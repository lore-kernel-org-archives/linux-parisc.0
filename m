From: Meelis Roos <mroos@linux.ee>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Sat, 29 Aug 2009 23:19:58 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0908292318050.12908@math.ut.ee>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
 <Pine.SOC.4.64.0907302054100.20870@math.ut.ee> <4A724818.4080909@tausq.org>
 <Pine.SOC.4.64.0907310923520.710@math.ut.ee> <20090805174507.GB11458@lackof.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Randolph Chung <randolph@tausq.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090805174507.GB11458@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The real problem happens after tulip driver 
> > loading and PCI configuration of the cards.
> 
> This would be consistent with add-on cards not getting MMIO
> space assigned correctly. The ioread32() is one of several operations
> to configure the card.
> 
> It would be helpful to know if 2.6.30.x kernels (from unstable)
> show the same problem.

Tried 2.6.30-6 kernels today. Uniprocessor parisc64 kernel behaves the 
same. parisc64-smp kernel has an additional crash:

Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.30-1-parisc64-smp'
Selected kernel: /vmlinux-2.6.30-1-parisc64-smp from partition 2
Selected ramdisk: /initrd.img-2.6.30-1-parisc64-smp from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4771840 mediaptr 0x1000
Segment 1 load 00618000 size 460848 mediaptr 0x48e000
Segment 2 load 0068c000 size 300800 mediaptr 0x4ff000
Loading ramdisk 8180633 bytes @ 3f821000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.30-1-parisc64-smp (Debian 2.6.30-6) (waldi@debian.org) (gcc version 4.3.4 (GCC) ) #1 SMP Sun Aug 16 03:05:33 UTC 2009
[    0.000000] unwind_init: start = 0x404b9144, end = 0x404e5214, entries = 11277
[    0.000000] WARNING: Out of order unwind entry! 00000000404bb0c4 and 00000000404bb0d4
[    0.000000] WARNING: Out of order unwind entry! 00000000404bb0d4 and 00000000404bb0e4
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] console [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00005c90 00000491 00000000 00000002 2353fbcb 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 17 rev 8 (0x00000228)
[    0.000000] capabilities 0x1
[    0.000000] model 9000/800/L1000-44
[    0.000000] Total Memory: 3072 MB
[    0.000000] initrd: 7f821000-7ffee399
[    0.000000] initrd: reserving 3f821000-3ffee399 (mem_max c0000000)
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 775680
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.30-1-parisc64-smp
[    0.000000] NR_IRQS:128
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[    0.000000] Console: colour dummy device 160x64
[    0.028000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.064000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.580000] Memory: 3075452k/3145728k available (3144k kernel code, 69636k reserved, 1467k data, 296k init)
[    0.588000] virtual kernel memory layout:
[    0.588000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.588000]     memory  : 0x0000000040000000 - 0x0000000100000000   (3072 MB)
[    0.588000]       .init : 0x000000004068c000 - 0x00000000406d6000   ( 296 kB)
[    0.588000]       .data : 0x0000000040412118 - 0x0000000040581000   (1467 kB)
[    0.588000]       .text : 0x0000000040100000 - 0x0000000040412118   (3144 kB)
[    0.660000] Calibrating delay loop... 876.54 BogoMIPS (lpj=1753088)
[    0.756000] Security Framework initialized
[    0.764000] SELinux:  Disabled at boot.
[    0.776000] Mount-cache hash table entries: 256
[    0.784000] Initializing cgroup subsys ns
[    0.876000] Initializing cgroup subsys cpuacct
[    0.884000] Initializing cgroup subsys devices
[    0.892000] Initializing cgroup subsys freezer
[    0.896000] Initializing cgroup subsys net_cls
[    0.904000] Brought up 1 CPUs
[    1.160000] net_namespace: 1928 bytes
[    1.168000] regulator: core version 0.5
[    1.176000] NET: Registered protocol family 16
[    1.300000] EISA bus registered
[    1.304000] Searching for devices...
[    1.772000] Found devices:
[    1.772000] 1. Rhapsody DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5c9, 0x00004 }
[    1.780000] 2. Rhapsody DC- 440 at 0xfffffffffffa6000 [166] { 0, 0x0, 0x5c9, 0x00004 }
[    1.788000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x095, 0x00009 }
[    1.792000] 4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[    1.800000] 5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[    1.868000] 6. Elroy PCI Bridge at 0xfffffffffed32000 [0/1] { 13, 0x0, 0x782, 0x0000a }
[    1.876000] 7. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[    1.884000] 8. Elroy PCI Bridge at 0xfffffffffed36000 [0/3] { 13, 0x0, 0x782, 0x0000a }
[    1.892000] 9. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[    1.900000] 10. Elroy PCI Bridge at 0xfffffffffed3a000 [0/5] { 13, 0x0, 0x782, 0x0000a }
[    2.432000] 11. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error detected.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
[    3.132000] powersw: Soft power switch support not available.
[    3.144000] bio: create slab <bio-0> at 0
[    3.292000] NET: Registered protocol family 2
[    3.348000] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    3.356000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    3.440000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    3.564000] TCP: Hash tables configured (established 262144 bind 65536)
[    3.568000] TCP reno registered
[    3.584000] NET: Registered protocol family 1
[    3.696000] Trying to unpack rootfs image as initramfs...
[    4.732000] Freeing initrd memory: 7988k freed
[    4.740000] Chassis warnings not supported.
[    4.748000] Performance monitoring counters enabled for Rhapsody DC- 440
[    4.764000] audit: initializing netlink socket (disabled)
[    4.772000] type=2000 audit(1251556747.242:1): initialized
[    4.788000] VFS: Disk quotas dquot_6.5.2
[    4.796000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    4.816000] msgmni has been set to 6023
[    4.828000] alg: No test for stdrng (krng)
[    4.836000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    4.848000] io scheduler noop registered
[    4.856000] io scheduler anticipatory registered
[    4.860000] io scheduler deadline registered
[    4.864000] io scheduler cfq registered (default)
[    4.960000] PDC Stable Storage facility v0.30
[    5.652000] STI GSC/PCI core graphics driver Version 0.9a
[    5.684000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    5.692000] serial 0000:00:04.0: enabling device (0146 -> 0147)
[    5.704000] 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
[    5.712000] console handover: boot [ttyB0] -> real [ttyS0]
[    5.728000] 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16550A
[    5.752000] 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
[    5.764000] serial 0000:00:05.0: enabling device (0000 -> 0003)
[    5.776000] serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
[    5.792000] 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71) is a 16550A
[    5.804000] Couldn't register serial port 0000:00:05.0: -28
[    5.908000] brd: module loaded
[    5.912000] mice: PS/2 mouse device common for all mice
[    6.032000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[    6.048000] TCP cubic registered
[    6.172000] NET: Registered protocol family 17
[    6.184000] registered taskstats version 1
[    6.196000] rtc-generic rtc-generic: setting system clock to 2009-08-29 14:39:08 UTC (1251556748)
[    6.316000] Freeing unused kernel memory: <0>------------[ cut here ]------------
[    6.464000] Badness at /build/buildd/linux-2.6-2.6.30/debian/build/source_hppa_none/kernel/smp.c:369
[    6.476000] 
[    6.480000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    6.484000] PSW: 00001000000001100000000000001110 Not tainted
[    6.488000] r00-03  000000000806000e 0000000040686fc0 0000000040182c3c 000000004058d020
[    6.496000] r04-07  0000000040668fc0 000000004065e7e0 00000000404f7db0 0000000000000000
[    6.504000] r08-11  0000000040686fc0 000000000000000 00000000406797c0
[    7.028000] r12-15  0000000000000001 0000000000000001 0000000000000000 0000000000000001
[    7.040000] r16-19  00000000f00003b0 0000000040686fc0 00000000ff83eb40 00000000406d6000
[    7.048000] r20-23  0000000000000000 00000000406d6000 ffffffffffffffff 0000000000000001
[    7.056000] r24-27  0000000000000000 000000004065e7e0 00000000404f7db0 0000000040668fc0
[    7.064000] r28-31  0000000000000000 00000000ff840490 00000000ff840580 0000000000000000
[    7 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    7.592000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    7.608000] 
[    7.608000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040182984 0000000040182988
[    7.616000]  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000
[    7.624000]  CPU:        0   CR30: 00000000ff840000 CR31: 0000000000008020
[    7.628000]  ORIG_R28: 000000000800000e
[    7.632000]  function_many+0x7c/0x2f8
[    8.152000]  IAOQ[1]: smp_call_function_many+0x80/0x2f8
[    8.164000]  RP(r2): smp_call_function+0x3c/0x50
[    8.168000] Backtrace:
[    8.168000] Backtrace:
[    8.168000]  [<0000000040115fe8>] printk+0x40/0x50
[    8.168000]  <0000000040152698>] print_tainted+0xc0/0xe0
[    8.168000]  [<0000000040104084>] intr_check_sig+0x0/0x38
[    8.168000]  [<0000000040104074>] intr_return+0x0/0x4
[    8.168000]  [<0000000040182c3c>] smp_call_function+0x3c/0x50
[    8.168000]  [<0000000040159c40>] on_each_cpu+0x28/0x68
[    8.168000]  [<000000004011b95c>] free_initmem+0x94/0x340

-- 
Meelis Roos (mroos@linux.ee)
