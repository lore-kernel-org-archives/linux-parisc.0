From: Helge Deller <deller@gmx.de>
Subject: Re: invalid printk time during boot on PA-RISC
Date: Wed, 1 Jun 2016 23:12:48 +0200
Message-ID: <20160601211248.GA15061@p100.box>
References: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Mikulas Patocka <mpatocka@redhat.com>:
> Hi
> 
> With the kernel 4.7-rc1, I get corrupted printk times when the machine 
> boots. The kernel is compiled with "Show timing information on printks" 
> (CONFIG_PRINTK_TIME) enabled. There are no other negative effects.
> 
> Bisecting shows that it is caused by the patch 
> 54b668009076caddbede8fde513ca2c982590bfe ("parisc: Add native 
> high-resolution sched_clock() implementation").
> 
> [    0.000000] NR_IRQS:80
> [    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000] Console: colour dummy device 160x64
> [   90.122205] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3317760)
> [   90.224168] pid_max: default: 32768 minimum: 301
> ....
> [   92.235878] 13. Crestone Peak Core RS-232 at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
> [   92.708000] Releasing cpu 1 now, hpa=fffffffffe781000
> [   92.818803] FP[1] enabled: Rev 1 Model 20
> [    2.917508] Releasing cpu 2 now, hpa=fffffffffe798000
> [    0.196666] FP[2] enabled: Rev 1 Model 20
> [    3.116794] Releasing cpu 3 now, hpa=fffffffffe799000
> [    0.196666] FP[3] enabled: Rev 1 Model 20
> [    3.296942] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
> [    3.447762] Setting cache flush threshold to 65536 kB
> [    3.450548] Setting TLB flush threshold to 1020 kB

Please try attached patch.

It fixes the problem mostly for me, there is just one little glitch
left, which is that the lines "FP[x] enabled" will still print an
invalid time. I assume it's because when this text is printed, the
clock/interrupts for the just booted CPU aren't enabled yet.

I'm not sure it's worth trying to fix that. 
One could print out that info at a later time, or just disabled it.

Helge

[    5.720014] Enabling PDC_PAT chassis codes support v0.05
[    6.644542] Releasing cpu 1 now, hpa=fffffffffe781000
[    0.196000] FP[1] enabled: Rev 1 Model 20
[    7.088432] CPU(s): 2 out of 2 PA8800 (Mako) at 900.000000 MHz online

-----------

[PATCH] parisc: Fix printk time during boot

Signed-off-by: Helge Deller <deller@gmx.de>

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
