Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx1.corp.harris.com (mlbmx1.corp.harris.com [137.237.90.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6470482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 09:06:56 -0600 (MDT)
Message-ID: <8D4C69676E66D511A1CB00508BBBB19216273C@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Helge Deller' <helge.deller@sap.com>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
Date: Thu, 30 Aug 2001 11:06:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi,

no luck with aumix. "Error opening mixer".
I expected that because i get Error-Messages about problems with getting irq at
bootup, dmesg attached.

greetings
Wolfgang

Linux version 2.4.9-pa10 (root@ran-248-105) (gcc version 3.0.1 20010811 (Debian
prerelease)) #11 Thu Aug 30 14:47:54 CEST 2001
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
model	00003160 00000481 00000000 00000000 77d91f19 ffffffff 00000004 0000000a
0000000a
vers	00000013
CPUID	vers 0 rev 0
model	9000/715
Total Memory: 256 Mb
On node 0 totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Using Alex's odd 715/old exception, onboard graphics won't be inventoried!
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77
2. Scorpio Sr. Core BA (11) at 0xf082f000, versions 0x19, 0x0, 0x70
3. Scorpio Sr. Core SCSI (10) at 0xf0825000, versions 0x19, 0x0, 0x71
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000, versions 0x19, 0x0, 0x72
5. Scorpio Sr. Core HIL (10) at 0xf0821000, versions 0x19, 0x0, 0x73
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75
8. Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0, 0x74
9. Scorpio Sr. Audio (10) at 0xf1000000, versions 0x19, 0x0, 0x7b
10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76
11. Scorpio Sr.(715/75) (0) at 0xfffbe000, versions 0x316, 0x0, 0x4
12. Scorpio Sr. (1) at 0xfffbf000, versions 0x27, 0x0, 0x9
That's a total of 12 devices.
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0
Error reading tod clock
Console: colour dummy device 160x64
Calibrating delay loop... 74.75 BogoMIPS
Memory: 255600k available
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
Asp version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: keyboard found at id 2
HIL: keymap loaded.
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 91 B8 3A IRQ 87.
82596.c $Revision: 1.22 $
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST34520N          Rev: 1498
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 8888924 512-byte hdwr sectors (4551 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
busdevice_alloc_irq(0x102cc664): No known LASI/ASP/WAX owns device at 0xf1000000
!
harmony_driver_callback: problem getting irq
Warning : device (10, 0x19, 0x0, 0x7b) NOT claimed by Lasi Harmony
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 120476k swap-space (priority -1)
eth0: link ok.


> -----Original Message-----
> From:	Helge Deller [SMTP:helge.deller@sap.com]
> Sent:	Thursday, August 30, 2001 4:53 PM
> To:	Pedot, Wolfgang; 'Parisc Linux Mailinglist'
> Subject:	Re: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
> 
> On Thursday 30 August 2001 15:20, Pedot, Wolfgang wrote:
> > Hi,
> >
> > at last kernel 2.4.9-pa10 worked on my 715/75 but I still can´t use the
> > sound-chip although the CVS-Log for harmony.c says
> > "- harmony.c: support all kinds of 712/715 machines again" for Revision
> > 1.13. Anybody had any luck using the soundchip on a 715 machine?
> >
> > greetings
> > Wolfgang Pedot
> 
> Hi Wolfgang,
> 
> congrats for your success!
> 
> Regarding the harmony sound-driver: please set your output-level with
> aumix and play a .mp3 file with mpg123. This worked for me on a 715/64.
> If not feel free to send me your dmesg to <deller@gmx.de> so I could try 
> to analyze it.
> 
> Greetings,
> Helge
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
