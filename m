Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail48.sdc1.sfba.home.com (femail48.sdc1.sfba.home.com [24.254.60.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0E8E482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 06:36:16 -0700 (MST)
Received: from w2kpro ([24.248.173.115]) by femail48.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with ESMTP
          id <20011213133609.OXTJ8989.femail48.sdc1.sfba.home.com@w2kpro>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 13 Dec 2001 05:36:09 -0800
From: "Edward Alfert" <edward@alfert.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] What keywords should I use to find the answer?
Date: Thu, 13 Dec 2001 08:37:20 -0500
Message-ID: <001101c183db$4be88290$0201a8c0@w2kpro>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <E16ERsF-0007tz-00@linuxlab.wdf.sap-ag.de>
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

Thanks for the reply... Following is the entire dmsg... 
I notice it twice says "I'm not trying to set up your PCI graphics card
now... It would freeze your machine."

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri
Nov 30 19
:36:30 MST 2001
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model   00005990 00000481 00000000 00000002 77ab680d 100000f0 00000008
000000b2 
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
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf,
0xb
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa
3. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/0/63], versions 0x6,
0x0, 0x8c
4. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000 [8/16], versions 0x56,
0x0, 0x8
1,  additional addresses: 0xffc00000 
5. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000 [8/16/0],
versions 0x56
, 0x0, 0x74,  additional addresses: 0xffd03000 
6. Raven+ w SE FWSCSU Core Audio (10) at 0xffd04000 [8/16/1], versions
0x56, 0x4
, 0x7b
7. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000 [8/16/4], versions
0x56, 0x
0, 0x8c
8. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000 [8/16/5], versions
0x56, 0x0,
 0x82
9. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000 [8/16/7],
versions 0x56,
 0x0, 0x84
10. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100 [8/16/8],
versions 0x56
, 0x0, 0x84
11. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1,
0xc
12. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf,
0xb
13. Cujo PCI Bridge (13) at 0xf1000000 [10/0], versions 0x682, 0x1, 0xa,
additi
onal addresses: 0xf6000000 
14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1,
0xc
15. Raven U 240 (9000/780/C240) (0) at 0xfffa0000 [32], versions 0x599,
0x0, 0x4
16. Raven U 240 (1) at 0xfffb1000 [49], versions 0x6f, 0x0, 0x9
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
ccio found U2 at 0xfff88000
io_io_low: 0xf2000000
17. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa
18. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/0/63], versions 0x6,
0x0, 0x8c
19. Raven U/L2 Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6,
0x0, 0x96
20. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000 [8/16], versions 0x56,
0x0, 0x
81,  additional addresses: 0xffc00000 
21. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000 [8/16/0],
versions 0x5
6, 0x0, 0x74,  additional addresses: 0xffd03000 
22. Raven+ w SE FWSCSU Core Audio (10) at 0xffd04000 [8/16/1], versions
0x56, 0x
4, 0x7b
23. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000 [8/16/4], versions
0x56, 0
x0, 0x8c
24. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000 [8/16/5], versions
0x56, 0x0
, 0x82
25. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000 [8/16/7],
versions 0x56
, 0x0, 0x84
26. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100 [8/16/8],
versions 0x56
, 0x0, 0x84
27. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1,
0xc
ccio found U2 at 0xfff8a000
io_io_low: 0xf1000000
28. Cujo PCI Bridge (13) at 0xf1000000 [10/0], versions 0x682, 0x1, 0xa,
additi
onal addresses: 0xf6000000 
29. Dino RS-232 (10) at 0xf1003000 [10/3], versions 0x7, 0x0, 0x8c
30. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1,
0xc
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
I'm not trying to set up the PCI graphic card now... It would freeze
your machin
e
Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard
Company)'
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI en
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
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:60:B0:D0:4D:57, IRQ 96.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: 53c875 detected 
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
sym53c875-0: ID 7, Fast-20, Parity Checking
scsi0 : sym53c8xx-1.7.3c-20010512
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi1: (2:0) Synchronous at offset 8, period 100ns
  Vendor: TOSHIBA   Model: CD-ROM XM-6201TA  Rev: 1037
  Type:   CD-ROM                             ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio rev. 31 at 0xffd04000, using IRQ 82
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
I'm not trying to set up the PCI graphic card now... It would freeze
your machin
e
Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard
Company)'
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
Adding Swap: 498872k swap-space (priority -1)
eth0: Setting full-duplex based on MII#1 link partner capability of
45e1.
VFS: Disk change detected on device sr(11,0)
ISO 9660 Extensions: RRIP_1991A
ISO 9660 Extensions: RRIP_1991A
Lasi PS/2 transmit buffer timeout
-----Original Message-----
From: Helge Deller [mailto:helge.deller@sap.com] 
Sent: Thursday, December 13, 2001 4:10 AM
To: Edward Alfert
Subject: Re: [parisc-linux] What keywords should I use to find the
answer?


On Thursday 13 December 2001 05:42, Edward Alfert wrote:
> ?) Does 0.9.3 support the graphics card on a c240? Or only serial?

Hi Edward,

You maybe should have mentioned the name of the graphic card in 
your machine.
Boot up in serial-console mode and give us the inventory listing (or the
whole
dmesg) which the pa-kernel prints right at the beginning.

Greetings,
Helge
