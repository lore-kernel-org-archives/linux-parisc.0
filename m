From: Prasad Joshi <prasadjoshi124@gmail.com>
Subject: Re: [RFC][PATCH v3 11/22] mm, parisc: add gfp flags variant of pmd
 and pte allocations
Date: Fri, 18 Mar 2011 19:59:26 +0000
Message-ID: <20110318195926.GL4746@prasad-kvm>
References: <20110318194341.GB4746@prasad-kvm>
 <20110318194600.GC4746@prasad-kvm>
 <20110318194740.GD4746@prasad-kvm>
 <20110318194929.GE4746@prasad-kvm>
 <20110318195035.GF4746@prasad-kvm>
 <20110318195141.GG4746@prasad-kvm>
 <20110318195307.GH4746@prasad-kvm>
 <20110318195507.GI4746@prasad-kvm>
 <20110318195643.GJ4746@prasad-kvm>
 <20110318195754.GK4746@prasad-kvm>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	prasadjoshi124@gmail.com, mitra@kqinfotech.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110318195754.GK4746@prasad-kvm>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


- Added __pte_alloc_one_kernel() function to allocate zeroed page using
   passed allocation flag. The function pte_alloc_one_kernel() is changed to
   call __pte_alloc_one_kernel() passing GFP_KERNEL | __GFP_REPEAT allocation
   flags.

2-level page table support
- Added macro __pmd_alloc_one which is same as pmd_alloc_one, but has an extra
  argument to pass gfp_t

3-level page table support
- Added function __pmd_alloc_one() to allocate pages using allocation flag.
  The allocation flag is argument to the function.

- The function pmd_alloc_one() is changed to call __pmd_alloc_one(), passing
  GFP_KERNEL | __GFP_REPEAT allocation flags.

- All these changes help in fixing the Bug 30702

Signed-off-by: Prasad Joshi <prasadjoshi124@gmail.com>
Signed-off-by: Anand Mitra <mitra@kqinfotech.com>
---
 arch/parisc/include/asm/pgalloc.h |   21 ++++++++++++++++-----
 1 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index fc987a1..0284a43 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -61,15 +61,20 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmd)
 		        (__u32)(__pa((unsigned long)pmd) >> PxD_VALUE_SHIFT));
 }
 
-static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
+static inline pmd_t *
+__pmd_alloc_one(struct mm_struct *mm, unsigned long address, gfp_t gfp_mask)
 {
-	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT,
-					       PMD_ORDER);
+	pmd_t *pmd = (pmd_t *)__get_free_pages(gfp_mask, PMD_ORDER);
 	if (pmd)
 		memset(pmd, 0, PAGE_SIZE<<PMD_ORDER);
 	return pmd;
 }
 
+static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
+{
+	return __pmd_alloc_one(mm, address, GFP_KERNEL | __GFP_REPEAT);
+}
+
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 #ifdef CONFIG_64BIT
@@ -90,6 +95,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
  * inside the pgd, so has no extra memory associated with it.
  */
 
+#define __pmd_alloc_one(mm, addr, mask)		({ BUG(); ((pmd_t *)2); })
 #define pmd_alloc_one(mm, addr)		({ BUG(); ((pmd_t *)2); })
 #define pmd_free(mm, x)			do { } while (0)
 #define pgd_populate(mm, pmd, pte)	BUG()
@@ -127,10 +133,15 @@ pte_alloc_one(struct mm_struct *mm, unsigned long address)
 }
 
 static inline pte_t *
+__pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr, gfp_t gfp_mask)
+{
+	return (pte_t *)__get_free_page(gfp_mask | __GFP_ZERO);
+}
+
+static inline pte_t *
 pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr)
 {
-	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
-	return pte;
+	return __pte_alloc_one_kernel(mm, addr, GFP_KERNEL | __GFP_REPEAT);
 }
 
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
-- 
1.7.0.4

