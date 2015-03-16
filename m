From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix pmd code to depend on PT_NLEVELS value, not on
 CONFIG_64BIT
Date: Mon, 16 Mar 2015 21:17:50 +0100
Message-ID: <20150316201750.GA3085@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Make the code which sets up the pmd depend on PT_NLEVELS == 3, not on
CONFIG_64BIT. The reason is, that a 64bit kernel with a page size
greater than 4k doesn't need the pmd and thus has PT_NLEVELS = 2.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index 8ee9a0b..c500730 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -26,7 +26,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 	if (likely(pgd != NULL)) {
 		memset(pgd, 0, PAGE_SIZE<<PGD_ALLOC_ORDER);
-#ifdef CONFIG_64BIT
+#if PT_NLEVELS == 3
 		actual_pgd += PTRS_PER_PGD;
 		/* Populate first pmd with allocated memory.  We mark it
 		 * with PxD_FLAG_ATTACHED as a signal to the system that this
@@ -46,7 +46,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-#ifdef CONFIG_64BIT
+#if PT_NLEVELS == 3
 	pgd -= PTRS_PER_PGD;
 #endif
 	free_pages((unsigned long)pgd, PGD_ALLOC_ORDER);
@@ -73,12 +73,10 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
-#ifdef CONFIG_64BIT
 	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
 		/* This is the permanent pmd attached to the pgd;
 		 * cannot free it */
 		return;
-#endif
 	free_pages((unsigned long)pmd, PMD_ORDER);
 }
 
@@ -100,7 +98,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-#ifdef CONFIG_64BIT
+#if PT_NLEVELS == 3
 	/* preserve the gateway marker if this is the beginning of
 	 * the permanent pmd */
 	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
