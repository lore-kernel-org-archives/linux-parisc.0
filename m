From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move die_if_kernel() prototype into traps.h header
Date: Sat, 4 Jun 2016 17:38:09 +0200
Message-ID: <20160604153809.GA28686@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/traps.h b/arch/parisc/include/asm/traps.h
index 4736020..5e953ab 100644
--- a/arch/parisc/include/asm/traps.h
+++ b/arch/parisc/include/asm/traps.h
@@ -8,6 +8,8 @@ struct pt_regs;
 void parisc_terminate(char *msg, struct pt_regs *regs,
 		int code, unsigned long offset) __noreturn __cold;
 
+void die_if_kernel(char *str, struct pt_regs *regs, long err);
+
 /* mm/fault.c */
 void do_page_fault(struct pt_regs *regs, unsigned long code,
 		unsigned long address);
diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index d7c0acb..2b65c01 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -28,6 +28,7 @@
 #include <linux/ratelimit.h>
 #include <asm/uaccess.h>
 #include <asm/hardirq.h>
+#include <asm/traps.h>
 
 /* #define DEBUG_UNALIGNED 1 */
 
@@ -130,8 +131,6 @@
 
 int unaligned_enabled __read_mostly = 1;
 
-void die_if_kernel (char *str, struct pt_regs *regs, long err);
