From: Graham Gower <graham.gower@gmail.com>
Subject: bad address in handle_percpu_irq
Date: Sun, 16 Aug 2015 16:14:14 +0930
Message-ID: <55D0313E.3090602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I'm seeing the panic below on a c8000. It happens sometimes when booting, just
before the login prompt is to appear. I've seen it with older kernels too, going
back to at least 3.19.

-Graham


[   62.596000] Backtrace:
[   62.596000]  [<00000000401fdb60>] handle_percpu_irq+0xb0/0xf0
[   62.596000]  [<00000000401f7894>] generic_handle_irq+0x4c/0x68
[   62.596000]  [<0000000040177670>] execute_on_irq_stack+0x90/0xa8
[   62.596000]  [<0000000040178574>] do_cpu_irq_mask+0x1ec/0x3e0
[   62.596000]  [<0000000040164074>] intr_return+0x0/0xc
[   62.596000]
[   62.596000]
[   62.596000] Bad Address (null pointer deref?): Code=26 regs=0000000042a0a070 (Addr=0000000000000000)
[   62.596000] CPU: 0 PID: 444 Comm: (agetty) Not tainted 4.1.0-1-parisc64-smp #1 Debian 4.1.3-1
[   62.596000] task: 000000007a9a7538 ti: 000000007dc38000 task.ti: 000000007dc38000
[   62.596000]
[   62.596000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   62.596000] PSW: 00001000000001001111111100001110 Not tainted
[   62.596000] r00-03  000000ff0804ff0e 00000000408b8f30 00000000401fdb60 0000000042a09f80
[   62.596000] r04-07  000000004089ff30 0000000000000000 0000000000000000 0000000000000000
[   62.596000] r08-11  0000000042a0a040 000000000000004c 0000000040932d40 000000000000004c
[   62.596000] r12-15  000000000000004c 0000000000000001 00000000408d4f30 0000000000000001
[   62.596000] r16-19  00000000408b8f30 00000000408b8f30 0000000000000202 00000000028b3000
[   62.596000] r20-23  0000000042a0d020 bff7ffffffffffff 0000000040948420 fffc000000000000
[   62.596000] r24-27  0000000042a099d0 0000000000000000 0000000040932d40 000000004089ff30
[   62.596000] r28-31  0008000000000000 0000000042a09f50 0000000042a0a070 bff4000000000000
[   62.596000] sr00-03  000000000013f800 0000000000000000 0000000000000000 000000000013b000
[   62.596000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   62.596000]
[   62.596000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401f861c 00000000401f8620
[   62.596000]  IIR: 0ca010dc    ISR: 0000000000000000  IOR: 0000000000000000
[   62.596000]  CPU:        0   CR30: 000000007dc38000 CR31: ffffffffdbfeffff
[   62.596000]  ORIG_R28: 0000000040948420
[   62.596000]  IAOQ[0]: handle_irq_event_percpu+0x8c/0x250
[   62.596000]  IAOQ[1]: handle_irq_event_percpu+0x90/0x250
[   62.596000]  RP(r2): handle_percpu_irq+0xb0/0xf0
[   62.596000] Backtrace:
[   62.596000]  [<00000000401fdb60>] handle_percpu_irq+0xb0/0xf0
[   62.596000]  [<00000000401f7894>] generic_handle_irq+0x4c/0x68
[   62.596000]  [<0000000040177670>] execute_on_irq_stack+0x90/0xa8
[   62.596000]  [<0000000040178574>] do_cpu_irq_mask+0x1ec/0x3e0
[   62.596000]  [<0000000040164074>] intr_return+0x0/0xc
[   62.596000]
<Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
[   62.596000] Kernel panic - not syncing: Bad Address (null pointer deref?)
<Cpu0> 78000c6200e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING
<Cpu0> 76000c6800e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING
<Cpu0> 0300109100e00000  0000000000000000  CC_PROCS_ENTRY_OUT
[   62.596000] ---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)


Full dmesg from a successful boot.

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.1.0-1-parisc64-smp (debian-kernel@lists.debian.org) (gcc version 4.9.3 (GCC) ) #1 SMP Debian 4.1.3-1 (2015-08-03)
[    0.000000] unwind_init: start = 0x408d6650, end = 0x4091f6c0, entries = 18695
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Default page size is 4KB.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 000088a0 00000491 00000000 00000002 567eef09b2675bcf 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000301
[    0.000000] CPUID vers 20 rev 4 (0x00000284)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 8190 MB
[    0.000000] initrd: 7eee8000-7ffedc68
[    0.000000] initrd: reserving 3eee8000-3ffedc68 (mem_max 1ffe00000)
[    0.000000] On node 0 totalpages: 262144
[    0.000000] free_area_init_node: node 0, pgdat 40936a40, node_mem_map 41a00000
[    0.000000]   Normal zone: 4096 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 262144 pages, LIFO batch:31
[    0.000000] On node 1 totalpages: 1048064
[    0.000000] free_area_init_node: node 1, pgdat 40937800, node_mem_map 140000000
[    0.000000]   Normal zone: 16376 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 1048064 pages, LIFO batch:31
[    0.000000] On node 2 totalpages: 786432
[    0.000000] free_area_init_node: node 2, pgdat 409385c0, node_mem_map 4080000000
[    0.000000]   Normal zone: 12288 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 786432 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 19 pages/cpu @0000000042a09000 s37632 r8192 d32000 u77824
[    0.000000] pcpu-alloc: s37632 r8192 d32000 u77824 alloc=19*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2063880
[    0.000000] Kernel command line: root=UUID=47254bb5-1fd8-4d2f-9940-c0507cb05fa5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 8198520K/8386560K available (5760K kernel code, 1872K rwdata, 1167K rodata, 384K init, 671K bss, 188040K reserved, 0K cma-reserved)
[    0.000000] virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x0000000040100000 - 0x0000000040160000   ( 384 kB)
      .data : 0x0000000040700000 - 0x00000000409f81f0   (3040 kB)
      .text : 0x0000000040160000 - 0x0000000040700000   (5760 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	CONFIG_RCU_FANOUT set to non-default value of 32
[    0.000000] NR_IRQS:128
[    0.000000] clocksource cr16: mask: 0xffffffffffffffff max_cycles: 0xcf914c9718, max_idle_ns: 440795231327 ns
[    0.128000] Console: colour dummy device 160x64
[    0.188000] Calibrating delay loop... 1795.07 BogoMIPS (lpj=3590144)
[    0.296000] pid_max: default: 32768 minimum: 301
[    0.356000] Security Framework initialized
[    0.408000] AppArmor: AppArmor disabled by boot time parameter
[    0.488000] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.576000] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.664000] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.764000] Initializing cgroup subsys blkio
[    0.820000] Initializing cgroup subsys memory
[    0.876000] Initializing cgroup subsys devices
[    0.936000] Initializing cgroup subsys freezer
[    0.992000] Initializing cgroup subsys net_cls
[    1.052000] Initializing cgroup subsys perf_event
[    1.112000] Initializing cgroup subsys net_prio
[    1.176000] Brought up 1 CPUs
[    1.216000] devtmpfs: initialized
[    1.260000] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    1.400000] NET: Registered protocol family 16
[    1.460000] EISA bus registered
[    1.500000] Searching for devices...
[    1.648000] Found devices:
[    1.684000] 1. Crestone Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x88a, 0x00004 }
[    1.792000] 2. Crestone Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x88a, 0x00004 }
[    1.896000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[    1.988000] 4. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    2.100000] 5. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    2.208000] 6. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    2.316000] 7. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    2.420000] 8. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[    2.536000] 9. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    2.640000] 10. Crestone Peak Core RS-232 at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x076, 0x000ad }
[    2.756000] 11. Crestone Peak Core RS-232 at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
[    2.872000] Enabling PDC_PAT chassis codes support v0.05
[    3.796000] Releasing cpu 1 now, hpa=fffffffffe781000
[    4.224000] FP[1] enabled: Rev 1 Model 20
[    4.228000] CPU(s): 2 out of 2 PA8800 (Mako) at 900.000000 MHz online
[    4.372000] Whole cache flush 4255702 cycles, flushing 9702864 bytes 1092542 cycles
[    4.372000] Setting cache flush threshold to 2000000 (2 CPUs online)
[    4.596000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    4.728000] sba_ioc_init_pluto: reserving 512Mb of IOVA space for agpgart
[    4.832000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    4.940000] LBA: lmmio_space [0xffffffff80000000-0xffffffff9fffffff] - new
[    5.052000] LBA 0:0: PCI host bridge to bus 0000:00
[    5.116000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    5.196000] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff9fffffff] (bus address [0x80000000-0x9fffffff])
[    5.348000] pci_bus 0000:00: root bus resource [mem 0xffffff0000000000-0xffffff0fffffffff]
[    5.456000] pci_bus 0000:00: root bus resource [bus 00-07]
[    5.532000] pci 0000:00:01.0: [1095:3124] type 00 class 0x010400
[    5.532000] pci 0000:00:01.0: reg 0x10: [mem 0xffffffff80088000-0xffffffff8008807f 64bit]
[    5.532000] pci 0000:00:01.0: reg 0x18: [mem 0xffffffff80080000-0xffffffff80087fff 64bit]
[    5.532000] pci 0000:00:01.0: reg 0x20: [io  0x0d00-0x0d0f]
[    5.532000] pci 0000:00:01.0: reg 0x30: [mem 0xffffffff80000000-0xffffffff8007ffff pref]
[    5.532000] pci 0000:00:01.0: supports D1 D2
[    5.544000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    5.672000] LBA 0:2: PCI host bridge to bus 0000:40
[    5.736000] pci_bus 0000:40: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    5.856000] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    6.008000] pci_bus 0000:40: root bus resource [mem 0xffffff2000000000-0xffffff2fffffffff]
[    6.116000] pci_bus 0000:40: root bus resource [bus 40-47]
[    6.188000] pci 0000:40:01.0: [1000:0030] type 00 class 0x010000
[    6.188000] pci 0000:40:01.0: reg 0x10: [io  0x14100-0x141ff]
[    6.188000] pci 0000:40:01.0: reg 0x14: [mem 0xffffffffa0260000-0xffffffffa027ffff 64bit]
[    6.188000] pci 0000:40:01.0: reg 0x1c: [mem 0xffffffffa0240000-0xffffffffa025ffff 64bit]
[    6.188000] pci 0000:40:01.0: reg 0x30: [mem 0xffffffffa0100000-0xffffffffa01fffff pref]
[    6.188000] pci 0000:40:01.0: supports D1 D2
[    6.188000] pci 0000:40:01.1: [1000:0030] type 00 class 0x010000
[    6.188000] pci 0000:40:01.1: reg 0x10: [io  0x14000-0x140ff]
[    6.188000] pci 0000:40:01.1: reg 0x14: [mem 0xffffffffa0220000-0xffffffffa023ffff 64bit]
[    6.188000] pci 0000:40:01.1: reg 0x1c: [mem 0xffffffffa0200000-0xffffffffa021ffff 64bit]
[    6.188000] pci 0000:40:01.1: reg 0x30: [mem 0xffffffffa0000000-0xffffffffa00fffff pref]
[    6.188000] pci 0000:40:01.1: supports D1 D2
[    6.204000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    6.332000] LBA 0:3: PCI host bridge to bus 0000:60
[    6.396000] pci_bus 0000:60: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    6.512000] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    6.668000] pci_bus 0000:60: root bus resource [mem 0xffffff3000000000-0xffffff3fffffffff]
[    6.776000] pci_bus 0000:60: root bus resource [bus 60-67]
[    6.848000] pci 0000:60:01.0: [1033:0035] type 00 class 0x0c0310
[    6.848000] pci 0000:60:01.0: reg 0x10: [mem 0xffffffffb00a3000-0xffffffffb00a3fff]
[    6.848000] pci 0000:60:01.0: supports D1 D2
[    6.848000] pci 0000:60:01.0: PME# supported from D0 D1 D2 D3hot
[    6.848000] pci 0000:60:01.1: [1033:0035] type 00 class 0x0c0310
[    6.848000] pci 0000:60:01.1: reg 0x10: [mem 0xffffffffb00a2000-0xffffffffb00a2fff]
[    6.848000] pci 0000:60:01.1: supports D1 D2
[    6.848000] pci 0000:60:01.1: PME# supported from D0 D1 D2 D3hot
[    6.848000] pci 0000:60:01.2: [1033:00e0] type 00 class 0x0c0320
[    6.848000] pci 0000:60:01.2: reg 0x10: [mem 0xffffffffb00a1000-0xffffffffb00a10ff]
[    6.848000] pci 0000:60:01.2: supports D1 D2
[    6.848000] pci 0000:60:01.2: PME# supported from D0 D1 D2 D3hot
[    6.848000] pci 0000:60:02.0: [1095:0680] type 00 class 0x010185
[    6.848000] pci 0000:60:02.0: reg 0x10: [io  0x27058-0x2705f]
[    6.848000] pci 0000:60:02.0: reg 0x14: [io  0x27064-0x27067]
[    6.848000] pci 0000:60:02.0: reg 0x18: [io  0x27050-0x27057]
[    6.848000] pci 0000:60:02.0: reg 0x1c: [io  0x27060-0x27063]
[    6.848000] pci 0000:60:02.0: reg 0x20: [io  0x27040-0x2704f]
[    6.848000] pci 0000:60:02.0: reg 0x24: [mem 0xffffffffb00a0000-0xffffffffb00a00ff]
[    6.848000] pci 0000:60:02.0: reg 0x30: [mem 0xffffffffb0000000-0xffffffffb007ffff pref]
[    6.848000] pci 0000:60:02.0: supports D1 D2
[    6.848000] pci 0000:60:03.0: [8086:100e] type 00 class 0x020000
[    6.848000] pci 0000:60:03.0: reg 0x10: [mem 0xffffffffb0080000-0xffffffffb009ffff]
[    6.848000] pci 0000:60:03.0: reg 0x18: [io  0x27000-0x2703f]
[    6.848000] pci 0000:60:03.0: PME# supported from D0 D3hot D3cold
[    6.848000] pci 0000:60:04.0: [131f:2000] type 00 class 0x070002
[    6.848000] pci 0000:60:04.0: reg 0x10: [io  0x26000-0x26007]
[    6.864000] Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000
[    6.976000] LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new
[    7.088000] LBA 0:4: PCI host bridge to bus 0000:80
[    7.152000] pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    7.268000] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] (bus address [0xc0000000-0xdfffffff])
[    7.424000] pci_bus 0000:80: root bus resource [mem 0xffffff4000000000-0xffffff4fffffffff]
[    7.532000] pci_bus 0000:80: root bus resource [bus 80-87]
[    7.604000] pci 0000:80:00.0: [10de:00f1] type 00 class 0x030000
[    7.604000] pci 0000:80:00.0: reg 0x10: [mem 0xffffffffd1000000-0xffffffffd1ffffff]
[    7.604000] pci 0000:80:00.0: reg 0x14: [mem 0xffffffffc0000000-0xffffffffcfffffff pref]
[    7.604000] pci 0000:80:00.0: reg 0x18: [mem 0xffffffffd0000000-0xffffffffd0ffffff]
[    7.604000] pci 0000:80:00.0: reg 0x30: [mem 0xffffffffd2000000-0xffffffffd201ffff pref]
[    8.012000] powersw: Soft power switch at 0xfffffff0f042e278 enabled.
[    8.124000] vgaarb: setting as boot device: PCI:0000:80:00.0
[    8.124000] vgaarb: device added: PCI:0000:80:00.0,decodes=io+mem,owns=io+mem,locks=none
[    8.308000] vgaarb: loaded
[    8.340000] vgaarb: bridge control possible 0000:80:00.0
[    8.416000] NET: Registered protocol family 2
[    8.476000] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    8.572000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    8.664000] TCP: Hash tables configured (established 65536 bind 65536)
[    8.748000] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    8.828000] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    8.928000] NET: Registered protocol family 1
[    8.988000] PCI: CLS 64 bytes
[    9.136000] Unpacking initramfs...
[   10.168000] Freeing initrd memory: 17428K (000000007eee8000 - 000000007ffed000)
[   10.264000] Chassis warnings not supported.
[   10.320000] Performance monitoring counters enabled for Crestone Peak Slow
[   10.412000] futex hash table entries: 2048 (order: 5, 131072 bytes)
[   10.496000] audit: initializing netlink subsys (disabled)
[   10.564000] audit: type=2000 audit(1439706958.564:1): initialized
[   10.648000] zpool: loaded
[   10.684000] VFS: Disk quotas dquot_6.6.0
[   10.736000] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[   10.828000] alg: No test for stdrng (krng)
[   10.880000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[   10.980000] io scheduler noop registered
[   11.032000] io scheduler deadline registered
[   11.088000] io scheduler cfq registered (default)
[   11.152000] PDC Stable Storage facility v0.30
[   11.252000] STI GSC/PCI core graphics driver Version 0.9b
[   11.324000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   11.420000] console [ttyS0] disabled
[   11.488000] 17: ttyS0 at MMIO 0xfffffff0f05e0800 (irq = 76, base_baud = 115200) is a 16550A
[   11.600000] console [ttyS0] enabled
[   11.688000] bootconsole [ttyB0] disabled
[   11.820000] 18: ttyS1 at MMIO 0xfffffff0f05e2800 (irq = 77, base_baud = 115200) is a 16550A
[   11.940000] 0000:60:04.0: ttyS2 at I/O 0x26000 (irq = 74, base_baud = 921600) is a 16550A
[   12.040000] Linux agpgart interface v0.103
[   12.088000] quicksilver: IO PDIR shared with sba_iommu
[   12.164000]  (null): AGP aperture is 512M @ 0x60000000
[   12.228000] [drm] Initialized drm 1.1.0 20060810
[   12.284000] mousedev: PS/2 mouse device common for all mice
[   12.356000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   12.444000] ledtrig-cpu: registered to indicate activity on CPUs
[   12.516000] NET: Registered protocol family 10
[   12.568000] mip6: Mobile IPv6
[   12.604000] NET: Registered protocol family 17
[   12.656000] mpls_gso: MPLS GSO support
[   12.704000] registered taskstats version 1
[   12.760000] rtc-generic rtc-generic: setting system clock to 2015-08-16 06:36:01 UTC (1439706961)
[   12.880000] Freeing unused kernel memory: 384K (0000000040100000 - 0000000040160000)
[   13.700000] systemd-udevd[64]: starting version 215
[   13.760000] random: systemd-udevd urandom read with 55 bits of entropy available
[   14.204000] SCSI subsystem initialized
[   14.752000] usbcore: registered new interface driver usbfs
[   14.752000] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[   14.752000] e1000: Copyright (c) 1999-2006 Intel Corporation.
[   14.988000] Fusion MPT base driver 3.04.20
[   15.044000] Copyright (c) 1999-2008 LSI Corporation
[   15.224000] libata version 3.00 loaded.
[   15.332000] sata_sil24 0000:00:01.0: version 1.1
[   15.384000] sata_sil24 0000:00:01.0: Applying completion IRQ loss on PCI-X errata fix
[   15.652000] usbcore: registered new interface driver hub
[   15.724000] usbcore: registered new device driver usb
[   15.796000] scsi host0: sata_sil24
[   15.840000] scsi host1: sata_sil24
[   16.004000] e1000 0000:60:03.0 eth0: (PCI:33MHz:32-bit) 00:30:6e:f3:5f:10
[   16.096000] e1000 0000:60:03.0 eth0: Intel(R) PRO/1000 Network Connection
[   16.248000] scsi host2: sata_sil24
[   16.332000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   16.560000] scsi host3: sata_sil24
[   16.560000] pata_sil680 0000:60:02.0: version 0.4.9
[   16.560000] sil680: 133MHz clock.
[   16.604000] scsi host4: pata_sil680
[   16.764000] scsi host5: pata_sil680
[   16.772000] Fusion MPT SPI Host driver 3.04.20
[   16.948000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   17.032000] ata5: PATA max UDMA/133 cmd 0x27058 ctl 0x27064 bmdma 0x27040 irq 72
[   17.036000] mptbase: ioc0: Initiating bringup
[   17.036000] ata1: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80080000 irq 66
[   17.036000] ata2: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80082000 irq 66
[   17.036000] ata3: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80084000 irq 66
[   17.036000] ata4: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80086000 irq 66
[   17.036000] ehci-pci: EHCI PCI platform driver
[   17.688000] ata6: PATA max UDMA/133 cmd 0x27050 ctl 0x27060 bmdma 0x27048 irq 72
[   17.836000] ehci-pci 0000:60:01.2: EHCI Host Controller
[   17.900000] ehci-pci 0000:60:01.2: new USB bus registered, assigned bus number 1
[   17.988000] ehci-pci 0000:60:01.2: irq 71, io mem 0xffffffffb00a1000
[   18.076000] ehci-pci 0000:60:01.2: USB 2.0 started, EHCI 0.95
[   18.144000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[   18.224000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   18.312000] usb usb1: Product: EHCI Host Controller
[   18.368000] usb usb1: Manufacturer: Linux 4.1.0-1-parisc64-smp ehci_hcd
[   18.448000] usb usb1: SerialNumber: 0000:60:01.2
[   18.504000] hub 1-0:1.0: USB hub found
[   18.552000] hub 1-0:1.0: 5 ports detected
[   18.772000] ohci-pci: OHCI PCI platform driver
[   18.836000] ohci-pci 0000:60:01.0: OHCI PCI host controller
[   18.904000] ohci-pci 0000:60:01.0: new USB bus registered, assigned bus number 2
[   18.992000] ohci-pci 0000:60:01.0: irq 69, io mem 0xffffffffb00a3000
[   19.124000] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[   19.204000] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   19.292000] usb usb2: Product: OHCI PCI host controller
[   19.352000] usb usb2: Manufacturer: Linux 4.1.0-1-parisc64-smp ohci_hcd
[   19.392000] ioc0: LSI53C1030 B2: Capabilities={Initiator,Target}
[   19.504000] usb usb2: SerialNumber: 0000:60:01.0
[   19.560000] hub 2-0:1.0: USB hub found
[   19.608000] hub 2-0:1.0: 3 ports detected
[   19.668000] ohci-pci 0000:60:01.1: OHCI PCI host controller
[   19.736000] ohci-pci 0000:60:01.1: new USB bus registered, assigned bus number 3
[   19.824000] ata1: SATA link down (SStatus 0 SControl 0)
[   19.888000] ohci-pci 0000:60:01.1: irq 70, io mem 0xffffffffb00a2000
[   20.020000] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[   20.100000] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   20.188000] usb usb3: Product: OHCI PCI host controller
[   20.196000] scsi host6: ioc0: LSI53C1030 B2, FwRev=01030f00h, Ports=1, MaxQ=255, IRQ=67
[   20.344000] usb usb3: Manufacturer: Linux 4.1.0-1-parisc64-smp ohci_hcd
[   20.424000] usb usb3: SerialNumber: 0000:60:01.1
[   20.480000] hub 3-0:1.0: USB hub found
[   20.524000] hub 3-0:1.0: 2 ports detected
[   20.844000] mptbase: ioc1: Initiating bringup
[   21.376000] ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}
[   21.936000] scsi host7: ioc1: LSI53C1030 B2, FwRev=01030f00h, Ports=1, MaxQ=255, IRQ=68
[   22.032000] ata2: SATA link down (SStatus 0 SControl 0)
[   23.496000] scsi 6:0:5:0: Direct-Access     HP 73.4G ST373454LW       HPC2 PQ: 0 ANSI: 3
[   23.592000] scsi target6:0:5: Beginning Domain Validation
[   23.676000] scsi target6:0:5: Ending Domain Validation
[   23.740000] scsi target6:0:5: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.25 ns, offset 63)
[   23.860000] scsi 6:0:6:0: Direct-Access     HP 73.4G ST373454LW       HPC2 PQ: 0 ANSI: 3
[   23.956000] scsi target6:0:6: Beginning Domain Validation
[   24.040000] scsi target6:0:6: Domain Validation skipping write tests
[   24.116000] scsi target6:0:6: Ending Domain Validation
[   24.176000] scsi target6:0:6: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.25 ns, offset 63)
[   24.176000] ata3: SATA link down (SStatus 0 SControl 0)
[   25.372000] random: nonblocking pool is initialized
[   26.388000] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 0)
[   26.460000] ata4.00: ATA-9: Samsung SSD 840 PRO Series, DXM05B0Q, max UDMA/133
[   26.548000] ata4.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 31/32)
[   26.628000] ata4.00: configured for UDMA/100
[   26.680000] scsi: waiting for bus probes to complete ...
[   26.744000] scsi 3:0:0:0: Direct-Access     ATA      Samsung SSD 840  5B0Q PQ: 0 ANSI: 5
[   27.252000] ata4.00: Enabling discard_zeroes_data
[   27.316000] sd 6:0:5:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)
[   27.476000] sd 6:0:5:0: [sda] Write Protect is off
[   27.540000] sd 6:0:5:0: [sda] Mode Sense: d3 00 10 08
[   27.540000] sd 6:0:6:0: [sdb] Spinning up disk...
[   27.552000] sd 3:0:0:0: [sdc] 250069680 512-byte logical blocks: (128 GB/119 GiB)
[   27.552000] sd 3:0:0:0: [sdc] Write Protect is off
[   27.552000] sd 3:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[   27.552000] sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   27.552000] ata4.00: Enabling discard_zeroes_data
[   27.884000]  sdc: sdc1 sdc2 < sdc5 >
[   28.004000] ata4.00: Enabling discard_zeroes_data
[   28.096000] sd 3:0:0:0: [sdc] Attached SCSI disk
[   28.152000] sd 6:0:5:0: Attached scsi generic sg0 type 0
[   28.152000] sd 6:0:5:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
[   28.240000]  sda: sda1 sda2 sda3 < sda5 sda6 >
[   28.344000] sd 6:0:5:0: [sda] Attached SCSI disk
[   28.440000] sd 6:0:6:0: Attached scsi generic sg1 type 0
[   28.504000] sd 3:0:0:0: Attached scsi generic sg2 type 0
[   29.156000] ..........ready
[   38.216000] sd 6:0:6:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)
[   38.308000] sd 6:0:6:0: [sdb] Write Protect is off
[   38.368000] sd 6:0:6:0: [sdb] Mode Sense: d3 00 10 08
[   38.368000] sd 6:0:6:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[   38.496000]  sdb: sdb1 sdb2
[   38.548000] sd 6:0:6:0: [sdb] Attached SCSI disk
[   39.880000] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
[   40.604000] systemd[1]: systemd 215 running in system mode. (+PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP -APPARMOR)
[   40.764000] systemd[1]: Detected architecture 'parisc64'.
[   41.064000] systemd[1]: Inserted module 'autofs4'
[   41.128000] systemd[1]: Set hostname to <wills>.
[   41.768000] systemd[1]: Cannot add dependency job for unit dbus.socket, ignoring: Unit dbus.socket failed to load: No such file or directory.
[   41.924000] systemd[1]: Cannot add dependency job for unit display-manager.service, ignoring: Unit display-manager.service failed to load: No such file or directory.
[   42.100000] systemd[1]: Expecting device dev-ttyS0.device...
[   42.252000] systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
[   42.344000] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   42.436000] systemd[1]: Starting Remote File Systems (Pre).
[   42.592000] systemd[1]: Reached target Remote File Systems (Pre).
[   42.664000] systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
[   42.760000] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   42.856000] systemd[1]: Starting Paths.
[   42.976000] systemd[1]: Reached target Paths.
[   43.028000] systemd[1]: Starting Encrypted Volumes.
[   43.176000] systemd[1]: Reached target Encrypted Volumes.
[   43.240000] systemd[1]: Starting Arbitrary Executable File Formats File System Automount Point.
[   43.468000] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   43.580000] systemd[1]: Expecting device dev-disk-by\x2duuid-7b4abae5\x2d4940\x2d4b49\x2d9cce\x2d9a76bdf297ad.device...
[   43.824000] systemd[1]: Expecting device dev-disk-by\x2duuid-d01c8b13\x2d987c\x2d4eaa\x2dac16\x2d4a567841bbd6.device...
[   44.068000] systemd[1]: Expecting device dev-disk-by\x2duuid-ad9c6293\x2d6842\x2d4d30\x2d856b\x2db944974f9e3a.device...
[   44.312000] systemd[1]: Expecting device dev-disk-by\x2duuid-46c35a76\x2deec5\x2d4299\x2dbc6f\x2d8aa32fd5bcef.device...
[   44.556000] systemd[1]: Starting Root Slice.
[   44.720000] systemd[1]: Created slice Root Slice.
[   44.776000] systemd[1]: Starting User and Session Slice.
[   44.932000] systemd[1]: Created slice User and Session Slice.
[   45.000000] systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
[   45.188000] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[   45.272000] systemd[1]: Starting Delayed Shutdown Socket.
[   45.428000] systemd[1]: Listening on Delayed Shutdown Socket.
[   45.496000] systemd[1]: Starting Journal Socket (/dev/log).
[   45.656000] systemd[1]: Listening on Journal Socket (/dev/log).
[   45.728000] systemd[1]: Starting Syslog Socket.
[   45.864000] systemd[1]: Listening on Syslog Socket.
[   45.920000] systemd[1]: Starting udev Control Socket.
[   46.072000] systemd[1]: Listening on udev Control Socket.
[   46.136000] systemd[1]: Starting udev Kernel Socket.
[   46.280000] systemd[1]: Listening on udev Kernel Socket.
[   46.344000] systemd[1]: Starting Journal Socket.
[   46.480000] systemd[1]: Listening on Journal Socket.
[   46.540000] systemd[1]: Starting Sockets.
[   46.660000] systemd[1]: Reached target Sockets.
[   46.712000] systemd[1]: Starting System Slice.
[   46.844000] systemd[1]: Created slice System Slice.
[   46.900000] systemd[1]: Starting File System Check on Root Device...
[   47.072000] systemd[1]: Starting system-systemd\x2dfsck.slice.
[   47.236000] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   47.320000] systemd[1]: Starting system-getty.slice.
[   47.380000] systemd[1]: Created slice system-getty.slice.
[   47.444000] systemd[1]: Starting system-serial\x2dgetty.slice.
[   47.532000] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   47.624000] systemd[1]: Mounting POSIX Message Queue File System...
[   47.720000] systemd[1]: Starting Create list of required static device nodes for the current kernel...
[   47.848000] systemd[1]: Mounted Huge Pages File System.
[   47.924000] systemd[1]: Starting udev Coldplug all Devices...
[   48.016000] systemd[1]: Mounting Debug File System...
[   48.108000] systemd[1]: Started Set Up Additional Binary Formats.
[   48.212000] systemd[1]: Starting Load Kernel Modules...
[   48.292000] systemd[1]: Starting Journal Service...
[   48.376000] systemd[1]: Started Journal Service.
[   49.752000] systemd-udevd[180]: starting version 215
[   50.028000] EXT4-fs (sda5): re-mounted. Opts: errors=remount-ro
[   51.564000] nouveau 0000:80:00.0: enabling SERR and PARITY (0107 -> 0147)
[   52.220000] nouveau  [  DEVICE][0000:80:00.0] BOOT0  : 0x043000a4
[   52.292000] nouveau  [  DEVICE][0000:80:00.0] Chipset: NV43 (NV43)
[   52.368000] nouveau  [  DEVICE][0000:80:00.0] Family : NV40
[   52.612000] nouveau 0000:80:00.0: Invalid ROM contents
[   52.700000] nouveau ![   VBIOS][0000:80:00.0] unable to locate usable image
[   52.800000] nouveau E[  DEVICE][0000:80:00.0] failed to create 0x10000001, -22
[   52.904000] nouveau E[     DRM] failed to create 0x00000080, -22
[   53.008000] nouveau: probe of 0000:80:00.0 failed with error -22
[   53.472000] Adding 2657276k swap on /dev/sda6.  Priority:-1 extents:1 across:2657276k FS
[   53.804000] Adding 4194300k swap on /dev/sdb1.  Priority:-2 extents:1 across:4194300k FS
[   55.188000] EXT4-fs (sdb2): mounted filesystem with ordered data mode. Opts: (null)
[   55.316000] EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
[   55.412000] EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
[   56.228000] systemd-journald[169]: Received request to flush runtime journal from PID 1
[   56.920000] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   56.992000] e1000: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
[   57.088000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

