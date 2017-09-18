From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Check for broken memory in initrd
Date: Mon, 18 Sep 2017 17:55:24 +0200
Message-ID: <20170918155524.GA24676@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While scanning the PDT for reported broken memory modules, check if the
initrd may have been loaded in such broken regions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 05730a8..00aed08 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/seq_file.h>
 #include <linux/kthread.h>
+#include <linux/initrd.h>
 
 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
@@ -216,8 +217,16 @@ void __init pdc_pdt_init(void)
 	}
 
 	for (i = 0; i < pdt_status.pdt_entries; i++) {
+		unsigned long addr;
+
 		report_mem_err(pdt_entry[i]);
 
+		addr = pdt_entry[i] & PDT_ADDR_PHYS_MASK;
+		if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) &&
+			addr >= initrd_start && addr < initrd_end)
+			pr_crit("CRITICAL: initrd possibly broken "
+				"due to bad memory!\n");
+
 		/* mark memory page bad */
 		memblock_reserve(pdt_entry[i] & PAGE_MASK, PAGE_SIZE);
 	}
