Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hottub.hottub.org (hottub.org [66.60.164.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 469454829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Nov 2002 10:12:44 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by hottub.hottub.org (Postfix) with ESMTP id 0294E213BB
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Nov 2002 09:10:56 -0800 (PST)
Date: Tue, 5 Nov 2002 09:10:55 -0800 (PST)
From: Matthew Zahorik <matt@hottub.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.GSO.4.40.0211050848330.17389-100000@hottub>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] J6700 64-bit hang on boot
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I've just compiled 2.4.19-pa24 as an SMP 64-bit kernel and it hangs on
boot.

This is a J6700.  Kernel was compiled with the binutils/gcc 3.0 from
ftp.p-l.org/unofficial-debs/ (not 3.0.4)

The 32-bit UP and SMP kernels don't seem to hang, at least it didn't
happen during boot nor kernel compilation.  I simply checked on 64-bit
(without 32-bit PDC) and make clean/dep/vmlinux/modules/modules_install
moved it into place and rebooted.

Tried twice, hung at the same place [right after/during setserial]

Machine is back up now on the 32-bit SMP kernel without problems...

Given the machine has 16G of RAM I'd like to use 64-bit (:

Any pointers?

Thanks!

- Matt

-- snip kernel boot log --
Linux version 2.4.19-pa24 (root@debian-j6700) (gcc version 3.0) #2 SMP Tue Nov 5 11:13:41 EST 2002
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005dd0 00000491 00000000 00000002 78074db1 100000f0 00000008 000000b2 000000b2
vers  00000202
CPUID vers 19 rev 6 (0x00000266)
capabilities 0x7
model 9000/785/J6700
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 Mb
 1) Start 0x0000000100000000 End 0x00000003ffffffff Size  12288 Mb
Total Memory: 16128 Mb
pagetable_init
On node 0 totalpages: 4194304
zone(0): 4194304 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=2/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 1497.49 BogoMIPS
Memory: 16116144k available
Dentry cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 9, 2097152 bytes)
Mount-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Buffer-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfffffffffed00000 [10], versions 0x582, 0x0, 0xb
2. Elroy PCI Bridge (13) at 0xfffffffffed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfffffffffed34000 [10/2], versions 0x782, 0x0, 0xa
4. Elroy PCI Bridge (13) at 0xfffffffffed38000 [10/4], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [10/6], versions 0x782, 0x0, 0xa
6. Duet W2 (0) at 0xfffffffffffa0000 [32], versions 0x5dd, 0x0, 0x4
7. Duet W2 (0) at 0xfffffffffffa2000 [34], versions 0x5dd, 0x0, 0x4
8. Memory (1) at 0xfffffffffed10200 [49], versions 0xa, 0x0, 0x9
CPU(s): 2 x PA8700 (PCX-W2) at 750.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
POSIX conformance testing by UNIFIX
FP[1] enabled: Rev 1 Model 19
SMP: Total 2 of 2 processors activated (2995.00 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x2)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xfffffff0f0400804.
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 128)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 197 [PCSPP(,...)]
Performance monitoring counters enabled for Duet W2
Starting kswapd
Journalled Block Device driver loaded
STI GSC/PCI graphics driver version 0.9
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at port 0x03f8 (irq = 195) is a 16550A
ttyS01 at port 0x02f8 (irq = 196) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
NS87415: IDE controller on PCI bus 00 dev 70
NS87415: chipset revision 3
NS87415: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
hda: CD-224E, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 199
hda: ATAPI 24X CD-ROM drive, 128kB Cache
Uniform CD-ROM driver Revision: 3.12
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre11 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0x1000, 00:30:6E:1B:9B:1D, IRQ 130.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c896 detected
sym53c8xx: at PCI bus 0, device 15, function 1
sym53c8xx: 53c896 detected
sym53c896-0: rev 0x7 on pci bus 0 device 15 function 0 irq 129
sym53c896-0: ID 7, Fast-40, Parity Checking
sym53c896-0: handling phase mismatch from SCRIPTS.
sym53c896-1: rev 0x7 on pci bus 0 device 15 function 1 irq 129
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
  Vendor: FUJITSU   Model: MAJ3364MC         Rev: HP12
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: FUJITSU   Model: MAJ3364MC         Rev: HP12
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi1, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi1, channel 0, id 6, lun 0
sym53c896-1-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
SCSI device sdb: 71132960 512-byte hdwr sectors (36420 MB)
 sdb: unknown partition table
mice: PS/2 mouse device common for all mice
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  3465.200 MB/sec
   8regs_prefetch:  2782.000 MB/sec
   32regs    :  2822.000 MB/sec
   32regs_prefetch:  2659.600 MB/sec
raid5: using function: 8regs (3465.200 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 16384 buckets, 768Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 306k freed
INIT: version 2.84 booting
Activating swap.
Adding Swap: 2097136k swap-space (priority -1)
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sda4: clean, 34219/2431680 files, 203484/4862976 blocks
EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,4), internal journal
System time was Tue Nov  5 16:42:33 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Tue Nov  5 16:40:50 UTC 2002.
Calculating module dependencies... done.
Loading modules:
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda2: clean, 20/24384 files, 17459/97280 blocks
Setting kernel variables.
Loading the saved-state of the serial devices...
Cannot set serial info: Device or resource busy
/dev/ttyS0 at 0  [ hangs here ]
-- snip kernel boot log --

-- snip ser pim --
Main Menu: Enter command > ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)

HPMC Chassis Codes = 2cbf0  2500b  2cbfb

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  000000001034bda0  00000000000f4000
04-07   000000004fd4a350  0000000000000010  000000004fd4a000  0000000000000000
08-11   0000000000000002  000000004fd4a00c  000000004fd4a050  0000000010323010
12-15   0000000000000000  0000000010376c08  00000000102d2000  0000000000000038
16-19   000000000000000f  00000000103234d4  0000000010323010  00000000000f423f
20-23   000000000000000f  00000000f4005014  0000000000000001  00000000f4005000
24-27   00000000000f423f  00000000000bb800  0000000000000001  00000000102f0010
28-31   0000000000000000  7e11d60000001d4c  000000004fd60b00  0000000010201f40

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  00000000000000c0  0000000000000002
12-15   0000000000000000  0000000000000000  0000000000105000  00000000ffffffff
16-19   0000001900b79c56  0000000000000000  000000001034be68  000000000ea00013
20-23   00000000a607ffd0  c000000001405014  000000ff0004fe0d  0000000080000000
24-27   000000000030b000  000000000030b000  000000009fa16636  00000000a1fb4654
28-31   0000000006602606  0000000006602606  000000004fd60000  00000000103a0000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000001034be6c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff4005014
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  bd7d0898784bbae6  22ee19cc8bb0128a  78b88f0551920780
04-07   00001e8452694064  000000785614420c  00000000000e4de0  a8b315de3ac13662
08-11   891432eb620082d0  aa5ecbbd509a1352  85b867380e42abe0  2542db8bb4ad0418
12-15   1c9b2416bb93c48a  aeb0c6c54d144184  9249b4c2aa8cf112  8e1729e04d109010
16-19   2d0f11b663da7032  01153c00299b3142  03867492cd738f04  8833a120978a88c8
20-23   0edc76a0e232a402  80f2eeedb49a1482  1c081cf4b8824b08  22c43ef48e0e320c
24-27   75ae488380099214  5404242512500000  b21fc08801b81560  8346a5288dcd5a24
28-31   2618b9a49b48ddcc  ad989afc19d95f18  15139400c30a5a2e  900d7751fd1a1d9e


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041008000000
Available Memory             = 0x0000000400000000
CPU Diagnose Register 2      = 0x0202000000000004
CPU Status Register 0        = 0x2040c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0xc10080fff4005014
Read Short LOG               = 0xc18080fff4005014
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x4b97000082e02058
RUN_DATA_LOW                 = 0xd2f91bec8338201a
RUN_CTRL                     = 0x0000165800002a58
RUN_ADDR                     = 0xc13ff0f0f005b1a8
System Responder Path        = 0x00ffffff0a000f00


HPMC PIM Analysis Information:

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/0/15/0 (built-in PCI device).


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000


-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
CPU State                    = 0x00000000


-----------------  Processor 1 HPMC Information ------------------

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)

HPMC Chassis Codes = 2cbf0  25108  2cbf1  2cbfc

General Registers 0 - 31
00-03   0000000000000000  0000001900aa4059  0000000000000000  0000000000000000
04-07   0000000000001e23  fffffff0f0400008  00000000000000fa  fffffff0f0002f34
08-11   0000000000000008  0000000000000000  000000000000000a  fffffff0f00015e0
12-15   00000000000000f2  0000000000000001  0000000000000001  00000000000000f3
16-19   0000000002020202  0000000000000002  fffffff0f000016c  fffffff0f04120d1
20-23   0000000000000000  fffffff0f04120d0  0000000000000000  0000000000000000
24-27   0000000000000043  fffffff0f04120c0  fffffff0f0400880  fffffff0f0412000
28-31   0000000000000000  fffffff0f040af80  fffffff0f040af90  fffffffffffffff0

Control Registers 0 - 31
00-03   000000007fffffff  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0007e5ed0007aeb9  0001712e0005d8b9  0000000000000000  000000000000001e
12-15   00001d2c000540f6  00038d7600016738  000000f0f0003800  0000000000000000
16-19   0000001900b776ca  000000003fffffef  ffffffeff0001c14  0000000002e008a2
20-23   000000009a07c3c1  c00000007c1f00b8  0000000008000008  0000000000000000
24-27   b7f7f5edf7ffeea9  37b3f46df7ff8099  a0aab6c9073ca7ff  558611b4bdf3b1f1
28-31   b7f7f5edf7ffeeb9  5fffa53831fbb6be  b7f7f5edf7ffeeb9  b7f7f5edf7ffeeb9
Space Registers 0 - 7

00-03   00000000          402a0441          42480002          00000000
04-07   00000000          14918480          03200411          00040302

IIA Space                    = 0x000000003fffffef
IIA Offset                   = 0xffffffeff0001c18
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa2000
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  95bf5f67088d36c9  c93e6f9ec71c2463  2dd5ffffc9884908
04-07   404991fad4d3b83a  8253eec9d2f915b9  fe6bbfb95997cd64  b6b5cfba9c484ca8
08-11   a576ee93751c0d24  adfb94781e4a4512  af157e9eacc2ea22  bb10b4cd16347920
12-15   2bb9077b66c29ed4  bf44fa07b69d54f7  bb72c352a16d4a70  b1bee8f8e31cba5c
16-19   0f6cd6faf184659c  bf316442aa1c5c48  821639c8a41dc720  1bf02a77f6231b71
20-23   02b1bf10b597db02  0000070c08000028  9d4ce7aa13ba9dfc  fae3ca03726fcf04
24-27   a05b4e07f9a95182  07cdbcdc42ce269b  b988140fad3b1136  98c6f46766ca46b1
28-31   a437f9fd2c8bbb58  b896772db6214a60  fedbad5e616125c4  fdea9dd8718aaaf8


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xc381841008000000
Available Memory             = 0x0000000400000000
CPU Diagnose Register 2      = 0x0202010080802000
CPU Status Register 0        = 0x3040000000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000002
Read Short LOG               = 0xc13ff0f0f0005cf8
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x34793f810f2010e7
RUN_DATA_LOW                 = 0x0ce0107fd89705f0
RUN_CTRL                     = 0x00003c1800003c18
RUN_ADDR                     = 0xc13ff0f0f00591c8
System Responder Path        = 0x00ffffffffffffff


HPMC PIM Analysis Information:

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:

CPU 1 observed a Broadcast Error on the Runway Bus.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not log
any additional information about the HPMC.

-----------------  Processor 1 LPMC Information ------------------

Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000


-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  0000000000000000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
CPU State                    = 0x00000000


Memory Error Log Information:

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp =
  Sun Nov  3 04:40:29 GMT 2002    (20:02:11:03:04:40:29)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc249   0x00000000fed30048
   1    ----------   0x1e0cc009   ------------------
   2    0x00000000   0x2e0cc009   0x00000000fed34048
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
Main Menu: Enter command >
-- snip ser pim --

[note: The clock is set correctly within Debian, and the hang happened at
Nov 5 11:00am EST - I don't know if the Nov 3rd items are related ]
