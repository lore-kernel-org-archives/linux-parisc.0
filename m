Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3UGPla08568; Fri, 30 Apr 2004 12:25:47 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040430162037.9D2B94945CD@palinux.hppa>
References: <20040430162037.9D2B94945CD@palinux.hppa>
Content-Type: text/plain
Date: 30 Apr 2004 11:25:46 -0500
Message-Id: <1083342347.2063.38.camel@mulgrave>
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

On Fri, 2004-04-30 at 11:20, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/30 10:20:37
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c entry.S init_task.c 
> 	include/asm-parisc: page.h pgalloc.h pgtable.h 
> 
> Log message:
> Update the parametrisation of our page tables
> 
> This fix also allows variable size pgd and pmd and thus lays the ground
> work for expanding the number of page table flags we have

===== arch/parisc/kernel/asm-offsets.c 1.6 vs edited =====
--- 1.6/arch/parisc/kernel/asm-offsets.c	Sun Apr 25 04:00:10 2004
+++ edited/arch/parisc/kernel/asm-offsets.c	Thu Apr 29 12:52:22 2004
@@ -276,6 +276,12 @@
 	BLANK();
 	DEFINE(PA_BLOCKSTEP_BIT, 31-PT_BLOCKSTEP_BIT);
 	DEFINE(PA_SINGLESTEP_BIT, 31-PT_SINGLESTEP_BIT);
+	BLANK();
+	DEFINE(ASM_PMD_SHIFT, PMD_SHIFT);
+	DEFINE(ASM_PGDIR_SHIFT, PGDIR_SHIFT);
+	DEFINE(ASM_BITS_PER_PGD, BITS_PER_PGD);
+	DEFINE(ASM_BITS_PER_PMD, BITS_PER_PMD);
+	DEFINE(ASM_BITS_PER_PTE, BITS_PER_PTE);
 	DEFINE(ASM_PMD_ENTRY, ((__PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
 	BLANK();
 	return 0;
===== arch/parisc/kernel/entry.S 1.17 vs edited =====
--- 1.17/arch/parisc/kernel/entry.S	Tue Apr 27 06:20:11 2004
+++ edited/arch/parisc/kernel/entry.S	Thu Apr 29 18:16:28 2004
@@ -455,21 +455,25 @@
 	/* Look up a PTE in a 2-Level scheme (faulting at each
 	 * level if the entry isn't present */
 	.macro		L2_ptep	pmd,pte,index,va,fault
-	EXTR		\va,31-PMD_SHIFT,PAGE_SHIFT-BITS_PER_PMD,\index
+#if PT_NLEVELS == 3
+	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+#else
+	EXTR		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
+#endif
 	copy		%r0,\pte
 	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
 	LDREG,s		\index(\pmd),\pmd
-	EXTR		\va,31-PAGE_SHIFT,PAGE_SHIFT-BITS_PER_PTE,\index
+	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	bb,>=,n		\pmd,_PAGE_PRESENT_BIT,\fault
 	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
-	shladd		\index,BITS_PER_PTE,\pmd,\pmd
+	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
 	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
 	.endm
 
 	/* Look up PTE in a 3-Level scheme */
 	.macro		L3_ptep pgd,pte,index,va,fault
-	extrd,u		\va,63-PGDIR_SHIFT,PAGE_SHIFT-BITS_PER_PGD,\index
+	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 	copy		%r0,\pte
 	ldd,s		\index(\pgd),\pgd
 	bb,>=,n		\pgd,_PAGE_PRESENT_BIT,\fault
===== arch/parisc/kernel/init_task.c 1.7 vs edited =====
--- 1.7/arch/parisc/kernel/init_task.c	Tue Feb  3 23:41:56 2004
+++ edited/arch/parisc/kernel/init_task.c	Thu Apr 29 11:42:08 2004
@@ -52,7 +52,7 @@
 	__attribute__((aligned(128))) __attribute__((__section__(".data.init_task"))) =
 		{ INIT_THREAD_INFO(init_task) };
 
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((aligned(4096))) = { {0}, };
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((aligned(PAGE_SIZE<<PGD_ORDER))) = { {0}, };
 #ifdef __LP64__
 unsigned long pmd0[PTRS_PER_PMD] __attribute__ ((aligned(4096))) = { 0, };
 #endif
===== include/asm-parisc/page.h 1.7 vs edited =====
--- 1.7/include/asm-parisc/page.h	Tue Apr 27 06:20:26 2004
+++ edited/include/asm-parisc/page.h	Fri Apr 30 09:16:34 2004
@@ -84,14 +84,21 @@
 
 #endif /* !__ASSEMBLY__ */
 
+/* WARNING: The definitions below must match exactly to sizeof(pte_t)
+ * etc
+ */
 #ifdef __LP64__
-#define BITS_PER_PTE	3
-#define BITS_PER_PMD	3
-#define BITS_PER_PGD	3
+#define BITS_PER_PTE_ENTRY	3
+#define BITS_PER_PMD_ENTRY	3
+#define BITS_PER_PGD_ENTRY	3
 #else
-#define BITS_PER_PTE	2
-#define BITS_PER_PMD	2
+#define BITS_PER_PTE_ENTRY	2
+#define BITS_PER_PMD_ENTRY	2
+#define BITS_PER_PGD_ENTRY	BITS_PER_PMD_ENTRY
 #endif
+#define PGD_ENTRY_SIZE	(1UL << BITS_PER_PGD_ENTRY)
+#define PMD_ENTRY_SIZE	(1UL << BITS_PER_PMD_ENTRY)
+#define PTE_ENTRY_SIZE	(1UL << BITS_PER_PTE_ENTRY)
 
 /* to align the pointer to the (next) page boundary */
 #define PAGE_ALIGN(addr)	(((addr)+PAGE_SIZE-1)&PAGE_MASK)
===== include/asm-parisc/pgalloc.h 1.9 vs edited =====
--- 1.9/include/asm-parisc/pgalloc.h	Sat Sep 27 16:43:45 2003
+++ edited/include/asm-parisc/pgalloc.h	Thu Apr 29 17:07:16 2004
@@ -12,18 +12,19 @@
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd = (pgd_t *)__get_free_page(GFP_KERNEL);
+	pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL, PGD_ORDER);
+
 	if (likely(pgd != NULL))
-		clear_page(pgd);
+		memset(pgd, 0, PAGE_SIZE<<PGD_ORDER);
 	return pgd;
 }
 
 static inline void pgd_free(pgd_t *pgd)
 {
-	free_page((unsigned long)pgd);
+	free_pages((unsigned long)pgd, PGD_ORDER);
 }
 
-#ifdef __LP64__
+#if PT_NLEVELS == 3
 
 /* Three Level Page Table Support for pmd's */
 
@@ -34,15 +35,16 @@
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	pmd_t *pmd = (pmd_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT);
+	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT,
+					       PMD_ORDER);
 	if (pmd)
-		clear_page(pmd);
+		memset(pmd, 0, PAGE_SIZE<<PMD_ORDER);
 	return pmd;
 }
 
 static inline void pmd_free(pmd_t *pmd)
 {
-	free_page((unsigned long)pmd);
+	free_pages((unsigned long)pmd, PMD_ORDER);
 }
 
 #else
===== include/asm-parisc/pgtable.h 1.17 vs edited =====
--- 1.17/include/asm-parisc/pgtable.h	Sun Apr 25 04:00:21 2004
+++ edited/include/asm-parisc/pgtable.h	Fri Apr 30 11:16:11 2004
@@ -63,41 +63,49 @@
  */
 
 #ifdef __LP64__
-#define PT_NLEVELS 3
-#define PT_INITIAL 4 /* Number of initial page tables */
+#define PT_NLEVELS	3
+#define PT_INITIAL	4 /* Number of initial page tables */
+#define PGD_ORDER	0 /* Number of pages per pgd */
+#define PMD_ORDER	0 /* Number of pages per pmd */
 #else
-#define PT_NLEVELS 2
-#define PT_INITIAL 2 /* Number of initial page tables */
+#define PT_NLEVELS	2
+#define PT_INITIAL	2 /* Number of initial page tables */
+#define PGD_ORDER	0 /* Number of pages per pgd */
 #endif
 
-#define MAX_ADDRBITS (PAGE_SHIFT + (PT_NLEVELS)*(PAGE_SHIFT - PT_NLEVELS))
-#define MAX_ADDRESS (1UL << MAX_ADDRBITS)
-
-#define SPACEID_SHIFT (MAX_ADDRBITS - 32)
-
-/* Definitions for 1st level */
-
-#define PGDIR_SHIFT  (PAGE_SHIFT + (PT_NLEVELS - 1)*(PAGE_SHIFT - PT_NLEVELS))
-#define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
-#define PGDIR_MASK	(~(PGDIR_SIZE-1))
-#define PTRS_PER_PGD    (1UL << (PAGE_SHIFT - PT_NLEVELS))
-#define USER_PTRS_PER_PGD       PTRS_PER_PGD
+/* Definitions for 3rd level (we use PLD here for Page Lower directory
+ * because PTE_SHIFT is used lower down to mean shift that has to be
+ * done to get usable bits out of the PTE) */
+#define PLD_SHIFT	PAGE_SHIFT
+#define PLD_SIZE	PAGE_SIZE
+#define BITS_PER_PTE	(PAGE_SHIFT - BITS_PER_PTE_ENTRY)
+#define PTRS_PER_PTE    (1UL << BITS_PER_PTE)
 
 /* Definitions for 2nd level */
 #define pgtable_cache_init()	do { } while (0)
 
-#define PMD_SHIFT       (PAGE_SHIFT + (PAGE_SHIFT - PT_NLEVELS))
+#define PMD_SHIFT       (PLD_SHIFT + BITS_PER_PTE)
 #define PMD_SIZE	(1UL << PMD_SHIFT)
 #define PMD_MASK	(~(PMD_SIZE-1))
 #if PT_NLEVELS == 3
-#define PTRS_PER_PMD    (1UL << (PAGE_SHIFT - PT_NLEVELS))
+#define BITS_PER_PMD	(PAGE_SHIFT + PMD_ORDER - BITS_PER_PMD_ENTRY)
 #else
-#define PTRS_PER_PMD    1
+#define BITS_PER_PMD	0
 #endif
+#define PTRS_PER_PMD    (1UL << BITS_PER_PMD)
 
-/* Definitions for 3rd level */
+/* Definitions for 1st level */
+#define PGDIR_SHIFT	(PMD_SHIFT + BITS_PER_PMD)
+#define BITS_PER_PGD	(PAGE_SHIFT + PGD_ORDER - BITS_PER_PGD_ENTRY)
+#define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
+#define PGDIR_MASK	(~(PGDIR_SIZE-1))
+#define PTRS_PER_PGD    (1UL << BITS_PER_PGD)
+#define USER_PTRS_PER_PGD       PTRS_PER_PGD
 
-#define PTRS_PER_PTE    (1UL << (PAGE_SHIFT - PT_NLEVELS))
+#define MAX_ADDRBITS	(PGDIR_SHIFT + BITS_PER_PGD)
+#define MAX_ADDRESS	(1UL << MAX_ADDRBITS)
+
+#define SPACEID_SHIFT (MAX_ADDRBITS - 32)
 
 /*
  * pgd entries used up by user/kernel:
@@ -241,7 +249,7 @@
 


-#ifdef __LP64__
+#if PT_NLEVELS == 3
 #define pgd_page(pgd) ((unsigned long) __va(pgd_val(pgd) & PAGE_MASK))
 
 /* For 64 bit we have three level tables */
@@ -337,7 +345,7 @@
 
 /* Find an entry in the second-level page table.. */
 
-#ifdef __LP64__
+#if PT_NLEVELS == 3
 #define pmd_offset(dir,address) \
 ((pmd_t *) pgd_page(*(dir)) + (((address)>>PMD_SHIFT) & (PTRS_PER_PMD-1)))
 #else
