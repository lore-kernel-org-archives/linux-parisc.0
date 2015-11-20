From: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/9] parisc: Fix wrong comment regarding first pmd entry flags
Date: Fri, 20 Nov 2015 22:38:34 +0100
Message-ID: <1448055522-11594-2-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The first pmd entry is marked with PxD_FLAG_ATTACHED instead of
_PAGE_GATEWAY.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgalloc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index 3edbb9f..f2fd327 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -35,7 +35,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 				        PxD_FLAG_VALID | 
 					PxD_FLAG_ATTACHED) 
 			+ (__u32)(__pa((unsigned long)pgd) >> PxD_VALUE_SHIFT));
-		/* The first pmd entry also is marked with _PAGE_GATEWAY as
+		/* The first pmd entry also is marked with PxD_FLAG_ATTACHED as
 		 * a signal that this pmd may not be freed */
 		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
 #endif
-- 
2.1.0

