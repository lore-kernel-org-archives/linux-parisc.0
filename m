Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.xs4all.nl (smtp3.xs4all.nl [194.109.127.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8ED3482A
	for <parisc-linux@parisc-linux.org>; Wed, 29 Aug 2001 14:23:14 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp3.xs4all.nl (8.9.3/8.9.3) with ESMTP id WAA16142
	for <parisc-linux@parisc-linux.org>; Wed, 29 Aug 2001 22:22:42 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Wed, 29 Aug 2001 22:22:18 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <20010829222218.A20951@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] newborn
List-ID: <linux-parisc.vger.kernel.org>

It works! Thank you all so very much!!

Jurriaan

palo ipl 0.92 bame@c3k Wed Jun 20 11:49:11 MDT 2001
0/vmlinux32 2853588 bytes @ 0x44000
Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32    3846   83 ext2
3            3847    7661   83 ext2
4            7662    8678   82 swap

Command line: 'root=/dev/sda2 HOME=/ console=ttyS0 TERM=vt102'

Kernel: partition 2 file /boot/vmlinux-2.4.0
ext2 block size 4096
ext2_mount(partition 2) returns 0
ext2_open(/boot/vmlinux-2.4.0) = 3
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1606948 mediaptr 0x1000
Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
Linux version 2.4.0-32 (root@slab) (gcc version 3.0 (Debian)) #1 Thu Jun 28 11:49:00 BST 2001
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: Newer Box
model	000059d0 00000481 00000000 00000002 78017d2b 100000f0 00000008 000000b2 000000b2
vers	00000501
cpuid	000001d7
CPUID	vers 14 rev 23
model	9000/782/C200+
Total Memory: 512 Mb
On node 0 totalpages: 131072
zone(0): 131072 pages.
zone(1): 0 pages.
zone(2): 0 pages.
PDC reported no LCD or LED.
Searching for devices...
Found devices:
1. Raven U/L2 Dino RS-232 (10) at 0xf2003000, versions 0x6, 0x0, 0x8c, 0x0, 0x0
2. Raven+ w SE FWSCSI Core BA (11) at 0xffd00000, versions 0x56, 0x0, 0x81, 0x0, 0x0,  additional addresses: 0xffd0c000 0xffc00000 
3. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000, versions 0x56, 0x0, 0x8c, 0x0, 0x0
4. Raven+ w SE FWSCSI Core SCSI (10) at 0xffd06000, versions 0x56, 0x0, 0x82, 0x0, 0x0
5. Raven+ w SE FWSCSI Core Centronics (10) at 0xffd02000, versions 0x56, 0x0, 0x74, 0x0, 0x0,  additional addresses: 0xffd01000 0xffd03000 
6. Raven+ w SE FWSCSU Core Audio (10) at 0xffd04000, versions 0x56, 0x4, 0x7b, 0x0, 0x0
7. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08000, versions 0x56, 0x0, 0x84, 0x0, 0x0
8. Raven+ w SE FWSCSI Core PS/2 Port (10) at 0xffd08100, versions 0x56, 0x0, 0x84, 0x0, 0x0
9. U2-IOA BC GSC+ Port (7) at 0xf203f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
10. U2-IOA BC GSC+ Port (7) at 0xf103f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
11. Cujo PCI Bridge (13) at 0xf1000000, versions 0x682, 0x1, 0xa, 0x1, 0x0,  additional addresses: 0xf1800000 0xf6000000 
12. Dino PCI Bridge (13) at 0xf2000000, versions 0x680, 0x3, 0xa, 0x0, 0x0,  additional addresses: 0xf2800000 
13. U2-IOA BC Runway Port (12) at 0xfff88000, versions 0x580, 0xf, 0xb, 0x1, 0x50
14. U2-IOA BC Runway Port (12) at 0xfff8a000, versions 0x580, 0xf, 0xb, 0x1, 0x50
15. Raven U 200 (9000/780/C200) (0) at 0xfffa0000, versions 0x59d, 0x0, 0x4, 0x0, 0x81
16. Raven U 200 (1) at 0xfffb1000, versions 0x5d, 0x0, 0x9, 0x0, 0x0
That's a total of 16 devices.
CPU(s): 1 x PA8200 (PCX-U+) at 200.000000 MHz
Kernel command line: root=/dev/sda2 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 398.95 BogoMIPS
Memory: 513012k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
Dino version 3.1 (bridge mode) found at 0xf2000000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
PS/2 keyboard controller at 0xffd08000 (irq 133) found, no device attached.
PS/2 psaux controller at 0xffd08100 (irq 133) found, no device attached.

sticonsole_init: searching for STI ROMs
ccio found U2 I/O MMU at 0xfff88000
io_io_high: 0xf6000000 io_io_low: 0xf2000000
ccio found U2 I/O MMU at 0xfff8a000
ccio: Cujo 2.0 bug needs a work around
io_io_high: 0xf2000000 io_io_low: 0xf1000000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: enabling 8 loop devices
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xffd05800 (irq = 154) is a 16550A
ttyS01 at iomem 0xf2003800 (irq = 74) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Linux Tulip driver version 0.9.13 (January 2, 2001)
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:60:B0:B2:9E:BC, IRQ 64.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 152 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: 53c875 detected 
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 67
sym53c875-0: NCR clock is 40401KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf2ffe000
sym53c875-0: restart (scsi reset).
sym53c875-0: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.6b
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c875-0-<6,0>: tagged command queue depth set to 8
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 150, options 0
scsi1: Revision 0x2
scsi1: test 1 completed ok.
scsi1 : LASI/Simple 53c7xx
  Vendor: TOSHIBA   Model: CD-ROM XM-6201TA  Rev: 1037
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
sym53c875-0-<6,0>: wide: wide=1 chg=0.
sym53c875-0-<6,0>: wide msgout: 1-2-3-1.
sym53c875-0-<6,0>: wide msgin: 1-2-3-1.
sym53c875-0-<6,0>: wide: wide=1 chg=0.
sym53c875-0-<6,0>: sync msgout: 1-3-1-c-10.
sym53c875-0-<6,0>: sync msg in: 1-3-1-c-f.
sym53c875-0-<6,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Detected scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio rev. 0 at 0xffd04000, using IRQ 146
md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md.c: sizeof(mdp_super_t) = 4096
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
IP-Config: Incomplete network configuration information.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
INIT: version 2.78 booting
Activating swap...
Adding Swap: 1041400k swap-space (priority -1)
Checking root file system...
Parallelizing fsck version 1.20 (25-May-2001)
/dev/sda2: clean, 7165/488640 files, 38002/976640 blocks
Calculating module dependencies... done.
Loading modules: 
Checking all file systems...
Parallelizing fsck version 1.20 (25-May-2001)
Setting kernel variables.
Mounting local filesystems...
nothing was mounted
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Tue Mar 26 01:04:14 CET 2024

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting internet superserver: inetd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux testing/unstable pa8200 ttyS0

pa8200 login: root
Password: 
Last login: Sat Jan 16 00:48:17 2021 on ttyS0
Linux pa8200 2.4.0-32 #1 Thu Jun 28 11:49:00 BST 2001 parisc unknown
