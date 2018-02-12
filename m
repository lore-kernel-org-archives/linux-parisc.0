From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Reduce irq overhead when run in QEMU
Date: Mon, 12 Feb 2018 21:43:55 +0100
Message-ID: <20180212204355.GA10131@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When run under qemu, calling mfctl(16) creates some overhead because the
qemu timer has to be scaled and moved into the register. This patch
reduces the number of calls to mfctl(16) by moving the calls out of the
loops.

Additionally, increase the minimal time interval to 8000 cycles instead
of 500 for better QEMU support.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 4b8fd6dc22da..743a8933cd47 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -76,10 +76,10 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	next_tick = cpuinfo->it_value;
 
 	/* Calculate how many ticks have elapsed. */
+	now = mfctl(16);
 	do {
 		++ticks_elapsed;
 		next_tick += cpt;
-		now = mfctl(16);
 	} while (next_tick - now > cpt);
 
 	/* Store (in CR16 cycles) up to when we are accounting right now. */
@@ -103,16 +103,17 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	 * if one or the other wrapped. If "now" is "bigger" we'll end up
 	 * with a very large unsigned number.
 	 */
-	while (next_tick - mfctl(16) > cpt)
+	now = mfctl(16);
+	while (next_tick - now > cpt)
 		next_tick += cpt;
 
 	/* Program the IT when to deliver the next interrupt.
 	 * Only bottom 32-bits of next_tick are writable in CR16!
 	 * Timer interrupt will be delivered at least a few hundred cycles
-	 * after the IT fires, so if we are too close (<= 500 cycles) to the
+	 * after the IT fires, so if we are too close (<= 8000 cycles) to the
 	 * next cycle, simply skip it.
 	 */
-	if (next_tick - mfctl(16) <= 500)
+	if (next_tick - now <= 8000)
 		next_tick += cpt;
 	mtctl(next_tick, 16);
 
