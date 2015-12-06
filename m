From: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/3] parisc: Disable huge pages on Mako machines
Date: Sun,  6 Dec 2015 21:43:31 +0100
Message-ID: <1449434613-32214-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Mako-based machines (PA8800 and PA8900 CPUs) don't allow aliasing on
non-equaivalent addresses.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index d8534f9..291cee2 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -372,7 +372,8 @@ static inline pte_t pte_mkspecial(pte_t pte)	{ return pte; }
  */
 #ifdef CONFIG_HUGETLB_PAGE
 #define pte_huge(pte)           (pte_val(pte) & _PAGE_HUGE)
-#define pte_mkhuge(pte)         (__pte(pte_val(pte) | _PAGE_HUGE))
+#define pte_mkhuge(pte)         (__pte(pte_val(pte) | \
+				 (parisc_requires_coherency() ? 0 : _PAGE_HUGE)))
 #else
 #define pte_huge(pte)           (0)
 #define pte_mkhuge(pte)         (pte)
-- 
2.1.0

