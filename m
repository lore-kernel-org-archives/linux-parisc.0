From: Meelis Roos <mroos@linux.ee>
Subject: IRQ handler type mismatches
Date: Mon, 10 Jan 2011 10:28:49 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1101101025340.27086@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,

I'm tring 2.6.37 and 2.6.37+git on SMP L1000 64-bit. I'm getting IRQ 
handler type mismatch for IRQs 64 and 65 on bootup. 2.6.37 crashed 
aptitude (maybe unrelated), 2.6.37+git as of 2011-01-09 has worked fine 
on two tries.

Full dmesg:
[    0.000000] Linux version 2.6.37-03737-g0c21e3a (mroos@hernes) (gcc version 4.4.5 (GCC) ) #1 SMP Sun Jan 9 18:47:10 EET 2011
[    0.000000] unwind_init: start = 0x4050f000, end = 0x4053cef0, entries = 11759
[    0.000000] WARNING: Out of order unwind entry! 0000000040510720 and 0000000040510730
[    0.000000] WARNING: Out of order unwind entry! 0000000040510730 and 0000000040510740
[    0.000000] WARNING: Out of order unwind entry! 0000000040511330 and 0000000040511340
[    0.000000] WARNING: Out of order unwind entry! 0000000040511340 and 0000000040511350
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00005c90 00000491 00000000 00000002 2353fbcb 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 17 rev 8 (0x00000228)
[    0.000000] capabilities 0x1
[    0.000000] model 9000/800/L1000-44
[    0.000000] Total Memory: 3072 MB
[    0.000000] On node 0 totalpages: 786432
[    0.000000] free_area_init_node: node 0, pgdat 40554700, node_mem_map 40c25000
[    0.000000]   Normal zone: 10752 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 775680 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 10 pages/cpu @0000000043650000 s12032 r8192 d20736 u40960
[    0.000000] pcpu-alloc: s12032 r8192 d20736 u40960 alloc=10*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 775680
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.37-03737-g0c21e3a
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Memory: 3083708k/3145728k available (3503k kernel code, 62020k reserved, 1476k data, 172k init)
[    0.000000] virtual kernel memory layout:
[    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.000000]     memory  : 0x0000000040000000 - 0x0000000100000000   (3072 MB)
[    0.000000]       .init : 0x00000000406d4000 - 0x00000000406ff000   ( 172 kB)
[    0.000000]       .data : 0x000000004046bf10 - 0x00000000405dd200   (1476 kB)
[    0.000000]       .text : 0x0000000040100000 - 0x000000004046bf10   (3503 kB)
[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU-based detection of stalled CPUs is disabled.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.130000] Calibrating delay loop... 878.18 BogoMIPS (lpj=4390912)
[    0.400000] pid_max: default: 32768 minimum: 301
[    0.400000] Mount-cache hash table entries: 256
[    0.430000] Brought up 1 CPUs
[    0.440000] NET: Registered protocol family 16
[    0.440000] Searching for devices...
[    0.910000] Found devices:
[    0.910000] 1. Rhapsody DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5c9, 0x00004 }
[    0.920000] 2. Rhapsody DC- 440 at 0xfffffffffffa6000 [166] { 0, 0x0, 0x5c9, 0x00004 }
[    0.920000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x095, 0x00009 }
[    0.930000] 4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[    0.940000] 5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[    0.990000] 6. Elroy PCI Bridge at 0xfffffffffed32000 [0/1] { 13, 0x0, 0x782, 0x0000a }
[    1.000000] 7. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[    1.000000] 8. Elroy PCI Bridge at 0xfffffffffed36000 [0/3] { 13, 0x0, 0x782, 0x0000a }
[    1.010000] 9. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[    1.020000] 10. Elroy PCI Bridge at 0xfffffffffed3a000 [0/5] { 13, 0x0, 0x782, 0x0000a }
[    1.410000] 11. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
[    1.420000] 12. Elroy PCI Bridge at 0xfffffffffed3e000 [0/7] { 13, 0x0, 0x782, 0x0000a }
[    1.430000] Enabling PDC_PAT chassis codes support v0.05
[    1.760000] Releasing cpu 1 now, hpa=fffffffffffa6000
[    1.770000] FP[1] enabled: Rev 1 Model 16
[    1.780000] IRQ handler type mismatch for IRQ 64
[    1.780000] current handler: timer
[    1.790000] Backtrace:
[    1.790000]  [<000000004011ed24>] show_stack+0x14/0x20
[    1.810000]  [<00000000401174a8>] dump_stack+0x18/0x28
[    1.810000]  [<0000000040196cd0>] __setup_irq+0x4d0/0x500
[    1.820000]  [<0000000040196d40>] setup_irq+0x40/0x58
[    1.820000]  [<00000000406d7378>] init_IRQ+0xa8/0x130
[    1.830000]  [<00000000406d87c4>] smp_callin+0x144/0x1a8
[    1.830000]  [<00000000402011e4>] d_rehash+0x4c/0x60
[    1.860000]  [<00000000401f9330>] do_path_lookup+0xa0/0x140
[    1.860000]  [<00000000401fa72c>] do_filp_open+0x17c/0x780
[    1.870000]  [<0000000040142b78>] enqueue_task+0x60/0x88
[    1.870000]  [<000000004011b5f0>] _raw_spin_unlock_irqrestore+0x18/0x30
[    1.880000]  [<000000004014965c>] finish_task_switch+0x4c/0x150
[    1.880000]  [<000000004014b564>] schedule_tail+0x54/0x160
[    1.910000]  [<000000004010347c>] ret_from_kernel_thread+0x24/0x40
[    1.910000] 
[    1.910000] IRQ handler type mismatch for IRQ 65
[    1.920000] current handler: IPI
[    1.920000] Backtrace:
[    1.920000]  [<000000004011ed24>] show_stack+0x14/0x20
[    1.930000]  [<00000000401174a8>] dump_stack+0x18/0x28
[    1.930000]  [<0000000040196cd0>] __setup_irq+0x4d0/0x500
[    1.940000]  [<0000000040196d40>] setup_irq+0x40/0x58
[    1.940000]  [<00000000406d73b4>] init_IRQ+0xe4/0x130
[    1.960000]  [<00000000406d87c4>] smp_callin+0x144/0x1a8
[    1.970000]  [<00000000402011e4>] d_rehash+0x4c/0x60
[    1.970000]  [<00000000401f9330>] do_path_lookup+0xa0/0x140
[    1.980000]  [<00000000401fa72c>] do_filp_open+0x17c/0x780
[    1.980000]  [<0000000040142b78>] enqueue_task+0x60/0x88
[    1.990000]  [<000000004011b5f0>] _raw_spin_unlock_irqrestore+0x18/0x30
[    1.990000]  [<000000004014965c>] finish_task_switch+0x4c/0x150
[    2.030000]  [<000000004014b564>] schedule_tail+0x54/0x160
[    2.030000]  [<000000004010347c>] ret_from_kernel_thread+0x24/0x40
[    2.040000] 
[    2.130000] CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
[    2.130000] Whole cache flush 333647 cycles, flushing 6287360 bytes 1074964 cycles
[    2.130000] Setting cache flush threshold to 100000 (2 CPUs online)
[    2.190000] SBA found Astro 2.1 at 0xfffffffffed00000
[    2.200000] Elroy version TR4.0 (0x5) found at 0xfffffffffed30000
[    2.230000] pci 0000:00:00.0: [1011:0019] type 0 class 0x000200
[    2.230000] pci 0000:00:00.0: reg 10: [io  0x0000-0x007f]
[    2.230000] pci 0000:00:00.0: reg 14: [mem 0x00000000-0x000003ff]
[    2.230000] pci 0000:00:00.0: reg 30: [mem 0x00000000-0x0003ffff pref]
[    2.230000] pci 0000:00:01.0: [1000:000b] type 0 class 0x000100
[    2.230000] pci 0000:00:01.0: reg 10: [io  0x0000-0x00ff]
[    2.230000] pci 0000:00:01.0: reg 14: [mem 0x00000000-0x000003ff 64bit]
[    2.230000] pci 0000:00:01.0: reg 1c: [mem 0x00000000-0x00001fff 64bit]
[    2.230000] pci 0000:00:01.0: supports D1 D2
[    2.230000] pci 0000:00:01.1: [1000:000b] type 0 class 0x000100
[    2.230000] pci 0000:00:01.1: reg 10: [io  0x0000-0x00ff]
[    2.230000] pci 0000:00:01.1: reg 14: [mem 0xf8020000-0xf80203ff 64bit]
[    2.230000] pci 0000:00:01.1: reg 1c: [mem 0xf8040000-0xf8041fff 64bit]
[    2.230000] pci 0000:00:01.1: supports D1 D2
[    2.230000] pci 0000:00:02.0: [1000:000f] type 0 class 0x000100
[    2.230000] pci 0000:00:02.0: reg 10: [io  0x0000-0x00ff]
[    2.230000] pci 0000:00:02.0: reg 14: [mem 0x00000000-0x000000ff]
[    2.230000] pci 0000:00:02.0: reg 18: [mem 0x00000000-0x00000fff]
[    2.230000] pci 0000:00:02.1: [1000:000f] type 0 class 0x000100
[    2.230000] pci 0000:00:02.1: reg 10: [io  0x0000-0x00ff]
[    2.230000] pci 0000:00:02.1: reg 14: [mem 0x00000000-0x000000ff]
[    2.230000] pci 0000:00:02.1: reg 18: [mem 0x00000000-0x00000fff]
[    2.240000] pci 0000:00:04.0: [103c:1048] type 0 class 0x000700
[    2.240000] pci 0000:00:04.0: reg 10: [mem 0xf8000000-0xf8000fff]
[    2.240000] pci 0000:00:04.0: reg 14: [io  0x0000-0x003f]
[    2.240000] pci 0000:00:05.0: [103c:1048] type 0 class 0x000700
[    2.240000] pci 0000:00:05.0: reg 10: [mem 0x00000000-0x00000fff]
[    2.240000] pci 0000:00:05.0: reg 14: [io  0x0000-0x003f]
[    2.240000] pci 0000:00:00.0: BAR 6: assigned [mem 0xfffffffff8080000-0xfffffffff80bffff pref]
[    2.300000] pci 0000:00:01.0: BAR 3: assigned [mem 0xfffffffff8002000-0xfffffffff8003fff 64bit]
[    2.440000] pci 0000:00:01.0: BAR 3: set to [mem 0xfffffffff8002000-0xfffffffff8003fff 64bit] (PCI address [0xf8002000-0xf8003fff])
[    2.460000] pci 0000:00:02.0: BAR 2: assigned [mem 0xfffffffff8001000-0xfffffffff8001fff]
[    2.460000] pci 0000:00:02.0: BAR 2: set to [mem 0xfffffffff8001000-0xfffffffff8001fff] (PCI address [0xf8001000-0xf8001fff])
[    2.730000] pci 0000:00:02.1: BAR 2: assigned [mem 0xfffffffff8004000-0xfffffffff8004fff]
[    2.860000] pci 0000:00:02.1: BAR 2: set to [mem 0xfffffffff8004000-0xfffffffff8004fff] (PCI address [0xf8004000-0xf8004fff])
[    3.000000] pci 0000:00:05.0: BAR 0: assigned [mem 0xfffffffff8005000-0xfffffffff8005fff]
[    3.140000] pci 0000:00:05.0: BAR 0: set to [mem 0xfffffffff8005000-0xfffffffff8005fff] (PCI address [0xf8005000-0xf8005fff])
[    3.290000] pci 0000:00:00.0: BAR 1: assigned [mem 0xfffffffff8006000-0xfffffffff80063ff]
[    3.420000] pci 0000:00:00.0: BAR 1: set to [mem 0xfffffffff8006000-0xfffffffff80063ff] (PCI address [0xf8006000-0xf80063ff])
[    3.440000] pci 0000:00:01.0: BAR 1: assigned [mem 0xfffffffff8007000-0xfffffffff80073ff 64bit]
[    3.450000] pci 0000:00:01.0: BAR 1: set to [mem 0xfffffffff8007000-0xfffffffff80073ff 64bit] (PCI address [0xf8007000-0xf80073ff])
[    3.710000] pci 0000:00:01.0: BAR 0: assigned [io  0x0100-0x01ff]
[    3.720000] pci 0000:00:01.0: BAR 0: set to [io  0x0100-0x01ff] (PCI address [0x100-0x1ff])
[    3.990000] pci 0000:00:01.1: BAR 0: assigned [io  0x0200-0x02ff]
[    4.000000] pci 0000:00:01.1: BAR 0: set to [io  0x0200-0x02ff] (PCI address [0x200-0x2ff])
[    4.130000] pci 0000:00:02.0: BAR 0: assigned [io  0x0300-0x03ff]
[    4.140000] pci 0000:00:02.0: BAR 0: set to [io  0x0300-0x03ff] (PCI address [0x300-0x3ff])
[    4.270000] pci 0000:00:02.0: BAR 1: assigned [mem 0xfffffffff8008000-0xfffffffff80080ff]
[    4.280000] pci 0000:00:02.0: BAR 1: set to [mem 0xfffffffff8008000-0xfffffffff80080ff] (PCI address [0xf8008000-0xf80080ff])
[    4.560000] pci 0000:00:02.1: BAR 0: assigned [io  0x0400-0x04ff]
[    4.560000] pci 0000:00:02.1: BAR 0: set to [io  0x0400-0x04ff] (PCI address [0x400-0x4ff])
[    4.840000] pci 0000:00:02.1: BAR 1: assigned [mem 0xfffffffff8009000-0xfffffffff80090ff]
[    4.850000] pci 0000:00:02.1: BAR 1: set to [mem 0xfffffffff8009000-0xfffffffff80090ff] (PCI address [0xf8009000-0xf80090ff])
[    4.980000] pci 0000:00:00.0: BAR 0: assigned [io  0x0080-0x00ff]
[    4.980000] pci 0000:00:00.0: BAR 0: set to [io  0x0080-0x00ff] (PCI address [0x80-0xff])
[    5.260000] pci 0000:00:04.0: BAR 1: assigned [io  0x0040-0x007f]
[    5.260000] pci 0000:00:04.0: BAR 1: set to [io  0x0040-0x007f] (PCI address [0x40-0x7f])
[    5.270000] pci 0000:00:05.0: BAR 1: assigned [io  0x0500-0x053f]
[    5.540000] pci 0000:00:05.0: BAR 1: set to [io  0x0500-0x053f] (PCI address [0x500-0x53f])
[    5.560000] Elroy version TR4.0 (0x5) found at 0xfffffffffed32000
[    5.700000] Elroy version TR4.0 (0x5) found at 0xfffffffffed34000
[    5.700000] NOTICE: Enabling PCI Arbitration
[    5.730000] Elroy version TR4.0 (0x5) found at 0xfffffffffed36000
[    5.840000] pci 0000:18:00.0: [1011:0019] type 0 class 0x000200
[    5.840000] pci 0000:18:00.0: reg 10: [io  0xdc139c00-0xdc139c7f]
[    5.840000] pci 0000:18:00.0: reg 14: [mem 0xd053f800-0xd053fbff]
[    5.840000] pci 0000:18:00.0: reg 30: [mem 0xcefc0000-0xceffffff pref]
[    5.840000] pci 0000:18:00.0: no compatible bridge window for [io  0xdc139c00-0xdc139c7f]
[    5.960000] pci 0000:18:00.0: no compatible bridge window for [mem 0xffffffffd053f800-0xffffffffd053fbff]
[    5.970000] pci 0000:18:00.0: no compatible bridge window for [mem 0xffffffffcefc0000-0xffffffffceffffff pref]
[    6.100000] pci 0000:18:00.0: BAR 6: assigned [mem 0xfffffffff9800000-0xfffffffff983ffff pref]
[    6.240000] pci 0000:18:00.0: BAR 1: assigned [mem 0xfffffffff9840000-0xfffffffff98403ff]
[    6.380000] pci 0000:18:00.0: BAR 1: set to [mem 0xfffffffff9840000-0xfffffffff98403ff] (PCI address [0xf9840000-0xf98403ff])
[    6.530000] pci 0000:18:00.0: BAR 0: assigned [io  0x30000-0x3007f]
[    6.530000] pci 0000:18:00.0: BAR 0: set to [io  0x30000-0x3007f] (PCI address [0x0-0x7f])
[    6.540000] Elroy version TR4.0 (0x5) found at 0xfffffffffed38000
[    6.810000] NOTICE: Enabling PCI Arbitration
[    6.830000] Elroy version TR4.0 (0x5) found at 0xfffffffffed3a000
[    6.840000] NOTICE: Enabling PCI Arbitration
[    6.860000] Elroy version TR4.0 (0x5) found at 0xfffffffffed3c000
[    6.940000] NOTICE: Enabling PCI Arbitration
[    6.970000] Elroy version TR4.0 (0x5) found at 0xfffffffffed3e000
[    6.970000] NOTICE: Enabling PCI Arbitration
[    7.000000] powersw: Soft power switch support not available.
[    7.090000] bio: create slab <bio-0> at 0
[    7.220000] vgaarb: loaded
[    7.230000] SCSI subsystem initialized
[    7.260000] NET: Registered protocol family 2
[    7.270000] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    7.370000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    7.530000] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes)
[    7.540000] TCP: Hash tables configured (established 262144 bind 65536)
[    7.650000] TCP reno registered
[    7.660000] UDP hash table entries: 2048 (order: 5, 196608 bytes)
[    7.790000] UDP-Lite hash table entries: 2048 (order: 5, 196608 bytes)
[    7.800000] NET: Registered protocol family 1
[    7.930000] PCI: CLS 64 bytes
[    7.930000] Chassis warnings not supported.
[    7.940000] Performance monitoring counters enabled for Rhapsody DC- 440
[    8.100000] VFS: Disk quotas dquot_6.5.2
[    8.100000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    8.210000] msgmni has been set to 6022
[    8.220000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    8.230000] io scheduler noop registered
[    8.350000] io scheduler cfq registered (default)
[    8.370000] PDC Stable Storage facility v0.30
[    9.180000] STI GSC/PCI core graphics driver Version 0.9a
[    9.180000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    9.200000] serial 0000:00:04.0: enabling device (0146 -> 0147)
[    9.230000] 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
[    9.240000] console [ttyS0] enabled, bootconsole disabled
[    9.280000] 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16550A
[    9.320000] 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
[    9.330000] serial 0000:00:05.0: enabling device (0000 -> 0003)
[    9.340000] serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
[    9.380000] 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71) is a 16550A
[    9.420000] Couldn't register serial port 0000:00:05.0: -28
[    9.560000] sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
[    9.570000] sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)
[    9.770000] sym0: <896> rev 0x5 at pci 0000:00:01.0 irq 67
[    9.780000] sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
[    9.850000] sym0: SCSI BUS has been reset.
[    9.860000] scsi0 : sym-2.2.3
[    9.860000] sym53c8xx 0000:00:01.1: enabling device (0146 -> 0147)
[   10.050000] sym1: <896> rev 0x5 at pci 0000:00:01.1 irq 68
[   10.060000] sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
[   10.130000] sym1: SCSI BUS has been reset.
[   10.130000] scsi1 : sym-2.2.3
[   10.130000] sym1: SCSI BUS mode change from SE to SE.
[   10.130000] sym1: SCSI BUS has been reset.
[   10.280000] sym53c8xx 0000:00:02.0: enabling device (0000 -> 0003)
[   10.410000] sym53c8xx 0000:00:02.0: enabling SERR and PARITY (0003 -> 0143)
[   10.620000] sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 68
[   10.710000] sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
[   10.720000] sym2: SCSI BUS has been reset.
[   10.720000] scsi2 : sym-2.2.3
[   10.730000] sym53c8xx 0000:00:02.1: enabling device (0000 -> 0003)
[   10.830000] sym53c8xx 0000:00:02.1: enabling SERR and PARITY (0003 -> 0143)
[   10.910000] sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 69
[   11.060000] sym3: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
[   11.120000] sym3: SCSI BUS has been reset.
[   11.120000] scsi3 : sym-2.2.3
[   11.130000] mousedev: PS/2 mouse device common for all mice
[   11.250000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   11.270000] TCP cubic registered
[   11.390000] NET: Registered protocol family 17
[   11.400000] Registering the dns_resolver key type
[   11.530000] scsi: waiting for bus probes to complete ...
[   13.190000] scsi 1:0:0:0: Direct-Access     SEAGATE  ST136403LC       HP01 PQ: 0 ANSI: 2
[   13.200000] scsi target1:0:0: tagged command queuing enabled, command queue depth 16.
[   13.220000] scsi target1:0:0: Beginning Domain Validation
[   13.240000] scsi target1:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
[   13.250000] scsi target1:0:0: Domain Validation skipping write tests
[   13.260000] scsi target1:0:0: Ending Domain Validation
[   13.760000] scsi 2:0:0:0: Direct-Access     SEAGATE  ST136403LC       HP01 PQ: 0 ANSI: 2
[   13.760000] scsi target2:0:0: tagged command queuing enabled, command queue depth 16.
[   13.770000] scsi target2:0:0: Beginning Domain Validation
[   13.810000] scsi target2:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
[   13.820000] scsi target2:0:0: Domain Validation skipping write tests
[   13.820000] scsi target2:0:0: Ending Domain Validation
[   14.770000] scsi 3:0:2:0: CD-ROM            HP       DVD-ROM 304      2.00 PQ: 0 ANSI: 2
[   14.780000] scsi target3:0:2: Beginning Domain Validation
[   14.800000] scsi target3:0:2: FAST-20 SCSI 20.0 MB/s ST (50 ns, offset 16)
[   14.810000] scsi target3:0:2: Domain Validation skipping write tests
[   14.820000] scsi target3:0:2: Ending Domain Validation
[   17.480000] sd 1:0:0:0: [sda] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
[   17.490000] sd 1:0:0:0: [sda] Write Protect is off
[   17.510000] sd 1:0:0:0: [sda] Mode Sense: 9f 00 10 08
[   17.510000] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   17.550000]  sda: sda1 sda2 sda3 < sda5 sda6 >
[   17.570000] sd 1:0:0:0: [sda] Attached SCSI disk
[   17.980000] sd 2:0:0:0: [sdb] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
[   17.990000] sd 2:0:0:0: [sdb] Write Protect is off
[   18.010000] sd 2:0:0:0: [sdb] Mode Sense: 9f 00 10 08
[   18.010000] sd 2:0:0:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   18.060000]  sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 >
[   18.070000] sd 2:0:0:0: [sdb] Attached SCSI disk
[   18.380000] rtc-generic rtc-generic: setting system clock to 2011-01-10 07:50:23 UTC (1294645823)
[   18.470000] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
[   18.480000] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
[   18.500000] Freeing unused kernel memory: 172k freed
[   18.500000] Write protecting the kernel read-only data: 652k
[   21.030000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[   21.040000] tulip 0000:00:00.0: enabling device (0140 -> 0143)
[   21.060000] tulip0: no phy info, aborting mtable build
[   21.070000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1
[   21.090000] net eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff8006000, 00:10:83:fe:9c:b0, IRQ 66
[   21.100000] tulip 0000:18:00.0: enabling device (0000 -> 0003)
[   21.110000] tulip 0000:18:00.0: enabling SERR and PARITY (0003 -> 0143)
[   21.140000] tulip1: EEPROM default media type Autosense
[   21.150000] tulip1: Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block
[   21.170000] tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101
[   21.180000] tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101
[   21.190000] net eth1: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff9840000, 00:10:83:fb:99:c0, IRQ 72
[   21.650000] sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
[   21.650000] cdrom: Uniform CD-ROM driver Revision: 3.20
[   21.670000] sr 3:0:2:0: Attached scsi CD-ROM sr0
[   21.800000] sd 1:0:0:0: Attached scsi generic sg0 type 0
[   21.810000] sd 2:0:0:0: Attached scsi generic sg1 type 0
[   21.820000] sr 3:0:2:0: Attached scsi generic sg2 type 5
[   23.760000] Adding 1350652k swap on /dev/sda6.  Priority:-1 extents:1 across:1350652k 
[   23.820000] EXT4-fs (sda5): re-mounted. Opts: (null)
[   24.360000] EXT4-fs (sda5): re-mounted. Opts: errors=remount-ro
[   24.810000] loop: module loaded
[   31.060000] net eth0: Setting full-duplex based on MII#1 link partner capability of 45e1
[   31.360000] NET: Registered protocol family 10
[   31.370000] lo: Disabled Privacy Extensions
[   31.660000] sshd (924): /proc/924/oom_adj is deprecated, please use /proc/924/oom_score_adj instead.

-- 
Meelis Roos (mroos@linux.ee)
