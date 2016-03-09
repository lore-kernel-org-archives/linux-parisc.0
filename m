From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 2/2] PA-RISC: panic immediately when panic_on_oops
Date: Wed,  9 Mar 2016 22:08:43 +0200
Message-ID: <1457554123-18491-3-git-send-email-aaro.koskinen@iki.fi>
References: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Ralf Baechle <ralf@linux-mips.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-mips@linux-mips.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PA-RISC wants to sleep 5 seconds before panicking when panic_on_oops
is set, with no apparent reason. Remove this feature, since some users
may want their systems to fail as quickly as possible.

Users who want to delay reboot after panic can use PANIC_TIMEOUT.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/parisc/kernel/traps.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 553b098..16e0735 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -284,11 +284,8 @@ void die_if_kernel(char *str, struct pt_regs *regs, long err)
 	if (in_interrupt())
 		panic("Fatal exception in interrupt");
 
-	if (panic_on_oops) {
-		printk(KERN_EMERG "Fatal exception: panic in 5 seconds\n");
-		ssleep(5);
+	if (panic_on_oops)
 		panic("Fatal exception");
-	}
 
 	oops_exit();
 	do_exit(SIGSEGV);
-- 
2.4.0
