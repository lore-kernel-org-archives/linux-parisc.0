From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 23:51:40 -0400 (EDT)
Message-ID: <200609040351.k843peXe022064@hiauly1.hia.nrc.ca>
References: <20060904000937.GA6963@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 soete.joel@scarlet.be,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060904000937.GA6963@colo.lackof.org> from "Grant Grundler" at
	Sep 3, 2006 06:09:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I've not applied the irqsave/restore since I don't think it does anything.
> do_cpu_irq_mask() doesn't allow nested external interrupts.

I updated what I'm testing to remove the irqsave/restore.  I'm interested
to see if this helps various random failures that occur, particularly in
the libjava testsuite with thread intensive code.

> > GCC didn't do a great job of optimizing the code.  I think we would
> > get better code if clocktick and halftick were copied to temps before
> > the irqsave.
> 
> hrm...I would expect the same result from __read_mostly but can understand
> why that's not as useful as I hoped.

#define __read_mostly __attribute__((__section__(".data.read_mostly")))

GCC doesn't do anything special with this section as far as I can tell.

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
+++ time.c	4 Sep 2006 03:26:43 -0000
@@ -47,26 +47,38 @@ irqreturn_t timer_interrupt(int irq, voi
 {
 	long now;
 	long next_tick;
-	int nticks;
+	unsigned long nticks = 0;
+	long ct = clocktick;
+	long ht = halftick;
 	int cpu = smp_processor_id();
 
 	profile_tick(CPU_PROFILING, regs);
 
-	now = mfctl(16);
-	/* initialize next_tick to time at last clocktick */
+	/* Initialize next_tick to time of last clocktick */
 	next_tick = cpu_data[cpu].it_value;
 
-	/* since time passes between the interrupt and the mfctl()
-	 * above, it is never true that last_tick + clocktick == now.  If we
-	 * never miss a clocktick, we could set next_tick = last_tick + clocktick
-	 * but maybe we'll miss ticks, hence the loop.
+	/* Since time passes between the interrupt and the mfctl(),
+	 * it is never true that last_tick + clocktick == now.
+	 * If we never missed a clocktick, we could set
+	 * next_tick = last_tick + clocktick, but maybe we'll
+	 * miss ticks, hence the loop.  It also ensures that the
+	 * count for the next interrupt is at least a half tick
+	 * away.
+	 *
+	 * Variables are *signed*.  As a result, onc cycle of ticks
+	 * will be missed if interrupt latency every causes the 
+	 * difference between next_tick and now to exceed roughly
+	 * half the 32-bit wrap counter period.
+	 *
+	 * We only use local automatic variables in the loop to
+	 * avoid the possibility of an interruption delaying the
+	 * setting of cr16 for the next tick.
 	 *
-	 * Variables are *signed*.
 	 */
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
-		next_tick += clocktick;
+	now = mfctl(16);
+	while((next_tick - now) < ht) {
+		next_tick += ct;
 		nticks++;
 	}
 	mtctl(next_tick, 16);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
