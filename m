From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop CONFIG_SMP around update_cr16_clocksource()
Date: Tue, 8 Sep 2015 17:49:31 +0200
Message-ID: <20150908154931.GA31927@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

No need to use CONFIG_SMP around update_cr16_clocksource(). It checks for
num_online_cpus() beeing greater than 1, which is always 1 in UP builds.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 70e105d..400acac 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -202,7 +202,6 @@ static struct clocksource clocksource_cr16 = {
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-#ifdef CONFIG_SMP
 int update_cr16_clocksource(void)
 {
 	/* since the cr16 cycle counters are not synchronized across CPUs,
@@ -214,12 +213,6 @@ int update_cr16_clocksource(void)
 
 	return 0;
 }
-#else
-int update_cr16_clocksource(void)
-{
-	return 0; /* no change */
-}
-#endif /*CONFIG_SMP*/
 
 void __init start_cpu_itimer(void)
 {
