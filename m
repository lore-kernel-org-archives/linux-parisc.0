From: Helge Deller <deller@gmx.de>
Subject: [PATCH 4/9] parisc: Add defines for Huge page support
Date: Fri, 20 Nov 2015 22:38:37 +0100
Message-ID: <1448055522-11594-5-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Huge pages on parisc will have the same size as one pmd table, which
is on a 64bit kernel 2MB on a kernel with 4K kernel page sizes, and
on a 32bit kernel 4MB when used with 4K kernel pages.

Since parisc does not physically supports 2MB huge page sizes, emulate
it with two consecutive 1MB page sizes instead. Keeping the same huge
page size as one pmd will allow us to add transparent huge page support
later on.

Bit 21 in the pte flags was unused and will now be used to mark a page
as huge page (_PAGE_HPAGE_BIT).

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/page.h    | 13 ++++++++++++-
 arch/parisc/include/asm/pgtable.h | 20 +++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 60d5d17..80e742a 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -145,11 +145,22 @@ extern int npmem_ranges;
 #endif /* CONFIG_DISCONTIGMEM */
 
 #ifdef CONFIG_HUGETLB_PAGE
-#define HPAGE_SHIFT		22	/* 4MB (is this fixed?) */
+#define HPAGE_SHIFT		PMD_SHIFT /* fixed for transparent huge pages */
 #define HPAGE_SIZE      	((1UL) << HPAGE_SHIFT)
 #define HPAGE_MASK		(~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER	(HPAGE_SHIFT - PAGE_SHIFT)
+
+#if defined(CONFIG_64BIT) && defined(CONFIG_PARISC_PAGE_SIZE_4KB)
+# define REAL_HPAGE_SHIFT	20 /* 20 = 1MB */
+# define _HUGE_PAGE_SIZE_ENCODING_DEFAULT _PAGE_SIZE_ENCODING_1M
+#elif !defined(CONFIG_64BIT) && defined(CONFIG_PARISC_PAGE_SIZE_4KB)
+# define REAL_HPAGE_SHIFT	22 /* 22 = 4MB */
+# define _HUGE_PAGE_SIZE_ENCODING_DEFAULT _PAGE_SIZE_ENCODING_4M
+#else
+# define REAL_HPAGE_SHIFT	24 /* 24 = 16MB */
+# define _HUGE_PAGE_SIZE_ENCODING_DEFAULT _PAGE_SIZE_ENCODING_16M
 #endif
+#endif /* CONFIG_HUGETLB_PAGE */
 
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index f93c4a4..638317a 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -167,7 +167,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 #define _PAGE_NO_CACHE_BIT 24   /* (0x080) Uncached Page (U bit) */
 #define _PAGE_ACCESSED_BIT 23   /* (0x100) Software: Page Accessed */
 #define _PAGE_PRESENT_BIT  22   /* (0x200) Software: translation valid */
-/* bit 21 was formerly the FLUSH bit but is now unused */
+#define _PAGE_HPAGE_BIT    21   /* (0x400) Software: Huge Page */
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
 
@@ -363,6 +364,18 @@ static inline pte_t pte_mkwrite(pte_t pte)	{ pte_val(pte) |= _PAGE_WRITE; return
 static inline pte_t pte_mkspecial(pte_t pte)	{ return pte; }
 
 /*
+ * Huge pte definitions.
+ */
+#ifdef CONFIG_HUGETLB_PAGE
+#define pte_huge(pte)           (pte_val(pte) & _PAGE_HUGE)
+#define pte_mkhuge(pte)         (__pte(pte_val(pte) | _PAGE_HUGE))
+#else
+#define pte_huge(pte)           (0)
+#define pte_mkhuge(pte)         (pte)
+#endif
+
+
+/*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  */
@@ -410,8 +423,9 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* Find an entry in the second-level page table.. */
 
 #if CONFIG_PGTABLE_LEVELS == 3
+#define pmd_index(addr)         (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
 #define pmd_offset(dir,address) \
-((pmd_t *) pgd_page_vaddr(*(dir)) + (((address)>>PMD_SHIFT) & (PTRS_PER_PMD-1)))
+((pmd_t *) pgd_page_vaddr(*(dir)) + pmd_index(address))
 #else
 #define pmd_offset(dir,addr) ((pmd_t *) dir)
 #endif
-- 
2.1.0

