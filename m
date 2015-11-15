From: Helge Deller <deller@gmx.de>
Subject: [PATCH, RFC] parisc: Add huge page support for parisc
Date: Sun, 15 Nov 2015 23:13:04 +0100
Message-ID: <20151115221304.GA8881@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is an initial working version of getting huge pages support on
parisc.

Can be pulled from my "hugetlb_hppa3" branch of my git tree as well:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=hugetlb_hppa3

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index c365469..2278497 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -108,6 +108,9 @@ config PGTABLE_LEVELS
 	default 3 if 64BIT && PARISC_PAGE_SIZE_4KB
 	default 2
 
+config SYS_SUPPORTS_HUGETLBFS
+	def_bool y if 64BIT
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
new file mode 100644
index 0000000..7d56a9c
--- /dev/null
+++ b/arch/parisc/include/asm/hugetlb.h
@@ -0,0 +1,85 @@
+#ifndef _ASM_PARISC64_HUGETLB_H
+#define _ASM_PARISC64_HUGETLB_H
+
+#include <asm/page.h>
+#include <asm-generic/hugetlb.h>
+
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t pte);
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep);
+
+static inline int is_hugepage_only_range(struct mm_struct *mm,
+					 unsigned long addr,
+					 unsigned long len) {
+	return 0;
+}
+
+/*
+ * If the arch doesn't supply something else, assume that hugepage
+ * size aligned regions are ok without further preparation.
+ */
+static inline int prepare_hugepage_range(struct file *file,
+			unsigned long addr, unsigned long len)
+{
+	if (len & ~HPAGE_MASK)
+		return -EINVAL;
+	if (addr & ~HPAGE_MASK)
+		return -EINVAL;
+	return 0;
+}
+
+static inline void hugetlb_free_pgd_range(struct mmu_gather *tlb,
+					  unsigned long addr, unsigned long end,
+					  unsigned long floor,
+					  unsigned long ceiling)
+{
+	free_pgd_range(tlb, addr, end, floor, ceiling);
+}
+
+static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
+					 unsigned long addr, pte_t *ptep)
+{
+}
+
+static inline int huge_pte_none(pte_t pte)
+{
+	return pte_none(pte);
+}
+
+static inline pte_t huge_pte_wrprotect(pte_t pte)
+{
+	return pte_wrprotect(pte);
+}
+
+static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
+					   unsigned long addr, pte_t *ptep)
+{
+	pte_t old_pte = *ptep;
+	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
+}
+
+static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, int dirty)
+{
+	int changed = !pte_same(*ptep, pte);
+	if (changed) {
+		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+		flush_tlb_page(vma, addr);
+	}
+	return changed;
+}
+
+static inline pte_t huge_ptep_get(pte_t *ptep)
+{
+	return *ptep;
+}
+
+static inline void arch_clear_hugepage_flags(struct page *page)
+{
+}
+
+#endif /* _ASM_PARISC64_HUGETLB_H */
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 60d5d17..ca2dff4 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -145,10 +145,13 @@ extern int npmem_ranges;
 #endif /* CONFIG_DISCONTIGMEM */
 
 #ifdef CONFIG_HUGETLB_PAGE
-#define HPAGE_SHIFT		22	/* 4MB (is this fixed?) */
+#define HPAGE_SHIFT		PMD_SHIFT /* fixed for transparent huge pages */
 #define HPAGE_SIZE      	((1UL) << HPAGE_SHIFT)
 #define HPAGE_MASK		(~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
+
+#define REAL_HPAGE_SHIFT	20 /* 20=1MB, 22=4MB */
+#define _HUGE_PAGE_SIZE_ENCODING_DEFAULT _PAGE_SIZE_ENCODING_1M
 #endif
 
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index f93c4a4..148a243 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -167,7 +167,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 #define _PAGE_NO_CACHE_BIT 24   /* (0x080) Uncached Page (U bit) */
 #define _PAGE_ACCESSED_BIT 23   /* (0x100) Software: Page Accessed */
 #define _PAGE_PRESENT_BIT  22   /* (0x200) Software: translation valid */
-/* bit 21 was formerly the FLUSH bit but is now unused */
+#define _PAGE_HPAGE_BIT    21   /* (0x400) Huge Page */
 #define _PAGE_USER_BIT     20   /* (0x800) Software: User accessible page */
 
 /* N.B. The bits are defined in terms of a 32 bit word above, so the */
@@ -194,6 +194,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 #define _PAGE_NO_CACHE (1 << xlate_pabit(_PAGE_NO_CACHE_BIT))
 #define _PAGE_ACCESSED (1 << xlate_pabit(_PAGE_ACCESSED_BIT))
 #define _PAGE_PRESENT  (1 << xlate_pabit(_PAGE_PRESENT_BIT))
+#define _PAGE_HUGE     (1 << xlate_pabit(_PAGE_HPAGE_BIT))
 #define _PAGE_USER     (1 << xlate_pabit(_PAGE_USER_BIT))
 
 #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE |  _PAGE_DIRTY | _PAGE_ACCESSED)
@@ -217,7 +218,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 #define PxD_FLAG_VALID    (1 << xlate_pabit(_PxD_VALID_BIT))
 #define PxD_FLAG_MASK     (0xf)
 #define PxD_FLAG_SHIFT    (4)
-#define PxD_VALUE_SHIFT   (8) /* (PAGE_SHIFT-PxD_FLAG_SHIFT) */
+#define PxD_VALUE_SHIFT   (PFN_PTE_SHIFT-PxD_FLAG_SHIFT)
 
 #ifndef __ASSEMBLY__
 
@@ -363,6 +364,13 @@ static inline pte_t pte_mkwrite(pte_t pte)	{ pte_val(pte) |= _PAGE_WRITE; return
 static inline pte_t pte_mkspecial(pte_t pte)	{ return pte; }
 
 /*
+ * Huge pte definitions.
+ */
+#define pte_huge(pte)           (pte_val(pte) & _PAGE_HUGE)
+#define pte_mkhuge(pte)         (__pte(pte_val(pte) | _PAGE_HUGE))
+
+
+/*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  */
@@ -410,8 +418,9 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* Find an entry in the second-level page table.. */
 
 #if CONFIG_PGTABLE_LEVELS == 3
+#define pmd_index(addr)         (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
 #define pmd_offset(dir,address) \
-((pmd_t *) pgd_page_vaddr(*(dir)) + (((address)>>PMD_SHIFT) & (PTRS_PER_PMD-1)))
+((pmd_t *) pgd_page_vaddr(*(dir)) + pmd_index(address))
 #else
 #define pmd_offset(dir,addr) ((pmd_t *) dir)
 #endif
@@ -504,6 +513,8 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 #define _PAGE_SIZE_ENCODING_4M		5
 #define _PAGE_SIZE_ENCODING_16M		6
 #define _PAGE_SIZE_ENCODING_64M		7
+#define _PAGE_SIZE_ENCODING_MASK	0x0f
+#define PHYS_PAGE_SIZE_ENCODING(x)	((x) & _PAGE_SIZE_ENCODING_MASK)
 
 #if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
 # define _PAGE_SIZE_ENCODING_DEFAULT _PAGE_SIZE_ENCODING_4K
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 294d251..587005a 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -46,25 +46,15 @@
 #define MADV_DONTFORK	10		/* don't inherit across fork */
 #define MADV_DOFORK	11		/* do inherit across fork */
 
-/* The range 12-64 is reserved for page size specification. */
-#define MADV_4K_PAGES   12              /* Use 4K pages  */
-#define MADV_16K_PAGES  14              /* Use 16K pages */
-#define MADV_64K_PAGES  16              /* Use 64K pages */
-#define MADV_256K_PAGES 18              /* Use 256K pages */
-#define MADV_1M_PAGES   20              /* Use 1 Megabyte pages */
-#define MADV_4M_PAGES   22              /* Use 4 Megabyte pages */
-#define MADV_16M_PAGES  24              /* Use 16 Megabyte pages */
-#define MADV_64M_PAGES  26              /* Use 64 Megabyte pages */
+#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
+#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
 
-#define MADV_MERGEABLE   65		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 66		/* KSM may not merge identical pages */
+#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
+#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_HUGEPAGE	67		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	68		/* Not worth backing with hugepages */
-
-#define MADV_DONTDUMP   69		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
 					   overrides the coredump filter bits */
-#define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
+#define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
 
 /* compatibility flags */
 #define MAP_FILE	0
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index c5ef408..f0e5157 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -504,19 +504,32 @@
 
 	/* bitshift difference between a PFN (based on kernel's PAGE_SIZE)
 	 * to a CPU TLB 4k PFN (4k => 12 bits to shift) */
-	#define PAGE_ADD_SHIFT  (PAGE_SHIFT-12)
+	#define PAGE_ADD_SHIFT		(PAGE_SHIFT-12)
+	#define PAGE_ADD_HUGE_SHIFT	(REAL_HPAGE_SHIFT-12)
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
-	.macro		convert_for_tlb_insert20 pte
+	.macro		convert_for_tlb_insert20 pte,tmp
+#ifdef CONFIG_HUGETLB_PAGE
+	copy		\pte,\tmp
+	extrd,u		\tmp,(63-ASM_PFN_PTE_SHIFT)+(63-58)+PAGE_ADD_SHIFT,\
+				64-PAGE_SHIFT-PAGE_ADD_SHIFT,\pte
+
+	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,\
+				(63-58)+PAGE_ADD_SHIFT,\pte
+	extrd,u,*=	\tmp,_PAGE_HPAGE_BIT+32,1,%r0
+	depdi		_HUGE_PAGE_SIZE_ENCODING_DEFAULT,63,\
+				(63-58)+PAGE_ADD_SHIFT,\pte
+#else /* Huge pages disabled */
 	extrd,u		\pte,(63-ASM_PFN_PTE_SHIFT)+(63-58)+PAGE_ADD_SHIFT,\
 				64-PAGE_SHIFT-PAGE_ADD_SHIFT,\pte
 	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,\
 				(63-58)+PAGE_ADD_SHIFT,\pte
+#endif
 	.endm
 
 	/* Convert the pte and prot to tlb insertion values.  How
 	 * this happens is quite subtle, read below */
-	.macro		make_insert_tlb	spc,pte,prot
+	.macro		make_insert_tlb	spc,pte,prot,tmp
 	space_to_prot   \spc \prot        /* create prot id from space */
 	/* The following is the real subtlety.  This is depositing
 	 * T <-> _PAGE_REFTRAP
@@ -553,7 +566,7 @@
 	depdi		1,12,1,\prot
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
-	convert_for_tlb_insert20 \pte
+	convert_for_tlb_insert20 \pte \tmp
 	.endm
 
 	/* Identical macro to make_insert_tlb above, except it
@@ -1147,7 +1160,7 @@ dtlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 	
 	idtlbt          pte,prot
 
@@ -1173,7 +1186,7 @@ nadtlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	idtlbt          pte,prot
 
@@ -1267,7 +1280,7 @@ dtlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	f_extend	pte,t1
 
@@ -1295,7 +1308,7 @@ nadtlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	f_extend	pte,t1
 	
@@ -1404,7 +1417,7 @@ itlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 	
 	iitlbt          pte,prot
 
@@ -1428,7 +1441,7 @@ naitlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	iitlbt          pte,prot
 
@@ -1514,7 +1527,7 @@ itlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	f_extend	pte,t1
 
@@ -1534,7 +1547,7 @@ naitlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	f_extend	pte,t1
 
@@ -1566,7 +1579,7 @@ dbit_trap_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 		
 	idtlbt          pte,prot
 
@@ -1610,7 +1623,7 @@ dbit_trap_20:
 	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t0
 
 	f_extend	pte,t1
 	
diff --git a/arch/parisc/mm/Makefile b/arch/parisc/mm/Makefile
index 758ceef..134393d 100644
--- a/arch/parisc/mm/Makefile
+++ b/arch/parisc/mm/Makefile
@@ -3,3 +3,4 @@
 #
 
 obj-y	 := init.o fault.o ioremap.o
+obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
new file mode 100644
index 0000000..3e82f86
--- /dev/null
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -0,0 +1,160 @@
+/*
+ * PARISC64 Huge TLB page support.
+ *
+ * Copyright (C) 2002, 2003, 2006 David S. Miller (davem@davemloft.net)
+ */
+
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/hugetlb.h>
+#include <linux/pagemap.h>
+#include <linux/sysctl.h>
+
+#include <asm/mman.h>
+#include <asm/pgalloc.h>
+#include <asm/tlb.h>
+#include <asm/tlbflush.h>
+#include <asm/cacheflush.h>
+#include <asm/mmu_context.h>
+
+
+unsigned long
+hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
+{
+	struct hstate *h = hstate_file(file);
+
+	if (len & ~huge_page_mask(h))
+		return -EINVAL;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		if (prepare_hugepage_range(file, addr, len))
+			return -EINVAL;
+
+	if (addr)
+		addr = ALIGN(addr, huge_page_size(h));
+
+	/* we need to make sure the colouring is OK */
+	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
+}
+
+
+pte_t *huge_pte_alloc(struct mm_struct *mm,
+			unsigned long addr, unsigned long sz)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte = NULL;
+
+	/* We must align the address, because our caller will run
+	 * set_huge_pte_at() on whatever we return, which writes out
+	 * all of the sub-ptes for the hugepage range.  So we have
+	 * to give it the first such sub-pte.
+	 */
+	addr &= HPAGE_MASK;
+
+	pgd = pgd_offset(mm, addr);
+	pud = pud_alloc(mm, pgd, addr);
+	if (pud) {
+		pmd = pmd_alloc(mm, pud, addr);
+		if (pmd)
+			pte = pte_alloc_map(mm, NULL, pmd, addr);
+	}
+	return pte;
+}
+
+pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte = NULL;
+
+	addr &= HPAGE_MASK;
+
+	pgd = pgd_offset(mm, addr);
+	if (!pgd_none(*pgd)) {
+		pud = pud_offset(pgd, addr);
+		if (!pud_none(*pud)) {
+			pmd = pmd_offset(pud, addr);
+			if (!pmd_none(*pmd))
+				pte = pte_offset_map(pmd, addr);
+		}
+	}
+	return pte;
+}
+
+/* Purge data and instruction TLB entries.  Must be called holding
+ * the pa_tlb_lock.  The TLB purge instructions are slow on SMP
+ * machines since the purge must be broadcast to all CPUs.
+ */
+static inline void purge_tlb_entries_huge(struct mm_struct *mm, unsigned long addr)
+{
+	// we use 2 physical huge pages to emulate Linux huge pages
+	BUILD_BUG_ON(REAL_HPAGE_SHIFT+1 != HPAGE_SHIFT);
+
+	mtsp(mm->context, 1);
+	addr &= HPAGE_MASK;
+	addr |= _HUGE_PAGE_SIZE_ENCODING_DEFAULT;
+	pdtlb(addr);
+	pdtlb(addr + (1UL << REAL_HPAGE_SHIFT));
+	if (unlikely(split_tlb)) {
+		pitlb(addr);
+		pitlb(addr + (1UL << REAL_HPAGE_SHIFT));
+	}
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t entry)
+{
+	unsigned long flags;
+	unsigned long addr_start;
+	int i;
+
+#if 0 // HELGE
+	if (!pte_present(*ptep) && pte_present(entry))
+		mm->context.huge_pte_count++;
+#endif
+
+	addr &= HPAGE_MASK;
+	addr_start = addr;
+
+	spin_lock_irqsave(&pa_tlb_lock, flags);
+
+	for (i = 0; i < (1 << HUGETLB_PAGE_ORDER); i++) {
+                *ptep = entry; // set_pte_at(mm, addr, ptep, entry);
+		ptep++;
+		purge_tlb_entries(mm, addr); // non-huge
+		addr += PAGE_SIZE;
+		pte_val(entry) += PAGE_SIZE;
+	}
+
+	purge_tlb_entries_huge(mm, addr_start);
+
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
+}
+
+
+pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep)
+{
+	pte_t entry;
+
+	entry = *ptep;
+	set_huge_pte_at(mm, addr, ptep, __pte(0));
+
+	return entry;
+}
+
+int pmd_huge(pmd_t pmd)
+{
+	return 0;
+}
+
+int pud_huge(pud_t pud)
+{
+	return 0;
+}
