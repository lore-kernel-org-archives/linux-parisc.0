Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delphi.at (unknown [62.173.143.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C72B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Apr 2002 06:36:05 -0600 (MDT)
Received: (from uucp@localhost)
	by delphi.at (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) id g3CCZvA29052
	for parisc-linux@lists.parisc-linux.org; Fri, 12 Apr 2002 14:35:57 +0200
Message-Id: <200204121235.g3CCZvA29052@delphi.at>
Content-Type: text/plain;
  charset="iso-8859-15"
Date: Fri, 12 Apr 2002 15:35:14 +0200
From: Hannes Wenzel <h.wenzel@delphi.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Network card
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hello,

I set up a Apollo Model 735/99 with parisc linux 0.9.3. Installation was ok, 
but I couldn't get the network card running. I don't know what card it is, 
only that it is an eisa card with bnc and aui interfaces.

I include in that message the startup message, hoping there is any hint for 
my problem. I would be very appreciated if I hear anything.

Booting from:     scsi.6.0     MICROP  2112

Hard booted.
palo ipl 0.96 root@smallone Sun Nov 11 23:23:30 UTC 2001

Partition Start(MB) End(MB) Id Type
1               1      15   f0 Palo
2              16    1001   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3122078 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently  used by firmware (serial).

Command line for kernel: 'root=/dev/sdb2 HOME=/ console=ttyS0 TERM=vt102'
Selected kernel: /boot/vmlinux from partition 2
Opening /boot/vmlinux
Opening /boot/vmlinux-2.4.9-32
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1618208 mediaptr 0x1000
Segment 1 load 0028c000 size 287728 mediaptr 0x18d000
Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000
Segment 3 load 00334000 size 8192 mediaptr 0x231000
Segment 4 load 00338000 size 32768 mediaptr 0x233000
Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov 30 
19FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model   00002030 00000481 00000000 00000000 78137887 ffffffff 00000004 
0000000a
vers    00000013
CPUID   vers 0 rev 0
model   9000/735
Total Memory: 208 Mb
pagetable_init
On node 0 totalpages: 53248
zone(0): 53248 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sdb2 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 98.71 BogoMIPS
Memory: 206764k available
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
Searching for devices...
Found devices:
1. Outfield Core BA (11) at 0xf082f000 [2], versions 0x9, 0x0, 0x70
2. Outfield Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x9, 0x0, 0x71
3. Outfield Core HIL (10) at 0xf0821000 [2/0/3], versions 0x9, 0x0, 0x73
4. Outfield Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x9, 0x0, 0x75
5. Outfield Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x9, 0x0, 0x75
6. Outfield Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x9, 0x0, 
0x74
7. Outfield FW SCSI (10) at 0xf0830000 [2/0/7], versions 0x9, 0x0, 0x7c
8. Outfield Audio (10) at 0xf1000000 [2/0/8], versions 0x9, 0x0, 0x7f
9. Outfield FDDI (10) at 0xf0831000 [2/0/9], versions 0x9, 0x0, 0x7d
10. Cobra EISA BA (11) at 0xfc000000 [4], versions 0x4, 0x0, 0x76
11. Hardball (735/99) (0) at 0xfffbe000 [8], versions 0x203, 0x0, 0x4
12. Hardball (1) at 0xfffbf000 [9], versions 0x19, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI 
enttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
Warning : device (10, 0x9, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: SONY      Model: CD-ROM CDU-76S    Rev: 1.1c
  Type:   CD-ROM                             ANSI SCSI revision: 02
  Vendor: QUANTUM   Model: FIREBALL1050S     Rev: 630C
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: MICROP    Model: 2112              Rev: 4024
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
Partition check:
 sda: sda1 sda2
SCSI device sdb: 2051460 512-byte hdwr sectors (1050 MB)
 sdb: sdb1 sdb2
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 3, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
sticonsole_init: searching for STI ROMs
BUG: Skipping previously registered driver: sti (native)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
INIT: version 2.84 booting
Activating swap.
Adding Swap: 124768k swap-space (priority -1)
Checking root file system...
fsck 1.25 (20-Sep-2001)
/dev/sdb2 was not cleanly unmounted, check forced.
/dev/sdb2: |=====                                                   |  8.8%   
/dSystem time was Fri Apr  5 13:29:19 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Fri Apr  5 13:28:53 UTC 2002.
Calculating module dependencies... done.
Loading modules: tun Universal TUN/TAP device driver 1.4 (C)1999-2001 Maxim 
Krasppp_async CSLIP: code copyright 1989 Regents of the University of 
California
PPP generic driver version 2.4.1
ppp_deflate PPP Deflate Compression module registered
ppp_synctty sk98lin sk98lin: Network Device Driver v4.06
Copyright (C) 2000-2001 SysKonnect GmbH.

Checking all file systems...
fsck 1.25 (20-Sep-2001)
Setting kernel variables.
Mounting local filesystems...
nothing was mounted
Running 0dns-down to make sure resolv.conf is ok...chmod: getting attributes 
of
done.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Fri Apr  5 13:29:08 UTC 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting internet superserver: inetd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Configuring the base system...

Using CD-ROM mount point /cdrom/
Identifying.. [6b8fd7bcb09f2b771ad6347a17d7a170-2]
Scanning Disc for index files..  Found 2 package indexes and 0 source indexes.
Found label 'Debian GNU/Linux 3.0 prerelease _Woody_ - Unofficial hppa 
Binary-1
This Disc is called:
 'Debian GNU/Linux 3.0 prerelease _Woody_ - Unofficial hppa Binary-1 
(20011205)'Reading Package Indexes... 0%Reading Package Indexes... 1%Reading 
Package IndexeWrote 581 records.
Writing new source list
Source List entries for this Disc are:
deb cdrom:[Debian GNU/Linux 3.0 prerelease _Woody_ - Unofficial hppa Binary-1 
(2Repeat this process for the rest of the CDs in your set.

- -- 
Hannes Wenzel                    E-mail: h.wenzel@delphi.at
DELPHI Software GesmbH           Web: http://www.delphi.at/
Consulting & IT-Services
Vivenotgasse 48
A-1120 Wien, Austria
____________________________________________________________________

Key fingerprint = 33A2 A4F8 E6B9 C83F 65EF  7FD9 A6C2 3EDF DD3B 2E59
____________________________________________________________________
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8tuKXpsI+3907LlkRAiS6AKCPISd49rpx64Fo8X08PjKFz7Fw7gCfQRUg
0v8aiVKkjKnWfZ/rjJEV30s=
=3T+o
-----END PGP SIGNATURE-----
