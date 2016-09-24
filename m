From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix self-detected CPU stall warnings on Mako machines
Date: Sat, 24 Sep 2016 22:22:12 +0200
Message-ID: <20160924202212.GA23059@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The config option HAVE_UNSTABLE_SCHED_CLOCK is set automatically when compiling
for SMP. There is no need to clear the stable-clock flag via
clear_sched_clock_stable() when starting secondary CPUs, and even worse,
clearing it triggers wrong self-detected CPU stall warnings on 64bit Mako
machines.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.7+

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 4b0b963..9b63b87 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -226,12 +226,6 @@ void __init start_cpu_itimer(void)
 	unsigned int cpu = smp_processor_id();
 	unsigned long next_tick = mfctl(16) + clocktick;
 
-#if defined(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK) && defined(CONFIG_64BIT)
-	/* With multiple 64bit CPUs online, the cr16's are not syncronized. */
-	if (cpu != 0)
-		clear_sched_clock_stable();
-#endif
