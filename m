From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix system shutdown halting
Date: Sat, 18 Mar 2017 17:13:27 +0100
Message-ID: <20170318161327.GA31127@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On those parisc machines which don't provide a software power off
function, the system currently kills the init process at the end of a
shutdown and unexpectedly restarts insteads of halting.
Fix it by adding a loop which will not return.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.9+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 06f7ca7..b76f503 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -142,6 +142,8 @@ void machine_power_off(void)
 
 	printk(KERN_EMERG "System shut down completed.\n"
 	       "Please power this system off now.");
+
+	for (;;);
 }
 
 void (*pm_power_off)(void) = machine_power_off;
