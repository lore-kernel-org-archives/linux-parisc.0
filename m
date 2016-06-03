From: Helge Deller <deller@gmx.de>
Subject: Re: invalid printk time during boot on PA-RISC
Date: Fri, 3 Jun 2016 19:22:31 +0200
Message-ID: <20160603172231.GA4592@ls3530.box>
References: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
 <20160601211248.GA15061@p100.box>
 <20160601213628.GC5218@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>, linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160601213628.GC5218@raspberrypi.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi>:
> Hi,
> 
> On Wed, Jun 01, 2016 at 11:12:48PM +0200, Helge Deller wrote:
> > It fixes the problem mostly for me, there is just one little glitch
> > left, which is that the lines "FP[x] enabled" will still print an
> > invalid time. I assume it's because when this text is printed, the
> > clock/interrupts for the just booted CPU aren't enabled yet.
> > 
> > I'm not sure it's worth trying to fix that. 
> > One could print out that info at a later time, or just disabled it.
> > 
> > Helge
> > 
> > [    5.720014] Enabling PDC_PAT chassis codes support v0.05
> > [    6.644542] Releasing cpu 1 now, hpa=fffffffffe781000
> > [    0.196000] FP[1] enabled: Rev 1 Model 20
> > [    7.088432] CPU(s): 2 out of 2 PA8800 (Mako) at 900.000000 MHz online
> 
> Some tools that analyze boot time based on dmesg might get confused.

Yes, valid point.
Updated patch below.

Helge

__________


parisc: Fix printk time during boot

Avoid showing invalid printk time stamps during boot.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index e81ccf1..5adc339 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -324,8 +324,9 @@ int init_per_cpu(int cpunum)
 		per_cpu(cpu_data, cpunum).fp_rev = coproc_cfg.revision;
 		per_cpu(cpu_data, cpunum).fp_model = coproc_cfg.model;
 
-		printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
-			cpunum, coproc_cfg.revision, coproc_cfg.model);
+		if (cpunum == 0)
+			printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
+				cpunum, coproc_cfg.revision, coproc_cfg.model);
 
 		/*
 		** store status register to stack (hopefully aligned)
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 58dd680..31ec99a 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -309,11 +309,6 @@ void __init time_init(void)
 	clocks_calc_mult_shift(&cyc2ns_mul, &cyc2ns_shift, current_cr16_khz,
 				NSEC_PER_MSEC, 0);
 
-#if defined(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK) && defined(CONFIG_64BIT)
-	/* At bootup only one 64bit CPU is online and cr16 is "stable" */
-	set_sched_clock_stable();
-#endif
