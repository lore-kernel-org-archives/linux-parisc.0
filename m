From: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/3] parisc: Disable tlb flush optimization with huge pages
Date: Sun,  6 Dec 2015 21:43:32 +0100
Message-ID: <1449434613-32214-2-git-send-email-deller@gmx.de>
References: <1449434613-32214-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1449434613-32214-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

It seems calling flush_tlb_all() doesn't reliable flush the tlb on all
CPUs. Disable it when used with huge pages.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/cache.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index cda6dbb..aee27e1 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -442,13 +442,15 @@ EXPORT_SYMBOL(copy_user_page);
 int __flush_tlb_range(unsigned long sid, unsigned long start,
 		      unsigned long end)
 {
-	unsigned long flags, size;
+	unsigned long flags;
 
-	size = (end - start);
+#if !defined(CONFIG_HUGETLB_PAGE)
+	unsigned long size = (end - start);
 	if (size >= parisc_tlb_flush_threshold) {
 		flush_tlb_all();
 		return 1;
 	}
+#endif
 
 	/* Purge TLB entries for small ranges using the pdtlb and
 	   pitlb instructions.  These instructions execute locally
-- 
2.1.0

