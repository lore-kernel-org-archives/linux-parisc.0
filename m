From: Meelis Roos <mroos@linux.ee>
Subject: HPPA64: badness while freeing init memory
Date: Tue, 30 Sep 2008 13:16:34 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0809301312190.18858@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Just tried 2.6.27-rc8 on a freshly installed HP 9000 L1000-44. With 
current config it boots fine but emits two badness messages while 
freeing unused initial memory (dmesg below).

I'm not subscribed to linux-parisc so please CC: any discussion to me.

Linux version 2.6.27-rc8 (mroos@hernes) (gcc version 4.3.2 (GCC) ) #1 SMP Tue Sep 30 09:26:39 EEST 2008
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005c90 00000491 00000000 00000002 2353fbcb 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 17 rev 8 (0x00000228)
capabilities 0x1
model 9000/800/L1000-44
Total Memory: 3072 MB
initrd: 7f9c6000-7ffedd69
initrd: reserving 3f9c6000-3ffedd69 (mem_max c0000000)
On node 0 totalpages: 786432
free_area_init_node: node 0, pgdat 40407d40, node_mem_map 40ab3000
  Normal zone: 775680 pages, LIFO batch:31
SMP: bootstrap CPU ID is 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 775680
Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.27-rc8
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 3078400k/3145728k available (2491k kernel code, 66664k reserved, 1124k data, 260k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000000100000000   (3072 MB)
      .init : 0x000000004054c000 - 0x000000004058d000   ( 260 kB)
      .data : 0x000000004036eea8 - 0x0000000040488000   (1124 kB)
      .text : 0x0000000040100000 - 0x000000004036eea8   (2491 kB)
SLUB: Genslabs=12, HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=8
Calibrating delay loop... 878.18 BogoMIPS (lpj=4390912)
Mount-cache hash table entries: 256
Brought up 1 CPUs
net_namespace: 1536 bytes
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Rhapsody DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5c9, 0x00004 }
2. Rhapsody DC- 440 at 0xfffffffffffa6000 [166] { 0, 0x0, 0x5c9, 0x00004 }
3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x095, 0x00009 }
4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed32000 [0/1] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
8. Elroy PCI Bridge at 0xfffffffffed36000 [0/3] { 13, 0x0, 0x782, 0x0000a }
9. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
10. Elroy PCI Bridge at 0xfffffffffed3a000 [0/5] { 13, 0x0, 0x782, 0x0000a }
11. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
12. Elroy PCI Bridge at 0xfffffffffed3e000 [0/7] { 13, 0x0, 0x782, 0x0000a }
Enabling PDC_PAT chassis codes support v0.05
Releasing cpu 1 now, hpa=fffffffffffa6000
FP[1] enabled: Rev 1 Model 16
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
Whole cache flush 282944 cycles, flushing 4771840 bytes 816911 cycles
Setting cache flush threshold to 100000 (2 CPUs online)
SBA found Astro 2.1 at 0xfffffffffed00000
Elroy version TR4.0 (0x5) found at 0xfffffffffed30000
PCI: 0000:00:00.0 reg 10 io port: [0, 7f]
PCI: 0000:00:00.0 reg 14 32bit mmio: [0, 3ff]
PCI: 0000:00:00.0 reg 30 32bit mmio: [0, 3ffff]
PCI: 0000:00:01.0 reg 10 io port: [0, ff]
PCI: 0000:00:01.0 reg 14 64bit mmio: [0, 3ff]
PCI: 0000:00:01.0 reg 1c 64bit mmio: [0, 1fff]
pci 0000:00:01.0: supports D1
pci 0000:00:01.0: supports D2
PCI: 0000:00:01.1 reg 10 io port: [0, ff]
PCI: 0000:00:01.1 reg 14 64bit mmio: [f8020000, f80203ff]
PCI: 0000:00:01.1 reg 1c 64bit mmio: [f8040000, f8041fff]
pci 0000:00:01.1: supports D1
pci 0000:00:01.1: supports D2
PCI: 0000:00:02.0 reg 10 io port: [0, ff]
PCI: 0000:00:02.0 reg 14 32bit mmio: [0, ff]
PCI: 0000:00:02.0 reg 18 32bit mmio: [0, fff]
PCI: 0000:00:02.1 reg 10 io port: [0, ff]
PCI: 0000:00:02.1 reg 14 32bit mmio: [0, ff]
PCI: 0000:00:02.1 reg 18 32bit mmio: [0, fff]
PCI: 0000:00:04.0 reg 10 32bit mmio: [f8000000, f8000fff]
PCI: 0000:00:04.0 reg 14 io port: [0, 3f]
PCI: 0000:00:05.0 reg 10 32bit mmio: [0, fff]
PCI: 0000:00:05.0 reg 14 io port: [0, 3f]
Elroy version TR4.0 (0x5) found at 0xfffffffffed32000
Elroy version TR4.0 (0x5) found at 0xfffffffffed34000
NOTICE: Enabling PCI Arbitration
Elroy version TR4.0 (0x5) found at 0xfffffffffed36000
PCI: 0000:18:00.0 reg 10 io port: [0, 7f]
PCI: 0000:18:00.0 reg 14 32bit mmio: [0, 3ff]
PCI: 0000:18:00.0 reg 30 32bit mmio: [0, 3ffff]
Elroy version TR4.0 (0x5) found at 0xfffffffffed38000
NOTICE: Enabling PCI Arbitration
Elroy version TR4.0 (0x5) found at 0xfffffffffed3a000
NOTICE: Enabling PCI Arbitration
Elroy version TR4.0 (0x5) found at 0xfffffffffed3c000
NOTICE: Enabling PCI Arbitration
Elroy version TR4.0 (0x5) found at 0xfffffffffed3e000
NOTICE: Enabling PCI Arbitration
powersw: Soft power switch support not available.
NET: Registered protocol family 2
IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
NET: Registered protocol family 1
checking if image is initramfs... it is
Freeing initrd memory: 6303k freed
Chassis warnings not supported.
unwind_init: start = 0x403e4e84, end = 0x40407a14, entries = 8889
Performance monitoring counters enabled for Rhapsody DC- 440
msgmni has been set to 6026
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9a
Serial: 8250/16550 driver4 ports, IRQ sharing enabled
serial 0000:00:04.0: enabling device (0146 -> 0147)
0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
console handover: boot [ttyB0] -> real [ttyS0]
0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16550A
0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
serial 0000:00:05.0: enabling device (0140 -> 0143)
0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71) is a 16550A
Couldn't register serial port 0000:00:05.0: -28
brd: module loaded
mice: PS/2 mouse device common for all mice
TCP bic registered
NET: Registered protocol family 17
Freeing unused kernel memory: <0>------------[ cut here ]------------
Badness at kernel/smp.c:332

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 0000000040544b00 0000000040175674 0000000040494030
r04-07  000000004053cb00 000000004052f880 0000000000000000 0000000040410cf0
r08-11  00000000ff850460 0000000000000001 000000004052f880 0000000000000000
r12-15  0000000040410cf8 00000000000000fa 0000000000000000 00000000000000ff
r16-19  0000000040472550 000000004053fb00 000000004058a400 000000004058d000
r20-23  0000000000000000 000000004058d000 0000000040532ec0 0000000000000001
r24-27  0000000000000000 000000004052f880 0000000000000003 000000004053cb00
r28-31  000000000800000e 00000000ff8504a0 00000000ff850610 0000000000000000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401753c8 00000000401753cc
 IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000002fe14050460
 CPU:        0   CR30: 00000000ff850000 CR31: 0000000000008020
 ORIG_R28: 00000000ff8504e0
 IAOQ[0]: smp_call_function_mask+0x48/0x2c8
 IAOQ[1]: smp_call_function_mask+0x4c/0x2c8
 RP(r2): smp_call_function+0x2c/0x38
Backtrace:
 [<0000000040175674>] smp_call_function+0x2c/0x38
 [<0000000040151fc0>] on_each_cpu+0x28/0x68
 [<000000004011ad9c>] flush_data_cache+0x24/0x30
 [<000000004011a23c>] free_initmem+0x94/0x338
 [<00000000401193f4>] init_post+0x1c/0x228
 [<000000004054c4b4>] kernel_init+0x34c/0x380

------------[ cut here ]------------
Badness at kernel/smp.c:219

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Tainted: G        W
r00-03  000000ff0804ff0e 000000004053f300 00000000401754b0 000000004052f880
r04-07  000000004053cb00 0000000000000001 0000000000000000 0000000040410cf0
r08-11  00000000ff850460 0000000000000001 000000004052f880 0000000000000000
r12-15  0000000040410cf8 00000000000000fa 0000000000000000 00000000000000ff
r16-19  0000000040472550 000000004053fb00 000000004058a400 0000000000000038
r20-23  00000000ff850460 0000000000000000 00000000ff8504d8 0000000000000001
r24-27  0000000000000000 000000004052f880 0000000000000001 000000004053cb00
r28-31  000000000800000e 00000000ff8505e0 00000000ff8506d0 0000000000000000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040175298 000000004017529c
 IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000002fe14050650
 CPU:        0   CR30: 00000000ff850000 CR31: 0000000000008020
 ORIG_R28: 0000000040104084
 IAOQ[0]: smp_call_function_single+0x38/0x120
 IAOQ[1]: smp_call_function_single+0x3c/0x120
 RP(r2): smp_call_function_mask+0x130/0x2c8
Backtrace:
 [<00000000401754b0>] smp_call_function_mask+0x130/0x2c8
 [<0000000040175674>] smp_call_function+0x2c/0x38
 [<0000000040151fc0>] on_each_cpu+0x28/0x68
 [<000000004011ad9c>] flush_data_cache+0x24/0x30
 [<000000004011a23c>] free_initmem+0x94/0x338
 [<00000000401193f4>] init_post+0x1c/0x228
 [<000000004054c4b4>] kernel_init+0x34c/0x380

260k freed
SCSI subsystem initialized
sym53c8xx 0000:00:01.0: enabling device (0140 -> 0143)
sym0: <896> rev 0x5 at pci 0000:00:01.0 irq 67
sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
tulip 0000:00:00.0: enabling device (0140 -> 0143)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff8006000, 00:10:83:fe:9c:b0, IRQ 66.
sym53c8xx 0000:00:01.1: enabling device (0146 -> 0147)
sym1: <896> rev 0x5 at pci 0000:00:01.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
scsi 1:0:2:0: Direct-Access     SEAGATE  ST136403LC       HP01 PQ: 0 ANSI: 2
scsi target1:0:2: tagged command queuing enabled, command queue depth 16.
scsi target1:0:2: Beginning Domain Validation
scsi target1:0:2: asynchronous
scsi target1:0:2: wide asynchronous
scsi target1:0:2: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
scsi target1:0:2: Domain Validation skipping write tests
scsi target1:0:2: Ending Domain Validation
sym53c8xx 0000:00:02.0: enabling device (0140 -> 0143)
sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 68
sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.2.3
scsi 2:0:2:0: Direct-Access     SEAGATE  ST136403LC       HP01 PQ: 0 ANSI: 2
scsi target2:0:2: tagged command queuing enabled, command queue depth 16.
scsi target2:0:2: Beginning Domain Validation
scsi target2:0:2: asynchronous
scsi target2:0:2: wide asynchronous
scsi target2:0:2: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
scsi target2:0:2: Domain Validation skipping write tests
scsi target2:0:2: Ending Domain Validation
sym53c8xx 0000:00:02.1: enabling device (0140 -> 0143)
sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 69
sym3: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.2.3
scsi 3:0:2:0: CD-ROM            HP       DVD-ROM 304      2.00 PQ: 0 ANSI: 2
scsi target3:0:2: Beginning Domain Validation
scsi target3:0:2: asynchronous
scsi target3:0:2: FAST-20 SCSI 20.0 MB/s ST (50 ns, offset 16)
scsi target3:0:2: Domain Validation skipping write tests
scsi target3:0:2: Ending Domain Validation
tulip 0000:18:00.0: enabling device (0140 -> 0143)
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff9840000, 00:10:83:fb:99:c0, IRQ 72.
Driver 'sd' needs updating - please use bus_type methods
sd 1:0:2:0: [sda] 71132960 512-byte hardware sectors (36420 MB)
sd 1:0:2:0: [sda] Write Protect is off
sd 1:0:2:0: [sda] Mode Sense: 9f 00 10 08
sd 1:0:2:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 1:0:2:0: [sda] 71132960 512-byte hardware sectors (36420 MB)
sd 1:0:2:0: [sda] Write Protect is off
sd 1:0:2:0: [sda] Mode Sense: 9f 00 10 08
sd 1:0:2:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
 sda: sda1 sda2 sda3 < sda5<4>Driver 'sr' needs updating - please use bus_type methods
 sda6 >
sd 1:0:2:0: [sda] Attached SCSI disk
sd 2:0:2:0: [sdb] 71132960 512-byte hardware sectors (36420 MB)
sd 2:0:2:0: [sdb] Write Protect is off
sd 2:0:2:0: [sdb] Mode Sense: 9f 00 10 08
sd 2:0:2:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 2:0:2:0: [sdb] 71132960 512-byte hardware sectors (36420 MB)
sd 2:0:2:0: [sdb] Write Protect is off
sd 2:0:2:0: [sdb] Mode Sense: 9f 00 10 08
sd 2:0:2:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
 sdb: unknown partition table
sd 2:0:2:0: [sdb] Attached SCSI disk
sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 3:0:2:0: Attached scsi CD-ROM sr0
sd 1:0:2:0: Attached scsi generic sg0 type 0
sd 2:0:2:0: Attached scsi generic sg1 type 0
sr 3:0:2:0: Attached scsi generic sg2 type 5
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
udevd version 125 started
Adding 1349420k swap on /dev/sda6.  Priority:-1 extents:1 across:1349420k
EXT3 FS on sda5, internal journal
LASI 82596 driver - Revision: 1.30
loop: module loaded
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
eth0: no IPv6 routers present

-- 
Meelis Roos (mroos@linux.ee)
