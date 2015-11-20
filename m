From: Helge Deller <deller@gmx.de>
Subject: [PATCH 8/9] parisc: Add Huge Page and HUGETLBFS support
Date: Fri, 20 Nov 2015 22:38:41 +0100
Message-ID: <1448055522-11594-9-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch adds huge page support to allow userspace to allocate huge
pages and to use hugetlbfs filesystem on 32- and 64-bit Linux kernels.
A later patch will add kernel support to map kernel text and data on
huge pages.

The only requirement is, that the kernel needs to be compiled for a
PA8X00 CPU (PA2.0 architecture). Older PA1.X CPUs do not support
variable page sizes. 64bit Kernels are compiled for PA2.0 by default.

Technically on parisc multiple physical huge pages may be needed to
emulate standard 2MB huge pages.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig               |   3 +
 arch/parisc/include/asm/hugetlb.h |  85 ++++++++++++++++++++
 arch/parisc/kernel/entry.S        |  45 +++++++----
 arch/parisc/kernel/setup.c        |  11 ++-
 arch/parisc/mm/Makefile           |   1 +
 arch/parisc/mm/hugetlbpage.c      | 162 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 292 insertions(+), 15 deletions(-)
 create mode 100644 arch/parisc/include/asm/hugetlb.h
 create mode 100644 arch/parisc/mm/hugetlbpage.c

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index c365469..729f891 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -108,6 +108,9 @@ config PGTABLE_LEVELS
 	default 3 if 64BIT && PARISC_PAGE_SIZE_4KB
 	default 2
 
+config SYS_SUPPORTS_HUGETLBFS
+	def_bool y if PA20
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
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index b2fdc44..623496c 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -502,21 +502,38 @@
 	STREG		\pte,0(\ptp)
 	.endm
 
+	/* We have (depending on the page size):
+	 * - 38 to 52-bit Physical Page Number
+	 * - 12 to 26-bit page offset
+	 */
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
+				(63-58)+PAGE_ADD_HUGE_SHIFT,\pte
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
@@ -553,7 +570,7 @@
 	depdi		1,12,1,\prot
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
-	convert_for_tlb_insert20 \pte
+	convert_for_tlb_insert20 \pte \tmp
 	.endm
 
 	/* Identical macro to make_insert_tlb above, except it
@@ -1142,7 +1159,7 @@ dtlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 	
 	idtlbt          pte,prot
 
@@ -1168,7 +1185,7 @@ nadtlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	idtlbt          pte,prot
 
@@ -1262,7 +1279,7 @@ dtlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	f_extend	pte,t1
 
@@ -1290,7 +1307,7 @@ nadtlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	f_extend	pte,t1
 	
@@ -1399,7 +1416,7 @@ itlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 	
 	iitlbt          pte,prot
 
@@ -1423,7 +1440,7 @@ naitlb_miss_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20w
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	iitlbt          pte,prot
 
@@ -1509,7 +1526,7 @@ itlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	f_extend	pte,t1
 
@@ -1529,7 +1546,7 @@ naitlb_miss_20:
 	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20
 	update_accessed	ptp,pte,t0,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	f_extend	pte,t1
 
@@ -1561,7 +1578,7 @@ dbit_trap_20w:
 	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 		
 	idtlbt          pte,prot
 
@@ -1605,7 +1622,7 @@ dbit_trap_20:
 	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
 	update_dirty	ptp,pte,t1
 
-	make_insert_tlb	spc,pte,prot
+	make_insert_tlb	spc,pte,prot,t1
 
 	f_extend	pte,t1
 	
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index f097762..f7ea626 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -130,7 +130,16 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "The 32-bit Kernel has started...\n");
 #endif
 
-	printk(KERN_INFO "Default page size is %dKB.\n", (int)(PAGE_SIZE / 1024));
+	printk(KERN_INFO "Kernel default page size is %d KB. Huge pages ",
+		(int)(PAGE_SIZE / 1024));
+#ifdef CONFIG_HUGETLB_PAGE
+	printk(KERN_CONT "enabled with %d MB physical and %d MB virtual size",
+		 1 << (REAL_HPAGE_SHIFT - 20), 1 << (HPAGE_SHIFT - 20));
+#else
+	printk(KERN_CONT "disabled");
+#endif
+	printk(KERN_CONT ".\n");
+
 
 	pdc_console_init();
 
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
index 0000000..36033c0
--- /dev/null
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -0,0 +1,162 @@
+/*
+ * PARISC64 Huge TLB page support.
+ *
+ * This parisc implementation is heavily based on the SPARC and x86 code.
+ *
+ * Copyright (C) 2015 Helge Deller <deller@gmx.de>
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
+	unsigned long flags;
+	int i;
+
+	/* We may use multiple physical huge pages (e.g. 2x1 MB) to emulate
+	 * Linux standard huge pages (e.g. 2 MB) */
+	BUILD_BUG_ON(REAL_HPAGE_SHIFT > HPAGE_SHIFT);
+
+	addr &= HPAGE_MASK;
+	addr |= _HUGE_PAGE_SIZE_ENCODING_DEFAULT;
+
+	spin_lock_irqsave(&pa_tlb_lock, flags);
+
+	mtsp(mm->context, 1);
+	for (i = 0; i < (1 << (HPAGE_SHIFT-REAL_HPAGE_SHIFT)); i++) {
+		pdtlb(addr);
+		if (unlikely(split_tlb))
+			pitlb(addr);
+		addr += (1UL << REAL_HPAGE_SHIFT);
+	}
+
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
+}
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t entry)
+{
+	unsigned long addr_start;
+	int i;
+
+	addr &= HPAGE_MASK;
+	addr_start = addr;
+
+	for (i = 0; i < (1 << HUGETLB_PAGE_ORDER); i++) {
+		/* Directly write pte entry.  We could call set_pte_at(mm, addr, ptep, entry)
+		 * instead, but then we get double locking on pa_tlb_lock. */
+		*ptep = entry;
+		ptep++;
+		addr += PAGE_SIZE;
+		pte_val(entry) += PAGE_SIZE;
+	}
+
+	purge_tlb_entries_huge(mm, addr_start);
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
-- 
2.1.0

