Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05B6C482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 08:50:03 -0700 (MST)
Received: from localhost (xam@localhost)
	by student.cs.ucc.ie (8.9.3/8.9.3) with ESMTP id PAA24633
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 15:50:24 GMT
Date: Tue, 18 Dec 2001 15:50:24 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.OSF.4.41.0112181415560.6043-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HP 9000/782/C240 up and running 0.9.3 (serial)
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

Hi all,
yesterday I successfully installed Debian 0.9.3 (full cd install)
on my C240! Since I don't have a good monitor that
even supports the 1024x768/75Hz of the HP (but just 72Hz),
I can't use STI (and stifb) yet.
The installation was nearly as easy as the first time I tried Linux/HPPA
(when you just had to extract the nfsroot-tarball on the harddisk ;)
I'll try the 0.9.3 on my HP9000/730 next week when I return to Germany
for christmas.

OT: I had some problems at the very beginning since
minicom on my SPARCstation LX (Suse 7.1) is broken
(serial port is working fine; I'll reinstall Linux on the
 Sun in a couple of days anyway ...)

Slightly OT and newbie question: I don't have any clue how to use debian.
I always created my own linux distributions (at least on Intel).
Since I don't have a internet connection here in Ireland at home (but a
permanent at work), I can't update the system very easily using apt-get
update/upgrade.
So where can I get the latest (post 0.9.3) debian updates (.debs) ?
Do you know a way to set up an proxy server so that i simply mirror
the debian pool system (for personal use) ?

Well, the C240 is just too heavy to bring it to the office (I don't
have a car). Moreover our sysadmins wouldn't be too happy to see a
new workstation on the net (without their permission).

Anyway, here is the dmesg (and more):



xam@beast:~$ uname -a
Linux beast 2.4.9-32 #1 Fri Nov 30 19:36:30 MST 2001 parisc unknown
xam@beast:~$ dmesg
Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov 30 19
:36:30 MST 2001
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model   00005990 00000481 00000000 00000002 77f75630 100000f0 00000008 000000b2
000000b2
vers    00000501
cpuid   000001d7
CPUID   vers 14 rev 23
model   9000/782/C240+
Total Memory: 512 Mb
pagetable_init
On node 0 totalpages: 131072
zone(0): 131072 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LED display at f0190001 registered
Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 470.22 BogoMIPS
Memory: 512860k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa
3. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/0/63], versions 0x6, 0x0, 0x8c
4. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000 [8/16], versions 0x56, 0x0, 0x8
1,  additional addresses: 0xffc00000
5. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x56
, 0x0, 0x74,  additional addresses: 0xffd03000
6. Raven+ w SE FWSCSU Core Audio (10) at 0xffd04000 [8/16/1], versions 0x56, 0x4
, 0x7b
7. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x56, 0x
0, 0x8c
8. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x56, 0x0,
 0x82
9. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x56,
 0x0, 0x84
10. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x56
, 0x0, 0x84
11. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
12. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
13. Cujo PCI Bridge (13) at 0xf1000000 [10/0], versions 0x682, 0x1, 0xa,  additi
onal addresses: 0xf6000000
14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
15. Raven U 240 (9000/780/C240) (0) at 0xfffa0000 [32], versions 0x599, 0x0, 0x4
16. Raven U 240 (1) at 0xfffb1000 [49], versions 0x6f, 0x0, 0x9
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
ccio found U2 at 0xfff88000
io_io_low: 0xf2000000
17. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa
18. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/0/63], versions 0x6, 0x0, 0x8c
19. Raven U/L2 Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, 0x0, 0x96
20. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000 [8/16], versions 0x56, 0x0, 0x
81,  additional addresses: 0xffc00000
21. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x5
6, 0x0, 0x74,  additional addresses: 0xffd03000
22. Raven+ w SE FWSCSU Core Audio (10) at 0xffd04000 [8/16/1], versions 0x56, 0x
4, 0x7b
23. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x56, 0
x0, 0x8c
24. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x56, 0x0
, 0x82
25. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x56
, 0x0, 0x84
26. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x56
, 0x0, 0x84
27. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
ccio found U2 at 0xfff8a000
io_io_low: 0xf1000000
28. Cujo PCI Bridge (13) at 0xf1000000 [10/0], versions 0x682, 0x1, 0xa,  additi
onal addresses: 0xf6000000
29. Dino RS-232 (10) at 0xf1003000 [10/3], versions 0x7, 0x0, 0x8c
30. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xf2000000
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI PCI ROM enabled at 0xf1e00000
PCI graphic ROM found at f1e00000 (2048 kB), fb @ f6000000 (32 MB)
PCI region 0: f6000000 with 32768 kB
PCI region 1: 00000000 with 0 kB
PCI region 2: 00000000 with 0 kB
PCI region 3: 00000000 with 0 kB
PCI region 4: 00000000 with 0 kB
PCI region 5: 00000000 with 0 kB
PCI region 6: f1e00000 with 2048 kB
PCI region 7: 00000000 with 0 kB
PCI region 8: 00000000 with 0 kB
PCI region 9: 00000000 with 0 kB
PCI region 10: 00000000 with 0 kB
PCI region 11: 00000000 with 0 kB
Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
I'm not trying to set up the PCI graphic card now... It would freeze your machin
e
Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard Company)'
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI en
abled
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf2003800 (irq = 106) is a 16550A
ttyS02 at iomem 0xf1003800 (irq = 170) is a 16550A
Lasi PS/2 receive buffer timeout
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
Lasi PS/2 transmit buffer timeout
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre6 (July 2, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 7809 advertising 0101.
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:10:83:03:2C:1C, IRQ 96.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: 53c875 detected
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
sym53c875-0: ID 7, Fast-20, Parity Checking
scsi0 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST34520WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
  Vendor: HP        Model: CD-Writer 6020    Rev: 1.07
  Type:   CD-ROM                             ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 4, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio rev. 6 at 0xffd04000, using IRQ 82
sticonsole_init: searching for STI ROMs
BUG: Skipping previously registered driver: sti (native)
STI PCI ROM enabled at 0xf1e00000
PCI graphic ROM found at f1e00000 (2048 kB), fb @ f6000000 (32 MB)
PCI region 0: f6000000 with 32768 kB
PCI region 1: 00000000 with 0 kB
PCI region 2: 00000000 with 0 kB
PCI region 3: 00000000 with 0 kB
PCI region 4: 00000000 with 0 kB
PCI region 5: 00000000 with 0 kB
PCI region 6: f1e00000 with 2048 kB
PCI region 7: 00000000 with 0 kB
PCI region 8: 00000000 with 0 kB
PCI region 9: 00000000 with 0 kB
PCI region 10: 00000000 with 0 kB
PCI region 11: 00000000 with 0 kB
Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
I'm not trying to set up the PCI graphic card now... It would freeze your machin
e
Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard Company)'
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 251492k swap-space (priority -1)
ip_tables: (c)2000 Netfilter core team
ip_conntrack (4006 buckets, 32048 max)
VFS: Disk change detected on device sr(11,0)
ISO 9660 Extensions: RRIP_1991A
ISO 9660 Extensions: RRIP_1991A
Lasi PS/2 transmit buffer timeout

do_page_fault() pid=5087 command='scrollkeeper_to' type=15 address=0x00000008

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 40250e70 00012003 00034640
r4-7     00023060 00000000 00000008 faf00788
r8-11    00000000 000aa708 000ac708 000ab3e8
r12-15   00000000 000ab548 ffffffff 00000000
r16-19   00000000 0009cd64 00000003 00000008
r20-23   0000000a 00000000 00000000 00000000
r24-27   00032640 00000001 00034640 000226e4
r28-31   00000000 00034638 faf00c80 00001630
sr0-3    000005fc 000005fc 00000000 000005fc
sr4-7    000005fc 000005fc 000005fc 000005fc

IASQ: 000005fc 000005fc IAOQ: 0001200f 00012013
 IIR: 0cb01093    ISR: 000005fc  IOR: 00000008
 CPU:        0   CR30: 1961c000 CR31: 10338000
 ORIG_R28: 01000001

do_page_fault() pid=14740 command='scrollkeeper_to' type=15 address=0x00000008

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 40250e70 00012003 00034640
r4-7     00023060 00000000 00000008 faf00788
r8-11    00000000 000aa708 000ac708 000ab3e8
r12-15   00000000 000ab548 ffffffff 00000000
r16-19   00000000 0009cd64 00000003 00000008
r20-23   0000000a 00000000 00000000 00000000
r24-27   00032640 00000001 00034640 000226e4
r28-31   00000000 00034638 faf00c80 00001630
sr0-3    00005fc1 00005fc1 00000000 00005fc1
sr4-7    00005fc1 00005fc1 00005fc1 00005fc1

IASQ: 00005fc1 00005fc1 IAOQ: 0001200f 00012013
 IIR: 0cb01093    ISR: 00005fc1  IOR: 00000008
 CPU:        0   CR30: 19e94000 CR31: 10338000
 ORIG_R28: 01000001
xam@beast:~$ more /proc/pci
PCI devices found:
  Bus  0, device  19, function  0:
    SCSI storage controller: Symbios Logic Inc. (formerly NCR) 53c875 (rev 4).
      IRQ 99.
      Master Capable.  Latency=255.  Min Gnt=17.Max Lat=64.
      I/O at 0xfe00 [0xfeff].
      Non-prefetchable 32 bit memory at 0xf2ffd000 [0xf2ffd0ff].
      Non-prefetchable 32 bit memory at 0xf2ffe000 [0xf2ffefff].
  Bus  0, device  20, function  0:
    Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 48)
.
      IRQ 96.
      Master Capable.  Latency=255.  Min Gnt=20.Max Lat=40.
      I/O at 0xff00 [0xff7f].
      Non-prefetchable 32 bit memory at 0xf2fff000 [0xf2fff07f].
  Bus  1, device   4, function  0:
    Display controller: PCI device 103c:1008 (Hewlett-Packard Company) (rev 2).
      IRQ 160.
      Master Capable.  Latency=255.
      Non-prefetchable 64 bit memory at 0xf6000000 [0xf7ffffff].
xam@beast:~$
