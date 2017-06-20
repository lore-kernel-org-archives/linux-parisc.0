From: Meelis Roos <mroos@linux.ee>
Subject: 4.12-rc5+: segfault while compiling, on rp3410
Date: Tue, 20 Jun 2017 17:20:25 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1706201714280.12869@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I am using gentoo on my hppa machines and just tried 
4.12.0-rc5-00187-gab2789b at the end of last week. This time there 
was new gcc release so a lot of work. rp3440 and A500 had no problems, 
rp3410 errored out with SIGSEGV, twice.

It is of course possible that the hardware has gone bad but so far it 
has always been the kernel and the machine has worked fine so far, so I 
suspect the kernel again.

Full dmesg (with crash) and config are below.

[    0.000000] Linux version 4.12.0-rc5-00187-gab2789b (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #17 Sat Jun 17 02:04:31 EEST 2017
[    0.000000] unwind_init: start = 0x4079d32c, end = 0x407d822c, entries = 15088
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00008860 00000491 00000000 00000002 3e45475d0860fe3d 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000302
[    0.000000] CPUID vers 20 rev 5 (0x00000285)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/800/rp3410  
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
[    0.000000] Total Memory: 2046 MB
[    0.000000] On node 0 totalpages: 262144
[    0.000000] free_area_init_node: node 0, pgdat 408064b0, node_mem_map 40bf000000
[    0.000000]   Normal zone: 3584 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 262144 pages, LIFO batch:31
[    0.000000] On node 1 totalpages: 261632
[    0.000000] free_area_init_node: node 1, pgdat 40806fc0, node_mem_map 40be1fff00
[    0.000000]   Normal zone: 3577 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 261632 pages, LIFO batch:31
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 516615
[    0.000000] Kernel command line: root=/dev/sdb3 console=ttyS1 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Memory: 2050012K/2095104K available (4640K kernel code, 1591K rwdata, 551K rodata, 1024K init, 476K bss, 45092K reserved, 0K cma-reserved)
[    0.000000] virtual kernel memory layout:
                   vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
                   memory  : 0x0000000040000000 - 0x00000040bfe00000   (264190 MB)
                     .init : 0x0000000040100000 - 0x0000000040200000   (1024 kB)
                     .data : 0x0000000040688000 - 0x000000004089fa20   (2142 kB)
                     .text : 0x0000000040200000 - 0x0000000040688000   (4640 kB)
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
[    0.000000] NR_IRQS:80
[    0.000007] sched_clock: 64 bits at 800MHz, resolution 1ns, wraps every 4398046511103ns
[    0.000478] Console: colour dummy device 160x64
[    0.000778] Calibrating delay loop... 1594.36 BogoMIPS (lpj=3188736)
[    0.048166] pid_max: default: 32768 minimum: 301
[    0.048402] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.048775] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.051017] devtmpfs: initialized
[    0.051593] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.053440] futex hash table entries: 256 (order: 0, 6144 bytes)
[    0.066507] NET: Registered protocol family 16
[    0.066881] Searching for devices...
[    0.281305] Found devices:
[    0.281364] 1. Storm Peak Slow DC- at 0xfffffffffe780000 [128] { 0, 0x0, 0x886, 0x00004 }
[    0.281583] 2. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
[    0.282039] 3. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    0.284386] 4. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    0.284614] 5. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
[    0.286869] 6. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    0.289120] 7. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    0.291352] 8. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
[    0.291582] 9. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
[    0.294098] 10. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
[    0.296418] 11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    0.296646] Enabling PDC_PAT chassis codes support v0.05
[    1.110427] Logical CPU #0 is physical cpu #0 at location 0xffff0000ffff15 with hpa 0xfffffffffe780000
[    1.110729] CPU(s): 1 x PA8800 (Mako) at 800.001300 MHz
[    1.115263] Whole cache flush 2114067 cycles, flushing 8388608 bytes 880186 cycles
[    1.115271] Cache flush threshold set to 19675 KiB
[    1.127477] Whole TLB flush 2407 cycles, flushing 8388608 bytes 9664568 cycles
[    1.127481] TLB flush threshold set to 4 KiB
[    1.171489] SBA found Pluto 2.3 at 0xfffffffffed00000
[    1.234244] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    1.270611] LBA 0:0: PCI host bridge to bus 0000:00
[    1.270749] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.270910] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
[    1.271464] pci_bus 0000:00: root bus resource [bus 00-07]
[    1.273749] pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310
[    1.273786] pci 0000:00:01.0: reg 0x10: [mem 0xffffffff80002000-0xffffffff80002fff]
[    1.273917] pci 0000:00:01.0: supports D1 D2
[    1.273922] pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
[    1.274039] pci 0000:00:01.1: [1033:0035] type 00 class 0x0c0310
[    1.274068] pci 0000:00:01.1: reg 0x10: [mem 0xffffffff80001000-0xffffffff80001fff]
[    1.274188] pci 0000:00:01.1: supports D1 D2
[    1.274193] pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
[    1.274283] pci 0000:00:01.2: [1033:00e0] type 00 class 0x0c0320
[    1.274312] pci 0000:00:01.2: reg 0x10: [mem 0xffffffff80000000-0xffffffff800000ff]
[    1.274431] pci 0000:00:01.2: supports D1 D2
[    1.274437] pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
[    1.274549] pci 0000:00:02.0: [1095:0649] type 00 class 0x01018f
[    1.274577] pci 0000:00:02.0: reg 0x10: [io  0x0d18-0x0d1f]
[    1.274596] pci 0000:00:02.0: reg 0x14: [io  0x0d24-0x0d27]
[    1.274614] pci 0000:00:02.0: reg 0x18: [io  0x0d10-0x0d17]
[    1.274633] pci 0000:00:02.0: reg 0x1c: [io  0x0d20-0x0d23]
[    1.274651] pci 0000:00:02.0: reg 0x20: [io  0x0d00-0x0d0f]
[    1.274720] pci 0000:00:02.0: supports D1 D2
[    1.281646] Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
[    1.322573] LBA 0:1: PCI host bridge to bus 0000:20
[    1.322711] pci_bus 0000:20: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.323207] pci_bus 0000:20: root bus resource [mem 0xffffffff90000000-0xffffffff9fffffff] (bus address [0x90000000-0x9fffffff])
[    1.327097] pci_bus 0000:20: root bus resource [bus 20-27]
[    1.327266] pci 0000:20:01.0: [1000:0021] type 00 class 0x010000
[    1.327296] pci 0000:20:01.0: reg 0x10: [io  0x12100-0x121ff]
[    1.327317] pci 0000:20:01.0: reg 0x14: [mem 0xffffffff90015000-0xffffffff900153ff 64bit]
[    1.327337] pci 0000:20:01.0: reg 0x1c: [mem 0xffffffff90012000-0xffffffff90013fff 64bit]
[    1.327398] pci 0000:20:01.0: supports D1 D2
[    1.327506] pci 0000:20:01.1: [1000:0021] type 00 class 0x010000
[    1.327527] pci 0000:20:01.1: reg 0x10: [io  0x12000-0x120ff]
[    1.327548] pci 0000:20:01.1: reg 0x14: [mem 0xffffffff90014000-0xffffffff900143ff 64bit]
[    1.327568] pci 0000:20:01.1: reg 0x1c: [mem 0xffffffff90010000-0xffffffff90011fff 64bit]
[    1.327618] pci 0000:20:01.1: supports D1 D2
[    1.327714] pci 0000:20:02.0: [14e4:1645] type 00 class 0x020000
[    1.327743] pci 0000:20:02.0: reg 0x10: [mem 0xffffffff90000000-0xffffffff9000ffff 64bit]
[    1.327841] pci 0000:20:02.0: PME# supported from D3hot D3cold
[    1.334746] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    1.375653] LBA 0:2: PCI host bridge to bus 0000:40
[    1.375796] pci_bus 0000:40: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    1.376305] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    1.378730] pci_bus 0000:40: root bus resource [bus 40-47]
[    1.385674] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    1.427257] LBA 0:3: PCI host bridge to bus 0000:60
[    1.427396] pci_bus 0000:60: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    1.427894] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    1.430327] pci_bus 0000:60: root bus resource [bus 60-67]
[    1.437266] Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
[    1.470484] LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new
[    1.478732] LBA 0:4: PCI host bridge to bus 0000:80
[    1.478870] pci_bus 0000:80: root bus resource [io  0x40000-0x4ffff] (bus address [0x0000-0xffff])
[    1.479351] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] (bus address [0xc0000000-0xdfffffff])
[    1.481789] pci_bus 0000:80: root bus resource [bus 80-87]
[    1.488729] Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
[    1.525252] LBA 0:6: PCI host bridge to bus 0000:c0
[    1.525394] pci_bus 0000:c0: root bus resource [io  0x50000-0x5ffff] (bus address [0x0000-0xffff])
[    1.526449] pci_bus 0000:c0: root bus resource [mem 0xffffffffe0000000-0xffffffffefffffff] (bus address [0xe0000000-0xefffffff])
[    1.530695] pci_bus 0000:c0: root bus resource [bus c0-c7]
[    1.537648] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
[    1.571161] LBA: lmmio_space [0xfffffffff0000000-0xfffffffffe77ffff] - new
[    1.579379] LBA 0:7: PCI host bridge to bus 0000:e0
[    1.579519] pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
[    1.580011] pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
[    1.582413] pci_bus 0000:e0: root bus resource [bus e0-e7]
[    1.582590] pci 0000:e0:01.0: [103c:1290] type 00 class 0x078000
[    1.582663] pci 0000:e0:01.0: reg 0x18: [mem 0xfffffffff4051000-0xfffffffff405100f]
[    1.582900] pci 0000:e0:01.1: [103c:1048] type 00 class 0x070002
[    1.582933] pci 0000:e0:01.1: reg 0x10: [mem 0xfffffffff4050000-0xfffffffff4050fff]
[    1.582972] pci 0000:e0:01.1: reg 0x18: [mem 0xfffffffff4020000-0xfffffffff403ffff pref]
[    1.583186] pci 0000:e0:02.0: [1002:5159] type 00 class 0x030000
[    1.583219] pci 0000:e0:02.0: reg 0x10: [mem 0xfffffffff0000000-0xfffffffff3ffffff pref]
[    1.583240] pci 0000:e0:02.0: reg 0x14: [io  0x6e000-0x6e0ff]
[    1.583262] pci 0000:e0:02.0: reg 0x18: [mem 0xfffffffff4040000-0xfffffffff404ffff]
[    1.583329] pci 0000:e0:02.0: reg 0x30: [mem 0xfffffffff4000000-0xfffffffff401ffff pref]
[    1.583380] pci 0000:e0:02.0: supports D1 D2
[    1.586707] powersw: Soft power switch support not available.
[    1.588732] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    1.589355] pci 0000:e0:02.0: vgaarb: setting as boot VGA device
[    1.589513] pci 0000:e0:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    1.589870] pci 0000:e0:02.0: vgaarb: bridge control possible
[    1.592058] vgaarb: loaded
[    1.592296] SCSI subsystem initialized
[    1.596135] NET: Registered protocol family 2
[    1.596709] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
[    1.597205] TCP bind hash table entries: 16384 (order: 5, 131072 bytes)
[    1.597604] TCP: Hash tables configured (established 16384 bind 16384)
[    1.599523] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    1.599734] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    1.601831] NET: Registered protocol family 1
[    1.601952] PCI: CLS 16 bytes
[    1.602091] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0xb8813b0cbe, max_idle_ns: 440795221700 ns
[    1.604030] clocksource: Switched to clocksource cr16
[    1.607429] Chassis warnings not supported.
[    1.607580] Performance monitoring counters enabled for Storm Peak Slow DC-
[    1.608124] workingset: timestamp_bits=59 max_order=19 bucket_order=0
[    1.614512] cryptomgr_test (19) used greatest stack depth: 13976 bytes left
[    1.615168] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    1.615508] io scheduler noop registered
[    1.615600] io scheduler deadline registered
[    1.615879] io scheduler cfq registered (default)
[    1.622644] PDC Stable Storage facility v0.30
[    1.720861] STI GSC/PCI core graphics driver Version 0.9b
[    1.721132] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.729154] 0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 24, base_baud = 115200) is a 16450
[    1.757730] 0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 24, base_baud = 115200) is a 16550A
[    1.758270] console [ttyS1] enabled
[    1.758688] bootconsole [ttyB0] disabled
[    1.780183] 0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 24, base_baud = 115200) is a 16550A
[    1.801665] 0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 24, base_baud = 115200) is a 16550A
[    1.987310] sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 21
[    1.989765] sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
[    2.029847] sym0: SCSI BUS has been reset.
[    2.029953] scsi host0: sym-2.2.3
[    2.315996] random: fast init done
[    5.113015] scsi 0:0:0:0: Direct-Access     FUJITSU  MAP3735NC        3701 PQ: 0 ANSI: 3
[    5.113233] scsi target0:0:0: tagged command queuing enabled, command queue depth 16.
[    5.113710] scsi target0:0:0: Beginning Domain Validation
[    5.118951] scsi target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[    5.127817] scsi target0:0:0: Ending Domain Validation
[    5.129667] scsi target0:0:1: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
[    5.131195] scsi 0:0:1:0: Direct-Access     IBM-ESXS ST336753LC    FN B85B PQ: 0 ANSI: 3
[    5.131415] scsi target0:0:1: tagged command queuing enabled, command queue depth 16.
[    5.132495] scsi target0:0:1: Beginning Domain Validation
[    5.138738] scsi target0:0:1: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[    5.145322] scsi target0:0:1: Ending Domain Validation
[    9.177893] sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 22
[    9.180451] sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
[    9.220533] sym1: SCSI BUS has been reset.
[    9.220635] scsi host1: sym-2.2.3
[   16.700370] mousedev: PS/2 mouse device common for all mice
[   16.714061] sd 0:0:0:0: [sda] 143550456 512-byte logical blocks: (73.5 GB/68.4 GiB)
[   16.714431] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   16.715024] NET: Registered protocol family 17
[   16.715253] sd 0:0:1:0: [sdb] 71096640 512-byte logical blocks: (36.4 GB/33.9 GiB)
[   16.717235] sd 0:0:0:0: [sda] Write Protect is off
[   16.717355] sd 0:0:0:0: [sda] Mode Sense: b3 00 00 08
[   16.731332] rtc-generic rtc-generic: setting system clock to 2017-06-17 05:29:49 UTC (1497677389)
[   16.731594] sd 0:0:1:0: [sdb] Write Protect is off
[   16.731599] sd 0:0:1:0: [sdb] Mode Sense: b3 00 10 08
[   16.739321] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   16.741649] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   16.771123]  sdb: sdb1 sdb2 sdb3 sdb4
[   16.783183] sd 0:0:1:0: [sdb] Attached SCSI disk
[   16.793807]  sda: sda1 sda2 sda3 < sda5 sda6 >
[   16.806437] sd 0:0:0:0: [sda] Attached SCSI disk
[   16.808795] EXT4-fs (sdb3): mounting ext3 file system using the ext4 subsystem
[   16.826998] EXT4-fs (sdb3): mounted filesystem with ordered data mode. Opts: (null)
[   16.827220] VFS: Mounted root (ext3 filesystem) readonly on device 8:19.
[   16.843537] devtmpfs: mounted
[   16.844878] Freeing unused kernel memory: 1024K
[   17.007562] Write protecting the kernel read-only data: 551k
[   17.736513] kbd_mode (69) used greatest stack depth: 10424 bytes left
[   17.992124] loadkeys (70) used greatest stack depth: 7240 bytes left
[   17.999560] init-early.sh (68) used greatest stack depth: 6760 bytes left
[   31.340128] libata version 3.00 loaded.
[   31.443299] pps_core: LinuxPPS API ver. 1 registered
[   31.443306] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   31.473661] pata_cmd64x 0000:00:02.0: Secondary port is disabled
[   31.513422] scsi host2: pata_cmd64x
[   31.519032] scsi host3: pata_cmd64x
[   31.519185] ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 20
[   31.519189] ata2: DUMMY
[   31.520305] pata_cmd64x: active 10 recovery 10 setup 3.
[   31.520320] pata_cmd64x: active 10 recovery 10 setup 3.
[   31.574976] PTP clock support registered
[   31.686312] ata1.00: ATAPI: DV-28E-C, C.4D, max UDMA/33
[   31.686338] pata_cmd64x: active 3 recovery 1 setup 1.
[   31.702557] ata1.00: configured for UDMA/33
[   31.751365] scsi 2:0:0:0: CD-ROM            TEAC     DV-28E-C         C.4D PQ: 0 ANSI: 5
[   32.097689] tg3.c:v3.137 (May 11, 2014)
[   32.552368] rtc rtc0: __rtc_set_alarm: err=-22
[   33.453004] tg3 0000:20:02.0 eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:13:21:d6:30:d0
[   33.453014] tg3 0000:20:02.0 eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
[   33.453021] tg3 0000:20:02.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
[   33.453028] tg3 0000:20:02.0 eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
[   34.521108] EXT4-fs (sdb3): re-mounted. Opts: (null)
[   36.180140] Adding 3091452k swap on /dev/sdb4.  Priority:-1 extents:1 across:3091452k 
[   36.869053] EXT4-fs (sdb2): mounting ext2 file system using the ext4 subsystem
[   36.881407] EXT4-fs (sdb2): mounted filesystem without journal. Opts: (null)
[   49.120047] random: crng init done
[   56.549994] tg3 0000:20:02.0 eth0: Link is up at 100 Mbps, full duplex
[   56.550003] tg3 0000:20:02.0 eth0: Flow control is off for TX and off for RX
[   69.936992] NET: Registered protocol family 10
[   69.952417] Segment Routing with IPv6
[ 1455.198271] try(12334): unaligned access to 0x00000000f9205589 at ip=0x0000000000010753
[ 1455.198285] try(12334): unaligned access to 0x00000000f9205589 at ip=0x0000000000010757
[ 1455.198292] try(12334): unaligned access to 0x00000000f920558a at ip=0x0000000000010753
[ 1455.198298] try(12334): unaligned access to 0x00000000f920558a at ip=0x0000000000010757
[ 1455.198304] try(12334): unaligned access to 0x00000000f920558b at ip=0x0000000000010753

[53244.910489] do_page_fault() command='as' type=15 address=0x000c1078 in libbfd-2.26.1.so[f850b000+b9000]
               trap #15: Data TLB miss fault, vm_start = 0x00065000, vm_end = 0x0006e000
[53244.910517] CPU: 0 PID: 1275 Comm: as Not tainted 4.12.0-rc5-00187-gab2789b #17
[53244.910522] task: 000000006a494280 task.stack: 00000040a00e4000

[53244.910527]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[53244.910531] PSW: 00000000000001101111110100001111 Not tainted
[53244.910537] r00-03  000000ff0006fd0f 00000000f85cf5f4 00000000f852fe4f 00000000007ef178
[53244.910542] r04-07  00000000f85ce5f4 0000000000053000 00000000007ef078 00000000fac3690c
[53244.910547] r08-11  00000000fac36808 00000000000651e4 00000000fac367d8 000000000006d450
[53244.910553] r12-15  00000000fac367dc 000000000006da44 0000000000055800 00000000007ef350
[53244.910558] r16-19  000000000006d438 0000000000000002 000000000006d424 00000000f85ce5f4
[53244.910563] r20-23  0000000000000000 00000000f85ce5f4 00000000f85c7850 00000000000001b6
[53244.910569] r24-27  0000000000000000 0000000000000000 000000000000001b 0000000000063ebc
[53244.910574] r28-31  00000000000c106c 0000000000000000 00000000fac36a00 0000000000000998
[53244.910579] sr00-03  0000000000012000 0000000000000000 0000000000000000 0000000000012000
[53244.910585] sr04-07  0000000000012000 0000000000012000 0000000000012000 0000000000012000

[53244.910590]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
[53244.910593] FPSR: 00000000000000000000000000000000
[53244.910595] FPER1: 00000000
[53244.910601] fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[53244.910606] fr04-07  00000000a12e1c5b 41d65162346b533c 0000000000000000 3ff00430b178b370
[53244.910612] fr08-11  0000000000000000 bc361578001e0162 0000000000000000 0000000000000000
[53244.910617] fr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[53244.910622] fr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[53244.910627] fr20-23  0000000000000000 0000000000000000 0000000000000088 0000003700000000
[53244.910633] fr24-27  0000000000000000 0000000000000000 3ec29e349cbe78d0 0000000000000000
[53244.910638] fr28-31  3fe00000000004dc 0000000000000000 bd2ef00000000000 3ff810b375dce72e

[53244.910645] IASQ: 0000000000012000 0000000000012000 IAOQ: 00000000f852fdeb 00000000f852fdef
[53244.910649]  IIR: 0f981094    ISR: 0000000000012000  IOR: 00000000000c1078
[53244.910653]  CPU:        0   CR30: 00000040a00e4000 CR31: fffffff0f0e05ee0
[53244.910656]  ORIG_R28: 0000000000000000
[53244.910659]  IAOQ[0]: 00000000f852fdeb
[53244.910662]  IAOQ[1]: 00000000f852fdef
[53244.910665]  RP(r2): 00000000f852fe4f


#
# Automatically generated file; DO NOT EDIT.
# Linux/parisc 4.12.0-rc5 Kernel Configuration
#
CONFIG_PARISC=y
CONFIG_MMU=y
CONFIG_STACK_GROWSUP=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_PGTABLE_LEVELS=3
CONFIG_SYS_SUPPORTS_HUGETLBFS=y
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE="hppa64-linux-"
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_DEFAULT_HOSTNAME="none"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_FHANDLE=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
# CONFIG_TASKS_RCU is not set
# CONFIG_RCU_STALL_COMMON is not set
CONFIG_RCU_NEED_SEGCBLIST=y
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_BUILD_BIN2C is not set
# CONFIG_IKCONFIG is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_GENERIC_SCHED_CLOCK=y
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_SOCK_CGROUP_DATA is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_POSIX_TIMERS=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_BPF_SYSCALL=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_USERFAULTFD=y
CONFIG_PCI_QUIRKS=y
CONFIG_MEMBARRIER=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_HASH=y
# CONFIG_ISA_BUS_API is not set
CONFIG_CLONE_BACKWARDS=y
CONFIG_ARCH_NO_COHERENT_DMA_MMAP=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
# CONFIG_HAVE_ARCH_VMAP_STACK is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
# CONFIG_ARCH_HAS_STRICT_MODULE_RWX is not set

#
# GCOV-based kernel profiling
#
# CONFIG_ARCH_HAS_GCOV_PROFILE_ALL is not set
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS is not set
CONFIG_TRIM_UNUSED_KSYMS=y
CONFIG_INIT_ALL_POSSIBLE=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="cfq"
# CONFIG_MQ_IOSCHED_DEADLINE is not set
# CONFIG_MQ_IOSCHED_KYBER is not set
# CONFIG_IOSCHED_BFQ is not set
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
# CONFIG_FREEZER is not set

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
# CONFIG_PA7300LC is not set
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_PREFETCH=y
# CONFIG_MLONGCALLS is not set
CONFIG_64BIT=y
CONFIG_PARISC_PAGE_SIZE_4KB=y
# CONFIG_PARISC_PAGE_SIZE_16KB is not set
# CONFIG_PARISC_PAGE_SIZE_64KB is not set
# CONFIG_SMP is not set
CONFIG_IRQSTACKS=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_DISCONTIGMEM_ENABLE=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_DISCONTIGMEM_DEFAULT=y
CONFIG_NODES_SHIFT=3
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_DISCONTIGMEM_MANUAL=y
CONFIG_DISCONTIGMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_NO_BOOTMEM=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
# CONFIG_FRONTSWAP is not set
# CONFIG_CMA is not set
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_MAX_STACK_SIZE_MB=80
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_AUDIT_ARCH=y

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
# CONFIG_GSC is not set
CONFIG_PCI=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_BUS_ADDR_T_64BIT=y
CONFIG_PCI_MSI=y
# CONFIG_PCI_MSI_IRQ_DOMAIN is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
# CONFIG_HOTPLUG_PCI is not set

#
# DesignWare PCI Core Support
#

#
# PCI host controller drivers
#

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
CONFIG_PCI_LBA=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_IOMMU_HELPER=y
# CONFIG_PCCARD is not set

#
# PA-RISC specific drivers
#
CONFIG_SUPERIO=y
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y
CONFIG_PDC_CHASSIS_WARN=y
CONFIG_PDC_STABLE=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
# CONFIG_UNIX_DIAG is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=m
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
# CONFIG_XFRM_MIGRATE is not set
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=m
CONFIG_IP_MROUTE=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
# CONFIG_NET_UDP_TUNNEL is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_XFRM_TUNNEL is not set
CONFIG_INET_TUNNEL=m
# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
# CONFIG_INET_XFRM_MODE_TUNNEL is not set
# CONFIG_INET_XFRM_MODE_BEET is not set
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=m
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_INET6_XFRM_MODE_TRANSPORT=m
CONFIG_INET6_XFRM_MODE_TUNNEL=m
CONFIG_INET6_XFRM_MODE_BEET=m
CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
# CONFIG_IPV6_FOU is not set
# CONFIG_IPV6_FOU_TUNNEL is not set
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
CONFIG_NETLINK_DIAG=m
# CONFIG_MPLS is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_NET_NCSI is not set
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_STREAM_PARSER is not set
CONFIG_FIB_RULES=y
# CONFIG_WIRELESS is not set
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
# CONFIG_NET_DEVLINK is not set
CONFIG_MAY_USE_DEVLINK=y

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
# CONFIG_DMA_SHARED_BUFFER is not set

#
# Bus devices
#
# CONFIG_CONNECTOR is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_FC is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HP_ILO=m
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_93CX6=m
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#

#
# Altera FPGA firmware download module
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_CXL_BASE is not set
# CONFIG_CXL_AFU_DRIVER_OPS is not set
CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_NETLINK is not set
CONFIG_SCSI_MQ_DEFAULT=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
# CONFIG_CHR_DEV_SCH is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_DH is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_ATA=m
# CONFIG_ATA_NONSTANDARD is not set
CONFIG_ATA_VERBOSE_ERROR=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
CONFIG_PATA_CMD64X=m
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_ATA_GENERIC is not set
# CONFIG_PATA_LEGACY is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
CONFIG_ETHERNET=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
# CONFIG_NET_VENDOR_AMAZON is not set
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_NET_VENDOR_AURORA is not set
# CONFIG_NET_CADENCE is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
CONFIG_TIGON3=m
CONFIG_TIGON3_HWMON=y
# CONFIG_BNX2X is not set
# CONFIG_BNXT is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CISCO is not set
# CONFIG_DNET is not set
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
# CONFIG_NET_VENDOR_EXAR is not set
# CONFIG_NET_VENDOR_HP is not set
# CONFIG_NET_VENDOR_INTEL is not set
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_NET_VENDOR_RENESAS is not set
# CONFIG_NET_VENDOR_RDC is not set
# CONFIG_NET_VENDOR_ROCKER is not set
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_MDIO_DEVICE=m
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_THUNDER is not set
CONFIG_PHYLIB=m

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AT803X_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_FIXED_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_QSEMI_PHY is not set
# CONFIG_REALTEK_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
# CONFIG_WLAN is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_ISDN is not set
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_ATKBD_HP_KEYCODES=y
# CONFIG_KEYBOARD_ATKBD_RDI_KEYCODES is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVMEM is not set
CONFIG_DEVKMEM=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_FSL is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_MOXA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
# CONFIG_PDC_CONSOLE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set

#
# I2C support
#
# CONFIG_I2C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set

#
# PPS support
#
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=m

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_GPIOLIB is not set
# CONFIG_W1 is not set
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SUPPLY is not set
CONFIG_HWMON=m
# CONFIG_HWMON_VID is not set
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ASPEED is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NTC_THERMISTOR is not set
# CONFIG_SENSORS_NCT6683 is not set
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH56XX_COMMON is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_REGULATOR is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_DRM is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_LIB_RANDOM is not set

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
# CONFIG_VGASTATE is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
CONFIG_STI_CONSOLE=y
# CONFIG_SOUND is not set

#
# HID support
#
# CONFIG_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#

#
# SPI RTC drivers
#

#
# SPI and I2C RTC drivers
#

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=y

#
# HID Sensor RTC drivers
#
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VIRT_DRIVERS is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV_TSCPAGE is not set
# CONFIG_STAGING is not set

#
# Hardware Spinlock drivers
#

#
# Clock Source drivers
#
# CONFIG_ATMEL_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set

#
# Rpmsg drivers
#

#
# SOC (System On Chip) specific Drivers
#

#
# Broadcom SoC drivers
#

#
# i.MX SoC drivers
#
# CONFIG_SUNXI_SRAM is not set
# CONFIG_SOC_TI is not set
# CONFIG_SOC_ZTE is not set
# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
# CONFIG_PWM is not set
CONFIG_ARM_GIC_MAX_NR=1
# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
# CONFIG_DAX is not set
# CONFIG_NVMEM is not set
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set

#
# FPGA Configuration Support
#
# CONFIG_FPGA is not set

#
# FSI support
#
# CONFIG_FSI is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_ENCRYPTION is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
# CONFIG_CONFIGFS_FS is not set
# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
# CONFIG_NLS is not set

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
# CONFIG_ENABLE_WARN_DEPRECATED is not set
# CONFIG_ENABLE_MUST_CHECK is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_DEBUG_FS is not set
# CONFIG_HEADERS_CHECK is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_LOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHED_INFO is not set
# CONFIG_SCHEDSTATS is not set
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_STACKTRACE is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PI_LIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_PROVE_RCU is not set
# CONFIG_SPARSE_RCU_POINTER is not set
# CONFIG_TORTURE_TEST is not set
# CONFIG_RCU_PERF_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set

#
# Runtime Testing
#
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_MEMTEST is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
CONFIG_UBSAN=y
CONFIG_UBSAN_ALIGNMENT=y
CONFIG_UBSAN_NULL=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
# CONFIG_SECCOMP is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=m
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=m
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=m
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=m
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_ACOMP2=y
# CONFIG_CRYPTO_RSA is not set
# CONFIG_CRYPTO_DH is not set
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_MANAGER=m
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
# CONFIG_CRYPTO_GF128MUL is not set
CONFIG_CRYPTO_NULL=m
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=m
# CONFIG_CRYPTO_CTR is not set
# CONFIG_CRYPTO_CTS is not set
# CONFIG_CRYPTO_ECB is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set
# CONFIG_CRYPTO_KEYWRAP is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_HMAC=m
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_CRCT10DIF is not set
# CONFIG_CRYPTO_GHASH is not set
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=m
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA256=m
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=m
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG=m
CONFIG_CRYPTO_JITTERENTROPY=m
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_HW is not set

#
# Certificates for signature checking
#
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IO=y
# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=m
CONFIG_ZLIB_DEFLATE=m
# CONFIG_XZ_DEC is not set
# CONFIG_XZ_DEC_BCJ is not set
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
# CONFIG_IRQ_POLL is not set
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
# CONFIG_ARCH_HAS_SG_CHAIN is not set
CONFIG_SBITMAP=y

-- 
Meelis Roos (mroos@linux.ee)
