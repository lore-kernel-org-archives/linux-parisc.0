Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AB24482A
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 12:09:03 -0600 (MDT)
Received: from hpgrla.gr.hp.com (gr.hp.com [15.57.1.1])
	by palrel13.hp.com (Postfix) with ESMTP id 56252400336
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 11:09:02 -0700 (PDT)
Received: from kontiki.gr.hp.com (kontiki.gr.hp.com [15.38.138.59])
	by hpgrla.gr.hp.com (8.9.3 (PHNE_25183)/8.9.3 SMKit7.01) with SMTP id MAA22951
	for <parisc-linux@parisc-linux.org>; Thu, 8 Aug 2002 12:09:01 -0600 (MDT)
Received: from [15.38.50.65] (HELO zaxxon) by kontiki.gr.hp.com (Stalker SMTP Server 1.8b8) with SMTP id S.0000038749 for <parisc-linux@parisc-linux.org>; Thu, 08 Aug 2002 12:08:55 -0600
Reply-To: <sanaya@gr.hp.com>
From: "Sean Anaya" <sanaya@gr.hp.com>
To: <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Booting Debian on an HP C180 workstation
Date: Thu, 8 Aug 2002 12:13:47 -0600
Message-ID: <000001c23f07$56c7f0a0$4132260f@gr.hp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01C23ED5.0C2F0740"
In-Reply-To: <20020730113848.GL29996@sleepie.demon.co.uk>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C23ED5.0C2F0740
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi All,

So I finally had a chance to install Debian 3.0 on my C180XP. So far looks
great, install was
far easier than the 0.9.3 CD, and I'm not seeing any of the file system
corruptions. However,
I'm still fighting a couple of battles.

1) where do you find the keywords to packages to install with apt-get
install <some package>?
   ie apt-get install xfree86  doesn't seem to work. I'd like to get the ftp
and telnet daemons
   working so I can ftp and telnet into my box, as well as X window system.

2) I'm still having trouble getting to system to boot with the monitor. The
boot sequence stops
   at "If this is the last message you see..." even tho the monitor flash a
couple of times.
   I have attached a log of the boot sequence when booting with a serial
console if that shows
   something helpful.

Any help would be most appreciated.

Thanks,

Sean Anaya
sanaya@gr.hp.com

------=_NextPart_000_0001_01C23ED5.0C2F0740
Content-Type: text/plain;
	name="bootup.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bootup.txt"




Firmware Version  6.1

Duplex Console IO Dependent Code (IODC) revision 1

-------------------------------------------------------------------------=
-----
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
-------------------------------------------------------------------------=
-----

  Processor   Speed            State           Coprocessor State  I/D =
Cache=20
  ---------  --------   ---------------------  -----------------  =
-------------
      0      180 MHz    Active                 Functional         1 MB/1 =
MB=0A=

  Central Bus Speed (in MHz) :        120=0A=

  Available memory (bytes)    : 536870912
  Good memory required (bytes):   76103680=20
=0A=
  Primary boot path:    FWSCSI.6.0=0A=
  Alternate boot path:  SESCSI.6.0=0A=
  Console path:         GRAPHICS(4)=0A=
  Keyboard path:        PS2=0A=

CPU 0=0A=
WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
=0A=

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Searching for device(s) with bootable media...
This may take several minutes.
=0A=
To discontinue search, press any key (termination may not be immediate).

Attempting to boot Primary Path...=0A=

BOOTABLE DEVICE FOUND:=0A=
   Path Number        Device Path              Device Type and Utilities
   -----------        -----------------        -------------------------
   P0                 FWSCSI.6.0               SEAGATE ST32171W        =0A=
                                               IPL=0A=

Booting...=20
Boot IO Dependent Code (IODC) revision 153


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002=0A=

Partition Start(MB) End(MB) Id Type=0A=
1               1      24   f0 Palo=0A=
5              25     267   82 swap=0A=
6             268    2046   83 ext2=0A=

PALO(F0) partition contains:=0A=
    0/vmlinux32 3687647 bytes @ 0x48000=0A=

Information: No console specified on kernel command line. This is normal.=0A=
PALO will choose the console currently used by firmware (serial).=0A=
Command line for kernel: 'root=3D/dev/sdb6 HOME=3D/ console=3DttyS0 =
TERM=3Dvt102 palo_ke
rnel=3D6/boot/vmlinux'=0A=
Selected kernel: /boot/vmlinux from partition 6=0A=
ELF32 executable=0A=
Entry 00100000 first 00100000 n 5=0A=
Segment 0 load 00100000 size 2024492 mediaptr 0x1000=0A=
Segment 1 load 002f0000 size 299320 mediaptr 0x1f0000=0A=
Segment 2 load 0033c000 size 401408 mediaptr 0x23a000=0A=
Segment 3 load 003a0000 size 32768 mediaptr 0x29c000=0A=
Segment 4 load 003c90f8 size 102032 mediaptr 0x2a40f8=0A=
Branching to kernel entry point 0x00100000.  If this is the last=0A=
message you see, you may need to switch your console.  This is=0A=
a common symptom -- search the FAQ and mailing list at parisc-linux.org=0A=

Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16 =
17:09:00 M
ST 2002=0A=
FP[0] enabled: Rev 0 Model 14=0A=
The 32-bit Kernel has started...=0A=
Determining PDC firmware type: System Map.=0A=
model 000059c0 00000481 00000000 00000002 780cc481 100000f0 00000008 =
000000b2 00
0000b2=0A=
vers  00000205=0A=
CPUID vers 14 rev 9 (0x000001c9)=0A=
model 9000/780/C180=0A=
Total Memory: 512 Mb=0A=
pagetable_init=0A=
On node 0 totalpages: 131072=0A=
zone(0): 131072 pages.=0A=
zone(1): 0 pages.=0A=
zone(2): 0 pages.=0A=
LED display at f0190001 registered=0A=
Kernel command line: root=3D/dev/sdb6 HOME=3D/ console=3DttyS0 =
TERM=3Dvt102 palo_kernel=3D
6/boot/vmlinux=0A=
Console: colour dummy device 160x64=0A=
Calibrating delay loop... 358.80 BogoMIPS=0A=
Memory: 513020k available=0A=
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)=0A=
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)=0A=
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)=0A=
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)=0A=
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)=0A=
Searching for devices...=0A=
Found devices:=0A=
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb=0A=
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x1, 0xa=0A=
3. Raven U/L2 Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, =
0x0, 0x96=0A=
4. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/3], versions 0x6, 0x0, =
0x8c=0A=
5. Raven U/L2 Core FW-SCSI (4) at 0xf200c000 [8/12], versions 0x3b, 0x0, =
0x89=0A=
6. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, =
0x81,  addi
tional addresses: 0xffd0c000 0xffc00000 =0A=
7. Raven U/L2 Core Centronics (10) at 0xffd02000 [8/16/0], versions =
0x3b, 0x0, 0
x74,  additional addresses: 0xffd01000 0xffd03000 =0A=
8. Raven U/L2 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3b, =
0x4, 0x7b=0A=
9. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, =
0x0, 0x8c=0A=
10. Raven U/L2 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3b, =
0x0, 0x82=0A=
11. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions =
0x3b, 0x0,
 0x8a=0A=
12. Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions =
0x3b, 0x0, 0
x84=0A=
13. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions =
0x3b, 0x0, 0
x84=0A=
14. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17, =
0x0, 0x8e=0A=
15. Raven Backplane Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x17, =
0x0, 0x7
3=0A=
16. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17, =
0x0, 0x8c=0A=
17. Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions =
0x17, 0x0,
 0x90,  additional addresses: 0xffc88000 0xfc00000b =0A=
18. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16, =
0x0, 0x85,
  additional addresses: 0xf0026000 =0A=
19. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, =
0xc=0A=
20. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, =
0xb=0A=
21. Coral SGC Graphics (10) at 0xf4000000 [10/12], versions 0x4, 0x0, =
0x77=0A=
22. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, =
0xc=0A=
23. Raven U 180 (9000/780/C180) (0) at 0xfffa0000 [32], versions 0x59c, =
0x0, 0x4=0A=
24. Memory (1) at 0xfffb1000 [49], versions 0x72, 0x0, 0x9=0A=
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz=0A=
Found U2 at 0xfff88000=0A=
Found U2 at 0xfff8a000=0A=
Lasi version 0 at 0xffd00000 found.=0A=
Wax at 0xffe00000 found.=0A=
Wax: HIL Keyboard-NMI registered.=0A=
Wax EISA Adapter found at 0xfc000000=0A=
EISA EEPROM at 0xffc88000=0A=
Enumerating EISA bus=0A=
EISA slot 1 a configured board was not detected ( expected ___FFFF)=0A=
Dino version 2.1 found at 0xf2000000=0A=
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit=0A=
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.=0A=
Systems shipped after Aug 20, 1997 will not exhibit this problem.=0A=
Models affected: C180, C160, C160L, B160L, and B132L workstations.=0A=

Dino: No PCI devices enabled.=0A=
POSIX conformance testing by UNIFIX=0A=
Linux NET4.0 for Linux 2.4=0A=
Based upon Swansea University Computer Society NET3.039=0A=
Initializing RT netlink socket=0A=
Enabled soft power switch (polling mode, io=3D0xf0140000).=0A=
Starting kswapd=0A=
Journalled Block Device driver loaded=0A=
parport_init_chip: initialize bidirectional-mode.=0A=
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]=0A=
STI word mode ROM at f0026000, hpa=3Dfa000000=0A=
STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.07=0A=
STI device: INTERNAL_EG_1280=0A=
STI byte mode ROM at f4000000, hpa=3Df4000000=0A=
STI byte mode ROM, id 2f8d570e-9a02587, conforms to spec rev. 8.05=0A=
STI device: HPA4246A=0A=
Console: switching to colour frame buffer device 160x64=0A=
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: =
0xfa100000=0A=
pty: 256 Unix98 ptys configured=0A=
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI en
abled=0A=
ttyS00 at iomem 0xffd05800 (irq =3D 90) is a 16550A=0A=
ttyS01 at iomem 0xf2003800 (irq =3D 121) is a 16550A=0A=
ttyS02 at iomem 0xffe02800 (irq =3D 121) is a 16550A=0A=
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.=0A=
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.=0A=
Found HIL at 0xffe01000, IRQ 126=0A=
HIL: no keyboard present.=0A=
lp0: using parport0 (interrupt-driven).=0A=
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)=0A=
block: 128 slots per queue, batch=3D32=0A=
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize=0A=
Uniform Multi-Platform E-IDE driver Revision: 6.31=0A=
ide: Assuming 50MHz system bus speed for PIO modes; override with =
idebus=3Dxx=0A=
loop: loaded (max 8 devices)=0A=
Found i82596 at 0xffd07000, IRQ 87=0A=
eth0: 82596 at 0xffd07000, 00 60 B0 18 03 7D IRQ 87.=0A=
82596.c $Revision: 1.28 $=0A=
SCSI subsystem driver Revision: 1.00=0A=
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35=0A=
ncr53c8xx: 53c720 detected=0A=
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential=0A=
scsi0 : ncr53c8xx-3.4.3b-20010512=0A=
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03=0A=
  Type:   Direct-Access                      ANSI SCSI revision: 02=0A=
  Vendor: SEAGATE   Model: ST32171W          Rev: HP03=0A=
  Type:   Direct-Access                      ANSI SCSI revision: 02=0A=
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com=0A=
scsi1: 53c710 rev 2 =0A=
scsi1 : LASI SCSI 53c700=0A=
scsi1: (2:0) Synchronous at offset 8, period 236ns=0A=
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036=0A=
  Type:   CD-ROM                             ANSI SCSI revision: 02=0A=
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0=0A=
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0=0A=
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)=0A=
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)=0A=
Partition check:=0A=
 sda: sda1 sda2 < sda5 >=0A=
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)=0A=
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)=0A=
 sdb: sdb1 sdb2 < sdb5 sdb6 >=0A=
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0=0A=
sr0: scsi-1 drive=0A=
Uniform CD-ROM driver Revision: 3.12=0A=
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 48 at 0xffd04000, IRQ 82=0A=
sticonsole_init: searching for STI ROMs=0A=
md: linear personality registered as nr 1=0A=
md: raid0 personality registered as nr 2=0A=
md: raid1 personality registered as nr 3=0A=
md: raid5 personality registered as nr 4=0A=
raid5: measuring checksumming speed=0A=
   8regs     :   394.800 MB/sec=0A=
   8regs_prefetch:   394.400 MB/sec=0A=
   32regs    :   306.800 MB/sec=0A=
   32regs_prefetch:   306.400 MB/sec=0A=
raid5: using function: 8regs (394.800 MB/sec)=0A=
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27=0A=
md: Autodetecting RAID arrays.=0A=
md: autorun ...=0A=
md: ... autorun DONE.=0A=
NET4: Linux TCP/IP 1.0 for NET4.0=0A=
IP Protocols: ICMP, UDP, TCP, IGMP=0A=
IP: routing cache hash table of 4096 buckets, 32Kbytes=0A=
TCP: Hash tables configured (established 32768 bind 65536)=0A=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.=0A=
VFS: Mounted root (ext2 filesystem) readonly.=0A=
NOT FREEING INITMEM (383k)=0A=
INIT: version 2.84 booting
Activating swap.
Adding Swap: 251432k swap-space (priority -1)=0A=
Adding Swap: 249200k swap-space (priority -2)=0A=
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sdb6: clean, 17334/228032 files, 56696/455374 blocks
System time was Thu Aug  8 17:56:28 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Thu Aug  8 17:56:23 UTC 2002.
Calculating module dependencies... done.
Loading modules:=20
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda1: clean, 14/493024 files, 15493/985397 blocks
Setting kernel variables.
Loading the saved-state of the serial devices...=20
Cannot set serial info: Address already in use
/dev/ttyS0 at 0x0000 (irq =3D 90) is a 16550A
Cannot set serial info: Address already in use
/dev/ttyS1 at 0x0000 (irq =3D 121) is a 16550A
Cannot set serial info: Address already in use
/dev/ttyS2 at 0x0000 (irq =3D 121) is a 16550A
Mounting local filesystems...
/dev/sda1 on /home type ext2 (rw)
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: link ok.=0A=
done.
Starting portmap daemon: portmap.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu Aug  8 11:56:34 MDT 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting NFS common utilities: statd.
Starting internet superserver: inetd.
Starting printer spooler: lpd.
OpenBSD Secure Shell server not in use (/etc/ssh/sshd_not_to_be_run)
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Starting web server: apache.

Debian GNU/Linux 3.0 icebox ttyS0

icebox login: 
------=_NextPart_000_0001_01C23ED5.0C2F0740--
