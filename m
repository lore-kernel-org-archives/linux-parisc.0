From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 1/2] MIPS: panic immediately when panic_on_oops
Date: Wed,  9 Mar 2016 22:08:42 +0200
Message-ID: <1457554123-18491-2-git-send-email-aaro.koskinen@iki.fi>
References: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Ralf Baechle <ralf@linux-mips.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-mips@linux-mips.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1457554123-18491-1-git-send-email-aaro.koskinen@iki.fi>
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: linux-mips <linux-mips.eddie.linux-mips.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>

MIPS wants to sleep 5 seconds before panicking when panic_on_oops is set,
with no apparent reason. Remove this feature, since some users may want
their systems to fail as quickly as possible.

Users who want to delay reboot after panic can use PANIC_TIMEOUT.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/mips/kernel/traps.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index bf14da9..5756740 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -398,11 +398,8 @@ void __noreturn die(const char *str, struct pt_regs *regs)
 	if (in_interrupt())
 		panic("Fatal exception in interrupt");
 
-	if (panic_on_oops) {
-		printk(KERN_EMERG "Fatal exception: panic in 5 seconds");
-		ssleep(5);
+	if (panic_on_oops)
 		panic("Fatal exception");
-	}
 
 	if (regs && kexec_should_crash(current))
 		crash_kexec(regs);
-- 
2.4.0
