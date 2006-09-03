From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 17:22:14 -0400 (EDT)
Message-ID: <200609032122.k83LMEpr020136@hiauly1.hia.nrc.ca>
References: <119aab440609031330i70b208cat9f347fe2ed6e8b52@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609031330i70b208cat9f347fe2ed6e8b52@mail.gmail.com>
	from "Carlos O'Donell" at Sep 3, 2006 04:30:22 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The signed math works correctly as an approximation (off by 2) and I
> do admit I find no fault in the math, but it is still confusing.

The signed math works as long as the latency in delivering the
interruption is not larger than about half a cycle.  Once
next_tick - now >= halftick, then we stop updating next_tick
until the counter wraps.  Probably, this could be extended
using unsigned math but you still have to handle the wrap.

The other issue is to ensure that the compare value for the
next interrupt is set before the counter passes this count.
We could have an interruption between the read and write
of cr16 even with interrupts disabled.  So, I think we should
minimize memory accesses.  The enclosed change eliminates
the memory accesses.

It may be we don't need the save/restore if interrupts are disabled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: time.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/time.c,v
retrieving revision 1.16
diff -u -p -u -r1.16 time.c
--- time.c	24 Jun 2006 16:05:18 -0000	1.16
+++ time.c	3 Sep 2006 21:17:25 -0000
@@ -47,29 +47,36 @@ irqreturn_t timer_interrupt(int irq, voi
 {
 	long now;
 	long next_tick;
-	int nticks;
+	unsigned long nticks = 0;
+	long ct = clocktick;
+	long ht = halftick;
 	int cpu = smp_processor_id();
+	long flags;
 
 	profile_tick(CPU_PROFILING, regs);
 
-	now = mfctl(16);
-	/* initialize next_tick to time at last clocktick */
+	/* Initialize next_tick to time at last clocktick */
 	next_tick = cpu_data[cpu].it_value;
 
-	/* since time passes between the interrupt and the mfctl()
-	 * above, it is never true that last_tick + clocktick == now.  If we
-	 * never miss a clocktick, we could set next_tick = last_tick + clocktick
-	 * but maybe we'll miss ticks, hence the loop.
+	/* Since time passes between the interrupt and the mfctl(),
+	 * it is never true that last_tick + clocktick == now.
+	 * If we never miss a clocktick, we could set
+	 * next_tick = last_tick + clocktick, * but maybe we'll miss
+	 * ticks, hence the loop.
 	 *
 	 * Variables are *signed*.
 	 */
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
-		next_tick += clocktick;
+	/* Don't want to be interrupted while calculating
+	 * the time for the next tick.  */
+	local_irq_save(flags);
+	now = mfctl(16);
+	while((next_tick - now) < ht) {
+		next_tick += ct;
 		nticks++;
 	}
 	mtctl(next_tick, 16);
+	local_irq_restore(flags);
 	cpu_data[cpu].it_value = next_tick;
 
 	while (nticks--) {
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
