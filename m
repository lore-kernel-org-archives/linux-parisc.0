From: Helge Deller <deller@gmx.de>
Subject: [PATCH 3/3] parisc: protect huge pte changes with spinlocks
Date: Sun,  6 Dec 2015 21:43:33 +0100
Message-ID: <1449434613-32214-3-git-send-email-deller@gmx.de>
References: <1449434613-32214-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1449434613-32214-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Protect all changes of huge page pte entries with purge_tlb_start() and
purge_tlb_end() spinlocks.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/hugetlb.h | 20 +++----------
 arch/parisc/mm/hugetlbpage.c      | 60 +++++++++++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
index 7d56a9c..a65d888 100644
--- a/arch/parisc/include/asm/hugetlb.h
+++ b/arch/parisc/include/asm/hugetlb.h
@@ -54,24 +54,12 @@ static inline pte_t huge_pte_wrprotect(pte_t pte)
 	return pte_wrprotect(pte);
 }
 
-static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
-					   unsigned long addr, pte_t *ptep)
-{
-	pte_t old_pte = *ptep;
-	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-}
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+					   unsigned long addr, pte_t *ptep);
 
-static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 					     unsigned long addr, pte_t *ptep,
-					     pte_t pte, int dirty)
-{
-	int changed = !pte_same(*ptep, pte);
-	if (changed) {
-		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
-		flush_tlb_page(vma, addr);
-	}
-	return changed;
-}
+					     pte_t pte, int dirty);
 
 static inline pte_t huge_ptep_get(pte_t *ptep)
 {
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index f6fdc77..54ba392 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -105,15 +105,13 @@ static inline void purge_tlb_entries_huge(struct mm_struct *mm, unsigned long ad
 	addr |= _HUGE_PAGE_SIZE_ENCODING_DEFAULT;
 
 	for (i = 0; i < (1 << (HPAGE_SHIFT-REAL_HPAGE_SHIFT)); i++) {
-		mtsp(mm->context, 1);
-		pdtlb(addr);
-		if (unlikely(split_tlb))
-			pitlb(addr);
+		purge_tlb_entries(mm, addr);
 		addr += (1UL << REAL_HPAGE_SHIFT);
 	}
 }
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+/* __set_huge_pte_at() must be called holding the pa_tlb_lock. */
+static void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t entry)
 {
 	unsigned long addr_start;
@@ -123,14 +121,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	addr_start = addr;
 
 	for (i = 0; i < (1 << HUGETLB_PAGE_ORDER); i++) {
-		/* Directly write pte entry.  We could call set_pte_at(mm, addr, ptep, entry)
-		 * instead, but then we get double locking on pa_tlb_lock. */
-		*ptep = entry;
+		set_pte(ptep, entry);
 		ptep++;
 
-		/* Drop the PAGE_SIZE/non-huge tlb entry */
-		purge_tlb_entries(mm, addr);
-
 		addr += PAGE_SIZE;
 		pte_val(entry) += PAGE_SIZE;
 	}
@@ -138,18 +131,61 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	purge_tlb_entries_huge(mm, addr_start);
 }
 
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		     pte_t *ptep, pte_t entry)
+{
+	unsigned long flags;
+
+	purge_tlb_start(flags);
+	__set_huge_pte_at(mm, addr, ptep, entry);
+	purge_tlb_end(flags);
+}
+
 
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep)
 {
+	unsigned long flags;
 	pte_t entry;
 
+	purge_tlb_start(flags);
 	entry = *ptep;
-	set_huge_pte_at(mm, addr, ptep, __pte(0));
+	__set_huge_pte_at(mm, addr, ptep, __pte(0));
+	purge_tlb_end(flags);
 
 	return entry;
 }
 
+
+void huge_ptep_set_wrprotect(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep)
+{
+	unsigned long flags;
+	pte_t old_pte;
+
+	purge_tlb_start(flags);
+	old_pte = *ptep;
+	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
+	purge_tlb_end(flags);
+}
+
+int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep,
+				pte_t pte, int dirty)
+{
+	unsigned long flags;
+	int changed;
+
+	purge_tlb_start(flags);
+	changed = !pte_same(*ptep, pte);
+	if (changed) {
+		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+	}
+	purge_tlb_end(flags);
+	return changed;
+}
+
+
 int pmd_huge(pmd_t pmd)
 {
 	return 0;
-- 
2.1.0

