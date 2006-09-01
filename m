From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Fri, 1 Sep 2006 16:48:25 -0600
Message-ID: <20060901224825.GD4041@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831065327.GG3999@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 12:53:27AM -0600, Grant Grundler wrote:
> And I've hacked your version some more.
> diff is below.

version #3: seems to be working fine on 64-bit SMP.
32-bit UP kernel is still under construction.

That means gettimeoffset() hasn't been tested.
And I'm getting the following warnings on my b2600:
...
Setting the system clock..                                                      
timer_interrupt(CPU 0): delayed! run ntpdate ticks 859 cycles FFF51A1C rem 40E59C next/now FFFE7A9D/96080
gettimeoffset(CPU -119762782): missing ticks!cycles FFC87AE4 prev/now/next 6EBEA41/14C624/4C4B40  clock 0
gettimeoffset(CPU -177625053): missing ticks!cycles FFC87AE4 prev/now/next A5ED2C0/14C624/4C4B40  clock 12
gettimeoffset(CPU -238800592): missing ticks!cycles FFC87AE4 prev/now/next E0449B3/14C624/4C4B40  clock 12
gettimeoffset(CPU -302979574): missing ticks!cycles FFC87AE4 prev/now/next 11D794D9/14C624/4C4B40  clock 0
Sysgettimeoffset(CPU -361861366): missing ticks!cycles FFC87AE4 prev/now/next 155A0BD9/14C624/4C4B40  clock 12                                                  
tem Clock set. Local time: Fri Sep  1 22:42:09 UTC 2006. 

gettimeoffset printk is busticated. I'll fix that in the next version.
But it looks like wrapped values are causing problems.

The timer_interrupt warning might be reasonable given we are making
a call to firmware to set the clock and block interrupts for
the duration.


In addition to time.c, two more files are touched:
	smp.c	I couldn't see where slave CPUs would start
		the interval timer and added the call here.

	param.h	Use CONFIG_HZ for interval timer.
		We were ignored this before.

I just realized one small change to arch/parisc/kernel/processor.c
is missin from this diff. We don't want processor_probe() to clobber
CPU0's cpu_data. "it_value" has already been initialized.

enjoy!
grant


diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 98e4095..f33e8de 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -430,8 +430,9 @@ smp_do_timer(struct pt_regs *regs)
 static void __init
 smp_cpu_init(int cpunum)
 {
-	extern int init_per_cpu(int);  /* arch/parisc/kernel/setup.c */
+	extern int init_per_cpu(int);  /* arch/parisc/kernel/processor.c */
 	extern void init_IRQ(void);    /* arch/parisc/kernel/irq.c */
+	extern void start_cpu_itimer(void); /* arch/parisc/kernel/time.c */
 
 	/* Set modes and Enable floating point coprocessor */
 	(void) init_per_cpu(cpunum);
@@ -457,6 +458,7 @@ smp_cpu_init(int cpunum)
 	enter_lazy_tlb(&init_mm, current);
 
 	init_IRQ();   /* make sure no IRQ's are enabled or pending */
+	start_cpu_itimer();
 }
 
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 5facc9b..337c4ec 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -35,8 +35,8 @@ #include <linux/timex.h>
 /* xtime and wall_jiffies keep wall-clock time */
 extern unsigned long wall_jiffies;
 
-static long clocktick __read_mostly;	/* timer cycles per tick */
-static long halftick __read_mostly;
+static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
+static unsigned long halftick __read_mostly;
 
 #ifdef CONFIG_SMP
 extern void smp_do_timer(struct pt_regs *regs);
@@ -44,34 +44,77 @@ #endif
 
 irqreturn_t timer_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	long now;
-	long next_tick;
-	int nticks;
+	unsigned long now;
+	unsigned long next_tick;
+	unsigned long cycles_elapsed;
+        unsigned long cycles_remainder;
+	unsigned long ticks_elapsed = 1;	/* at least one elapsed */
 	int cpu = smp_processor_id();
 
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
+	/* Determine how much time elapsed.  */
+	if (now < next_tick) {
+		/* Scenario 2: CR16 wrapped after clock tick.
+		 * 1's complement will give us the "elapse cycles".
+		 *
+		 * This "cr16 wrapped" cruft is primarily for 32-bit kernels.
+		 * So think "unsigned long is u32" when reading the code.
+		 * And yes, of course 64-bit will someday wrap, but only
+	  	 * every 198841 days on a 1GHz machine.
+		 */
+		cycles_elapsed = ~cycles_elapsed;   /* off by one cycle - don't care */
+	}
+
+	ticks_elapsed += cycles_elapsed / clocktick;
+	cycles_remainder = cycles_elapsed % clocktick;
 
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
+	if (ticks_elapsed > HZ) {
+		/* Scenario 3: very long delay?  bad in any case */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed! run ntpdate"
+			" ticks %ld cycles %lX rem %lX"
+			" next/now %lX/%lX\n",
+			cpu,
+			ticks_elapsed, cycles_elapsed, cycles_remainder,
+			next_tick, now );
+
+		ticks_elapsed = 1;	/* hack to limit damage in loop below */
 	}
+
+
+	/* Determine when (in CR16 cycles) next IT interrupt will fire.
+	 * We want IT to fire modulo clocktick even if we miss/skip some.
+	 * But those interrupts don't in fact get delivered that regularly.
+	 */
+	next_tick = now + (clocktick - cycles_remainder);
+
+	/* Program the IT when to deliver the next interrupt. */
+        /* Only bottom 32-bits of next_tick are written to cr16.  */
 	mtctl(next_tick, 16);
 	cpu_data[cpu].it_value = next_tick;
 
-	while (nticks--) {
+	/* Now that we are done mucking with unreliable delivery of interrupts,
+	 * go do system house keeping.
+	 */
+	while (ticks_elapsed--) {
 #ifdef CONFIG_SMP
 		smp_do_timer(regs);
 #else
@@ -124,21 +167,40 @@ #ifndef CONFIG_SMP
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
 
-	/* it_value is the intended time of the next tick */
-	last_tick = cpu_data[smp_processor_id()].it_value;
+	next_tick = cpu_data[smp_processor_id()].it_value;
+	now = mfctl(16);	/* Read the hardware interval timer.  */
 
-	/* Subtract one tick and account for possible difference between
-	 * when we expected the tick and when it actually arrived.
-	 * (aka wall vs real)
-	 */
-	last_tick -= clocktick * (jiffies - wall_jiffies + 1);
-	elapsed_cycles = mfctl(16) - last_tick;
+	prev_tick = next_tick - clocktick;
 
-	/* the precision of this math could be improved */
-	return elapsed_cycles / (PAGE0->mem_10msec / 10000);
+	/* Assume Scenario 1: "now" is later than prev_tick.  */
+	elapsed_cycles = now - prev_tick;
+
+	if (now < prev_tick) {
+		/* Scenario 2: CR16 wrapped!
+		 * 1's complement is close enough.
+		 */
+		elapsed_cycles = ~elapsed_cycles;
+	}
+
+	if (elapsed_cycles > (HZ * clocktick)) {
+		/* Scenario 3: clock ticks are missing. */
+		printk (KERN_CRIT "gettimeoffset(CPU %d): missing ticks!"
+			"cycles %lX prev/now/next %lX/%lX/%lX  clock %lX\n",
+			 elapsed_cycles, prev_tick, now, next_tick, clocktick);
+	}
+
+	/* FIXME: Can we improve the precision? Not with PAGE0. */
+	usec = (elapsed_cycles * 10000) / PAGE0->mem_10msec;
+
+	/* add in "lost" jiffies */
+	usec += clocktick * (jiffies - wall_jiffies);
+	return usec;
 #else
 	return 0;
 #endif
@@ -149,6 +211,7 @@ do_gettimeofday (struct timeval *tv)
 {
 	unsigned long flags, seq, usec, sec;
 
+	/* Hold xtime_lock and adjust timeval.  */
 	do {
 		seq = read_seqbegin_irqsave(&xtime_lock, flags);
 		usec = gettimeoffset();
@@ -156,25 +219,13 @@ do_gettimeofday (struct timeval *tv)
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
-
+	/* Move adjusted usec's into sec's.  */
 	while (usec >= USEC_PER_SEC) {
 		usec -= USEC_PER_SEC;
 		++sec;
 	}
 
+	/* Return adjusted result.  */
 	tv->tv_sec = sec;
 	tv->tv_usec = usec;
 }
@@ -226,22 +277,24 @@ unsigned long long sched_clock(void)
 }
 
 
+void __init start_cpu_itimer(void)
+{
+	unsigned int cpu = smp_processor_id();
+	unsigned long next_tick = mfctl(16) + clocktick;
+
+	mtctl(next_tick, 16);		/* kick off Interval Timer (CR16) */
+
+	cpu_data[cpu].it_value = next_tick;
+}
+
 void __init time_init(void)
 {
-	unsigned long next_tick;
 	static struct pdc_tod tod_data;
 
 	clocktick = (100 * PAGE0->mem_10msec) / HZ;
 	halftick = clocktick / 2;
 
-	/* Setup clock interrupt timing */
-
-	next_tick = mfctl(16);
-	next_tick += clocktick;
-	cpu_data[smp_processor_id()].it_value = next_tick;
-
-	/* kick off Itimer (CR16) */
-	mtctl(next_tick, 16);
+	start_cpu_itimer();	/* get CPU 0 started */
 
 	if(pdc_tod_read(&tod_data) == 0) {
 		write_seqlock_irq(&xtime_lock);
diff --git a/include/asm-parisc/param.h b/include/asm-parisc/param.h
index 07cb9b9..32e03d8 100644
--- a/include/asm-parisc/param.h
+++ b/include/asm-parisc/param.h
@@ -2,13 +2,9 @@ #ifndef _ASMPARISC_PARAM_H
 #define _ASMPARISC_PARAM_H
 
 #ifdef __KERNEL__
-# ifdef CONFIG_PA20
-#  define HZ		1000		/* Faster machines */
-# else
-#  define HZ		100		/* Internal kernel timer frequency */
-# endif
-# define USER_HZ	100		/* .. some user interfaces are in "ticks" */
-# define CLOCKS_PER_SEC	(USER_HZ)	/* like times() */
+#define HZ		CONFIG_HZ
+#define USER_HZ		100		/* some user API use "ticks" */
+#define CLOCKS_PER_SEC	(USER_HZ)	/* like times() */
 #endif
 
 #ifndef HZ
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
