From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Improve cache flushing under qemu
Date: Tue, 13 Feb 2018 23:10:10 +0100
Message-ID: <20180213221010.GA27272@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In QEMU we emulate a machine without any data or instruction caches.
Avoid calling the assembly cache flush functions when we have no caches
improves speed with qemu a lot.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index d5381b3e8f95..b4b6f6631d3b 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -55,11 +55,17 @@ static struct pdc_btlb_info btlb_info __read_mostly;
 void
 flush_data_cache(void)
 {
+	if (unlikely(!cache_info.dc_size))
+		return;
+
 	on_each_cpu(flush_data_cache_local, NULL, 1);
 }
 void 
 flush_instruction_cache(void)
 {
+	if (unlikely(!cache_info.ic_size))
+		return;
+
 	on_each_cpu(flush_instruction_cache_local, NULL, 1);
 }
 #endif
@@ -67,8 +73,10 @@ flush_instruction_cache(void)
 void
 flush_cache_all_local(void)
 {
-	flush_instruction_cache_local(NULL);
-	flush_data_cache_local(NULL);
+	if (likely(cache_info.ic_size))
+		flush_instruction_cache_local(NULL);
+	if (likely(cache_info.dc_size))
+		flush_data_cache_local(NULL);
 }
 EXPORT_SYMBOL(flush_cache_all_local);
 
@@ -506,7 +515,8 @@ static void cacheflush_h_tmp_function(void *dummy)
 
 void flush_cache_all(void)
 {
-	on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
+	if (likely(cache_info.dc_size || cache_info.ic_size))
+		on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
 }
 
 static inline unsigned long mm_total_size(struct mm_struct *mm)
