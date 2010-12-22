From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] eliminate special FLUSH flag from page table
Date: Wed, 22 Dec 2010 10:24:36 -0600
Message-ID: <1293035076.3019.13.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This was used to flush a region even if the page table entry had been
cleared.  In theory this was never necessary, but now we've switched to
alias based flushing, the whole set of code associated with it can be dumped.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

---
 arch/parisc/include/asm/pgtable.h |   14 ++------
 arch/parisc/kernel/entry.S        |   61 ++-----------------------------------
 2 files changed, 7 insertions(+), 68 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 865f37a..f3c0973 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -136,8 +136,7 @@
 #define _PAGE_NO_CACHE_BIT 24   /* (0x080) Uncached Page (U bit) */
 #define _PAGE_ACCESSED_BIT 23   /* (0x100) Software: Page Accessed */
 #define _PAGE_PRESENT_BIT  22   /* (0x200) Software: translation valid */
-#define _PAGE_FLUSH_BIT    21   /* (0x400) Software: translation valid */
-				/*             for cache flushing only */
+/* bit 21 was formerly the FLUSH bit but is now unused */
 #define _PAGE_USER_BIT     20   /* (0x800) Software: User accessible page */
 
 /* N.B. The bits are defined in terms of a 32 bit word above, so the */
@@ -171,7 +170,6 @@
 #define _PAGE_NO_CACHE (1 << xlate_pabit(_PAGE_NO_CACHE_BIT))
 #define _PAGE_ACCESSED (1 << xlate_pabit(_PAGE_ACCESSED_BIT))
 #define _PAGE_PRESENT  (1 << xlate_pabit(_PAGE_PRESENT_BIT))
-#define _PAGE_FLUSH    (1 << xlate_pabit(_PAGE_FLUSH_BIT))
 #define _PAGE_USER     (1 << xlate_pabit(_PAGE_USER_BIT))
 #define _PAGE_FILE     (1 << xlate_pabit(_PAGE_FILE_BIT))
 
@@ -211,7 +209,6 @@
 #define PAGE_KERNEL_RO	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
 #define PAGE_KERNEL_UNC	__pgprot(_PAGE_KERNEL | _PAGE_NO_CACHE)
 #define PAGE_GATEWAY    __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED | _PAGE_GATEWAY| _PAGE_READ)
-#define PAGE_FLUSH      __pgprot(_PAGE_FLUSH)
 
 
 /*
@@ -259,7 +256,7 @@ extern unsigned long *empty_zero_page;
 
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
-#define pte_none(x)     ((pte_val(x) == 0) || (pte_val(x) & _PAGE_FLUSH))
+#define pte_none(x)     (pte_val(x) == 0)
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(mm,addr,xp)	do { pte_val(*(xp)) = 0; } while (0)
 
@@ -442,13 +439,10 @@ struct mm_struct;
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	pte_t old_pte;
-	pte_t pte;
 
 	spin_lock(&pa_dbit_lock);
-	pte = old_pte = *ptep;
-	pte_val(pte) &= ~_PAGE_PRESENT;
-	pte_val(pte) |= _PAGE_FLUSH;
-	set_pte_at(mm,addr,ptep,pte);
+	old_pte = *ptep;
+	pte_clear(mm,addr,ptep);
 	spin_unlock(&pa_dbit_lock);
 
 	return old_pte;
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 564606d..5ed2344 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1206,23 +1206,7 @@ nadtlb_miss_20w:
 	nop
 
 nadtlb_check_alias_20w:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_20w
-
-	idtlbt          pte,prot
-
-	rfir
-	nop
-
-nadtlb_check_flush_20w:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
-
-	/* Insert a "flush only" translation */
-
-	depdi,z         7,7,3,prot
-	depdi           1,10,1,prot
-
-	/* Drop prot bits from pte and convert to page addr for idtlbt */
-	convert_for_tlb_insert20 pte
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
 
 	idtlbt          pte,prot
 
@@ -1286,7 +1270,7 @@ nadtlb_miss_11:
 	nop
 
 nadtlb_check_alias_11:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_11
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
 
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
@@ -1294,30 +1278,6 @@ nadtlb_check_alias_11:
 	rfir
 	nop
 
-nadtlb_check_flush_11:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
-
-	/* Insert a "flush only" translation */
-
-	zdepi           7,7,3,prot
-	depi            1,10,1,prot
-
-	/* Get rid of prot bits and convert to page addr for idtlba */
-
-	depi		0,31,ASM_PFN_PTE_SHIFT,pte
-	SHRREG		pte,(ASM_PFN_PTE_SHIFT-(31-26)),pte
-
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
-	mtsp		spc,%sr1
-
-	idtlba		pte,(%sr1,va)
-	idtlbp		prot,(%sr1,va)
-
-	mtsp		t0, %sr1	/* Restore sr1 */
-
-	rfir
-	nop
-
 dtlb_miss_20:
 	space_adjust	spc,va,t0
 	get_pgd		spc,ptp
@@ -1363,28 +1323,13 @@ nadtlb_miss_20:
 	nop
 
 nadtlb_check_alias_20:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_20
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
 	
 	idtlbt          pte,prot
 
 	rfir
 	nop
 
-nadtlb_check_flush_20:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
-
-	/* Insert a "flush only" translation */
-
-	depdi,z         7,7,3,prot
-	depdi           1,10,1,prot
-
-	/* Drop prot bits from pte and convert to page addr for idtlbt */
-	convert_for_tlb_insert20 pte
-
-	idtlbt          pte,prot
