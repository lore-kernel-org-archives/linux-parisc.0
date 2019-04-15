Return-Path: <SRS0=h12M=SR=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05E6C10F0E
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 20:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A05E3205F4
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 20:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfDOUqW (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:46:22 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:54922 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726609AbfDOUqW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Apr 2019 16:46:22 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190415204620.SQNG4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 15 Apr 2019 16:46:20 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm02.bell.net
          with ESMTP
          id <20190415204620.KYIQ21689.mtlspm02.bell.net@[192.168.0.183]>;
          Mon, 15 Apr 2019 16:46:20 -0400
Subject: Re: [PATCH] parisc: Switch from DISCONTIGMEM to SPARSEMEM
To:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        Mikulas Patocka <mpatocka@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mel Gorman <mgorman@techsingularity.net>
References: <20190410173911.GA11288@ls3530.dellerweb.de>
 <20190415195203.GC4827@t470p.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <12794198-66ae-203b-b968-148f4d9c662d@bell.net>
Date:   Mon, 15 Apr 2019 16:46:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415195203.GC4827@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=dIMIts06Vzh9FAXszf4A:9 a=_j6VKaBA4eF4bb-y:21 a=fnA-S2Wl0--bJopn:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfDD7+E+destaBR4ynpP6W669Vco/7OFHGmd89jc0TYCyFvEHgqbqoQ7G2NHqTOWYZ9Ihiz+pwIOOuQ/31ND3Yjx13t2LKiVjYJBHyjold1zzxQ2E6tTT PNZ6fzoX0LUwcG8uVQSpw3jYfkckODcojyYsa0Allwyk8MoJAhne93/HIse6bcP9+nzKPrWLtV5GOQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The stack pointer contains fffffff0f0000018:
24-27   000000000400c240  fffffffffffa2000  fffffff0f0000018  fffffff0f0412000

I presume that it is initialized incorrectly:

[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
[    0.000000]  1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB

Dave

On 2019-04-15 3:52 p.m., Sven Schnelle wrote:
> Hi,
>
> On Wed, Apr 10, 2019 at 07:39:11PM +0200, Helge Deller wrote:
>> The commit 1c30844d2dfe ("mm: reclaim small amounts of memory when an
>> external fragmentation event occurs") breaks memory management on a
>> parisc c8000 workstation with this memory layout:
>>
>> 	0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
>> 	1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
>> 	2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
>>
>> With the patch 1c30844d2dfe, the kernel will incorrectly reclaim the
>> first zone when it fills up, ignoring the fact that there are two
>> completely free zones. Basiscally, it limits cache size to 1GiB.
>>
>> The parisc kernel is currently using the DISCONTIGMEM implementation,
>> but isn't NUMA. Avoid this issue and strange work-arounds by switching
>> to the more commonly used SPARSEMEM implementation.
>> [..]
> unfortunately this patch breaks booting on my J5000. The second CPU fails
> to start, and triggers a HPMC (Bus timeout). Running with this patch adding
> the nosmp command line option works. On my C3750 there's no problem.
>
> Here's the dmesg:
>
> [    0.000000] Linux version 5.1.0-rc3-64bit+ (svens@t470p) (gcc version 7.4.0 (GCC)) #259 SMP Mon Apr 15 20:57:57 CEST 2019
> [    0.000000] CPU0: thread -1, cpu 0, socket 0
> [    0.000000] FP[0] enabled: Rev 1 Model 16
> [    0.000000] The 64-bit Kernel has started...
> [    0.000000] Kernel default page size is 4 KB. Huge pages disabled.
> [    0.000000] printk: bootconsole [ttyB0] enabled
> [    0.000000] Initialized PDC Console for debugging.
> [    0.000000] Determining PDC firmware type: System Map.
> [    0.000000] model 00005bd0 00000491 00000000 00000002 782482ee 100000f0 00000008 000000b2 000000b2
> [    0.000000] vers  00000201
> [    0.000000] CPUID vers 17 rev 5 (0x00000225)
> [    0.000000] capabilities 0x3
> [    0.000000] model 9000/785/J5000
> [    0.000000] Memory Ranges:
> [    0.000000]  0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
> [    0.000000]  1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB
> [    0.000000] Total Memory: 4096 MB
> [    0.000000] PDT: type PDT_PDC, size 50, entries 0, status 2, dbe_loc 0xffffffffffffffff, good_mem 171 MB
> [    0.000000] PDT: Firmware reports all memory OK.
> [    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
> [    0.000000] percpu: Embedded 25 pages/cpu @(____ptrval____) s64064 r8192 d30144 u102400
> [    0.000000] SMP: bootstrap CPU ID is 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1032192
> [    0.000000] Kernel command line: HOME=/ root=/dev/sda4 panic_timeout=60 panic=10 console=ttyS0,9600 kgdboc=ttyS0,9600 palo_kernel=0/vmlinuz
> [    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
> [    0.000000] Memory: 4102676K/4194304K available (5660K kernel code, 1638K rwdata, 940K rodata, 444K init, 932K bss, 91628K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] NR_IRQS: 128
> [    0.000019] sched_clock: 64 bits at 440MHz, resolution 2ns, wraps every 4398046511103ns
> [    0.106184] Console: colour dummy device 160x64
> [    0.165835] Calibrating delay loop... 872.44 BogoMIPS (lpj=1744896)
> [    0.269845] pid_max: default: 32768 minimum: 301
> [    0.330589] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
> [    0.422023] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
> [    0.514921] *** VALIDATE proc ***
> [    0.558204] *** VALIDATE cgroup1 ***
> [    0.605858] *** VALIDATE cgroup2 ***
> [    0.655933] rcu: Hierarchical SRCU implementation.
> [    0.878065] smp: Bringing up secondary CPUs ...
> [    0.937862] smp: Brought up 1 node, 1 CPU
> [    0.994306] devtmpfs: initialized
> [    1.040437] random: get_random_u32 called from bucket_table_alloc+0x270/0x2a0 with crng_init=0
> [    1.154583] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    1.281884] futex hash table entries: 1024 (order: 3, 32768 bytes)
> [    1.366411] NET: Registered protocol family 16
> [    1.426212] Searching for devices...
> [    1.717848] Found devices:
> [    1.749864] 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
> [    1.861898] 2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
> [    1.965864] 3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
> [    2.073861] 4. Elroy PCI Bridge at 0xfffffffffed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
> [    2.177861] 5. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
> [    2.285861] 6. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
> [    2.393860] 7. Forte W 2-way at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5bd, 0x00004 }
> [    2.493860] 8. Forte W 2-way at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5bd, 0x00004 }
> [    2.593860] 9. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x088, 0x00009 }
> [    2.681855] Enabling regular chassis codes support v0.05
> [    2.874416] CPU1: thread -1, cpu 0, socket 1
> [    2.935257] Releasing cpu 1 now, hpa=fffffffffffa2000
> [hangs here forever]
>
> One interesting detail is that if i reserve PAGE0 from the memory mem, at least the HPMC
> handler from the kernel is triggered:
>
> [    2.785875] Backtrace:
> [    2.785875]  [<00000000401d20b4>] smp_boot_one_cpu+0x15c/0x1e8
> [    2.785875]  [<00000000401d2270>] __cpu_up+0xe0/0xf0
> [    2.785875]  [<00000000401f2580>] bringup_cpu+0xa0/0x1e0
> [    2.785875]  [<00000000401f1770>] cpuhp_invoke_callback+0x118/0x848
> [    2.785875]  [<00000000401f4848>] do_cpu_up+0x290/0x3d8
> [    2.785875]  [<00000000401f49f8>] cpu_up+0x68/0x80
> [    2.785875]  [<000000004010c47c>] processor_probe+0x3ec/0x420
> [    2.785875]  [<00000000401cae7c>] parisc_driver_probe+0x6c/0x98
> [    2.785875]  [<000000004083cb20>] really_probe+0x398/0x560
> [    2.785875]  [<000000004083d1e8>] driver_probe_device+0x198/0x1a0
> [    2.785875]  [<000000004083d3d0>] __driver_attach+0x1e0/0x1e8
> [    2.785875]  [<0000000040837ba0>] bus_for_each_dev+0x108/0x170
> [    2.785875]  [<000000004083bbb8>] driver_attach+0x80/0x98
> [    2.785875]  [<000000004083ab70>] bus_add_driver+0x298/0x4b8
> [    2.785875]  [<000000004083e628>] driver_register+0xe0/0x268
> [    2.785875]  [<00000000401cb0a0>] register_parisc_driver+0xa0/0x118
> [    2.785875]  [<000000004010cb44>] processor_init+0x6c/0x80
> [    2.785875]  [<0000000040108348>] parisc_init+0x348/0x5c0
> [    2.785875]  [<00000000401b30bc>] do_one_initcall+0xb4/0x2c8
> [    2.785875]  [<0000000040102ac0>] kernel_init_freeable+0x5a0/0x730
> [    2.785875]  [<0000000040bb0890>] kernel_init+0x60/0x318
> [    2.785875]  [<00000000401be020>] ret_from_kernel_thread+0x20/0x28
> [    2.785875]
> [    2.785875]
> [    2.785875] High Priority Machine Check (HPMC): Code=1 (High-priority machine check (HPMC)) at addr 0000000000000000
> [    2.785875] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-64bit+ #116
> [    2.785875] Hardware name: 9000/785/J5000
> [    2.785875]
> [    2.785875]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [    2.785875] PSW: 00001000000001001111011100001111 Not tainted
> [    2.785875] r00-03  000000ff0804f70f 0000000040d27a80 0000000040bab790 00000000400ecfe0
> [    2.785875] r04-07  0000000040c58a80 0000000000000064 0000000000000002 0000000040ecee30
> [    2.785875] r08-11  00000000400ecfb0 0000000040c7ba80 0000000000000001 000000004106c858
> [    2.785875] r12-15  000000004106c860 0000000040f0c9e8 0000000000000064 0000000000000001
> [    2.785875] r16-19  0000000000000000 0000000040d29a80 0000000040c78280 000000005666f671
> [    2.785875] r20-23  0000000000000000 0000000000000000 00000000000001b8 000000000000abe0
> [    2.785875] r24-27  00000000400ecfe0 0000000000000000 0000000000000000 0000000040c58a80
> [    2.785875] r28-31  000000000000abe0 00000000400ed040 00000000400ed070 0000000056679e96
> [    2.785875] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.785875] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.785875]
> [    2.785875] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040bab7c8 0000000040bab7cc
> [    2.785875]  IIR: 82953fb5    ISR: 0000000010340000  IOR: 000000003b4ed078
> [    2.785875]  CPU:        0   CR30: 00000000400ec000 CR31: 00000000ffffffff
> [    2.785875]  ORIG_R28: 0000000000000000
> [    2.785875]  IAOQ[0]: __udelay+0xe0/0x110
> [    2.785875]  IAOQ[1]: __udelay+0xe4/0x110
> [    2.785875]  RP(r2): __udelay+0xa8/0x110
> [    2.785875] Backtrace:
> [    2.785875]  [<00000000401d20b4>] smp_boot_one_cpu+0x15c/0x1e8
> [    2.785875]  [<00000000401d2270>] __cpu_up+0xe0/0xf0
> [    2.785875]  [<00000000401f2580>] bringup_cpu+0xa0/0x1e0
> [    2.785875]  [<00000000401f1770>] cpuhp_invoke_callback+0x118/0x848
> [    2.785875]  [<00000000401f4848>] do_cpu_up+0x290/0x3d8
> [    2.785875]  [<00000000401f49f8>] cpu_up+0x68/0x80
> [    2.785875]  [<000000004010c47c>] processor_probe+0x3ec/0x420
> [    2.785875]  [<00000000401cae7c>] parisc_driver_probe+0x6c/0x98
> [    2.785875]  [<000000004083cb20>] really_probe+0x398/0x560
> [    2.785875]  [<000000004083d1e8>] driver_probe_device+0x198/0x1a0
> [    2.785875]  [<000000004083d3d0>] __driver_attach+0x1e0/0x1e8
> [    2.785875]  [<0000000040837ba0>] bus_for_each_dev+0x108/0x170
> [    2.785875]  [<000000004083bbb8>] driver_attach+0x80/0x98
> [    2.785875]  [<000000004083ab70>] bus_add_driver+0x298/0x4b8
> [    2.785875]  [<000000004083e628>] driver_register+0xe0/0x268
> [    2.785875]  [<00000000401cb0a0>] register_parisc_driver+0xa0/0x118
> [    2.785875]  [<000000004010cb44>] processor_init+0x6c/0x80
> [    2.785875]  [<0000000040108348>] parisc_init+0x348/0x5c0
> [    2.785875]  [<00000000401b30bc>] do_one_initcall+0xb4/0x2c8
> [    2.785875]  [<0000000040102ac0>] kernel_init_freeable+0x5a0/0x730
> [    2.785875]  [<0000000040bb0890>] kernel_init+0x60/0x318
> [    2.785875]  [<00000000401be020>] ret_from_kernel_thread+0x20/0x28
> [    2.785875]
> [    2.785875] Kernel panic - not syncing: High Priority Machine Check (HPMC)
> [    2.785875] Rebooting in 10 seconds..
>
> PIM record shows:
>
> -----------------  Processor 1 HPMC Information ------------------
>
> Timestamp =
>   Thu Apr  11 13:35:21 GMT 2019    (20:19:04:11:13:35:21)
>
> HPMC Chassis Codes = 2cbf0  2510b  2cbf5  2cbfc
>
> General Registers 0 - 31
> 00-03   0000000000000000  0000000040000000  000000f0f0002090  0000000000000000
> 04-07   0000000000000e33  fffffff0f0400008  00000000000000fa  fffffff0f0002f68
> 08-11   fffffffffee003f8  00000000000000c4  000000000000000a  fffffff0f0001608
> 12-15   00000000000000f2  0000000000000001  0000000000000001  00000000000000f3
> 16-19   0000000002020202  0000000000000002  fffffff0f000016c  0440c24000000000
> 20-23   00000000000000cc  0000000000000001  0000000000000009  0000000000000000
> 24-27   000000000400c240  fffffffffffa2000  fffffff0f0000018  fffffff0f0412000
> 28-31   fffffffffffa2000  fffffff0f040ae70  00000010fb0e6f60  0000000000000000
>
> <Press any key to continue (q to quit)>
>
> Control Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 16-19   0000001959e11c2f  0000000000000000  0000000000100274  000000000fd010de
> 20-23   00000000a637ffec  c0000000398e6f68  000000ff00007f08  0000000000000000
> 24-27   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
> 28-31   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
> Space Registers 0 - 7
>
> 00-03   00000000          00000000          00000000          00000000
> 04-07   00000000          00000000          00000000          00000000
>
> <Press any key to continue (q to quit)>
>
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000100278
> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030103b
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x000000fffb0e6f68
> System Requestor Address     = 0xfffffffffffa2000
>
> 0000000040100250 <smp_slave_stext>:
>     40100250:   00 00 38 20     mtsp r0,sr4
>     40100254:   00 00 78 20     mtsp r0,sr5
>     40100258:   00 00 b8 20     mtsp r0,sr6
>     4010025c:   00 00 f8 20     mtsp r0,sr7
>     40100260:   23 d6 50 20     ldil L%106c800,sp
>     40100264:   37 de 00 b0     ldo 58(sp),sp
>     40100268:   0f c0 10 de     ldd 0(sp),sp
>     4010026c:   20 20 08 00     ldil L%40000000,r1
>     40100270:   08 3e 04 1e     sub sp,r1,sp
>
>     40100274:   0f d0 10 de     ldd 8(sp),sp        <-- HPMC
>
>     40100278:   03 de 18 40     mtctl sp,tr6
>     4010027c:   37 de 01 80     ldo c0(sp),sp
>     40100280:   20 94 20 20     ldil L%1029000,r4
>     40100284:   34 84 00 00     ldo 0(r4),r4
>     40100288:   03 04 18 40     mtctl r4,tr0
>     4010028c:   03 24 18 40     mtctl r4,tr1
>     40100290:   08 1a 02 43     copy r26,r3
>     40100294:   21 66 18 02     ldil L%4010c800,r11
>     40100298:   35 6b 0e c0     ldo 760(r11),r11
>     4010029c:   e8 1f 1c b5     b,l 401000fc <common_stext>,r0
>     401002a0:   08 00 02 40     nop
>
> sp (r30) is 00000010fb0e6f60, which is valid RAM. However, it's triggering a HPMC
> and the Display show Bus timeout. Does anyone have an idea what's going wrong?
>
> Regards,
> Sven
>


-- 
John David Anglin  dave.anglin@bell.net

