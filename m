From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix printk continuations in system detection
Date: Thu, 17 Nov 2016 21:13:56 +0100
Message-ID: <20161117201356.GA30025@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index 545f9d2..c9789d9 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -58,7 +58,7 @@ void __init setup_pdc(void)
 	status = pdc_system_map_find_mods(&module_result, &module_path, 0);
 	if (status == PDC_OK) {
 		pdc_type = PDC_TYPE_SYSTEM_MAP;
-		printk("System Map.\n");
+		pr_cont("System Map.\n");
 		return;
 	}
 
@@ -77,7 +77,7 @@ void __init setup_pdc(void)
 	status = pdc_pat_cell_get_number(&cell_info);
 	if (status == PDC_OK) {
 		pdc_type = PDC_TYPE_PAT;
-		printk("64 bit PAT.\n");
+		pr_cont("64 bit PAT.\n");
 		return;
 	}
 #endif
@@ -97,12 +97,12 @@ void __init setup_pdc(void)
 	case 0xC:		/* 715/64, at least */
 
 		pdc_type = PDC_TYPE_SNAKE;
-		printk("Snake.\n");
+		pr_cont("Snake.\n");
 		return;
 
 	default:		/* Everything else */
 
-		printk("Unsupported.\n");
+		pr_cont("Unsupported.\n");
 		panic("If this is a 64-bit machine, please try a 64-bit kernel.\n");
 	}
 }
