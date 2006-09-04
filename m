From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 4 Sep 2006 12:57:25 -0400 (EDT)
Message-ID: <200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
References: <1157385104.3513.11.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157385104.3513.11.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Sep 4, 2006 10:51:44 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sun, 2006-09-03 at 13:31 -0600, Grant Grundler wrote:
> > On Sun, Sep 03, 2006 at 11:14:53AM -0500, James Bottomley wrote:
> > > Since the timer interrupts miss so many ticks, halftick processing looks
> > > like a good idea to me.
> > 
> > I was going to argue halfticks are a bad idea.
> > They just make it all more complicated.
> > My last version of the rewrite patch does away with them complete.
> 
> I tried this on ioz ... you can simply remove the halftick code in my
> version of the patch.  What happens is that we start to drop astonishing
> number of ticks occasionally ... it looks like we're getting wrap
> conditions again.

There needs to be a check to ensure that the code has enough time
to set cr16 with the new compare time before the counter passes this
value.  If it misses, the counter will wrap.  This probably doesn't
need to be a full half tick if it's desireable to avoid negative
offsets.

In my mind, it's important to ensure that timer interrupts are not
disabled for long periods.  If that's not possible, we could go back
to 100 Hz.  However, I've been using 1000 Hz in an embedded project
using a small 8-bit micro running at 40 MHz.  So, I think 1000 Hz
should be possible on most PA processors.

I've reworked my previous patch to use unsigned variables.  As a
result, it can handle twice the latency.  There's one unlikely case
that could be detected.  That's an exact wrap of the counter
(next_tick == now).  This is extremely unlikely on LP64.  On 32-bit
kernels, we can't handle latencies larger than 0x100000000, so it
didn't seem worthwhile checking for this special case.

There's weren't any problems with the libjava testsuite with the
last patch, but one run probably isn't enough to be sure that this
change helps.

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
+++ time.c	4 Sep 2006 16:29:34 -0000
@@ -36,8 +36,8 @@
 /* xtime and wall_jiffies keep wall-clock time */
 extern unsigned long wall_jiffies;
 
-static long clocktick __read_mostly;	/* timer cycles per tick */
-static long halftick __read_mostly;
+static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
+static unsigned long halftick __read_mostly;
 
 #ifdef CONFIG_SMP
 extern void smp_do_timer(struct pt_regs *regs);
@@ -45,28 +45,41 @@ extern void smp_do_timer(struct pt_regs 
 
 irqreturn_t timer_interrupt(int irq, void *dev_id, struct pt_regs *regs)
 {
-	long now;
-	long next_tick;
-	int nticks;
+	unsigned long now;
+	unsigned long next_tick;
+	unsigned long nticks = 0;
+	unsigned long ct = clocktick;
+	unsigned long ht = halftick;
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
+	 * We use local automatic variables to avoid the
+	 * possibility of an interruption delaying the setting
+	 * of cr16 for the next tick.
 	 *
-	 * Variables are *signed*.
 	 */
 
-	nticks = 0;
-	while((next_tick - now) < halftick) {
-		next_tick += clocktick;
+	now = mfctl(16);
+	while((now - next_tick) >= ct) {
+		next_tick += ct;
+		nticks++;
+	}
+	next_tick += ct;
+	nticks++;
+	if ((next_tick - now) < ht) {
+		next_tick += ct;
 		nticks++;
 	}
 	mtctl(next_tick, 16);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
