From: Tobias Ulmer <tobiasu@tmux.org>
Subject: 3.4.0-rc7 hangs with SMP on c8000
Date: Sun, 13 May 2012 19:51:29 +0200
Message-ID: <20120513175129.GA13674@tin.tmux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kernel hangs somewhere around initializing the other CPUs. Note that the
timing information stays the same, despite the last message coming about
~2 seconds late.

SMP worked fine on 3.3.0, especially with David Angelin's cache-tlb patch.

Command line for kernel: 'root=/dev/sda4 console=ttyB0 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 6520832 mediaptr 0x1000
Segment 1 load 007a08c0 size 577784 mediaptr 0x6398c0
Segment 2 load 00830000 size 191360 mediaptr 0x6c7000
Segment 3 load 0085f000 size 151872 mediaptr 0x6f6000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Linux version 3.4.0-rc7+ (tobiasu@cobalt) (gcc version 4.6.2 (Gentoo 4.6.2-r1 p1.4.1) ) #2 SMP Sun May 13 19:21:35 CEST 2012
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 000088b0 00000491 00000000 00000002 56f855018c5b7ed5 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000302
[    0.000000] CPUID vers 20 rev 5 (0x00000285)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 8190 MB
[    0.000000] PERCPU: Embedded 10 pages/cpu @00000000425ed000 s8512 r8192 d24256 u40960
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Kernel command line: root=/dev/sda4 console=ttyB0 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 8234944k/8386560k available (4492k kernel code, 151616k reserved, 1827k data, 340k init)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.060000] Calibrating delay loop... 1993.93 BogoMIPS (lpj=9969664)
[    0.190000] pid_max: default: 32768 minimum: 301
[    0.250000] Mount-cache hash table entries: 256
[    0.310000] Brought up 1 CPUs
[    0.350000] NET: Registered protocol family 16
[    0.410000] EISA bus registered
[    0.450000] Searching for devices...
[    0.620000] Found devices:
[    0.660000] 1. Unknown machine at 0xfffffffffe780000 [128] { 0, 0x0, 0x88b, 0x00004 }
[    0.760000] 2. Unknown machine at 0xfffffffffe781000 [129] { 0, 0x0, 0x88b, 0x00004 }
[    0.860000] 3. Unknown machine at 0xfffffffffe798000 [152] { 0, 0x0, 0x88b, 0x00004 }
[    0.970000] 4. Unknown machine at 0xfffffffffe799000 [153] { 0, 0x0, 0x88b, 0x00004 }
[    1.070000] 5. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[    1.160000] 6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    1.270000] 7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    1.380000] 8. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    1.490000] 9. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    1.590000] 10. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[    1.710000] 11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    1.820000] 12. unknown device at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x077, 0x000ad }
[    1.920000] 13. unknown device at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x077, 0x000ad }
[    2.020000] Enabling PDC_PAT chassis codes support v0.05
[    2.540000] Releasing cpu 1 now, hpa=fffffffffe781000
[    2.650000] FP[1] enabled: Rev 1 Model 20
[    2.660000] Releasing cpu 2 now, hpa=fffffffffe798000
[    2.820000] timer_interrupt(CPU 0): delayed! cycles FFFFFFFFFF7DC908 rem 890E78  next/now 18A127FC36/18A09EEDBE
[    2.820448] FP[2] enabled: Rev 1 Model 20
[    2.820448] INFO: rcu_sched detected stalls on CPUs/tasks: { 1} (detected by 2, t=1844674407392 jiffies)
[    2.820448] INFO: Stall ended before state dump start
[    2.820448] timer_interrupt(CPU 0): delayed! cycles 44D95D66B rem 812C15  next/now 1CEF3EFEB6/1CEEBDD2A1



Booting the same image with nosmp:

[    0.000000] Linux version 3.4.0-rc7+ (tobiasu@cobalt) (gcc version 4.6.2 (Gentoo 4.6.2-r1 p1.4.1) ) #2 SMP Sun May 13 19:21:35 CEST 2012
[    0.000000] unwind_init: start = 0x4063e000, end = 0x40678e40, entries = 15076
[    0.000000] WARNING: Out of order unwind entry! 000000004063f960 and 000000004063f970
[    0.000000] WARNING: Out of order unwind entry! 000000004063f970 and 000000004063f980
[    0.000000] WARNING: Out of order unwind entry! 0000000040640620 and 0000000040640630
[    0.000000] WARNING: Out of order unwind entry! 0000000040640630 and 0000000040640640
[    0.000000] WARNING: Out of order unwind entry! 0000000040640690 and 00000000406406a0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406a0 and 00000000406406b0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406b0 and 00000000406406c0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406c0 and 00000000406406d0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406d0 and 00000000406406e0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406e0 and 00000000406406f0
[    0.000000] WARNING: Out of order unwind entry! 00000000406406f0 and 0000000040640700
[    0.000000] WARNING: Out of order unwind entry! 0000000040640700 and 0000000040640710
[    0.000000] WARNING: Out of order unwind entry! 0000000040640710 and 0000000040640720
[    0.000000] WARNING: Out of order unwind entry! 0000000040640720 and 0000000040640730
[    0.000000] WARNING: Out of order unwind entry! 0000000040640730 and 0000000040640740
[    0.000000] WARNING: Out of order unwind entry! 0000000040640740 and 0000000040640750
[    0.000000] WARNING: Out of order unwind entry! 0000000040640750 and 0000000040640760
[    0.000000] WARNING: Out of order unwind entry! 0000000040640760 and 0000000040640770
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 000088b0 00000491 00000000 00000002 56f855018c5b7ed5 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000302
[    0.000000] CPUID vers 20 rev 5 (0x00000285)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 8190 MB
[    0.000000] On node 0 totalpages: 262144
[    0.000000] free_area_init_node: node 0, pgdat 40696780, node_mem_map 417e4000
[    0.000000]   Normal zone: 3584 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 258560 pages, LIFO batch:31
[    0.000000] On node 1 totalpages: 1048064
[    0.000000] free_area_init_node: node 1, pgdat 40697500, node_mem_map 140000000
[    0.000000]   Normal zone: 14329 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 1033735 pages, LIFO batch:31
[    0.000000] On node 2 totalpages: 786432
[    0.000000] free_area_init_node: node 2, pgdat 40698280, node_mem_map 4080000000
[    0.000000]   Normal zone: 10752 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 775680 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 10 pages/cpu @00000000425ed000 s8512 r8192 d24256 u40960
[    0.000000] pcpu-alloc: s8512 r8192 d24256 u40960 alloc=10*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2067975
[    0.000000] Kernel command line: root=/dev/sda4 console=ttyB0 nosmp palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 8234944k/8386560k available (4492k kernel code, 151616k reserved, 1827k data, 340k init)
[    0.000000] virtual kernel memory layout:
[    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.000000]     memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
[    0.000000]       .init : 0x0000000040830000 - 0x0000000040885000   ( 340 kB)
[    0.000000]       .data : 0x0000000040563090 - 0x000000004072bcd0   (1827 kB)
[    0.000000]       .text : 0x0000000040100000 - 0x0000000040563090   (4492 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.060000] Calibrating delay loop... 1993.93 BogoMIPS (lpj=9969664)
[    0.190000] pid_max: default: 32768 minimum: 301
[    0.250000] Mount-cache hash table entries: 256
[    0.310000] SMP mode deactivated.
[    0.360000] Brought up 1 CPUs
[    0.400000] NET: Registered protocol family 16
[    0.460000] EISA bus registered
[    0.500000] Searching for devices...
[    0.660000] Found devices:
[    0.700000] 1. Unknown machine at 0xfffffffffe780000 [128] { 0, 0x0, 0x88b, 0x00004 }
[    0.800000] 2. Unknown machine at 0xfffffffffe781000 [129] { 0, 0x0, 0x88b, 0x00004 }
[    0.900000] 3. Unknown machine at 0xfffffffffe798000 [152] { 0, 0x0, 0x88b, 0x00004 }
[    1.010000] 4. Unknown machine at 0xfffffffffe799000 [153] { 0, 0x0, 0x88b, 0x00004 }
[    1.110000] 5. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[    1.200000] 6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    1.310000] 7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    1.420000] 8. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    1.530000] 9. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    1.630000] 10. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[    1.750000] 11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    1.860000] 12. unknown device at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x077, 0x000ad }
[    1.960000] 13. unknown device at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x077, 0x000ad }
[    2.060000] Enabling PDC_PAT chassis codes support v0.05
[    2.590000] CPU(s): 4 x PA8800 (Mako) at 1000.000000 MHz
[    2.670000] Whole cache flush 2241342 cycles, flushing 7884800 bytes 950153 cycles
[    2.670000] Setting cache flush threshold to 11bcf00 (1 CPUs online)
[    2.880000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    2.980000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    3.090000] LBA 0:0: PCI host bridge to bus 0000:00
[    3.160000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    3.240000] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
[    3.390000] pci_bus 0000:00: root bus resource [mem 0xffffff0000000000-0xffffff0fffffffff]
[    3.510000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    3.610000] LBA 0:2: PCI host bridge to bus 0000:40
[    3.680000] pci_bus 0000:40: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    3.800000] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    3.950000] pci_bus 0000:40: root bus resource [mem 0xffffff2000000000-0xffffff2fffffffff]
[    4.060000] pci 0000:40:01.0: [1000:0030] type 00 class 0x010000
[    4.060000] pci 0000:40:01.0: reg 10: [io  0x14100-0x141ff]
[    4.060000] pci 0000:40:01.0: reg 14: [mem 0xffffffffa0260000-0xffffffffa027ffff 64bit]
[    4.060000] pci 0000:40:01.0: reg 1c: [mem 0xffffffffa0240000-0xffffffffa025ffff 64bit]
[    4.060000] pci 0000:40:01.0: reg 30: [mem 0xffffffffa0100000-0xffffffffa01fffff pref]
[    4.060000] pci 0000:40:01.0: supports D1 D2
[    4.060000] pci 0000:40:01.1: [1000:0030] type 00 class 0x010000
[    4.060000] pci 0000:40:01.1: reg 10: [io  0x14000-0x140ff]
[    4.060000] pci 0000:40:01.1: reg 14: [mem 0xffffffffa0220000-0xffffffffa023ffff 64bit]
[    4.060000] pci 0000:40:01.1: reg 1c: [mem 0xffffffffa0200000-0xffffffffa021ffff 64bit]
[    4.060000] pci 0000:40:01.1: reg 30: [mem 0xffffffffa0000000-0xffffffffa00fffff pref]
[    4.060000] pci 0000:40:01.1: supports D1 D2
[    4.070000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    4.170000] LBA 0:3: PCI host bridge to bus 0000:60
[    4.240000] pci_bus 0000:60: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    4.360000] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    4.510000] pci_bus 0000:60: root bus resource [mem 0xffffff3000000000-0xffffff3fffffffff]
[    4.620000] pci 0000:60:01.0: [1033:0035] type 00 class 0x0c0310
[    4.620000] pci 0000:60:01.0: reg 10: [mem 0xffffffffb00a3000-0xffffffffb00a3fff]
[    4.620000] pci 0000:60:01.0: supports D1 D2
[    4.620000] pci 0000:60:01.0: PME# supported from D0 D1 D2 D3hot
[    4.620000] pci 0000:60:01.1: [1033:0035] type 00 class 0x0c0310
[    4.620000] pci 0000:60:01.1: reg 10: [mem 0xffffffffb00a2000-0xffffffffb00a2fff]
[    4.620000] pci 0000:60:01.1: supports D1 D2
[    4.620000] pci 0000:60:01.1: PME# supported from D0 D1 D2 D3hot
[    4.620000] pci 0000:60:01.2: [1033:00e0] type 00 class 0x0c0320
[    4.620000] pci 0000:60:01.2: reg 10: [mem 0xffffffffb00a1000-0xffffffffb00a10ff]
[    4.620000] pci 0000:60:01.2: supports D1 D2
[    4.620000] pci 0000:60:01.2: PME# supported from D0 D1 D2 D3hot
[    4.620000] pci 0000:60:02.0: [1095:0680] type 00 class 0x010185
[    4.620000] pci 0000:60:02.0: reg 10: [io  0x26158-0x2615f]
[    4.620000] pci 0000:60:02.0: reg 14: [io  0x26164-0x26167]
[    4.620000] pci 0000:60:02.0: reg 18: [io  0x26150-0x26157]
[    4.620000] pci 0000:60:02.0: reg 1c: [io  0x26160-0x26163]
[    4.620000] pci 0000:60:02.0: reg 20: [io  0x26140-0x2614f]
[    4.620000] pci 0000:60:02.0: reg 24: [mem 0xffffffffb00a0000-0xffffffffb00a00ff]
[    4.620000] pci 0000:60:02.0: reg 30: [mem 0xffffffffb0000000-0xffffffffb007ffff pref]
[    4.620000] pci 0000:60:02.0: supports D1 D2
[    4.620000] pci 0000:60:03.0: [8086:100e] type 00 class 0x020000
[    4.620000] pci 0000:60:03.0: reg 10: [mem 0xffffffffb0080000-0xffffffffb009ffff]
[    4.620000] pci 0000:60:03.0: reg 18: [io  0x26100-0x2613f]
[    4.620000] pci 0000:60:03.0: PME# supported from D0 D3hot D3cold
[    4.620000] pci 0000:60:05.0: [13f6:0111] type 00 class 0x040100
[    4.620000] pci 0000:60:05.0: reg 10: [io  0x26000-0x260ff]
[    4.620000] pci 0000:60:05.0: supports D1 D2
[    4.630000] Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000
[    4.740000] LBA 0:4: PCI host bridge to bus 0000:80
[    4.800000] pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    4.920000] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffcfffffff] (bus address [0xc0000000-0xcfffffff])
[    5.070000] pci_bus 0000:80: root bus resource [mem 0xffffff4000000000-0xffffff4fffffffff]
[    5.180000] pci 0000:80:00.0: [1002:4e47] type 00 class 0x030000
[    5.180000] pci 0000:80:00.0: reg 10: [mem 0xffffffffc8000000-0xffffffffcfffffff pref]
[    5.180000] pci 0000:80:00.0: reg 14: [io  0x3c000-0x3c0ff]
[    5.180000] pci 0000:80:00.0: reg 18: [mem 0xd0030000-0xd003ffff]
[    5.180000] pci 0000:80:00.0: reg 30: [mem 0xd0000000-0xd001ffff pref]
[    5.180000] pci 0000:80:00.0: supports D1 D2
[    5.180000] pci 0000:80:00.1: [1002:4e67] type 00 class 0x038000
[    5.180000] pci 0000:80:00.1: reg 10: [mem 0xffffffffc0000000-0xffffffffc7ffffff pref]
[    5.180000] pci 0000:80:00.1: reg 14: [mem 0xd0020000-0xd002ffff]
[    5.180000] pci 0000:80:00.1: supports D1 D2
[    5.180000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0030000-0xd003ffff]
[    5.290000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0000000-0xd001ffff pref]
[    5.410000] pci 0000:80:00.1: no compatible bridge window for [mem 0xd0020000-0xd002ffff]
[    5.510000] iosapic: no IRTE for 0000:80:00.1 (IRQ not connected?)
[    5.510000] pci 0000:80:00.0: BAR 6: assigned [mem 0xffffff4000000000-0xffffff400001ffff pref]
[    5.630000] pci 0000:80:00.0: BAR 2: assigned [mem 0xffffff4000020000-0xffffff400002ffff]
[    5.730000] pci 0000:80:00.1: BAR 1: assigned [mem 0xffffff4000030000-0xffffff400003ffff]
[    5.990000] powersw: Soft power switch at 0xfffffff0f042e278 enabled.
[    6.080000] bio: create slab <bio-0> at 0
[    6.130000] vgaarb: device added: PCI:0000:80:00.0,decodes=io+mem,owns=io+mem,locks=none
[    6.240000] vgaarb: loaded
[    6.280000] vgaarb: bridge control possible 0000:80:00.0
[    6.350000] SCSI subsystem initialized
[    6.400000] usbcore: registered new interface driver usbfs
[    6.470000] usbcore: registered new interface driver hub
[    6.540000] usbcore: registered new device driver usb
[    6.610000] Switching to clocksource cr16
[    6.660000] NET: Registered protocol family 2
[    6.720000] IP route cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    6.820000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    6.930000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    7.020000] TCP: Hash tables configured (established 262144 bind 65536)
[    7.100000] TCP: reno registered
[    7.150000] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    7.230000] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    7.310000] NET: Registered protocol family 1
[    7.370000] PCI: CLS 64 bytes
[    7.390000] The PDC console driver is still registered, removing CON_BOOT flag
[    7.490000] Chassis warnings not supported.
[    7.540000] Performance monitoring counters enabled for Unknown machine
[    7.550000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    7.630000] msgmni has been set to 16083
[    7.680000] io scheduler noop registered
[    7.730000] io scheduler cfq registered (default)
[    7.800000] PDC Stable Storage facility v0.30
[    7.900000] STI GSC/PCI core graphics driver Version 0.9a
[    8.010000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    8.100000] Linux agpgart interface v0.103
[    8.150000] loop: module loaded
[    8.190000] Uniform Multi-Platform E-IDE driver
[    8.260000] siimage 0000:60:02.0: IDE controller (0x1095:0x0680 rev 0x02)
[    8.350000] siimage 0000:60:02.0: BASE CLOCK == 133
[    8.420000] siimage 0000:60:02.0: 100% native mode on irq 71
[    8.490000]     ide0: MMIO-DMA
[    8.530000]     ide1: MMIO-DMA
[    8.570000] Probing IDE interface ide0...
[    9.180000] Probing IDE interface ide1...
[    9.780000] ide0 at 0x3e080-0x3e087,0x3e08a on irq 71
[    9.840000] ide1 at 0x3e0c0-0x3e0c7,0x3e0ca on irq 71
[    9.910000] ide-gd driver 1.18
[    9.950000] ide-cd driver 5.00
[    9.990000] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[   10.080000] e1000: Copyright (c) 1999-2006 Intel Corporation.
[   10.470000] e1000 0000:60:03.0: eth0: (PCI:33MHz:32-bit) 00:13:21:1a:34:3d
[   10.570000] e1000 0000:60:03.0: eth0: Intel(R) PRO/1000 Network Connection
[   10.660000] Fusion MPT base driver 3.04.20
[   10.710000] Copyright (c) 1999-2008 LSI Corporation
[   10.770000] Fusion MPT SPI Host driver 3.04.20
[   10.840000] mptbase: ioc0: Initiating bringup
[   12.120000] ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}
[   13.390000] scsi0 : ioc0: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=66
[   14.300000] scsi 0:0:0:0: Direct-Access     FUJITSU  MAW3073NP        5803 PQ: 0 ANSI: 3
[   14.400000] scsi target0:0:0: Beginning Domain Validation
[   14.490000] scsi target0:0:0: Ending Domain Validation
[   14.560000] scsi target0:0:0: FAST-160 WIDE SCSI 320.0 MB/s DT IU RTI WRFLOW PCOMP (6.25 ns, offset 127)
[   14.690000] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   14.760000] sd 0:0:0:0: [sda] 143374650 512-byte logical blocks: (73.4 GB/68.3 GiB)
[   14.860000] scsi 0:0:1:0: Direct-Access     FUJITSU  MAW3073NP        5803 PQ: 0 ANSI: 3
[   14.970000] scsi target0:0:1: Beginning Domain Validation
[   15.040000] sd 0:0:0:0: [sda] Write Protect is off
[   15.100000] sd 0:0:0:0: [sda] Mode Sense: b3 00 00 08
[   15.110000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   15.240000]  sda: sda1 sda2 sda3 sda4
[   15.290000] scsi target0:0:1: Ending Domain Validation
[   15.360000] scsi target0:0:1: FAST-160 WIDE SCSI 320.0 MB/s DT IU RTI WRFLOW PCOMP (6.25 ns, offset 127)
[   15.490000] sd 0:0:0:0: [sda] Attached SCSI disk
[   15.550000] sd 0:0:1:0: Attached scsi generic sg1 type 0
[   15.620000] sd 0:0:1:0: [sdb] 143374650 512-byte logical blocks: (73.4 GB/68.3 GiB)
[   16.120000] sd 0:0:1:0: [sdb] Write Protect is off
[   16.180000] sd 0:0:1:0: [sdb] Mode Sense: b3 00 00 08
[   17.120000] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   18.880000] mptbase: ioc1: Initiating bringup
[   20.130000] ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}
[   21.400000]  sdb: unknown partition table
[   21.460000] scsi1 : ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=67
[   22.400000] sd 0:0:1:0: [sdb] Attached SCSI disk
[   26.120000] Fusion MPT misc device (ioctl) driver 3.04.20
[   26.190000] mptctl: Registered with Fusion MPT base driver
[   26.260000] mptctl: /dev/mptctl @ (major,minor=10,220)
[   26.330000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   26.410000] ehci_hcd: block sizes: qh 112 qtd 96 itd 192 sitd 96
[   26.420000] ehci_hcd 0000:60:01.2: EHCI Host Controller
[   26.490000] ehci_hcd 0000:60:01.2: new USB bus registered, assigned bus number 1
[   26.590000] ehci_hcd 0000:60:01.2: reset hcs_params 0x2395 dbg=0 cc=2 pcc=3 ports=5
[   26.590000] ehci_hcd 0000:60:01.2: reset portroute 1 0 1 0 0 
[   26.590000] ehci_hcd 0000:60:01.2: reset hcc_params 0002 thresh 0 uframes 256/512/1024
[   26.590000] ehci_hcd 0000:60:01.2: reset command 0080002 (park)=0 ithresh=8 period=1024 Reset HALT
[   26.590000] ehci_hcd 0000:60:01.2: ...powerup ports...
[   26.620000] ehci_hcd 0000:60:01.2: MWI active
[   26.620000] ehci_hcd 0000:60:01.2: supports USB remote wakeup
[   26.620000] ehci_hcd 0000:60:01.2: irq 70, io mem 0xffffffffb00a1000
[   26.700000] ehci_hcd 0000:60:01.2: init command 0010005 (park)=0 ithresh=1 period=512 RUN
[   26.720000] ehci_hcd 0000:60:01.2: USB 2.0 started, EHCI 0.95
[   26.790000] usb usb1: default language 0x0409
[   26.790000] usb usb1: udev 1, busnum 1, minor = 0
[   26.790000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[   26.880000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   26.980000] usb usb1: Product: EHCI Host Controller
[   27.040000] usb usb1: Manufacturer: Linux 3.4.0-rc7+ ehci_hcd
[   27.120000] usb usb1: SerialNumber: 0000:60:01.2
[   27.180000] usb usb1: usb_probe_device
[   27.180000] usb usb1: configuration #1 chosen from 1 choice
[   27.180000] usb usb1: adding 1-0:1.0 (config #1, interface 0)
[   27.180000] hub 1-0:1.0: usb_probe_interface
[   27.180000] hub 1-0:1.0: usb_probe_interface - got id
[   27.180000] hub 1-0:1.0: USB hub found
[   27.230000] hub 1-0:1.0: 5 ports detected
[   27.280000] hub 1-0:1.0: standalone hub
[   27.280000] hub 1-0:1.0: individual port power switching
[   27.280000] hub 1-0:1.0: individual port over-current protection
[   27.280000] hub 1-0:1.0: power on to power good time: 20ms
[   27.280000] hub 1-0:1.0: local power source is good
[   27.280000] hub 1-0:1.0: enabling power on all ports
[   27.280000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   27.360000] ohci_hcd: block sizes: ed 80 td 96
[   27.370000] ohci_hcd 0000:60:01.0: OHCI Host Controller
[   27.440000] ohci_hcd 0000:60:01.0: new USB bus registered, assigned bus number 2
[   27.530000] ohci_hcd 0000:60:01.0: enabled NEC chipset lost interrupt quirk
[   27.530000] ohci_hcd 0000:60:01.0: created debug files
[   27.530000] ohci_hcd 0000:60:01.0: supports USB remote wakeup
[   27.530000] ohci_hcd 0000:60:01.0: irq 68, io mem 0xffffffffb00a3000
[   27.620000] hub 1-0:1.0: state 7 ports 5 chg 0000 evt 0000
[   28.190000] ohci_hcd 0000:60:01.0: OHCI controller state
[   28.190000] ohci_hcd 0000:60:01.0: OHCI 1.0, NO legacy support registers, rh state running
[   28.190000] ohci_hcd 0000:60:01.0: control 0x083 HCFS=operational CBSR=3
[   28.190000] ohci_hcd 0000:60:01.0: cmdstatus 0x00000 SOC=0
[   28.190000] ohci_hcd 0000:60:01.0: intrstatus 0x00000004 SF
[   28.190000] ohci_hcd 0000:60:01.0: intrenable 0x8000005a MIE RHSC UE RD WDH
[   28.190000] ohci_hcd 0000:60:01.0: hcca frame #01ff
[   28.190000] ohci_hcd 0000:60:01.0: roothub.a ff000203 POTPGT=255 NPS NDP=3(3)
[   28.190000] ohci_hcd 0000:60:01.0: roothub.b 00000000 PPCM=0000 DR=0000
[   28.190000] ohci_hcd 0000:60:01.0: roothub.status 00008000 DRWE
[   28.190000] ohci_hcd 0000:60:01.0: roothub.portstatus [0] 0x00000100 PPS
[   28.190000] ohci_hcd 0000:60:01.0: roothub.portstatus [1] 0x00000100 PPS
[   28.190000] ohci_hcd 0000:60:01.0: roothub.portstatus [2] 0x00000100 PPS
[   28.190000] usb usb2: default language 0x0409
[   28.190000] usb usb2: udev 1, busnum 2, minor = 128
[   28.190000] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[   28.270000] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   28.370000] usb usb2: Product: OHCI Host Controller
[   28.430000] usb usb2: Manufacturer: Linux 3.4.0-rc7+ ohci_hcd
[   28.510000] usb usb2: SerialNumber: 0000:60:01.0
[   28.570000] usb usb2: usb_probe_device
[   28.570000] usb usb2: configuration #1 chosen from 1 choice
[   28.570000] usb usb2: adding 2-0:1.0 (config #1, interface 0)
[   28.570000] hub 2-0:1.0: usb_probe_interface
[   28.570000] hub 2-0:1.0: usb_probe_interface - got id
[   28.570000] hub 2-0:1.0: USB hub found
[   28.620000] hub 2-0:1.0: 3 ports detected
[   28.670000] hub 2-0:1.0: standalone hub
[   28.670000] hub 2-0:1.0: no power switching (usb 1.0)
[   28.670000] hub 2-0:1.0: global over-current protection
[   28.670000] hub 2-0:1.0: power on to power good time: 510ms
[   28.670000] hub 2-0:1.0: local power source is good
[   28.670000] hub 2-0:1.0: no over-current condition exists
[   28.670000] hub 2-0:1.0: trying to enable port power on non-switchable hub
[   28.680000] ohci_hcd 0000:60:01.1: OHCI Host Controller
[   28.750000] ohci_hcd 0000:60:01.1: new USB bus registered, assigned bus number 3
[   28.850000] ohci_hcd 0000:60:01.1: enabled NEC chipset lost interrupt quirk
[   28.850000] ohci_hcd 0000:60:01.1: created debug files
[   28.850000] ohci_hcd 0000:60:01.1: supports USB remote wakeup
[   28.850000] ohci_hcd 0000:60:01.1: irq 69, io mem 0xffffffffb00a2000
[   29.500000] ohci_hcd 0000:60:01.1: OHCI controller state
[   29.500000] ohci_hcd 0000:60:01.1: OHCI 1.0, NO legacy support registers, rh state running
[   29.500000] ohci_hcd 0000:60:01.1: control 0x083 HCFS=operational CBSR=3
[   29.500000] ohci_hcd 0000:60:01.1: cmdstatus 0x00000 SOC=0
[   29.500000] ohci_hcd 0000:60:01.1: intrstatus 0x00000004 SF
[   29.500000] ohci_hcd 0000:60:01.1: intrenable 0x8000005a MIE RHSC UE RD WDH
[   29.500000] ohci_hcd 0000:60:01.1: hcca frame #01ff
[   29.500000] ohci_hcd 0000:60:01.1: roothub.a ff000202 POTPGT=255 NPS NDP=2(2)
[   29.500000] ohci_hcd 0000:60:01.1: roothub.b 00000000 PPCM=0000 DR=0000
[   29.500000] ohci_hcd 0000:60:01.1: roothub.status 00008000 DRWE
[   29.500000] ohci_hcd 0000:60:01.1: roothub.portstatus [0] 0x00000100 PPS
[   29.500000] ohci_hcd 0000:60:01.1: roothub.portstatus [1] 0x00000100 PPS
[   29.500000] usb usb3: default language 0x0409
[   29.500000] usb usb3: udev 1, busnum 3, minor = 256
[   29.500000] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[   29.580000] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   29.680000] usb usb3: Product: OHCI Host Controller
[   29.740000] usb usb3: Manufacturer: Linux 3.4.0-rc7+ ohci_hcd
[   29.820000] usb usb3: SerialNumber: 0000:60:01.1
[   29.880000] hub 2-0:1.0: state 7 ports 3 chg 0000 evt 0000
[   29.880000] usb usb3: usb_probe_device
[   29.880000] usb usb3: configuration #1 chosen from 1 choice
[   29.880000] usb usb3: adding 3-0:1.0 (config #1, interface 0)
[   29.880000] hub 3-0:1.0: usb_probe_interface
[   29.880000] hub 3-0:1.0: usb_probe_interface - got id
[   29.880000] hub 3-0:1.0: USB hub found
[   29.930000] hub 3-0:1.0: 2 ports detected
[   29.980000] hub 3-0:1.0: standalone hub
[   29.980000] hub 3-0:1.0: no power switching (usb 1.0)
[   29.980000] hub 3-0:1.0: global over-current protection
[   29.980000] hub 3-0:1.0: power on to power good time: 510ms
[   29.980000] hub 3-0:1.0: local power source is good
[   29.980000] hub 3-0:1.0: no over-current condition exists
[   29.980000] hub 3-0:1.0: trying to enable port power on non-switchable hub
[   29.980000] mousedev: PS/2 mouse device common for all mice
[   30.070000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   30.160000] usbcore: registered new interface driver usbhid
[   30.240000] usbhid: USB HID core driver
[   30.290000] TCP: cubic registered
[   30.330000] NET: Registered protocol family 10
[   30.390000] NET: Registered protocol family 17
[   30.450000] Registering the dns_resolver key type
[   30.520000] rtc-generic rtc-generic: setting system clock to 2012-05-13 17:30:19 UTC (1336930219)
[   30.630000] md: Waiting for all devices to be available before autodetect
[   30.720000] md: If you don't use raid, use raid=noautodetect
[   30.800000] md: Autodetecting RAID arrays.
[   30.850000] md: Scanned 0 and added 0 devices.
[   30.910000] md: autorun ...
[   30.950000] md: ... autorun DONE.
[   30.990000] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[   31.000000] EXT3-fs (sda4): error: couldn't mount because of unsupported optional features (240)
[   31.130000] EXT2-fs (sda4): error: couldn't mount because of unsupported optional features (240)
[   31.360000] EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)
[   31.460000] VFS: Mounted root (ext4 filesystem) readonly on device 8:4.
[   31.640000] Freeing unused kernel memory: 340k freed
[   35.610000] udevd[1038]: starting version 171
[   41.100000] EXT4-fs (sda4): re-mounted. Opts: nobarrier
[   51.060000] Adding 8787548k swap on /dev/sda3.  Priority:-1 extents:1 across:8787548k 
[   52.990000] e1000: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
[   52.990000] ADDRCONF(NETDEV_UP): eth0: link is not ready
[   52.990000] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   63.090000] eth0: no IPv6 routers present
