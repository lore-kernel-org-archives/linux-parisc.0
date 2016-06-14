From: Helge Deller <deller@gmx.de>
Subject: Re: invalid printk time during boot on PA-RISC
Date: Tue, 14 Jun 2016 23:23:35 +0200
Message-ID: <576075D7.60602@gmx.de>
References: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
 <20160601211248.GA15061@p100.box>
 <alpine.LRH.2.02.1606141216510.29159@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1606141216510.29159@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Mikulas,

On 14.06.2016 18:20, Mikulas Patocka wrote:
> There is another bug: when you enable CONFIG_DEBUG_TIMEKEEPING, parisc 
> boot gets stuck with these messages.

Nice catch!

> (but it is not caused by the patch 
> 54b668009076caddbede8fde513ca2c982590bfe, because this bug happens even in 
> kernel 4.6).

Seems to be a generic upstream problem.
Would be nice to know if it happens on x86_64 as well.

I tried this patch (copy&pasted):

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 31ec99a..85e7bb7 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -217,9 +217,16 @@ static struct clocksource clocksource_cr16 = {
        .rating                 = 300,
        .read                   = read_cr16,
        .mask                   = CLOCKSOURCE_MASK(BITS_PER_LONG),
+        .mult           = 1000,
+        .shift          = 12,
        .flags                  = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
+struct clocksource * __init clocksource_default_clock(void)
+{
+        return &clocksource_cr16;
+}
+
 int update_cr16_clocksource(void)
 {
        /* since the cr16 cycle counters are not synchronized across CPUs,

which gives:
[    0.000000] clocksource: cr16: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 29863444473 ns
[    0.000000] Console: colour dummy device 128x48
[    0.012938] Calibrating delay loop... 63.07 BogoMIPS (lpj=315392)
[    0.012938] pid_max: default: 32768 minimum: 301
[    0.014235] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.014235] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.019359] Adjusting cr16 more than 11% (1000 vs -1967128576)
[    0.019359] Brought up 1 CPUs
[    0.020634] devtmpfs: initialized
[    0.022716] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.022716] NET: Registered protocol family 16

Still puzzled...

Helge

 
> Mikulas
> 
> [    0.000000] Memory: 7201556K/7337984K available (4096K kernel code, 1419K rwdata, 883K rodata, 176K init, 2296K bss, 136428K reserved, 0K cma-reserved)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
> [    0.000000]     memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
> [    0.000000]       .init : 0x0000000040100000 - 0x000000004012c000   ( 176 kB)
> [    0.000000]       .data : 0x000000004052c000 - 0x000000004076bb60   (2302 kB)
> [    0.000000]       .text : 0x000000004012c000 - 0x000000004052c000   (4096 kB)
> [    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=4, Nodes=8
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000]  Build-time adjustment of leaf fanout to 64.
> [    0.000000] NR_IRQS:80
> [    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.133333] WARNING: timekeeping: Cycle offset (40) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.133333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.133333] Console: colour dummy device 160x64
> [    0.303333] WARNING: timekeeping: Cycle offset (51) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.303333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.423333] WARNING: timekeeping: Cycle offset (36) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.423333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.483333] WARNING: timekeeping: Cycle offset (18) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.483333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.653333] WARNING: timekeeping: Cycle offset (51) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.653333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.769999] WARNING: timekeeping: Cycle offset (35) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.769999]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> [    0.943333] WARNING: timekeeping: Cycle offset (52) is larger than allowed by the 'jiffies' clock's max_cycles value (10): time overflow danger
> [    0.943333]          timekeeping: Your kernel is sick, but tries to cope by capping time updates
> 
> 
> On Wed, 1 Jun 2016, Helge Deller wrote:
> 
>> * Mikulas Patocka <mpatocka@redhat.com>:
>>> Hi
>>>
>>> With the kernel 4.7-rc1, I get corrupted printk times when the machine 
>>> boots. The kernel is compiled with "Show timing information on printks" 
>>> (CONFIG_PRINTK_TIME) enabled. There are no other negative effects.
>>>
>>> Bisecting shows that it is caused by the patch 
>>> 54b668009076caddbede8fde513ca2c982590bfe ("parisc: Add native 
>>> high-resolution sched_clock() implementation").
>>>
>>> [    0.000000] NR_IRQS:80
>>> [    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
>>> [    0.000000] Console: colour dummy device 160x64
>>> [   90.122205] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3317760)
>>> [   90.224168] pid_max: default: 32768 minimum: 301
>>> ....
>>> [   92.235878] 13. Crestone Peak Core RS-232 at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
>>> [   92.708000] Releasing cpu 1 now, hpa=fffffffffe781000
>>> [   92.818803] FP[1] enabled: Rev 1 Model 20
>>> [    2.917508] Releasing cpu 2 now, hpa=fffffffffe798000
>>> [    0.196666] FP[2] enabled: Rev 1 Model 20
>>> [    3.116794] Releasing cpu 3 now, hpa=fffffffffe799000
>>> [    0.196666] FP[3] enabled: Rev 1 Model 20
>>> [    3.296942] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
>>> [    3.447762] Setting cache flush threshold to 65536 kB
>>> [    3.450548] Setting TLB flush threshold to 1020 kB
>>
>> Please try attached patch.
>>
>> It fixes the problem mostly for me, there is just one little glitch
>> left, which is that the lines "FP[x] enabled" will still print an
>> invalid time. I assume it's because when this text is printed, the
>> clock/interrupts for the just booted CPU aren't enabled yet.
>>
>> I'm not sure it's worth trying to fix that. 
>> One could print out that info at a later time, or just disabled it.
>>
>> Helge
>>
>> [    5.720014] Enabling PDC_PAT chassis codes support v0.05
>> [    6.644542] Releasing cpu 1 now, hpa=fffffffffe781000
>> [    0.196000] FP[1] enabled: Rev 1 Model 20
>> [    7.088432] CPU(s): 2 out of 2 PA8800 (Mako) at 900.000000 MHz online
>>
>> -----------
>>
>> [PATCH] parisc: Fix printk time during boot
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
>> index 58dd680..31ec99a 100644
>> --- a/arch/parisc/kernel/time.c
>> +++ b/arch/parisc/kernel/time.c
>> @@ -309,11 +309,6 @@ void __init time_init(void)
>>  	clocks_calc_mult_shift(&cyc2ns_mul, &cyc2ns_shift, current_cr16_khz,
>>  				NSEC_PER_MSEC, 0);
>>  
>> -#if defined(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK) && defined(CONFIG_64BIT)
>> -	/* At bootup only one 64bit CPU is online and cr16 is "stable" */
>> -	set_sched_clock_stable();
>> -#endif
>> -
>>  	start_cpu_itimer();	/* get CPU 0 started */
>>  
>>  	/* register at clocksource framework */
>>

