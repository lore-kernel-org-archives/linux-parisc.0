From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use kernel_text_address() in unwind functions
Date: Sat, 30 Nov 2013 21:23:20 +0100
Message-ID: <20131130202320.GA30998@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 76ed62e..ddd988b 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -168,7 +168,7 @@ void unwind_table_remove(struct unwind_table *table)
 }
 
 /* Called from setup_arch to import the kernel unwind info */
-int unwind_init(void)
+int __init unwind_init(void)
 {
 	long start, stop;
 	register unsigned long gp __asm__ ("r27");
@@ -233,7 +233,6 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 	e = find_unwind_entry(info->ip);
 	if (e == NULL) {
 		unsigned long sp;
-		extern char _stext[], _etext[];
 
 		dbg("Cannot find unwind entry for 0x%lx; forced unwinding\n", info->ip);
 
@@ -281,8 +280,7 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 				break;
 			info->prev_ip = tmp;
 			sp = info->prev_sp;
-		} while (info->prev_ip < (unsigned long)_stext ||
-			 info->prev_ip > (unsigned long)_etext);
+		} while (!kernel_text_address(info->prev_ip));
 
 		info->rp = 0;
 
@@ -435,9 +433,8 @@ unsigned long return_address(unsigned int level)
 	do {
 		if (unwind_once(&info) < 0 || info.ip == 0)
 			return 0;
-		if (!__kernel_text_address(info.ip)) {
+		if (!kernel_text_address(info.ip))
 			return 0;
-		}
 	} while (info.ip && level--);
 
 	return info.ip;
