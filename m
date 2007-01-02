From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [RFC][PATCH] use cycle_t instead of u64 in struct
	time_interpolator
Date: Tue, 2 Jan 2007 22:33:25 +0100
Message-ID: <200701022233.25697.deller__37301.6776670285$1416624246$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: linux-kernel@vger.kernel.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The 32bit and 64bit PARISC Linux kernels suffers from the problem, that the gettimeofday() call sometimes returns non-monotonic times.
The easiest way to fix this, is to drop the PARISC-specific implementation and switch over to the generic TIME_INTERPOLATION framework.
But in order to make it even compile on 32bit PARISC, the patch below which touches the generic Linux code, is mandatory. 
More information and the full patch with the parisc-specific changes is included in this thread: http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/031003.html

As far as I could see, this patch does not change anything for the existing architectures which use this framework (IA64 and SPARC64), since "cycles_t" is defined there as unsigned 64bit-integer anyway (which then makes this patch a no-change for them).

Ok, not Ok ?

Regards, Helge


Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/linux/timex.h b/include/linux/timex.h
index db501dc..9a24e50 100644
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -255,10 +255,10 @@ struct time_interpolator {
 	u8 jitter;			/* if set compensate for fluctuations */
 	u32 nsec_per_cyc;		/* set by register_time_interpolator() */
 	void *addr;			/* address of counter or function */
-	u64 mask;			/* mask the valid bits of the counter */
+	cycles_t mask;			/* mask the valid bits of the counter */
 	unsigned long offset;		/* nsec offset at last update of interpolator */
 	u64 last_counter;		/* counter value in units of the counter at last update */
-	u64 last_cycle;			/* Last timer value if TIME_SOURCE_JITTER is set */
+	cycles_t last_cycle;		/* Last timer value if TIME_SOURCE_JITTER is set */
 	u64 frequency;			/* frequency in counts/second */
 	long drift;			/* drift in parts-per-million (or -1) */
 	unsigned long skips;		/* skips forward */
diff --git a/kernel/timer.c b/kernel/timer.c
index c2a8ccf..d38801a 100644
--- a/kernel/timer.c
+++ b/kernel/timer.c
@@ -1624,7 +1624,7 @@ struct time_interpolator *time_interpola
 static struct time_interpolator *time_interpolator_list __read_mostly;
 static DEFINE_SPINLOCK(time_interpolator_lock);
 
-static inline u64 time_interpolator_get_cycles(unsigned int src)
+static inline cycles_t time_interpolator_get_cycles(unsigned int src)
 {
 	unsigned long (*x)(void);
 
@@ -1650,8 +1650,8 @@ static inline u64 time_interpolator_get_
 
 	if (time_interpolator->jitter)
 	{
-		u64 lcycle;
-		u64 now;
+		cycles_t lcycle;
+		cycles_t now;
 
 		do {
 			lcycle = time_interpolator->last_cycle;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
