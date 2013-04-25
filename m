From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status
Date: Thu, 25 Apr 2013 21:21:39 +0200 (MEST)
Message-ID: <201304251921.r3PJLd1d014087@arbas.nms.ulrich-teichert.org>
References: <1366917527.6167.1.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1366917527.6167.1.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

>That one looks very much like an interrupt routing problem ... the full
>log might give more diagnostic information.

No problem:

[    0.000000] Linux version 3.6.11-livecd64 (root@terminator) (gcc version 4.6.3 (Gentoo 4.6.3 p1.9) ) #1 SMP Thu Jan 24 16:09:18 UTC 2013
[    0.000000] unwind_init: start = 0x406ad000, end = 0x406e85e0, entries = 15198
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 000089b0 00000491 00000000 00000002 56fa29f07c511780 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000401
[    0.000000] CPUID vers 20 rev 10 (0x0000028a)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 8190 MB
[    0.000000] initrd: 7fda6000-7ffee9d0
[    0.000000] initrd: reserving 3fda6000-3ffee9d0 (mem_max 1ffe00000)
[    0.000000] On node 0 totalpages: 262144
[    0.000000] free_area_init_node: node 0, pgdat 40706780, node_mem_map 41865000
[    0.000000]   Normal zone: 3584 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 258560 pages, LIFO batch:31
[    0.000000] On node 1 totalpages: 1048064
[    0.000000] free_area_init_node: node 1, pgdat 40707540, node_mem_map 140000000
[    0.000000]   Normal zone: 14329 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 1033735 pages, LIFO batch:31
[    0.000000] On node 2 totalpages: 786432
[    0.000000] free_area_init_node: node 2, pgdat 40708300, node_mem_map 4080000000
[    0.000000]   Normal zone: 10752 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 775680 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 10 pages/cpu @000000004266e000 s9728 r8192 d23040 u40960
[    0.000000] pcpu-alloc: s9728 r8192 d23040 u40960 alloc=10*4096
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
[    0.000000] pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
[    0.000000] pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2067975
[    0.000000] Kernel command line:  root=/dev/ram0 init=/linuxrc cdroot dokeymap looptype=squashfs loop=/image.squashfs console=ttyB0 video=radeonfb:off palo_kernel=0/livecd
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 8230968k/8386560k available (4846k kernel code, 155592k reserved, 1929k data, 376k init)
[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.060000] Calibrating delay loop... 1988.60 BogoMIPS (lpj=3977216)
[    0.156000] pid_max: default: 32768 minimum: 301
[    0.216000] Mount-cache hash table entries: 256
[    0.276000] Brought up 1 CPUs
[    0.316000] xor: measuring software checksum speed
[    0.420000]    8regs     :  4697.000 MB/sec
[    0.512000]    8regs_prefetch:  3504.000 MB/sec
[    0.608000]    32regs    :  3852.000 MB/sec
[    0.700000]    32regs_prefetch:  3552.000 MB/sec
[    0.760000] xor: using function: 8regs (4697.000 MB/sec)
[    0.828000] NET: Registered protocol family 16
[    0.888000] EISA bus registered
[    0.928000] Searching for devices...
[    1.080000] Found devices:
[    1.116000] 1. Crestone Peak Mako+ Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x89b, 0x00004 }
[    1.232000] 2. Crestone Peak Mako+ Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x89b, 0x00004 }
[    1.344000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[    1.436000] 4. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    1.544000] 5. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    1.652000] 6. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    1.760000] 7. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    1.868000] 8. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[    1.980000] 9. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    2.088000] 10. unknown device at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x076, 0x000ad }
[    2.192000] 11. unknown device at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
[    2.296000] Enabling PDC_PAT chassis codes support v0.05
[    3.192000] Releasing cpu 1 now, hpa=fffffffffe781000
[    3.616000] FP[1] enabled: Rev 1 Model 20
[    3.620000] genirq: Flags mismatch irq 64. 00015620 (timer) vs. 00015620 (timer)
[    3.768000] genirq: Flags mismatch irq 65. 00000420 (IPI) vs. 00000420 (IPI)
[    3.876000] CPU(s): 2 x PA8900 (Shortfin) at 1000.000000 MHz
[    3.960000] Whole cache flush 8506953 cycles, flushing 8413184 bytes 1019328 cycles
[    3.960000] Setting cache flush threshold to 4000000 (2 CPUs online)
[    4.192000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    4.408000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    4.552000] LBA 0:0: PCI host bridge to bus 0000:00
[    4.616000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    4.696000] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
[    4.848000] pci_bus 0000:00: root bus resource [mem 0xffffff0000000000-0xffffff0fffffffff]
[    4.960000] pci_bus 0000:00: busn_res: [bus 00-07] is inserted under domain [bus 00-ff]
[    4.960000] pci_bus 0000:00: root bus resource [bus 00-07]
[    5.056000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    5.200000] LBA 0:2: PCI host bridge to bus 0000:40
[    5.264000] pci_bus 0000:40: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    5.384000] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    5.536000] pci_bus 0000:40: root bus resource [mem 0xffffff2000000000-0xffffff2fffffffff]
[    5.644000] pci_bus 0000:40: busn_res: [bus 40-47] is inserted under domain [bus 00-ff]
[    5.644000] pci_bus 0000:40: root bus resource [bus 40-47]
[    5.716000] pci 0000:40:01.0: [1000:0030] type 00 class 0x010000
[    5.716000] pci 0000:40:01.0: reg 10: [io  0x14100-0x141ff]
[    5.716000] pci 0000:40:01.0: reg 14: [mem 0xffffffffa0260000-0xffffffffa027ffff 64bit]
[    5.716000] pci 0000:40:01.0: reg 1c: [mem 0xffffffffa0240000-0xffffffffa025ffff 64bit]
[    5.716000] pci 0000:40:01.0: reg 30: [mem 0xffffffffa0100000-0xffffffffa01fffff pref]
[    5.716000] pci 0000:40:01.0: supports D1 D2
[    5.716000] pci 0000:40:01.1: [1000:0030] type 00 class 0x010000
[    5.716000] pci 0000:40:01.1: reg 10: [io  0x14000-0x140ff]
[    5.716000] pci 0000:40:01.1: reg 14: [mem 0xffffffffa0220000-0xffffffffa023ffff 64bit]
[    5.716000] pci 0000:40:01.1: reg 1c: [mem 0xffffffffa0200000-0xffffffffa021ffff 64bit]
[    5.716000] pci 0000:40:01.1: reg 30: [mem 0xffffffffa0000000-0xffffffffa00fffff pref]
[    5.716000] pci 0000:40:01.1: supports D1 D2
[    5.740000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    5.888000] LBA 0:3: PCI host bridge to bus 0000:60
[    5.952000] pci_bus 0000:60: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    6.068000] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    6.220000] pci_bus 0000:60: root bus resource [mem 0xffffff3000000000-0xffffff3fffffffff]
[    6.332000] pci_bus 0000:60: busn_res: [bus 60-67] is inserted under domain [bus 00-ff]
[    6.332000] pci_bus 0000:60: root bus resource [bus 60-67]
[    6.404000] pci 0000:60:01.0: [1033:0035] type 00 class 0x0c0310
[    6.404000] pci 0000:60:01.0: reg 10: [mem 0xffffffffb00a3000-0xffffffffb00a3fff]
[    6.404000] pci 0000:60:01.0: supports D1 D2
[    6.404000] pci 0000:60:01.0: PME# supported from D0 D1 D2 D3hot
[    6.404000] pci 0000:60:01.1: [1033:0035] type 00 class 0x0c0310
[    6.404000] pci 0000:60:01.1: reg 10: [mem 0xffffffffb00a2000-0xffffffffb00a2fff]
[    6.404000] pci 0000:60:01.1: supports D1 D2
[    6.404000] pci 0000:60:01.1: PME# supported from D0 D1 D2 D3hot
[    6.404000] pci 0000:60:01.2: [1033:00e0] type 00 class 0x0c0320
[    6.404000] pci 0000:60:01.2: reg 10: [mem 0xffffffffb00a1000-0xffffffffb00a10ff]
[    6.404000] pci 0000:60:01.2: supports D1 D2
[    6.404000] pci 0000:60:01.2: PME# supported from D0 D1 D2 D3hot
[    6.404000] pci 0000:60:02.0: [1095:0680] type 00 class 0x010185
[    6.404000] pci 0000:60:02.0: reg 10: [io  0x26058-0x2605f]
[    6.404000] pci 0000:60:02.0: reg 14: [io  0x26064-0x26067]
[    6.404000] pci 0000:60:02.0: reg 18: [io  0x26050-0x26057]
[    6.404000] pci 0000:60:02.0: reg 1c: [io  0x26060-0x26063]
[    6.404000] pci 0000:60:02.0: reg 20: [io  0x26040-0x2604f]
[    6.404000] pci 0000:60:02.0: reg 24: [mem 0xffffffffb00a0000-0xffffffffb00a00ff]
[    6.404000] pci 0000:60:02.0: reg 30: [mem 0xffffffffb0000000-0xffffffffb007ffff pref]
[    6.404000] pci 0000:60:02.0: supports D1 D2
[    6.404000] pci 0000:60:03.0: [8086:100e] type 00 class 0x020000
[    6.404000] pci 0000:60:03.0: reg 10: [mem 0xffffffffb0080000-0xffffffffb009ffff]
[    6.404000] pci 0000:60:03.0: reg 18: [io  0x26000-0x2603f]
[    6.404000] pci 0000:60:03.0: PME# supported from D0 D3hot D3cold
[    6.428000] Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000
[    6.576000] LBA 0:4: PCI host bridge to bus 0000:80
[    6.644000] pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    6.760000] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffcfffffff] (bus address [0xc0000000-0xcfffffff])
[    6.912000] pci_bus 0000:80: root bus resource [mem 0xffffff4000000000-0xffffff4fffffffff]
[    7.024000] pci_bus 0000:80: busn_res: [bus 80-87] is inserted under domain [bus 00-ff]
[    7.024000] pci_bus 0000:80: root bus resource [bus 80-87]
[    7.096000] pci 0000:80:00.0: [1002:4a4d] type 00 class 0x030000
[    7.096000] pci 0000:80:00.0: reg 10: [mem 0xffffffffc8000000-0xffffffffcfffffff pref]
[    7.096000] pci 0000:80:00.0: reg 14: [io  0x3c000-0x3c0ff]
[    7.096000] pci 0000:80:00.0: reg 18: [mem 0xd0030000-0xd003ffff]
[    7.096000] pci 0000:80:00.0: reg 30: [mem 0xd0000000-0xd001ffff pref]
[    7.096000] pci 0000:80:00.0: supports D1 D2
[    7.096000] pci 0000:80:00.1: [1002:4a6d] type 00 class 0x038000
[    7.096000] pci 0000:80:00.1: reg 10: [mem 0xffffffffc0000000-0xffffffffc7ffffff pref]
[    7.096000] pci 0000:80:00.1: reg 14: [mem 0xd0020000-0xd002ffff]
[    7.096000] pci 0000:80:00.1: supports D1 D2
[    7.096000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0030000-0xd003ffff]
[    7.204000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0000000-0xd001ffff pref]
[    7.316000] pci 0000:80:00.1: no compatible bridge window for [mem 0xd0020000-0xd002ffff]
[    7.424000] iosapic: no IRTE for 0000:80:00.1 (IRQ not connected?)
[    7.504000] pci 0000:80:00.0: BAR 6: assigned [mem 0xffffff4000000000-0xffffff400001ffff pref]
[    7.620000] pci 0000:80:00.0: BAR 2: assigned [mem 0xffffff4000020000-0xffffff400002ffff]
[    7.728000] pci 0000:80:00.1: BAR 1: assigned [mem 0xffffff4000030000-0xffffff400003ffff]
[    8.240000] powersw: Soft power switch at 0xfffffff0f042e278 enabled.
[    8.336000] bio: create slab <bio-0> at 0
[    8.456000] raid6: int64x1    987 MB/s
[    8.572000] raid6: int64x2   1207 MB/s
[    8.688000] raid6: int64x4   1342 MB/s
[    8.804000] raid6: int64x8   1269 MB/s
[    8.852000] raid6: using algorithm int64x4 (1342 MB/s)
[    8.920000] raid6: using intx1 recovery algorithm
[    8.980000] vgaarb: device added: PCI:0000:80:00.0,decodes=io+mem,owns=io+mem,locks=none
[    9.088000] vgaarb: loaded
[    9.124000] vgaarb: bridge control possible 0000:80:00.0
[    9.196000] SCSI subsystem initialized
[    9.244000] usbcore: registered new interface driver usbfs
[    9.316000] usbcore: registered new interface driver hub
[    9.388000] usbcore: registered new device driver usb
[    9.460000] NET: Registered protocol family 2
[    9.520000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    9.620000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    9.712000] TCP: Hash tables configured (established 262144 bind 65536)
[    9.800000] TCP: reno registered
[    9.840000] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    9.920000] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[   10.008000] NET: Registered protocol family 1
[   10.064000] PCI: CLS 64 bytes
[   10.140000] Unpacking initramfs...
[   11.484000] Freeing initrd memory: 2338k freed
[   11.544000] The PDC console driver is still registered, removing CON_BOOT flag
[   11.640000] Chassis warnings not supported.
[   11.696000] Performance monitoring counters enabled for Crestone Peak Mako+ Slow
[   11.804000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   11.904000] msgmni has been set to 16080
[   11.956000] io scheduler noop registered
[   12.008000] io scheduler deadline registered
[   12.068000] io scheduler cfq registered (default)
[   12.128000] STI GSC/PCI core graphics driver Version 0.9a
[   12.256000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   12.336000] Linux agpgart interface v0.103
[   12.396000] loop: module loaded
[   12.436000] Uniform Multi-Platform E-IDE driver
[   12.520000] siimage 0000:60:02.0: IDE controller (0x1095:0x0680 rev 0x02)
[   12.612000] siimage 0000:60:02.0: BASE CLOCK == 133
[   12.676000] siimage 0000:60:02.0: 100% native mode on irq 71
[   12.748000]     ide0: MMIO-DMA
[   12.788000]     ide1: MMIO-DMA
[   12.832000] Probing IDE interface ide0...
[   13.400000] Probing IDE interface ide1...
[   14.136000] hdc: HL-DT-STDVD-ROM GDR8164B, ATAPI CD/DVD-ROM drive
[   14.552000] hdc: host max PIO4 wanted PIO255(auto-tune) selected PIO4
[   14.552000] hdc: UDMA/44 mode selected
[   14.604000] ide0 at 0x60080-0x60087,0x6008a on irq 71
[   14.668000] ide1 at 0x600c0-0x600c7,0x600ca on irq 71
[   14.736000] ide-gd driver 1.18
[   14.776000] ide-cd driver 5.00
[   14.824000] ide-cd: hdc: ATAPI 48X DVD-ROM drive, 256kB Cache
[   14.900000] cdrom: Uniform CD-ROM driver Revision: 3.20
[   15.020000] Fusion MPT base driver 3.04.20
[   15.072000] Copyright (c) 1999-2008 LSI Corporation
[   15.136000] Fusion MPT SPI Host driver 3.04.20
[   15.220000] mptbase: ioc0: Initiating bringup
[   15.760000] ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}
[   16.328000] scsi0 : ioc0: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=66
[   43.872000] mptscsih: ioc0: attempting task abort! (sc=000000007f29e300)
[   43.960000] scsi 0:0:6:0: CDB: 
[   44.000000] cdb[0]=0x12: 12 00 00 00 24 00
[   54.176000] mptscsih: ioc0: WARNING - Issuing Reset from mptscsih_IssueTaskMgmt!! doorbell=0x24000000
[   55.584000] mptscsih: ioc0: task abort: SUCCESS (rv=2002) (sc=000000007f29e300)
[   55.680000] scsi target0:0:6: asynchronous
[   55.928000] mptscsih: ioc0: attempting target reset! (sc=000000007f29e300)
[   56.020000] scsi 0:0:6:0: CDB: 
[   56.060000] cdb[0]=0x12: 12 00 00 00 24 00
[   56.476000] mptscsih: ioc0: target reset: SUCCESS (sc=000000007f29e300)
[   56.812000] mptscsih: ioc0: attempting bus reset! (sc=000000007f29e300)
[   56.900000] scsi 0:0:6:0: CDB: 
[   56.944000] cdb[0]=0x12: 12 00 00 00 24 00
[   57.632000] mptscsih: ioc0: bus reset: SUCCESS (sc=000000007f29e300)
[   67.968000] mptscsih: ioc0: attempting host reset! (sc=000000007f29e300)
[   68.816000] mptscsih: ioc0: host reset: SUCCESS (sc=000000007f29e300)
[   68.900000] scsi target0:0:6: asynchronous
[   79.152000] scsi 0:0:6:0: Device offlined - not ready after error recovery
[   81.268000] mptbase: ioc1: Initiating bringup
[   81.808000] ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}
[   82.376000] scsi1 : ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=67
[   86.868000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   86.952000] ehci_hcd: block sizes: qh 104 qtd 96 itd 192 sitd 96
[   86.976000] ehci_hcd 0000:60:01.2: EHCI Host Controller
[   87.048000] ehci_hcd 0000:60:01.2: new USB bus registered, assigned bus number 1
[   87.144000] ehci_hcd 0000:60:01.2: reset hcs_params 0x2395 dbg=0 cc=2 pcc=3 ports=5
[   87.144000] ehci_hcd 0000:60:01.2: reset portroute 1 0 1 0 0 
[   87.144000] ehci_hcd 0000:60:01.2: reset hcc_params 0002 thresh 0 uframes 256/512/1024
[   87.144000] ehci_hcd 0000:60:01.2: reset command 0080002 (park)=0 ithresh=8 period=1024 Reset HALT
[   87.144000] ehci_hcd 0000:60:01.2: ...powerup ports...
[   87.168000] ehci_hcd 0000:60:01.2: MWI active
[   87.168000] ehci_hcd 0000:60:01.2: supports USB remote wakeup
[   87.168000] ehci_hcd 0000:60:01.2: irq 70, io mem 0xffffffffb00a1000
[   87.248000] ehci_hcd 0000:60:01.2: init command 0010005 (park)=0 ithresh=1 period=512 RUN
[   87.260000] ehci_hcd 0000:60:01.2: USB 2.0 started, EHCI 0.95
[   87.332000] usb usb1: default language 0x0409
[   87.332000] usb usb1: udev 1, busnum 1, minor = 0
[   87.332000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[   87.424000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   87.520000] usb usb1: Product: EHCI Host Controller
[   87.584000] usb usb1: Manufacturer: Linux 3.6.11-livecd64 ehci_hcd
[   87.664000] usb usb1: SerialNumber: 0000:60:01.2
[   87.724000] usb usb1: usb_probe_device
[   87.724000] usb usb1: configuration #1 chosen from 1 choice
[   87.724000] usb usb1: adding 1-0:1.0 (config #1, interface 0)
[   87.724000] hub 1-0:1.0: usb_probe_interface
[   87.724000] hub 1-0:1.0: usb_probe_interface - got id
[   87.724000] hub 1-0:1.0: USB hub found
[   87.776000] hub 1-0:1.0: 5 ports detected
[   87.828000] hub 1-0:1.0: standalone hub
[   87.828000] hub 1-0:1.0: individual port power switching
[   87.828000] hub 1-0:1.0: individual port over-current protection
[   87.828000] hub 1-0:1.0: power on to power good time: 20ms
[   87.828000] hub 1-0:1.0: local power source is good
[   87.828000] hub 1-0:1.0: enabling power on all ports
[   87.828000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   87.908000] ohci_hcd: block sizes: ed 80 td 96
[   87.936000] ohci_hcd 0000:60:01.0: OHCI Host Controller
[   88.004000] ohci_hcd 0000:60:01.0: new USB bus registered, assigned bus number 2
[   88.100000] ohci_hcd 0000:60:01.0: enabled NEC chipset lost interrupt quirk
[   88.100000] ohci_hcd 0000:60:01.0: created debug files
[   88.100000] ohci_hcd 0000:60:01.0: supports USB remote wakeup
[   88.100000] ohci_hcd 0000:60:01.0: irq 68, io mem 0xffffffffb00a3000
[   88.184000] hub 1-0:1.0: state 7 ports 5 chg 0000 evt 0000
[   88.748000] ohci_hcd 0000:60:01.0: OHCI controller state
[   88.748000] ohci_hcd 0000:60:01.0: OHCI 1.0, NO legacy support registers, rh state running
[   88.748000] ohci_hcd 0000:60:01.0: control 0x083 HCFS=operational CBSR=3
[   88.748000] ohci_hcd 0000:60:01.0: cmdstatus 0x00000 SOC=0
[   88.748000] ohci_hcd 0000:60:01.0: intrstatus 0x00000004 SF
[   88.748000] ohci_hcd 0000:60:01.0: intrenable 0x8000005a MIE RHSC UE RD WDH
[   88.748000] ohci_hcd 0000:60:01.0: hcca frame #01ff
[   88.748000] ohci_hcd 0000:60:01.0: roothub.a ff000203 POTPGT=255 NPS NDP=3(3)
[   88.748000] ohci_hcd 0000:60:01.0: roothub.b 00000000 PPCM=0000 DR=0000
[   88.748000] ohci_hcd 0000:60:01.0: roothub.status 00008000 DRWE
[   88.748000] ohci_hcd 0000:60:01.0: roothub.portstatus [0] 0x00000100 PPS
[   88.748000] ohci_hcd 0000:60:01.0: roothub.portstatus [1] 0x00000100 PPS
[   88.748000] ohci_hcd 0000:60:01.0: roothub.portstatus [2] 0x00000100 PPS
[   88.748000] usb usb2: default language 0x0409
[   88.748000] usb usb2: udev 1, busnum 2, minor = 128
[   88.748000] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[   88.836000] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   88.932000] usb usb2: Product: OHCI Host Controller
[   88.996000] usb usb2: Manufacturer: Linux 3.6.11-livecd64 ohci_hcd
[   89.080000] usb usb2: SerialNumber: 0000:60:01.0
[   89.140000] usb usb2: usb_probe_device
[   89.140000] usb usb2: configuration #1 chosen from 1 choice
[   89.140000] usb usb2: adding 2-0:1.0 (config #1, interface 0)
[   89.140000] hub 2-0:1.0: usb_probe_interface
[   89.140000] hub 2-0:1.0: usb_probe_interface - got id
[   89.140000] hub 2-0:1.0: USB hub found
[   89.188000] hub 2-0:1.0: 3 ports detected
[   89.244000] hub 2-0:1.0: standalone hub
[   89.244000] hub 2-0:1.0: no power switching (usb 1.0)
[   89.244000] hub 2-0:1.0: global over-current protection
[   89.244000] hub 2-0:1.0: power on to power good time: 510ms
[   89.244000] hub 2-0:1.0: local power source is good
[   89.244000] hub 2-0:1.0: no over-current condition exists
[   89.244000] hub 2-0:1.0: trying to enable port power on non-switchable hub
[   89.268000] ohci_hcd 0000:60:01.1: OHCI Host Controller
[   89.336000] ohci_hcd 0000:60:01.1: new USB bus registered, assigned bus number 3
[   89.432000] ohci_hcd 0000:60:01.1: enabled NEC chipset lost interrupt quirk
[   89.432000] ohci_hcd 0000:60:01.1: created debug files
[   89.432000] ohci_hcd 0000:60:01.1: supports USB remote wakeup
[   89.432000] ohci_hcd 0000:60:01.1: irq 69, io mem 0xffffffffb00a2000
[   90.080000] ohci_hcd 0000:60:01.1: OHCI controller state
[   90.080000] ohci_hcd 0000:60:01.1: OHCI 1.0, NO legacy support registers, rh state running
[   90.080000] ohci_hcd 0000:60:01.1: control 0x083 HCFS=operational CBSR=3
[   90.080000] ohci_hcd 0000:60:01.1: cmdstatus 0x00000 SOC=0
[   90.080000] ohci_hcd 0000:60:01.1: intrstatus 0x00000004 SF
[   90.080000] ohci_hcd 0000:60:01.1: intrenable 0x8000005a MIE RHSC UE RD WDH
[   90.080000] ohci_hcd 0000:60:01.1: hcca frame #01ff
[   90.080000] ohci_hcd 0000:60:01.1: roothub.a ff000202 POTPGT=255 NPS NDP=2(2)
[   90.080000] ohci_hcd 0000:60:01.1: roothub.b 00000000 PPCM=0000 DR=0000
[   90.080000] ohci_hcd 0000:60:01.1: roothub.status 00008000 DRWE
[   90.080000] ohci_hcd 0000:60:01.1: roothub.portstatus [0] 0x00000100 PPS
[   90.080000] ohci_hcd 0000:60:01.1: roothub.portstatus [1] 0x00000100 PPS
[   90.080000] usb usb3: default language 0x0409
[   90.080000] usb usb3: udev 1, busnum 3, minor = 256
[   90.080000] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[   90.168000] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   90.264000] usb usb3: Product: OHCI Host Controller
[   90.328000] usb usb3: Manufacturer: Linux 3.6.11-livecd64 ohci_hcd
[   90.412000] usb usb3: SerialNumber: 0000:60:01.1
[   90.472000] hub 2-0:1.0: state 7 ports 3 chg 0000 evt 0000
[   90.472000] usb usb3: usb_probe_device
[   90.472000] usb usb3: configuration #1 chosen from 1 choice
[   90.472000] usb usb3: adding 3-0:1.0 (config #1, interface 0)
[   90.472000] hub 3-0:1.0: usb_probe_interface
[   90.472000] hub 3-0:1.0: usb_probe_interface - got id
[   90.472000] hub 3-0:1.0: USB hub found
[   90.520000] hub 3-0:1.0: 2 ports detected
[   90.576000] hub 3-0:1.0: standalone hub
[   90.576000] hub 3-0:1.0: no power switching (usb 1.0)
[   90.576000] hub 3-0:1.0: global over-current protection
[   90.576000] hub 3-0:1.0: power on to power good time: 510ms
[   90.576000] hub 3-0:1.0: local power source is good
[   90.576000] hub 3-0:1.0: no over-current condition exists
[   90.576000] hub 3-0:1.0: trying to enable port power on non-switchable hub
[   90.576000] usbcore: registered new interface driver libusual
[   90.652000] mousedev: PS/2 mouse device common for all mice
[   90.732000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   90.824000] md: raid1 personality registered for level 1
[   90.896000] md: raid6 personality registered for level 6
[   90.964000] md: raid5 personality registered for level 5
[   91.036000] md: raid4 personality registered for level 4
[   91.104000] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[   91.108000] usbcore: registered new interface driver usbhid
[   91.184000] usbhid: USB HID core driver
[   91.232000] TCP: cubic registered
[   91.276000] NET: Registered protocol family 10
[   91.336000] NET: Registered protocol family 17
[   91.396000] Key type dns_resolver registered
[   91.460000] rtc-generic rtc-generic: setting system clock to 2013-03-17 09:30:08 UTC (1363512608)
[   92.056000] Freeing unused kernel memory: 376k freed
[  168.076000] ISO 9660 Extensions: Microsoft Joliet Level 3
[  169.840000] ISO 9660 Extensions: RRIP_1991A
[  381.100000] udevd[4964]: starting version 171
[  383.248000] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[  383.248000] e1000: Copyright (c) 1999-2006 Intel Corporation.
[  384.504000] e1000 0000:60:03.0: eth0: (PCI:33MHz:32-bit) 00:13:21:1a:c5:a5
[  384.504000] e1000 0000:60:03.0: eth0: Intel(R) PRO/1000 Network Connection
[  450.320000] warning: process `hwsetup' used the deprecated sysctl system call with 1.23.
[  459.952000] hdc: UDMA/44 mode selected
[  462.008000] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[  462.024000] e1000: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
[  462.024000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  480.360000] RPC: Registered named UNIX socket transport module.
[  480.360000] RPC: Registered udp transport module.
[  480.360000] RPC: Registered tcp transport module.
[  480.360000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[  526.456000] timer_interrupt(CPU 0): delayed! cycles 6D20C802 rem 1151FE  next/now 9DB32D5936/9DB31C0738
[  532.064000] timer_interrupt(CPU 1): delayed! cycles 8BDE3C25 rem 1566DB  next/now 9E9442784D/9E942D1172
[  535.804000] timer_interrupt(CPU 1): delayed! cycles 8BAEB7CF rem 7E231  next/now 9F732E574D/9F7326751C
[  539.344000] timer_interrupt(CPU 1): delayed! cycles 7A0EDE04 rem 321FC  next/now A045F16B4D/A045EE4951
[  545.640000] timer_interrupt(CPU 0): delayed! cycles 7A0F65F6 rem 29A0A  next/now A23781DB36/A2377F412C
[  560.924000] timer_interrupt(CPU 1): delayed! cycles 7A1125BA rem DA46  next/now A54C36164D/A54C353C07
[  565.084000] timer_interrupt(CPU 1): delayed! cycles 7A101DFF rem 1E201  next/now A6442AA64D/A64428C44C
[  572.508000] timer_interrupt(CPU 1): delayed! cycles 7A0BBEC8 rem 64138  next/now A7FEE8EF4D/A7FEE2AE15
[  582.576000] timer_interrupt(CPU 1): delayed! cycles 7A0C167D rem 5E983  next/now AA57026C4D/AA56FC82CA
[  863.356000] PDC Stable Storage facility v0.30

eth0 has a flaky connector, that's why it comes up only after a delay,

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Pale Bride (The Von Bondies), Slip Away (Sedatives)
24539 Neumuenster, Germany|Sacred Decay (The Estranged), She's Lost Control
