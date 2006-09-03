From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 15:59:34 -0400 (EDT)
Message-ID: <200609031959.k83JxYon019649@hiauly1.hia.nrc.ca>
References: <20060903193806.GB20217@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 soete.joel@scarlet.be,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903193806.GB20217@colo.lackof.org> from "Grant Grundler" at
	Sep 3, 2006 01:38:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Is it ok if I only add the irqsave/restore to my current patch?
> I also like the "avoid div/mul ops" test too.

I agree on that.  They are very expensive, especially in 64-bit code.

I'm playing with the patch below.  The main thing I tried to do is
reduce the amount of code in the irqsave/restore.  GCC didn't do a
great job of optimizing the code.  I think we would get better code
if clocktick and halftick were copied to temps before the irqsave.

I was also concerned about nticks not being unsigned long.

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
+++ time.c	3 Sep 2006 19:42:24 -0000
@@ -47,29 +47,34 @@ irqreturn_t timer_interrupt(int irq, voi
 {
 	long now;
 	long next_tick;
-	int nticks;
+	unsigned long nticks = 0;
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
+	/* Don't want to be interrupted while calculating
+	 * the time for the next tick.  */
+	local_irq_save(flags);
+	now = mfctl(16);
 	while((next_tick - now) < halftick) {
 		next_tick += clocktick;
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
