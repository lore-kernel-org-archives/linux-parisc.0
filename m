From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Mark cr16 clocksource unstable on SMP systems
Date: Mon, 26 Dec 2016 12:46:01 +0100
Message-ID: <20161226114601.GA5893@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The cr16 interval timer of each CPU is not syncronized to other cr16
timers in other CPUs in a SMP system. So, delay the registration of the
cr16 clocksource until all CPUs have been detected and then mark it as
unstable and lower it's rating before registering it at the clockource
framework.

This patch fixes the stalled CPU warnings which we have seen since
introduction of the cr16 clocksource.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 325f30d..47ef8fd 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -289,9 +289,26 @@ void __init time_init(void)
 
 	cr16_hz = 100 * PAGE0->mem_10msec;  /* Hz */
 
-	/* register at clocksource framework */
-	clocksource_register_hz(&clocksource_cr16, cr16_hz);
