From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 04 Sep 2006 17:47:19 -0500
Message-ID: <1157410039.3513.26.camel@mulgrave.il.steeleye.com>
References: <1157385104.3513.11.camel@mulgrave.il.steeleye.com>
	<200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
	<20060904212139.GA12278@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060904212139.GA12278@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-09-04 at 15:21 -0600, Grant Grundler wrote:
> \Yes - I agree. I think this is the last bug in my code.
> I'll just "skip" one tick in that case.
> My guess is we'll never need more than a 0x1000 cycles
> to read CR16, calculate the new "next_tick" and write CR16.
> 
> I picked 0x1000 because it very easy to test for: "if (x >> 12)...".
> 
> I'll review the your patch and see if I missed anything else
> and then post version #4 (or #5?). Lost count.

This is the one I'm using that seems most stable (no more > 9 lost
ticks, even on a pa8800).  However, to get it this stable, I do require
nested interrupts.  It also does halftick processing as Grant does, so
it doesn't ever push the time into the future, it just holds off one
tick beyond where we currently are.

James

Index: parisc-2.6/arch/parisc/kernel/time.c
===================================================================
--- parisc-2.6.orig/arch/parisc/kernel/time.c	2006-09-03 21:07:45.000000000 -0700
+++ parisc-2.6/arch/parisc/kernel/time.c	2006-09-04 15:07:33.000000000 -0700
@@ -48,6 +48,7 @@
 	long next_tick;
 	int nticks;
 	int cpu = smp_processor_id();
+	unsigned long cr16_val;
 
 	profile_tick(CPU_PROFILING, regs);
 
@@ -63,12 +64,24 @@
 	 * Variables are *signed*.
 	 */
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
+	/* Don't do expensive mul and div for the likely case */
+	if (likely(now - next_tick < clocktick)) {
+		nticks = 1;
 		next_tick += clocktick;
-		nticks++;
+	} else {
+		nticks = ((now - next_tick)/clocktick) + 1;
+		next_tick += clocktick*nticks;
+	}
+	/* Don't interrupt too much.  If we only have half
+	 * the time to go to the next tick, push it out one
+	 * more tick */
+	cr16_val = next_tick;
+	if (unlikely(next_tick - now < halftick)) {
+		/* don't increment nticks ... the next
+		 * tick will take care of that */
+		cr16_val += clocktick;
 	}
-	mtctl(next_tick, 16);
+	mtctl(cr16_val, 16);
 	cpu_data[cpu].it_value = next_tick;
 
 	while (nticks--) {


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
