Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i43KpAa02485; Mon, 3 May 2004 16:51:10 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040502161601.DC7C24945C7@palinux.hppa>
References: <20040502161601.DC7C24945C7@palinux.hppa>
Content-Type: text/plain
Date: 03 May 2004 15:51:09 -0500
Message-Id: <1083617469.2417.10.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 2004-05-02 at 11:16, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/05/02 10:16:01
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c entry.S init_task.c 
> 	include/asm-parisc: pgalloc.h pgtable.h 
> 
> Log message:
> Implement L2/L3 hybrid page tables for 64 bit kernels

Index: arch/parisc/kernel/asm-offsets.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/asm-offsets.c,v
retrieving revision 1.7
diff -u -r1.7 asm-offsets.c
--- a/arch/parisc/kernel/asm-offsets.c	1 May 2004 20:03:11 -0000	1.7
+++ b/arch/parisc/kernel/asm-offsets.c	2 May 2004 15:53:49 -0000
@@ -282,6 +282,7 @@
 	DEFINE(ASM_BITS_PER_PGD, BITS_PER_PGD);
 	DEFINE(ASM_BITS_PER_PMD, BITS_PER_PMD);
 	DEFINE(ASM_BITS_PER_PTE, BITS_PER_PTE);
+	DEFINE(ASM_PGD_PMD_OFFSET, -(PAGE_SIZE << PGD_ORDER));
 	DEFINE(ASM_PMD_ENTRY, ((PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
 	DEFINE(ASM_PGD_ENTRY, PAGE_OFFSET >> PGDIR_SHIFT);
 	DEFINE(ASM_PGD_ENTRY_SIZE, PGD_ENTRY_SIZE);
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.13
diff -u -r1.13 entry.S
--- a/arch/parisc/kernel/entry.S	1 May 2004 20:03:11 -0000	1.13
+++ b/arch/parisc/kernel/entry.S	2 May 2004 15:53:51 -0000
@@ -474,11 +474,24 @@
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
 	.endm
 
-	/* Look up PTE in a 3-Level scheme */
+	/* Look up PTE in a 3-Level scheme.
+	 *
+	 * Here we implement a Hybrid L2/L3 scheme: we allocate the
+	 * first pmd adjacent to the pgd.  This means that we can
+	 * subtract a constant offset to get to it.  The pmd and pgd
+	 * sizes are arranged so that a single pmd covers 4GB (giving
+	 * a full LP64 process access to 8TB) so our lookups are
+	 * effectively L2 for the first 4GB of the kernel (i.e. for
+	 * all ILP32 processes and all the kernel for machines with
+	 * under 4GB of memory) */
 	.macro		L3_ptep pgd,pte,index,va,fault
 	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 	copy		%r0,\pte
+	extrd,u,*=	\va,31,32,%r0
 	ldw,s		\index(\pgd),\pgd
+	extrd,u,*<>	\va,31,32,%r0
+	ldo		ASM_PGD_PMD_OFFSET(\pgd),\pgd
+	extrd,u,*=	\va,31,32,%r0
 	bb,>=,n		\pgd,_PAGE_PRESENT_BIT,\fault
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
Index: arch/parisc/kernel/init_task.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/init_task.c,v
retrieving revision 1.5
diff -u -r1.5 init_task.c
--- a/arch/parisc/kernel/init_task.c	1 May 2004 16:05:55 -0000	1.5
+++ b/arch/parisc/kernel/init_task.c	2 May 2004 15:53:51 -0000
@@ -52,11 +52,13 @@
 	__attribute__((aligned(128))) __attribute__((__section__(".data.init_task"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((aligned(PAGE_SIZE<<PGD_ORDER))) = { {0}, };
 #ifdef __LP64__
-pmd_t pmd0[PTRS_PER_PMD] __attribute__ ((aligned(4096))) = { {0}, };
+/* NOTE: This layout exactly conforms to the hybrid L2/L3 page table layout
+ * with the first pmd adjacent to the pgd and below it */
+pmd_t pmd0[PTRS_PER_PMD] __attribute__ ((aligned(PAGE_SIZE))) = { {0}, };
 #endif
-pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((aligned(4096))) = { {0}, };
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((aligned(PAGE_SIZE))) = { {0}, };
+pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((aligned(PAGE_SIZE))) = { {0}, };
 
 /*
  * Initial task structure.
Index: include/asm-parisc/pgalloc.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgalloc.h,v
retrieving revision 1.4
diff -u -r1.4 pgalloc.h
--- a/include/asm-parisc/pgalloc.h	1 May 2004 20:03:11 -0000	1.4
+++ b/include/asm-parisc/pgalloc.h	2 May 2004 15:54:10 -0000
@@ -10,18 +10,44 @@
 #include <asm/pgtable.h>
 #include <asm/cache.h>
 
+/* Allocate the top level pgd (page directory)
+ *
+ * Here (for 64 bit kernels) we implement a Hybrid L2/L3 scheme: we
+ * allocate the first pmd adjacent to the pgd.  This means that we can
+ * subtract a constant offset to get to it.  The pmd and pgd sizes are
+ * arranged so that a single pmd covers 4GB (giving a full LP64
+ * process access to 8TB) so our lookups are effectively L2 for the
+ * first 4GB of the kernel (i.e. for all ILP32 processes and all the
+ * kernel for machines with under 4GB of memory) */
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL, PGD_ORDER);
-
-	if (likely(pgd != NULL))
-		memset(pgd, 0, PAGE_SIZE<<PGD_ORDER);
-	return pgd;
+	pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL|GFP_DMA,
+					       PGD_ALLOC_ORDER);
+	pgd_t *actual_pgd = pgd;
+
+	if (likely(pgd != NULL)) {
+		memset(pgd, 0, PAGE_SIZE<<PGD_ALLOC_ORDER);
+#ifdef __LP64__
+		actual_pgd += PTRS_PER_PGD;
+		/* Populate first pmd with allocated memory.  We mark it
+		 * with _PAGE_GATEWAY as a signal to the system that this
+		 * pmd entry may not be cleared. */
+		pgd_val(*actual_pgd) = (_PAGE_TABLE | _PAGE_GATEWAY) + 
+			(__u32)__pa((unsigned long)pgd);
+		/* The first pmd entry also is marked with _PAGE_GATEWAY as
+		 * a signal that this pmd may not be freed */
+		pgd_val(*pgd) = _PAGE_GATEWAY;
+#endif
+	}
+	return actual_pgd;
 }
 
 static inline void pgd_free(pgd_t *pgd)
 {
-	free_pages((unsigned long)pgd, PGD_ORDER);
+#ifdef __LP64__
+	pgd -= PTRS_PER_PGD;
+#endif
+	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
 }
 
 #if PT_NLEVELS == 3
@@ -46,6 +72,12 @@
 
 static inline void pmd_free(pmd_t *pmd)
 {
+#ifdef __LP64__
+	if(pmd_val(*pmd) & _PAGE_GATEWAY)
+		/* This is the permanent pmd attached to the pgd;
+		 * cannot free it */
+		return;
+#endif
 	free_pages((unsigned long)pmd, PMD_ORDER);
 }
 
@@ -67,7 +99,15 @@
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-	pmd_val(*pmd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pte);
+#ifdef __LP64__
+	/* preserve the gateway marker if this is the beginning of
+	 * the permanent pmd */
+	if(pmd_val(*pmd) & _PAGE_GATEWAY)
+		pmd_val(*pmd) = (_PAGE_TABLE | _PAGE_GATEWAY)
+			+ (__u32)__pa((unsigned long)pte);
+	else
+#endif
+		pmd_val(*pmd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pte);
 }
 
 #define pmd_populate(mm, pmd, pte_page) \
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.8
diff -u -r1.8 pgtable.h
--- a/include/asm-parisc/pgtable.h	1 May 2004 20:03:11 -0000	1.8
+++ b/include/asm-parisc/pgtable.h	2 May 2004 15:54:11 -0000
@@ -67,10 +67,12 @@
 #define PT_INITIAL	4 /* Number of initial page tables */
 #define PGD_ORDER	1 /* Number of pages per pgd */
 #define PMD_ORDER	1 /* Number of pages per pmd */
+#define PGD_ALLOC_ORDER	2 /* first pgd contains pmd */
 #else
 #define PT_NLEVELS	2
 #define PT_INITIAL	2 /* Number of initial page tables */
 #define PGD_ORDER	0 /* Number of pages per pgd */
+#define PGD_ALLOC_ORDER	PGD_ORDER
 #endif
 
 /* Definitions for 3rd level (we use PLD here for Page Lower directory
@@ -242,10 +244,26 @@
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(xp)	do { pte_val(*(xp)) = 0; } while (0)
 
+#ifdef __LP64__
+/* The first entry of the permanent pmd is not there if it contains
+ * the gateway marker */
+#define pmd_none(x)	(!pmd_val(x) || pmd_val(x) == _PAGE_GATEWAY)
+#define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE && (pmd_val(x) & ~PAGE_MASK) != (_PAGE_TABLE | _PAGE_GATEWAY))
+#else
 #define pmd_none(x)	(!pmd_val(x))
 #define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
+#endif
 #define pmd_present(x)	(pmd_val(x) & _PAGE_PRESENT)
-#define pmd_clear(xp)	do { pmd_val(*(xp)) = 0; } while (0)
+static inline void pmd_clear(pmd_t *pmd) {
+#ifdef __LP64__
+	if(pmd_val(*pmd) & _PAGE_GATEWAY)
+		/* This is the entry pointing to the permanent pmd
+		 * attached to the pgd; cannot clear it */
+		pmd_val(*pmd) = _PAGE_GATEWAY;
+	else
+#endif
+		pmd_val(*pmd) = 0;
+}
 


@@ -255,9 +273,21 @@
 /* For 64 bit we have three level tables */
 
 #define pgd_none(x)     (!pgd_val(x))
+#ifdef __LP64__
+#define pgd_bad(x)      ((pgd_val(x) & ~PAGE_MASK) != _PAGE_TABLE && (pgd_val(x) & ~PAGE_MASK) != (_PAGE_TABLE | _PAGE_GATEWAY))
+#else
 #define pgd_bad(x)      ((pgd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
+#endif
 #define pgd_present(x)  (pgd_val(x) & _PAGE_PRESENT)
-#define pgd_clear(xp)   do { pgd_val(*(xp)) = 0; } while (0)
+static inline void pgd_clear(pgd_t *pgd) {
+#ifdef __LP64__
+	if(pgd_val(*pgd) & _PAGE_GATEWAY)
+		/* This is the permanent pmd attached to the pgd; cannot
+		 * free it */
+		return;
+#endif
+	pgd_val(*pgd) = 0;
+}
 #else
 /*
  * The "pgd_xxx()" functions here are trivial for a folded two-level
