Return-Path: <SRS0=nAaT=NU=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB746C43441
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 07:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97ACE20855
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 07:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97ACE20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbeKIREx (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 9 Nov 2018 12:04:53 -0500
Received: from mout.gmx.net ([212.227.15.15]:32961 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbeKIREx (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 9 Nov 2018 12:04:53 -0500
Received: from [192.168.20.60] ([92.116.184.208]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MD9NE-1gHfe80cJA-00GVg0; Fri, 09
 Nov 2018 08:25:28 +0100
Subject: Re: [PATCH] parisc: Improve alternative live patching
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20181108220356.GA16610@ls3530.dellerweb.de>
 <a0963ae2-457c-d54e-9c54-b1d7c4248e94@bell.net>
From:   Helge Deller <deller@gmx.de>
Message-ID: <48b52781-a13a-fe6d-5930-779aa783115f@gmx.de>
Date:   Fri, 9 Nov 2018 08:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <a0963ae2-457c-d54e-9c54-b1d7c4248e94@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z7CT4BLLOcqRKWNGAAZIOgxjmh3oyjGPr5STF9+DDniz3XGLL8l
 H0Ms7GsW6o6ealmy/ZQrThHRjvuLFmwOuyQv1saSVgae2QhAIxRT/O06UXbX4DmxuJRkV9s
 7vGYafEpTh8XElzW4zJn2M9E+Og1ta/L8CHXk4rsUm6NYC0YpfgE+v4iEtgdIwJl5C6rB7v
 bKlS7GdVpDzC9cpgiy91g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:7K39rfdsGFM=:RBGBMn946Ec1A4UNMvA0+q
 gIHvJgY1qXm5gjePmVc2PSsOotaPo2UMtgD5OrDxLfnLZ/T9yjik72AKWHsX86VRPKDeyx6k3
 1wxTTfr91dCuFyHDPrqEWUhltTN/hY9q+7o341wL3CpdUui7YWsxh4XHyaplIDiFx+Rbcpyv7
 GxH1/T3tSAPG63L+YBgwBgSR8W2UXKcLxplnsjMe7WspoDJ8w6nQZBnxHH4fz1jX7QG0KnuAR
 tjQhLQ9hKTSPzBh7VnPbtjg2fuGjAdWaJtTE4LoXz6H8uBOQZyTEtFzCFoes3NN2RLjQsIAFw
 9BSvW9VYLIsePAJNHU/l85L4M1KfPa7wnl/7nwRmo1ydXCEyITnR4v0QerBf9tJfusz0LdDBC
 VOk3cWDULNHlU/a0zy/rJarTBhb4YJQweBR2E0dkQA/9YYeyDWppxwqxdRAxhfFgjzH1l3G7l
 d7bBIu7ZqBLT/ubN8dzn1xPBgwSRO/QQ29Rn54jYBISxazSYUhFsE37COVxLzeYCWdloX9w/P
 J46VHHTZCwNIcuychjNPh+XYb1wDz7lGKAPBH+oPQBFUX/fBGeeNcc5BHVpPlh9CRayrKe7H/
 ClTAawCXZadqihAi0uPMt2J8TN4NJ+dO92D19h/NUETxnbJ/N9nAkUEavNBhKT+2cIgL8ILoa
 U/8Ei0sT2kVGJ8kTwjTk2rJFq4jTLbinLn0CVjskWxc7l87HyTgAk27+NNwSgwDp7U94vnhZZ
 9YEL5AG0UsHdbh0rQyiV5qzbP+7hMKCjzkRazbIQbpyn1wWiF8EgNDApZv2e/L6VDwskhNL4G
 b2JmvGLoJKdfYRR8qvG8MVQhxXfHk0WJuqfwBdZ+T5h0DD8ADJ+SWjPIZzkVVrP3MZJj3AzR9
 NauPB9i3nuNqdXTdJvlunQ9rLwRcRdFwhgIC6fKIlyhLOiSGVJUarUOonD022E
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 09.11.2018 01:11, John David Anglin wrote:
> On 2018-11-08 5:03 p.m., Helge Deller wrote:
>>   static inline int arch_spin_is_locked(arch_spinlock_t *x)
>>   {
>> -    volatile unsigned int *a = __ldcw_align(x);
>> +    volatile unsigned int *a;
>> +
>> +    if (asm_online_cpus() == 1)
>> +        return 1;

> I think the return value should be 0 (unlocked) when asm_online_cpus() == 1.

In that case, booting with 4 CPUs is working then, but when booting with only one CPU you get:

[    0.000000] Linux version 4.20.0-rc1-32bit+ (deller@ls3530) (gcc version 7.2.1 20170915 (Red Hat Cross 7.2.1-1) (GCC)) #943 SMP Fri Nov 9 08:08:13 CET 2018
[    0.000000] CPU0: thread -1, cpu 0, socket 0
[    0.000000] FP[0] enabled: Rev 1 Model 19
[    0.000000] The 32-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages disabled.
[    0.000000] printk: bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005020 00000481 00000000 02020202 7794d7fe 100000f0 00000004 000000ba 000000ba
[    0.000000] vers  00000008
[    0.000000] CPUID vers 15 rev 8 (0x000001e8)
[    0.000000] capabilities 0x2
[    0.000000] model 9000/778/B160L
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000001fffffff Size    512 MB
[    0.000000] Total Memory: 512 MB
[    0.000000] PDT: Firmware does not provide any page deallocation information.
[    0.000000] percpu: Embedded 22 pages/cpu @(ptrval) s61328 r8192 d20592 u90112
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129920
[    0.000000] Kernel command line: console=ttyS0 root=/dev/sda5 cryptomgr.notests
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Memory: 507412K/524288K available (7140K kernel code, 1036K rwdata, 1651K rodata, 780K init, 376K bss, 16876K reserved, 0K cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 96
[    0.000298] sched_clock: 32 bits at 250MHz, resolution 4ns, wraps every 8589934590ns
[    0.007222] Console: colour dummy device 128x48
[    0.008833] Calibrating delay loop... 1661.33 BogoMIPS (lpj=8306688)
[    0.232493] pid_max: default: 32768 minimum: 301
[    0.236972] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.237480] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.285070] rcu: Hierarchical SRCU implementation.
[    0.292563] smp: Bringing up secondary CPUs ...
[    0.293128] smp: Brought up 1 node, 1 CPU
[    0.306444] devtmpfs: initialized
[    0.320533] random: get_random_u32 called from bucket_table_alloc+0x1ac/0x1d4 with crng_init=0
[    0.326747] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.328413] futex hash table entries: 1024 (order: 3, 49152 bytes)
[    0.341270] NET: Registered protocol family 16
[    0.352413] EISA bus registered
[    0.354398] Searching for devices...
[    0.364975] Found devices:
[    0.366163] 1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
[    0.367071] 2. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a }
[    0.367621] 3. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
[    0.368216] 4. Merlin L2 160 (9000/778/B160L) at 0xfff10000 [62] { 0, 0x0, 0x502, 0x00004 }
[    0.368799] 5. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
[    0.371441] CPU(s): 1 out of 1 PA7300LC (PCX-L2) at 250.000000 MHz online
[    0.378172] alternatives: applied 10030 out of 10030 patches
[    0.378648] BUG: spinlock already unlocked on CPU#0, swapper/0/1
[    0.378648]  lock: logbuf_lock+0x0/0x1c, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 0
[    0.378648] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.20.0-rc1-32bit+ #943
[    0.378648] Hardware name: 9000/778/B160L
[    0.378648] Backtrace:
[    0.378648]  [<101c728c>] show_stack+0x48/0x5c
[    0.378648]  [<1089a3e0>] dump_stack+0x80/0x134
[    0.378648]  [<1024f734>] spin_bug+0xc4/0xec
[    0.378648]  [<1024f9e4>] do_raw_spin_unlock+0x7c/0xfc
[    0.378648]  [<108b9ed0>] _raw_spin_unlock+0x38/0x4c
[    0.378648]  [<10255de4>] vprintk_emit+0xe8/0x234
[    0.378648]  [<10256110>] vprintk_default+0x54/0x6c
[    0.378648]  [<10256f74>] vprintk_func+0x148/0x158
[    0.378648]  [<102566f8>] printk+0x54/0x6c
[    0.378648]  [<101d4354>] apply_alternatives+0xc4/0x1c4
[    0.378648]  [<10107ca8>] 0x10107ca8
[    0.378648]  [<10105e24>] 0x10105e24
[    0.378648]  [<101c39a8>] do_one_initcall+0xd0/0x1dc
[    0.378648]  [<101017b0>] 0x101017b0
[    0.378648]  [<108b2320>] kernel_init+0x34/0x158
[    0.378648]  [<101cc01c>] ret_from_kernel_thread+0x1c/0x24
[    0.378648] 
[    0.379288] Whole cache flush 12773 cycles, flushing 10448896 bytes 4675 cycles
[    0.379735] Cache flush threshold set to 512 KiB
[    0.393941] Whole TLB flush 10612 cycles, Range flush 10448896 bytes 1450591 cycles
[    0.394391] Calculated TLB flush threshold 4 KiB
[    0.394677] TLB flush threshold set to 16 KiB
[    0.397494] Dino version 3.1 found at 0xfff80000
[    0.401648] ------------[ cut here ]------------
[    0.401948] kernel BUG at /home/cvs/LINUX/git-kernel/linux-2.6/mm/slab.c:2910!
[    0.402565] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.20.0-rc1-32bit+ #943
[    0.402903] Hardware name: 9000/778/B160L
[    0.403262] 
[    0.403489]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    0.404065] PSW: 00000000000001001011111100001110 Not tainted
[    0.404668] r00-03  0004bf0e 10b1d670 10369034 2f4bc900
[    0.404979] r04-07  2f401190 00000000 2f4001c0 2fb391a8
[    0.405238] r08-11  101a01a8 0000003c 1f999000 00000200
[    0.405495] r12-15  10ac7064 006080c0 2f4011ac 2f4011b4
[    0.405942] r16-19  007fffff 00000200 00000020 00000000
[    0.406450] r20-23  00000001 10b162a4 00000000 00000000
[    0.407061] r24-27  2f4bc900 10368ffc 102af2d0 10ac6670
[    0.407777] r28-31  2f40119f 000affff 2f4bc940 105a27f0
[    0.408534] sr00-03  00000000 00000000 00000000 00000000
[    0.409727] sr04-07  00000000 00000000 00000000 00000000
[    0.410404] 
[    0.410737] IASQ: 00000000 00000000 IAOQ: 10369050 10369054
[    0.411122]  IIR: 03ffe01f    ISR: 00000000  IOR: 10369000
[    0.411419]  CPU:        0   CR30: 2f4bc000 CR31: 00000000
[    0.411700]  ORIG_R28: 00000000
[    0.411962]  IAOQ[0]: get_first_slab+0x54/0xd8
[    0.412219]  IAOQ[1]: get_first_slab+0x58/0xd8
[    0.412467]  RP(r2): get_first_slab+0x38/0xd8
[    0.412720] Backtrace:
[    0.412908]  [<1036a254>] cache_alloc_refill+0x278/0x474
[    0.413186]  [<1036b570>] __kmalloc+0x210/0x22c
[    0.413445]  [<101f5580>] resource_list_create_entry+0x48/0x7c
[    0.413770]  [<1057f2b4>] pci_add_resource_offset+0x48/0x98
[    0.414083]  [<10133058>] 0x10133058
[    0.414306]  [<101d3348>] parisc_driver_probe+0x48/0x6c
[    0.414603]  [<10622734>] really_probe+0x2a8/0x3c8
[    0.414877]  [<10622ec4>] driver_probe_device+0x4dc/0x4e4
[    0.415157]  [<10622f84>] __driver_attach+0xb8/0x110
[    0.415426]  [<1061fe48>] bus_for_each_dev+0xa0/0xd8
[    0.415771]  [<10621e10>] driver_attach+0x48/0x5c
[    0.416086]  [<106216f4>] bus_add_driver+0x1c0/0x20c
[    0.416429]  [<10623ac0>] driver_register+0xec/0x12c
[    0.416761]  [<101d3520>] register_parisc_driver+0xac/0xb4
[    0.417115]  [<10133478>] 0x10133478
[    0.417362]  [<10105e64>] 0x10105e64
[    0.417633]  [<101c39a8>] do_one_initcall+0xd0/0x1dc
[    0.417960]  [<101017b0>] 0x101017b0
[    0.418238]  [<108b2320>] kernel_init+0x34/0x158
[    0.418785]  [<101cc01c>] ret_from_kernel_thread+0x1c/0x24
[    0.419181] 
[    0.419490] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.20.0-rc1-32bit+ #943
[    0.420044] Hardware name: 9000/778/B160L
[    0.420337] Backtrace:
[    0.420519]  [<101c728c>] show_stack+0x48/0x5c
[    0.420789]  [<1089a3e0>] dump_stack+0x80/0x134
[    0.421048]  [<101c7468>] die_if_kernel+0x18c/0x1e8
[    0.421330]  [<101c7984>] handle_interruption+0x2ec/0x730
[    0.421710]  [<10369050>] get_first_slab+0x54/0xd8
[    0.421990]  [<1036a254>] cache_alloc_refill+0x278/0x474
[    0.422432]  [<1036b570>] __kmalloc+0x210/0x22c
[    0.422797]  [<101f5580>] resource_list_create_entry+0x48/0x7c
[    0.423267]  [<1057f2b4>] pci_add_resource_offset+0x48/0x98
[    0.423724]  [<10133058>] 0x10133058
[    0.424023]  [<101d3348>] parisc_driver_probe+0x48/0x6c
[    0.424474]  [<10622734>] really_probe+0x2a8/0x3c8
[    0.424863]  [<10622ec4>] driver_probe_device+0x4dc/0x4e4
[    0.425303]  [<10622f84>] __driver_attach+0xb8/0x110
[    0.425716]  [<1061fe48>] bus_for_each_dev+0xa0/0xd8
[    0.426155]  [<10621e10>] driver_attach+0x48/0x5c
[    0.426553]  [<106216f4>] bus_add_driver+0x1c0/0x20c
[    0.426978]  [<10623ac0>] driver_register+0xec/0x12c
[    0.427428]  [<101d3520>] register_parisc_driver+0xac/0xb4
[    0.427843]  [<10133478>] 0x10133478
[    0.428148]  [<10105e64>] 0x10105e64
[    0.428509]  [<101c39a8>] do_one_initcall+0xd0/0x1dc
[    0.428648]  [<101017b0>] 0x101017b0
[    0.428648]  [<108b2320>] kernel_init+0x34/0x158
[    0.428648]  [<101cc01c>] ret_from_kernel_thread+0x1c/0x24
[    0.428648] 
[    0.429129] ---[ end trace 1a6ae02625c0f6ff ]---
[    0.431183] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.432304] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
