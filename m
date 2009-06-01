From: Grant Grundler <grundler@parisc-linux.org>
Subject: PATCH 2.6.30-rc7 fix "delay!" timer handling
Date: Sun, 31 May 2009 18:20:23 -0600
Message-ID: <20090601002023.GE3291@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Rewrote timer_interrupt() to properly handle the "delayed!" case.

If we used floating point math to compute the number of ticks that had
elapsed since the last timer interrupt, it could take up to 12K cycles
(emperical!) to handle the interrupt. Existing code assumed it would
never take more than 8k cycles. We end up programming Interval Timer
to a value less than "current" cycle counter.  Thus have to wait until
Interval Timer "wrapped" and would then get the "delayed!" printk that
I moved below.

Since we don't really know what the upper limit is, I prefer to read
CR16 again after we've programmed it to make sure we won't have to
wait for CR16 to wrap.

Further, the printk was between reading CR16 (cycle couner) and writing CR16
(the interval timer). This would cause us to continue to set the interval
timer to a value that was "behind" the cycle counter. Rinse and repeat.
So no printk's between reading CR16 and setting next interval timer.

Tested on A500 (550 Mhz PA8600).

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

----
Kyle, Helge, and other parisc's,
Please test on 32-bit before committing.
I think I have it right but recognize I might not.

TODO: I wanted to use "do_div()" in order to get both remainder
and value back with one division op. That should help with the
latency alot but can be applied seperately from this patch.

thanks,
grant

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index d4dd056..b6daa53 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -56,9 +56,9 @@ static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
  */
 irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
-	unsigned long now;
+	unsigned long now, now2;
 	unsigned long next_tick;
-	unsigned long cycles_elapsed, ticks_elapsed;
+	unsigned long cycles_elapsed, ticks_elapsed = 1;
 	unsigned long cycles_remainder;
 	unsigned int cpu = smp_processor_id();
 	struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
@@ -71,44 +71,24 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	/* Initialize next_tick to the expected tick time. */
 	next_tick = cpuinfo->it_value;
 
-	/* Get current interval timer.
-	 * CR16 reads as 64 bits in CPU wide mode.
-	 * CR16 reads as 32 bits in CPU narrow mode.
-	 */
+	/* Get current cycle counter (Control Register 16). */
 	now = mfctl(16);
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 5) < cpt) {
+	if ((cycles_elapsed >> 6) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
 		cycles_remainder = cycles_elapsed;
-		ticks_elapsed = 1;
 		while (cycles_remainder > cpt) {
 			cycles_remainder -= cpt;
 			ticks_elapsed++;
 		}
 	} else {
+		/* TODO: Reduce this to one fdiv op */
 		cycles_remainder = cycles_elapsed % cpt;
-		ticks_elapsed = 1 + cycles_elapsed / cpt;
-	}
-
-	/* Can we differentiate between "early CR16" (aka Scenario 1) and
-	 * "long delay" (aka Scenario 3)? I don't think so.
-	 *
-	 * We expected timer_interrupt to be delivered at least a few hundred
-	 * cycles after the IT fires. But it's arbitrary how much time passes
-	 * before we call it "late". I've picked one second.
-	 */
-	if (unlikely(ticks_elapsed > HZ)) {
-		/* Scenario 3: very long delay?  bad in any case */
-		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
-			" cycles %lX rem %lX "
-			" next/now %lX/%lX\n",
-			cpu,
-			cycles_elapsed, cycles_remainder,
-			next_tick, now );
+		ticks_elapsed += cycles_elapsed / cpt;
 	}
 
 	/* convert from "division remainder" to "remainder of clock tick" */
@@ -122,18 +102,56 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cpuinfo->it_value = next_tick;
 
-	/* Skip one clocktick on purpose if we are likely to miss next_tick.
-	 * We want to avoid the new next_tick being less than CR16.
-	 * If that happened, itimer wouldn't fire until CR16 wrapped.
-	 * We'll catch the tick we missed on the tick after that.
+	/* Program the IT when to deliver the next interrupt.
+	 * Only bottom 32-bits of next_tick are writable in CR16!
 	 */
-	if (!(cycles_remainder >> 13))
-		next_tick += cpt;
-
-	/* Program the IT when to deliver the next interrupt. */
-	/* Only bottom 32-bits of next_tick are written to cr16.  */
 	mtctl(next_tick, 16);
 
+	/* Skip one clocktick on purpose if we missed next_tick.
+	 * The new CR16 must be "later" than current CR16 otherwise
+	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
+	 * later on a 1Ghz processor. We'll account for the missed
+	 * tick on the next timer interrupt.
+	 *
+	 * "next_tick - now" will always give the difference regardless
+	 * if one or the other wrapped. If "now" is "bigger" we'll end up
+	 * with a very large unsigned number.
+	 */
+	now2 = mfctl(16);
+	if (next_tick - now2 > cpt)
+		mtctl(next_tick+cpt, 16);
+
+#if 1
+/*
+ * GGG: DEBUG code for how many cycles programming CR16 used.
+ */
+	if (unlikely(now2 - now > 0x3000)) 	/* 12K cycles */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): SLOW! 0x%lx cycles!"
+			" cyc %lX rem %lX "
+			" next/now %lX/%lX\n",
+			cpu, now2 - now, cycles_elapsed, cycles_remainder,
+			next_tick, now );
+#endif
+
+	/* Can we differentiate between "early CR16" (aka Scenario 1) and
+	 * "long delay" (aka Scenario 3)? I don't think so.
+	 *
+	 * Timer_interrupt will be delivered at least a few hundred cycles
+	 * after the IT fires. But it's arbitrary how much time passes
+	 * before we call it "late". I've picked one second.
+	 *
+	 * It's important NO printk's are between reading CR16 and
+	 * setting up the next value. May introduce huge variance.
+	 */
+	if (unlikely(ticks_elapsed > HZ)) {
+		/* Scenario 3: very long delay?  bad in any case */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
+			" cycles %lX rem %lX "
+			" next/now %lX/%lX\n",
+			cpu,
+			cycles_elapsed, cycles_remainder,
+			next_tick, now );
+	}
 
 	/* Done mucking with unreliable delivery of interrupts.
 	 * Go do system house keeping.
