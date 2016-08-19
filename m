From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix automatic selection of cr16 clocksource
Date: Fri, 19 Aug 2016 22:39:02 +0200
Message-ID: <20160819203902.GA17039@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 54b66800907 (parisc: Add native high-resolution sched_clock()
implementation) added support to use the CPU-internal cr16 counters as reliable
clocksource with the help of HAVE_UNSTABLE_SCHED_CLOCK.

Sadly the commit missed to remove the hack which prevented cr16 to become the
default clocksource even on SMP systems.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.7+

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 5adc339..0c2a94a 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -51,8 +51,6 @@ EXPORT_SYMBOL(_parisc_requires_coherency);
 
 DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
-extern int update_cr16_clocksource(void);	/* from time.c */
-
 /*
 **  	PARISC CPU driver - claim "device" and initialize CPU data structures.
 **
@@ -228,12 +226,6 @@ static int processor_probe(struct parisc_device *dev)
 	}
 #endif
 
-	/* If we've registered more than one cpu,
-	 * we'll use the jiffies clocksource since cr16
-	 * is not synchronized between CPUs.
-	 */
-	update_cr16_clocksource();
-
 	return 0;
 }
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 505cf1a..4b0b963 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -221,18 +221,6 @@ static struct clocksource clocksource_cr16 = {
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-int update_cr16_clocksource(void)
-{
-	/* since the cr16 cycle counters are not synchronized across CPUs,
-	   we'll check if we should switch to a safe clocksource: */
-	if (clocksource_cr16.rating != 0 && num_online_cpus() > 1) {
-		clocksource_change_rating(&clocksource_cr16, 0);
-		return 1;
-	}
-
-	return 0;
-}
