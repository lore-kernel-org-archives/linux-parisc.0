From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] parisc: Replace PT_NLEVELS with CONFIG_PGTABLE_LEVELS
Date: Wed, 15 Apr 2015 13:34:28 -0700
Message-ID: <1429130068-18096-1-git-send-email-linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following warning is seen when compiling parisc images

./arch/parisc/include/asm/pgalloc.h: In function 'pgd_alloc':
./arch/parisc/include/asm/pgalloc.h:29:5: warning: "PT_NLEVELS" is not defined

Some definitions of PT_NLEVELS were missed with the conversion to
CONFIG_PGTABLE_LEVELS.

Fixes: f24ffde43237 ("parisc: expose number of page table levels
	on Kconfig level")
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/include/asm/pgalloc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index 1ba29369257c..3a08eae3318f 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -26,7 +26,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 	if (likely(pgd != NULL)) {
 		memset(pgd, 0, PAGE_SIZE<<PGD_ALLOC_ORDER);
-#if PT_NLEVELS == 3
+#if CONFIG_PGTABLE_LEVELS == 3
 		actual_pgd += PTRS_PER_PGD;
 		/* Populate first pmd with allocated memory.  We mark it
 		 * with PxD_FLAG_ATTACHED as a signal to the system that this
@@ -45,7 +45,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-#if PT_NLEVELS == 3
+#if CONFIG_PGTABLE_LEVELS == 3
 	pgd -= PTRS_PER_PGD;
 #endif
 	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
@@ -102,7 +102,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-#if PT_NLEVELS == 3
+#if CONFIG_PGTABLE_LEVELS == 3
 	/* preserve the gateway marker if this is the beginning of
 	 * the permanent pmd */
 	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
-- 
2.1.0

