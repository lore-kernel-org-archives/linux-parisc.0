From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show initial kernel memory layout unhashed
Date: Tue, 2 Jan 2018 20:42:59 +0100
Message-ID: <20180102194259.GA27242@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 13f7854e0d49..48f41399fc0b 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -631,11 +631,11 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 #ifdef CONFIG_DEBUG_KERNEL /* double-sanity-check paranoia */
 	printk("virtual kernel memory layout:\n"
-	       "    vmalloc : 0x%p - 0x%p   (%4ld MB)\n"
-	       "    memory  : 0x%p - 0x%p   (%4ld MB)\n"
-	       "      .init : 0x%p - 0x%p   (%4ld kB)\n"
-	       "      .data : 0x%p - 0x%p   (%4ld kB)\n"
-	       "      .text : 0x%p - 0x%p   (%4ld kB)\n",
+	       "    vmalloc : 0x%px - 0x%px   (%4ld MB)\n"
+	       "    memory  : 0x%px - 0x%px   (%4ld MB)\n"
+	       "      .init : 0x%px - 0x%px   (%4ld kB)\n"
+	       "      .data : 0x%px - 0x%px   (%4ld kB)\n"
+	       "      .text : 0x%px - 0x%px   (%4ld kB)\n",
 
 	       (void*)VMALLOC_START, (void*)VMALLOC_END,
 	       (VMALLOC_END - VMALLOC_START) >> 20,
