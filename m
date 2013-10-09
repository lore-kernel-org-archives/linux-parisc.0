From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: optimize timer_interrupt() function
Date: Thu, 10 Oct 2013 00:12:50 +0200
Message-ID: <20131009221250.GA1618@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Optimize the timer interrupt function to avoid timer_interrupt
delayed/SLOW messages:
- always do the "cheap" math, it's much faster.
- avoid calling mtctl() twice if we want to skip one clocktick
- do the house keeping (update counters) before we printk() some
  warnings

Overall those changes reduced the amount of timer_interrupt kernel
warnings a lot for me.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 70e105d..5a16c12 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -77,7 +77,7 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 6) < cpt) {
+	if (1 || (cycles_elapsed >> 6) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
@@ -105,10 +105,8 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	/* Program the IT when to deliver the next interrupt.
 	 * Only bottom 32-bits of next_tick are writable in CR16!
-	 */
-	mtctl(next_tick, 16);
-
-	/* Skip one clocktick on purpose if we missed next_tick.
+	 *
+	 * Skip one clocktick on purpose if we missed next_tick.
 	 * The new CR16 must be "later" than current CR16 otherwise
 	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
 	 * later on a 1Ghz processor. We'll account for the missed
@@ -121,6 +119,20 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	now2 = mfctl(16);
 	if (next_tick - now2 > cpt)
 		mtctl(next_tick+cpt, 16);
+	else
+		mtctl(next_tick, 16);
+
+	/* Done mucking with unreliable delivery of interrupts.
+	 * Go do system house keeping.
+	 */
+
+	if (!--cpuinfo->prof_counter) {
+		cpuinfo->prof_counter = cpuinfo->prof_multiplier;
+		update_process_times(user_mode(get_irq_regs()));
+	}
+
+	if (cpu == 0)
+		xtime_update(ticks_elapsed);
 
 #if 1
 /*
@@ -154,18 +166,6 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 			next_tick, now );
 	}
 
-	/* Done mucking with unreliable delivery of interrupts.
-	 * Go do system house keeping.
-	 */
-
-	if (!--cpuinfo->prof_counter) {
-		cpuinfo->prof_counter = cpuinfo->prof_multiplier;
-		update_process_times(user_mode(get_irq_regs()));
-	}
-
-	if (cpu == 0)
-		xtime_update(ticks_elapsed);
