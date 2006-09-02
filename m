From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sat, 02 Sep 2006 10:52:06 -0500
Message-ID: <1157212326.4041.26.camel@mulgrave.il.steeleye.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2006-08-30 at 16:23 -0400, Carlos O'Donell wrote:
> It actaully turns out I don't think I ever booted this patch, my
> palo.conf was hosed and I was writing the wrong kernel. It was too
> good to be true :)
> 
> I'll have a go at testing this again tonight.

Actually, according to my analysis on ioz (pa8800) there seem to be some
hidden issues with our implementation (i.e. it's not the mathematics).

The first problem is that interrupts are re-entrant, so the timer
interrupt can get re-interrupted.  If this happens between the mfctl(16)
and the mtctl(), which is made much longer by the use of while loops,
then there's a small possibility that the interrupt caused us to miss
the next tick (i.e. cr16 moved beyond next_tick while in the interrupt).
I see this very occasionally on the pa8800 caused by flush IPIs (since
the cache is so huge) ... it's probably caused by SCSI interrupts on the
C3xxx that everyone else is testing with.  However, when this happens,
you have to wait for cr16 to wrap before you get another timer
interrupt, which I believe to be the source of the time jumps and
negative offsets in gettimeoffset().

My proposed fix for this is below.  However, we seem to have a few other
issues:

     1. On SMP, cr16 of the secondary processors (and next_tick) is
        never initialised ... we just wait for the timer to wrap and
        then pick up ticking from there.
     2. processor_probe() blows away all of the next_tick data when it's
        called (once for every CPU)
     3. We're regularly missing multiple ticks ... mainly below about
        30 .. there must be some cause for this but I can't immediately
        find it.
     4. we don't obey CONFIG_HZ at all the clock is always either 1000
        for pa2.0 or 100 for pa1.0

James

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 5facc9b..93322a2 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -48,9 +48,13 @@ irqreturn_t timer_interrupt(int irq, voi
 	long next_tick;
 	int nticks;
 	int cpu = smp_processor_id();
+	unsigned long flags;
 
 	profile_tick(CPU_PROFILING, regs);
 
+	/* Don't want to be interrupted while calculating
+	 * time offsets */
+	local_irq_save(flags);
 	now = mfctl(16);
 	/* initialize next_tick to time at last clocktick */
 	next_tick = cpu_data[cpu].it_value;
@@ -63,13 +67,24 @@ irqreturn_t timer_interrupt(int irq, voi
 	 * Variables are *signed*.
 	 */
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
+	/* Don't do expensive mul and div for the likely case */
+	if (likely(now - next_tick < clocktick)) {
+		nticks = 1;
 		next_tick += clocktick;
+	} else {
+		nticks = ((now - next_tick)/clocktick) + 1;
+		next_tick += clocktick*nticks;
+	}
+	/* Don't interrupt too much.  If we only have half
+	 * the time to go to the next tick, push it out one
+	 * more tick */
+	if (unlikely(next_tick - now < halftick)) {
 		nticks++;
+		next_tick += clocktick;
 	}
 	mtctl(next_tick, 16);
 	cpu_data[cpu].it_value = next_tick;
+	local_irq_restore(flags);
 
 	while (nticks--) {
 #ifdef CONFIG_SMP


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
