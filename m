From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt #5
Date: Wed, 6 Sep 2006 00:29:00 -0600
Message-ID: <20060906062900.GC3448@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<20060901224825.GD4041@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060901224825.GD4041@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 01, 2006 at 04:48:25PM -0600, Grant Grundler wrote:
> version #3: seems to be working fine on 64-bit SMP.
> 32-bit UP kernel is still under construction.

I didn't bother posting version #4.
Here is version #5 (against current parisc git tree):

o makes all vars in timer_interrupt and gettimeoffset unsigned longs
o make a local var to store clocktick - gcc can optimize local vars
o completely remove halftick
o completely remove ticks_elapsed _and_ the loop that depended on it.
  (James observed that x86 doesn't have such a loop...all the risc
   arches seemed to have fallen behind on that.) 
o skips a tick if we can't safely program CR16 for that tick
o Avoids div/mul math in nearly all cases. If timer_interrupt()
  misses more than 32 ticks, division will be used in the
  one modulo operation.

I'd like to commit this by this friday (or sooner) if other folks
have no objection.

thanks,
grant

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index e595b93..e61d603 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -35,8 +35,7 @@ #include <linux/timex.h>
 /* xtime and wall_jiffies keep wall-clock time */
 extern unsigned long wall_jiffies;
 
-static long clocktick __read_mostly;	/* timer cycles per tick */
-static long halftick __read_mostly;
+static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
 
 #ifdef CONFIG_SMP
 extern void smp_do_timer(struct pt_regs *regs);
@@ -44,46 +43,106 @@ #endif
 
 irqreturn_t timer_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	long now;
-	long next_tick;
-	int nticks;
-	int cpu = smp_processor_id();
+	unsigned long now;
+	unsigned long next_tick;
+	unsigned long cycles_elapsed;
+	unsigned long cycles_remainder;
+	unsigned int cpu = smp_processor_id();
+
+	/* gcc can optimize for "read-only" case with a local clocktick */
+	unsigned long cpt = clocktick;
 
 	profile_tick(CPU_PROFILING, regs);
 
-	now = mfctl(16);
-	/* initialize next_tick to time at last clocktick */
+	/* Initialize next_tick to the expected tick time. */
 	next_tick = cpu_data[cpu].it_value;
 
-	/* since time passes between the interrupt and the mfctl()
-	 * above, it is never true that last_tick + clocktick == now.  If we
-	 * never miss a clocktick, we could set next_tick = last_tick + clocktick
-	 * but maybe we'll miss ticks, hence the loop.
-	 *
-	 * Variables are *signed*.
+	/* Get current interval timer.
+	 * CR16 reads as 64 bits in CPU wide mode.
+	 * CR16 reads as 32 bits in CPU narrow mode.
 	 */
+	now = mfctl(16);
+
+	cycles_elapsed = now - next_tick;
+
+	if ((cycles_elapsed >> 5) < cpt) {
+		/* use "cheap" math (add/subtract) instead
+		 * of the more expensive div/mul method
+		 */
+		cycles_remainder = cycles_elapsed;
+		while (cycles_remainder > cpt) {
+			cycles_remainder -= cpt;
+		}
+	} else {
+		cycles_remainder = cycles_elapsed % cpt;
+	}
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
-		next_tick += clocktick;
-		nticks++;
+	/* Can we differentiate between "early CR16" (aka Scenario 1) and
+	 * "long delay" (aka Scenario 3)? I don't think so.
+	 *
+	 * We expected timer_interrupt to be delivered at least a few hundred
+	 * cycles after the IT fires. But it's arbitrary how much time passes
+	 * before we call it "late". I've picked one second.
+	 */
+/* aproximate HZ with shifts. Intended math is "(elapsed/clocktick) > HZ" */
+#if (HZ = 1000)
+	if (cycles_elapsed > (cpt << 10) )
+#elif (HZ = 250)
+	if (cycles_elapsed > (cpt << 8) )
+#elif (HZ = 100)
+	if (cycles_elapsed > (cpt << 7) )
+#elif
+#warn WTF is HZ set to anyway?
+	if (cycles_elapsed > (HZ * cpt) )
+#endif
+	{
+		/* Scenario 3: very long delay?  bad in any case */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
+			" cycles %lX rem %lX "
+			" next/now %lX/%lX\n",
+			cpu,
+			cycles_elapsed, cycles_remainder,
+			next_tick, now );
 	}
-	mtctl(next_tick, 16);
+
+	/* convert from "division remainder" to "remainder of clock tick" */
+	cycles_remainder = cpt - cycles_remainder;
+
+	/* Determine when (in CR16 cycles) next IT interrupt will fire.
+	 * We want IT to fire modulo clocktick even if we miss/skip some.
+	 * But those interrupts don't in fact get delivered that regularly.
+	 */
+	next_tick = now + cycles_remainder;
+
 	cpu_data[cpu].it_value = next_tick;
 
-	while (nticks--) {
+	/* Skip one clocktick on purpose if we are likely to miss next_tick.
+	 * We want to avoid the new next_tick being less than CR16.
+	 * If that happened, itimer wouldn't fire until CR16 wrapped.
+	 * We'll catch the tick we missed on the tick after that.
+	 */
+	if (!(cycles_remainder >> 13))
+		next_tick += cpt;
+
+	/* Program the IT when to deliver the next interrupt. */
+        /* Only bottom 32-bits of next_tick are written to cr16.  */
+	mtctl(next_tick, 16);
+
+
+	/* Done mucking with unreliable delivery of interrupts.
+	 * Go do system house keeping.
+	 */
 #ifdef CONFIG_SMP
-		smp_do_timer(regs);
+	smp_do_timer(regs);
 #else
-		update_process_times(user_mode(regs));
+	update_process_times(user_mode(regs));
 #endif
-		if (cpu == 0) {
-			write_seqlock(&xtime_lock);
-			do_timer(regs);
-			write_sequnlock(&xtime_lock);
-		}
+	if (cpu == 0) {
+		write_seqlock(&xtime_lock);
+		do_timer(regs);
+		write_sequnlock(&xtime_lock);
 	}
-    
+
 	/* check soft power switch status */
 	if (cpu == 0 && !atomic_read(&power_tasklet.count))
 		tasklet_schedule(&power_tasklet);
@@ -109,14 +168,12 @@ #endif
 EXPORT_SYMBOL(profile_pc);
 
 
-/*** converted from ia64 ***/
 /*
  * Return the number of micro-seconds that elapsed since the last
  * update to wall time (aka xtime aka wall_jiffies).  The xtime_lock
  * must be at least read-locked when calling this routine.
  */
-static inline unsigned long
-gettimeoffset (void)
+static inline unsigned long gettimeoffset (void)
 {
 #ifndef CONFIG_SMP
 	/*
@@ -124,21 +181,47 @@ #ifndef CONFIG_SMP
 	 *    Once parisc-linux learns the cr16 difference between processors,
 	 *    this could be made to work.
 	 */
-	long last_tick;
-	long elapsed_cycles;
+	unsigned long now;
+	unsigned long prev_tick;
+	unsigned long next_tick;
+	unsigned long elapsed_cycles;
+	unsigned long usec;
+	unsigned long cpuid = smp_processor_id();
+	unsigned long cpt = clocktick;
+
+	next_tick = cpu_data[cpuid].it_value;
+	now = mfctl(16);	/* Read the hardware interval timer.  */
+
+	prev_tick = next_tick - cpt;
+
+	/* Assume Scenario 1: "now" is later than prev_tick.  */
+	elapsed_cycles = now - prev_tick;
+
+/* aproximate HZ with shifts. Intended math is "(elapsed/clocktick) > HZ" */
+#if (HZ = 1000)
+	if (elapsed_cycles > (cpt << 10) )
+#elif (HZ = 250)
+	if (elapsed_cycles > (cpt << 8) )
+#elif (HZ = 100)
+	if (elapsed_cycles > (cpt << 7) )
+#elif
+#warn WTF is HZ set to anyway?
+	if (elapsed_cycles > (HZ * cpt) )
+#endif
+	{
+		/* Scenario 3: clock ticks are missing. */
+		printk (KERN_CRIT "gettimeoffset(CPU %ld): missing %ld ticks!"
+			" cycles %lX prev/now/next %lX/%lX/%lX  clock %lX\n",
+			cpuid, elapsed_cycles / cpt,
+			elapsed_cycles, prev_tick, now, next_tick, cpt);
+	}
 
-	/* it_value is the intended time of the next tick */
-	last_tick = cpu_data[smp_processor_id()].it_value;
+	/* FIXME: Can we improve the precision? Not with PAGE0. */
+	usec = (elapsed_cycles * 10000) / PAGE0->mem_10msec;
 
-	/* Subtract one tick and account for possible difference between
-	 * when we expected the tick and when it actually arrived.
-	 * (aka wall vs real)
-	 */
-	last_tick -= clocktick * (jiffies - wall_jiffies + 1);
-	elapsed_cycles = mfctl(16) - last_tick;
-
-	/* the precision of this math could be improved */
-	return elapsed_cycles / (PAGE0->mem_10msec / 10000);
+	/* add in "lost" jiffies */
+	usec += cpt * (jiffies - wall_jiffies);
+	return usec;
 #else
 	return 0;
 #endif
@@ -149,6 +232,7 @@ do_gettimeofday (struct timeval *tv)
 {
 	unsigned long flags, seq, usec, sec;
 
+	/* Hold xtime_lock and adjust timeval.  */
 	do {
 		seq = read_seqbegin_irqsave(&xtime_lock, flags);
 		usec = gettimeoffset();
@@ -156,25 +240,13 @@ do_gettimeofday (struct timeval *tv)
 		usec += (xtime.tv_nsec / 1000);
 	} while (read_seqretry_irqrestore(&xtime_lock, seq, flags));
 
-	if (unlikely(usec > LONG_MAX)) {
-		/* This can happen if the gettimeoffset adjustment is
-		 * negative and xtime.tv_nsec is smaller than the
-		 * adjustment */
-		printk(KERN_ERR "do_gettimeofday() spurious xtime.tv_nsec of %ld\n", usec);
-		usec += USEC_PER_SEC;
-		--sec;
-		/* This should never happen, it means the negative
-		 * time adjustment was more than a second, so there's
-		 * something seriously wrong */
-		BUG_ON(usec > LONG_MAX);
-	}
-
