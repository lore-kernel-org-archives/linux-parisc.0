Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i41K9Aa22410; Sat, 1 May 2004 16:09:10 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040501200312.40BB74945E1@palinux.hppa>
References: <20040501200312.40BB74945E1@palinux.hppa>
Content-Type: text/plain
Date: 01 May 2004 15:09:09 -0500
Message-Id: <1083442151.2030.27.camel@mulgrave>
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

On Sat, 2004-05-01 at 15:03, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/05/01 14:03:11
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c entry.S head64.S 
> 	include/asm-parisc: page.h pgalloc.h pgtable.h 
> 
> Log message:
> Increase the maximum physical and virtual space available to
> the 64 bit kernel from 512GB to 8TB
> 
> As jsm pointed out, we could do a depd,z on the pgd and pmd entries
> instead to compress our unused bits in the flags.  However, for the
> moment, I elected to allocate the pte and pmd in ZONE_DMA instead.

===== arch/parisc/kernel/asm-offsets.c 1.8 vs edited =====
--- 1.8/arch/parisc/kernel/asm-offsets.c	Sat May  1 05:20:09 2004
+++ edited/arch/parisc/kernel/asm-offsets.c	Sat May  1 12:50:25 2004
@@ -282,8 +282,8 @@
 	DEFINE(ASM_BITS_PER_PGD, BITS_PER_PGD);
 	DEFINE(ASM_BITS_PER_PMD, BITS_PER_PMD);
 	DEFINE(ASM_BITS_PER_PTE, BITS_PER_PTE);
-	DEFINE(ASM_PMD_ENTRY, ((__PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
-	DEFINE(ASM_PGD_ENTRY, __PAGE_OFFSET >> PGDIR_SHIFT);
+	DEFINE(ASM_PMD_ENTRY, ((PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
+	DEFINE(ASM_PGD_ENTRY, PAGE_OFFSET >> PGDIR_SHIFT);
 	DEFINE(ASM_PGD_ENTRY_SIZE, PGD_ENTRY_SIZE);
 	DEFINE(ASM_PMD_ENTRY_SIZE, PMD_ENTRY_SIZE);
 	DEFINE(ASM_PTE_ENTRY_SIZE, PTE_ENTRY_SIZE);
===== arch/parisc/kernel/entry.S 1.19 vs edited =====
--- 1.19/arch/parisc/kernel/entry.S	Sat May  1 05:20:09 2004
+++ edited/arch/parisc/kernel/entry.S	Sat May  1 14:58:00 2004
@@ -453,7 +453,10 @@
 	.endm
 
 	/* Look up a PTE in a 2-Level scheme (faulting at each
-	 * level if the entry isn't present */
+	 * level if the entry isn't present 
+	 *
+	 * NOTE: we use ldw even for LP64 because our pte
+	 * and pmd are allocated <4GB */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if PT_NLEVELS == 3
 	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
@@ -462,7 +465,7 @@
 #endif
 	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
 	copy		%r0,\pte
-	LDREG,s		\index(\pmd),\pmd
+	ldw,s		\index(\pmd),\pmd
 	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	bb,>=,n		\pmd,_PAGE_PRESENT_BIT,\fault
 	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
@@ -475,7 +478,7 @@
 	.macro		L3_ptep pgd,pte,index,va,fault
 	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 	copy		%r0,\pte
-	ldd,s		\index(\pgd),\pgd
+	ldw,s		\index(\pgd),\pgd
 	bb,>=,n		\pgd,_PAGE_PRESENT_BIT,\fault
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
===== arch/parisc/kernel/head64.S 1.7 vs edited =====
--- 1.7/arch/parisc/kernel/head64.S	Sat May  1 05:20:09 2004
+++ edited/arch/parisc/kernel/head64.S	Sat May  1 12:52:13 2004
@@ -88,16 +88,16 @@
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-	std             %r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
+	stw             %r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
 
 	ldo		_PAGE_TABLE(%r1),%r3
-	std             %r3,(ASM_PMD_ENTRY * ASM_PMD_ENTRY_SIZE) (%r5)
+	stw             %r3,(ASM_PMD_ENTRY * ASM_PMD_ENTRY_SIZE) (%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 1)*ASM_PMD_ENTRY_SIZE)(%r5)
+	stw             %r3,((ASM_PMD_ENTRY + 1)*ASM_PMD_ENTRY_SIZE)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 2)*ASM_PMD_ENTRY_SIZE)(%r5)
+	stw             %r3,((ASM_PMD_ENTRY + 2)*ASM_PMD_ENTRY_SIZE)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 3)*ASM_PMD_ENTRY_SIZE)(%r5)
+	stw             %r3,((ASM_PMD_ENTRY + 3)*ASM_PMD_ENTRY_SIZE)(%r5)
 
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 $pgt_fill_loop:
===== include/asm-parisc/page.h 1.8 vs edited =====
--- 1.8/include/asm-parisc/page.h	Fri Apr 30 05:40:20 2004
+++ edited/include/asm-parisc/page.h	Sat May  1 14:53:09 2004
@@ -40,8 +40,10 @@
  * These are used to make use of C type-checking..
  */
 typedef struct { unsigned long pte; } pte_t;
-typedef struct { unsigned long pmd; } pmd_t;
-typedef struct { unsigned long pgd; } pgd_t;
+/* NOTE: even on 64 bits, these entries are __u32 because we allocate
+ * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
+typedef struct { __u32 pmd; } pmd_t;
+typedef struct { __u32 pgd; } pgd_t;
 typedef struct { unsigned long pgprot; } pgprot_t;
 
 #define pte_val(x)	((x).pte)
@@ -89,8 +91,8 @@
  */
 #ifdef __LP64__
 #define BITS_PER_PTE_ENTRY	3
-#define BITS_PER_PMD_ENTRY	3
-#define BITS_PER_PGD_ENTRY	3
+#define BITS_PER_PMD_ENTRY	2
+#define BITS_PER_PGD_ENTRY	2
 #else
 #define BITS_PER_PTE_ENTRY	2
 #define BITS_PER_PMD_ENTRY	2
===== include/asm-parisc/pgalloc.h 1.10 vs edited =====
--- 1.10/include/asm-parisc/pgalloc.h	Fri Apr 30 05:40:20 2004
+++ edited/include/asm-parisc/pgalloc.h	Sat May  1 14:54:36 2004
@@ -30,12 +30,14 @@
 
 static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmd)
 {
-	pgd_val(*pgd) = _PAGE_TABLE + __pa((unsigned long)pmd);
+	pgd_val(*pgd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pmd);
 }
 
+/* NOTE: pmd must be in ZONE_DMA (<4GB) so the pgd pointer can be
+ * housed in 32 bits */
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT,
+	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT|GFP_DMA,
 					       PMD_ORDER);
 	if (pmd)
 		memset(pmd, 0, PAGE_SIZE<<PMD_ORDER);
@@ -65,16 +67,18 @@
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-	pmd_val(*pmd) = _PAGE_TABLE + __pa((unsigned long)pte);
+	pmd_val(*pmd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pte);
 }
 
 #define pmd_populate(mm, pmd, pte_page) \
 	pmd_populate_kernel(mm, pmd, page_address(pte_page))
 
+/* NOTE: pte must be in ZONE_DMA (<4GB) so that the pmd pointer
+ * can be housed in 32 bits */
 static inline struct page *
 pte_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT);
+	struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT|GFP_DMA);
 	if (likely(page != NULL))
 		clear_page(page_address(page));
 	return page;
@@ -83,7 +87,7 @@
 static inline pte_t *
 pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr)
 {
-	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT);
+	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|GFP_DMA);
 	if (likely(pte != NULL))
 		clear_page(pte);
 	return pte;
===== include/asm-parisc/pgtable.h 1.19 vs edited =====
--- 1.19/include/asm-parisc/pgtable.h	Sat May  1 05:20:20 2004
+++ edited/include/asm-parisc/pgtable.h	Sat May  1 13:00:07 2004
@@ -43,9 +43,9 @@
 #define pte_ERROR(e) \
 	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-	printk("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
+	printk("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, (unsigned long)pmd_val(e))
 #define pgd_ERROR(e) \
-	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
+	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
  /* Note: If you change ISTACK_SIZE, you need to change the corresponding
   * values in vmlinux.lds and vmlinux64.lds (init_istack section). Also,
@@ -65,8 +65,8 @@
 #ifdef __LP64__
 #define PT_NLEVELS	3
 #define PT_INITIAL	4 /* Number of initial page tables */
-#define PGD_ORDER	0 /* Number of pages per pgd */
-#define PMD_ORDER	0 /* Number of pages per pmd */
+#define PGD_ORDER	1 /* Number of pages per pgd */
+#define PMD_ORDER	1 /* Number of pages per pmd */
 #else
 #define PT_NLEVELS	2
 #define PT_INITIAL	2 /* Number of initial page tables */
