From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 10:10:44 -0800
Message-ID: <1456078244.2340.4.camel@HansenPartnership.com>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
	 <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net>
	 <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de>
	 <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net>
	 <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net>
	 <1456026424.2268.5.camel@HansenPartnership.com>
	 <C6219E31-B9EA-4CD3-AD4A-76C5945E882D@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <C6219E31-B9EA-4CD3-AD4A-76C5945E882D@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2016-02-21 at 09:45 -0500, John David Anglin wrote:
> I tried HEAD this morning and problem is still present.  The warning
> in blk-merge.c occurs
> first followed by BUG:
> kernel BUG at drivers/scsi/scsi_lib.c:1097! 
> 
> Entire console output is shown below:

OK, this might actually be a clue.  I've attached my full boot below
for good measure.  There are two significant differences, firstly the
gcc version: you're 4.9 and I'm 4.5 and secondly the ata drivers.  I
have no ata drivers for the CD rom in my initrd (they caused problems a
while ago, so I have them blacklisted).  Can you take all the ata
drivers out of your initrd and see if you still get the panic.  If not,
we know where the fault is.

James

---

Command line for kernel: ' root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux-test'
Selected kernel: /vmlinux-test from partition 1
Selected ramdisk: /initrd.img-test from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 229872 mediaptr 0x1000
Segment 1 load 00139000 size 148016 mediaptr 0x3a000
Segment 2 load 00200000 size 8622768 mediaptr 0x5f000
Segment 3 load 00b00000 size 1583856 mediaptr 0x899000
Loading ramdisk 3119670 bytes @ 3fcf4000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Linux version 4.5.0-rc2 (jejb@ion) (gcc version 4.2.4 (Debian 4.2.4-6)) #1 SMP Fri Feb 5 17:20:38 PST 2016
[    0.000000] unwind_init: start = 0x409e92d0, end = 0x40a392b0, entries = 20478
[    0.000000] WARNING: Out of order unwind entry! 00000000409ed440 and 00000000409ed450
[    0.000000] WARNING: Out of order unwind entry! 00000000409ed450 and 00000000409ed460
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee160 and 00000000409ee170
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee170 and 00000000409ee180
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee1f0 and 00000000409ee200
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee200 and 00000000409ee210
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee210 and 00000000409ee220
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee220 and 00000000409ee230
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee230 and 00000000409ee240
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee240 and 00000000409ee250
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee250 and 00000000409ee260
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee260 and 00000000409ee270
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee270 and 00000000409ee280
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee280 and 00000000409ee290
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee2b0 and 00000000409ee2c0
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee2c0 and 00000000409ee2d0
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee2d0 and 00000000409ee2e0
[    0.000000] WARNING: Out of order unwind entry! 00000000409ee2e0 and 00000000409ee2f0
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00008870 00000491 00000000 00000002 3e0505e7352af710 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000301
[    0.000000] CPUID vers 20 rev 4 (0x00000284)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/800/rp3440  
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
[    0.000000] Total Memory: 2046 MB
[    0.000000] initrd: 7fcf4000-7ffeda36
[    0.000000] initrd: reserving 3fcf4000-3ffeda36 (mem_max 7fe00000)
[    0.000000] PERCPU: Embedded 18 pages/cpu @0000000042020000 s33328 r8192 d32208 u73728
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 515592
[    0.000000] Kernel command line:  root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux-test
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 2039128K/2095104K available (6156K kernel code, 2727K rwdata, 1214K rodata, 1024K init, 664K bss, 55976K reserved, 0K cma-reserved)
[    0.000000] virtual kernel memory layout:
    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    0.000000]     memory  : 0x0000000040000000 - 0x00000040bfe00000   (264190 MB)
    0.000000]       .init : 0x0000000040100000 - 0x0000000040200000   (1024 kB)
    0.000000]       .data : 0x0000000040803000 - 0x0000000040bdc8d0   (3942 kB)
    0.000000]       .text : 0x0000000040200000 - 0x0000000040803000   (6156 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] NR_IRQS:128
[    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0xb881be7834, max_idle_ns: 440795218296 ns
[    0.000000] Console: colour dummy device 160x64
[    0.004000] Calibrating delay loop... 1594.36 BogoMIPS (lpj=3188736)
[    0.028000] pid_max: default: 32768 minimum: 301
[    0.028000] Security Framework initialized
[    0.028000] Yama: becoming mindful.
[    0.028000] AppArmor: AppArmor disabled by boot time parameter
[    0.036000] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.036000] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.044000] Brought up 1 CPUs
[    0.044000] devtmpfs: initialized
[    0.052000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.076000] NET: Registered protocol family 16
[    0.076000] EISA bus registered
[    0.080000] Searching for devices...
[    0.212000] Found devices:
[    0.212000] 1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
[    0.212000] 2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
[    0.212000] 3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
[    0.220000] 4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
[    0.224000] 5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
[    0.232000] 6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    0.240000] 7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    0.240000] 8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
[    0.248000] 9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    0.256000] 10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    0.264000] 11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
[    0.272000] 12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
[    0.280000] 13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
[    0.280000] 14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    0.288000] Enabling PDC_PAT chassis codes support v0.05
[    0.912000] Releasing cpu 1 now, hpa=fffffffffe781000
[    0.960000] FP[1] enabled: Rev 1 Model 20
[    0.968000] Releasing cpu 2 now, hpa=fffffffffe798000
[    1.016000] FP[2] enabled: Rev 1 Model 20
[    1.024000] Releasing cpu 3 now, hpa=fffffffffe799000
[    1.084000] FP[3] enabled: Rev 1 Model 20
[    1.088000] CPU(s): 4 out of 4 PA8800 (Mako) at 800.010600 MHz online
[    1.100000] Setting cache flush threshold to 32768 kB
[    1.100000] Setting TLB flush threshold to 1436 kB
[    1.140000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    1.340000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    1.396000] LBA 0:0: PCI host bridge to bus 0000:00
[    1.396000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.396000] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
[    1.404000] pci_bus 0000:00: root bus resource [bus 00-07]
[    1.428000] Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
[    1.484000] LBA 0:1: PCI host bridge to bus 0000:20
[    1.484000] pci_bus 0000:20: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.484000] pci_bus 0000:20: root bus resource [mem 0xffffffff90000000-0xffffffff9fffffff] (bus address [0x90000000-0x9fffffff])
[    1.492000] pci_bus 0000:20: root bus resource [bus 20-27]
[    1.524000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    1.580000] LBA 0:2: PCI host bridge to bus 0000:40
[    1.580000] pci_bus 0000:40: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    1.580000] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    1.588000] pci_bus 0000:40: root bus resource [bus 40-47]
[    1.620000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    1.676000] LBA 0:3: PCI host bridge to bus 0000:60
[    1.676000] pci_bus 0000:60: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    1.676000] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    1.684000] pci_bus 0000:60: root bus resource [bus 60-67]
[    1.716000] Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
[    1.748000] LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new
[    1.772000] LBA 0:4: PCI host bridge to bus 0000:80
[    1.772000] pci_bus 0000:80: root bus resource [io  0x40000-0x4ffff] (bus address [0x0000-0xffff])
[    1.772000] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] (bus address [0xc0000000-0xdfffffff])
[    1.784000] pci_bus 0000:80: root bus resource [bus 80-87]
[    1.812000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
[    1.868000] LBA 0:6: PCI host bridge to bus 0000:c0
[    1.868000] pci_bus 0000:c0: root bus resource [io  0x50000-0x5ffff] (bus address [0x0000-0xffff])
[    1.872000] pci_bus 0000:c0: root bus resource [mem 0xffffffffe0000000-0xffffffffefffffff] (bus address [0xe0000000-0xefffffff])
[    1.880000] pci_bus 0000:c0: root bus resource [bus c0-c7]
[    1.912000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
[    1.944000] LBA: lmmio_space [0xfffffffff0000000-0xfffffffffe77ffff] - new
[    1.968000] LBA 0:7: PCI host bridge to bus 0000:e0
[    1.968000] pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
[    1.968000] pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
[    1.976000] pci_bus 0000:e0: root bus resource [bus e0-e7]
[    1.988000] powersw: Soft power switch support not available.
[    2.024000] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    2.048000] vgaarb: setting as boot device: PCI:0000:e0:02.0
[    2.048000] vgaarb: device added: PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
[    2.048000] vgaarb: loaded
[    2.048000] vgaarb: bridge control possible 0000:e0:02.0
[    2.056000] VFS: Disk quotas dquot_6.6.0
[    2.056000] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    2.068000] NET: Registered protocol family 2
[    2.092000] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
[    2.092000] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    2.092000] TCP: Hash tables configured (established 16384 bind 16384)
[    2.100000] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    2.100000] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    2.108000] NET: Registered protocol family 1
[    2.176000] Unpacking initramfs...
[    2.348000] Freeing initrd memory: 3044K (000000007fcf4000 - 000000007ffed000)
[    2.348000] Chassis warnings not supported.
[    2.348000] Performance monitoring counters enabled for Storm Peak Slow
[    2.352000] futex hash table entries: 2048 (order: 4, 65536 bytes)
[    2.356000] audit: initializing netlink subsys (disabled)
[    2.364000] audit: type=2000 audit(1456077963.364:1): initialized
[    2.364000] zbud: loaded
[    2.372000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    2.372000] io scheduler noop registered
[    2.376000] io scheduler deadline registered
[    2.376000] io scheduler cfq registered (default)
[    2.384000] PDC Stable Storage facility v0.30
[    2.432000] STI GSC/PCI core graphics driver Version 0.9b
[    2.432000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.476000] 0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 75, base_baud = 115200) is a 16550A
[    2.520000] 0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 75, base_baud = 115200) is a 16550A
[    2.520000] console [ttyS1] enabled
[    2.520000] console [ttyS1] enabled
[    2.524000] bootconsole [ttyB0] disabled
[    2.524000] bootconsole [ttyB0] disabled
[    2.552000] 0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 75, base_baud = 115200) is a 16550A
[    2.572000] 0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 75, base_baud = 115200) is a 16550A
[    2.572000] Linux agpgart interface v0.103
[    2.572000] quicksilver: No AGP devices found.
[    2.572000] [drm] Initialized drm 1.1.0 20060810
[    2.580000] mousedev: PS/2 mouse device common for all mice
[    2.588000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[    2.588000] ledtrig-cpu: registered to indicate activity on CPUs
[    2.620000] NET: Registered protocol family 10
[    2.620000] mip6: Mobile IPv6
[    2.620000] NET: Registered protocol family 17
[    2.620000] mpls_gso: MPLS GSO support
[    2.620000] registered taskstats version 1
[    2.628000] zswap: loaded using pool lzo/zbud
[    2.636000] rtc-generic rtc-generic: setting system clock to 2016-02-21 18:06:03 UTC (1456077963)
[    2.660000] Freeing unused kernel memory: 1024K (0000000040100000 - 0000000040200000)
Loading, please wait...
/scripts/init-top/udev: line 14: can't create /sys/kernel/uevent_helper: Permission denied
Begin: Loading essential drivers ... [    3.312000] SCSI subsystem initialized
[    3.880000] sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
[    3.884000] sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
[    3.924000] sym0: SCSI BUS has been reset.
[    3.924000] scsi host0: sym-2.2.3
[    4.124000] sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
[    4.128000] sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
[    4.168000] sym1: SCSI BUS has been reset.
[    4.168000] scsi host1: sym-2.2.3
[    6.936000] scsi 0:0:0:0: Direct-Access     HP 73.4G ST373405LC       HP03 PQ: 0 ANSI: 2
[    6.936000] scsi target0:0:0: tagged command queuing enabled, command queue depth 16.
[    6.936000] scsi target0:0:0: Beginning Domain Validation
[    6.956000] scsi target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[    6.972000] scsi target0:0:0: Ending Domain Validation
[    6.980000] scsi 0:0:1:0: Direct-Access     HP 73.4G MAX3073NC        HPC1 PQ: 0 ANSI: 3
[    6.980000] scsi target0:0:1: tagged command queuing enabled, command queue depth 16.
[    6.980000] scsi target0:0:1: Beginning Domain Validation
[    6.996000] scsi target0:0:1: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[    7.004000] scsi target0:0:1: Ending Domain Validation
[    7.816000] scsi 1:0:2:0: Direct-Access     HP 73.4G ST373405LC       HP03 PQ: 0 ANSI: 2
[    7.820000] scsi target1:0:2: tagged command queuing enabled, command queue depth 16.
[    7.820000] scsi target1:0:2: Beginning Domain Validation
[    7.840000] scsi target1:0:2: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
[    7.856000] scsi target1:0:2: Ending Domain Validation
[    8.936000] random: nonblocking pool is initialized
[   10.888000] sd 0:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)
[   10.888000] sd 0:0:1:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)
[   10.888000] sd 0:0:0:0: [sda] Write Protect is off
[   10.892000] sd 0:0:1:0: [sdb] Write Protect is off
[   10.892000] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   10.916000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   10.928000]  sdb: sdb1 sdb2 sdb3
[   10.968000]  sda: sda1 sda2 sda3
[   10.988000] sd 0:0:1:0: [sdb] Attached SCSI disk
[   10.996000] sd 0:0:0:0: [sda] Attached SCSI disk
[   11.428000] sd 1:0:2:0: [sdc] 143374738 512-byte logical blocks: (73.4 GB/68.4 GiB)
[   11.428000] sd 1:0:2:0: [sdc] Write Protect is off
[   11.432000] sd 1:0:2:0: [sdc] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   11.472000]  sdc: sdc1
[   11.500000] sd 1:0:2:0: [sdc] Attached SCSI disk
done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
error sending message: Connection refused
udevadm[129]: error sending message: Connection refused

Begin: Running /scripts/local-premount ... done.
[   12.300000] EXT4-fs (sda3): mounting ext3 file system using the ext4 subsystem
[   12.320000] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
Begin: Running /scripts/local-bottom ... done.
done.
Begin: Running /scripts/init-bottom ... done.
INIT: version 2.88 booting
Setting hostname to 'ion'...done.
udev requires hotplug support, not started. ... failed!
 failed!
Setting the system clock.
System Clock set to: Sun Feb 21 18:06:17 UTC 2016.
Activating swap:swapon on /dev/sda2
swapon: /dev/sda2: found swap signature: version 1, page-size 4, same byte order
swapon: /dev/sda2: pagesize=4096, swapsize=1028157440, devsize=1028160000
[   16.128000] Adding 1004056k swap on /dev/sda2.  Priority:-1 extents:1 across:1004056k FS
.
[   16.296000] EXT4-fs (sda3): re-mounted. Opts: (null)
Will now check root file system:fsck from util-linux-ng 2.17.2
[/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a -C0 /dev/sda3 
/dev/sda3: clean, 1959576/8814592 files, 10926496/17605231 blocks
.
[   16.616000] EXT4-fs (sda3): re-mounted. Opts: errors=remount-ro
Setting the system clock.
System Clock set to: Sun Feb 21 18:06:19 UTC 2016.
Cleaning up ifupdown....
Loading kernel module tg3.
WARNING: All config files need .conf: /etc/modprobe.d/arch, it will be ignored in a future release.
[   18.980000] pps_core: LinuxPPS API ver. 1 registered
[   18.980000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   19.092000] PTP clock support registered
[   19.384000] tg3.c:v3.137 (May 11, 2014)
[   20.904000] tg3 0000:20:02.0 eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:15:59
[   20.904000] tg3 0000:20:02.0 eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
[   20.912000] tg3 0000:20:02.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
[   20.912000] tg3 0000:20:02.0 eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
Will now activate lvm and md swap:done.
Will now check all file systems.
fsck from util-linux-ng 2.17.2
Checking all file systems.
[/sbin/fsck.ext2 (1) -- /boot] fsck.ext2 -a -C0 /dev/sda1 
/dev/sda1: clean, 55/64256 files, 153810/257008 blocks
Done checking file systems. A log is being saved in /var/log/fsck/checkfs if that location is writable..
Setting kernel variables ... /etc/sysctl.conf... /etc/sysctl.d/bindv6only.conf...done.
Will now mount local filesystems:[   21.568000] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
[   21.580000] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
mount: /sys already mounted or /sys busy
mount: according to mtab, sysfs is already mounted on /sys
 failed!
Will now activate swapfile swap:done.
Cleaning up temporary files...Cleaning /tmp...done.
Cleaning /var/run...done.
Cleaning /var/lock...done.
.
Checking minimum space in /tmp...done.
Running 0dns-down to make sure resolv.conf is ok...done.
Setting up networking....
/etc/network/options still exists and it will be IGNORED! Read README.Debian of netbase. ... (warning).
Configuring network interfaces...Internet Systems Consortium DHCP Client 4.1.1-P1
Copyright 2004-2010 Internet Systems Consortium.
All rights reserved.
For info, please visit https://www.isc.org/software/dhcp/

[   24.416000] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
Listening on LPF/eth0/00:30:6e:4b:15:59
Sending on   LPF/eth0/00:30:6e:4b:15:59
Sending on   Socket/fallback
