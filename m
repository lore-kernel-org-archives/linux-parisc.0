Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (dns1.rz.fh-heilbronn.de [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92D8C4841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 12:30:11 -0600 (MDT)
Received: from lisa.stud.fh-heilbronn.de (lisa.stud.fh-heilbronn.de [141.7.11.14])
	by dns1.rz.fh-heilbronn.de (8.12.2/8.12.2) with ESMTP id g8MIU8h7010617
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 20:30:08 +0200 (MET DST)
Received: from acid (acid.stuwo.fh-heilbronn.de [141.7.150.31])
	by lisa.stud.fh-heilbronn.de (8.12.2/8.12.2) with SMTP id g8MIU7kc025556
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 20:30:08 +0200 (MEST)
Message-ID: <03ab01c26266$2416dea0$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 22 Sep 2002 20:30:34 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_03A8_01C26276.E71F5B10"
Subject: [parisc-linux] RTC and FB on 735/125
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

------=_NextPart_000_03A8_01C26276.E71F5B10
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit

Hi,

i have a 'new' 735/125 workstation, which I run Debian 3.0 on.
hp735# uname -a
Linux hp735 2.4.19-32 #1 Tue Aug 20 03:25:39 MDT 2002 parisc unknown unknown
GNU/Linux

1st problem I have is the Real Time Clock. On boot I get the following
messages:

System Time was Thu Jan 1 00:00:10 UTC 1970
Setting the System Clock using the Hardware Clock as reference...
RTC_RD_TIME: Bad address
ioctl() to /dev/rtc read the time failed.
System Clock set. System local time is now Thu Jan 1 00:00:13 UTC 1970.

so i'm damned back to the 70' every boot time...

2nd problem is I can't start X. I'm using Helge Deller's XFConfig-4 from
ftp.p-l.org and just changed Depth from 8 to 24 bpp.

(EE) FBDev(0): FBIOPUT_VSCREENINFO: Invalid argument

Fatal server error:
AddScreen/ScreenInit failed for driver 0

Is the Coral SGC Graphics supported?
I've attached dmesg and XFree86.0.log .

Thanks for your help
Yves...

------=_NextPart_000_03A8_01C26276.E71F5B10
Content-Type: application/octet-stream;
	name="dmesg"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="dmesg"

Linux version 2.4.19-32 (root@j5k) (gcc version 3.0.4) #1 Tue Aug 20 =
03:25:39 MDT 2002=0A=
FP[0] enabled: Rev 1 Model 9=0A=
The 32-bit Kernel has started...=0A=
Determining PDC firmware type: Snake.=0A=
model 00002060 00000481 00000000 00000000 773bea94 ffffffff 00000004 =
0000000a 0000000a=0A=
vers  00000015=0A=
model 9000/735=0A=
Total Memory: 256 Mb=0A=
pagetable_init=0A=
On node 0 totalpages: 65536=0A=
zone(0): 65536 pages.=0A=
zone(1): 0 pages.=0A=
zone(2): 0 pages.=0A=
Kernel command line: root=3D/dev/sda3 HOME=3D/ console=3Dtty0 sti=3D1 =
sti_font=3DVGA8x16 TERM=3Dlinux palo_kernel=3D3/boot/vmlinux=0A=
Error reading tod clock=0A=
Console: colour dummy device 160x64=0A=
Calibrating delay loop... 124.51 BogoMIPS=0A=
Memory: 255920k available=0A=
Dentry cache hash table entries: 32768 (order: 6, 262144 bytes)=0A=
Inode cache hash table entries: 16384 (order: 5, 131072 bytes)=0A=
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)=0A=
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)=0A=
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)=0A=
Searching for devices...=0A=
Found devices:=0A=
1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77=0A=
2. Outfield Core BA (11) at 0xf082f000 [2], versions 0x9, 0x0, 0x70=0A=
3. Outfield Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x9, 0x0, 0x71=0A=
4. Outfield Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x9, =
0x0, 0x72=0A=
5. Outfield Core HIL (10) at 0xf0821000 [2/0/3], versions 0x9, 0x0, 0x73=0A=
6. Outfield Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x9, 0x0, =
0x75=0A=
7. Outfield Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x9, 0x0, =
0x75=0A=
8. Outfield Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x9, =
0x0, 0x74=0A=
9. Outfield FW SCSI (10) at 0xf0830000 [2/0/7], versions 0x9, 0x0, 0x7c=0A=
10. Outfield Audio (10) at 0xf1000000 [2/0/8], versions 0x9, 0x0, 0x7f=0A=
11. Snake Cheetah (735/130) (0) at 0xfffbe000 [8], versions 0x206, 0x0, =
0x4=0A=
12. Memory (1) at 0xfffbf000 [9], versions 0x37, 0x0, 0x9=0A=
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz=0A=
Cutoff version 4 at 0xf082f000 found.=0A=
LED (ASP-style) display at f0800020 registered=0A=
POSIX conformance testing by UNIFIX=0A=
Linux NET4.0 for Linux 2.4=0A=
Based upon Swansea University Computer Society NET3.039=0A=
Initializing RT netlink socket=0A=
Soft power switch support not available.=0A=
Starting kswapd=0A=
Journalled Block Device driver loaded=0A=
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).=0A=
parport_init_chip: enhanced parport-modes not supported.=0A=
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]=0A=
STI GSC/PCI graphics driver version 0.9=0A=
STI byte mode ROM at f8000000, hpa at f8000000=0A=
STI id 26d148ee-40a00499, conforms to spec rev. 8.02=0A=
STI device: HPA1439A=0A=
Console: switching to colour frame buffer device 160x64=0A=
fb0: stifb 1280x1024-32 frame buffer device, id: 26d148ee, mmio: =
0xf8100000=0A=
pty: 256 Unix98 ptys configured=0A=
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI enabled=0A=
ttyS00 at iomem 0xf0823800 (irq =3D 90) is a 16550A=0A=
ttyS01 at iomem 0xf0822800 (irq =3D 89) is a 16550A=0A=
lp0: using parport0 (interrupt-driven).=0A=
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)=0A=
Uniform Multi-Platform E-IDE driver Revision: 6.31=0A=
ide: Assuming 50MHz system bus speed for PIO modes; override with =
idebus=3Dxx=0A=
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize=0A=
loop: loaded (max 8 devices)=0A=
Found i82596 at 0xf0826000, IRQ 87=0A=
82596.c: MAC of HP700 LAN read from EEPROM=0A=
eth0: Couldn't get consistent shared memory=0A=
eth0: 82596 at 0xf0826000, 08 00 09 49 65 60 IRQ 87.=0A=
82596.c $Revision: 1.29 $=0A=
SCSI subsystem driver Revision: 1.00=0A=
53c700: consistent memory allocation failed=0A=
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com=0A=
scsi0: 53c700 rev 0 =0A=
scsi0 : LASI SCSI 53c700=0A=
  Vendor: MICROP    Model: 4110-09TBCU0322J  Rev: HT01=0A=
  Type:   Direct-Access                      ANSI SCSI revision: 02=0A=
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0=0A=
SCSI device sda: 2053880 512-byte hdwr sectors (1052 MB)=0A=
Partition check:=0A=
 sda: sda1 sda2 sda3=0A=
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xf1000000, IRQ 82=0A=
mice: PS/2 mouse device common for all mice=0A=
HP SDC: HP SDC at 0xf0821000, IRQ 94 (NMI IRQ 93)=0A=
HP SDC: New style SDC=0A=
HP SDC: Revision: 1820-4784=0A=
HP SDC: TI SN76494 beeper present=0A=
HP SDC: OKI MSM-58321 BBRTC present=0A=
HP SDC: Spunking the self test register to force PUP on next firmware =
reset.=0A=
HP SDC MLC: Registering the System Domain Controller's HIL MLC.=0A=
md: linear personality registered as nr 1=0A=
md: raid0 personality registered as nr 2=0A=
md: raid1 personality registered as nr 3=0A=
md: raid5 personality registered as nr 4=0A=
raid5: measuring checksumming speed=0A=
   8regs     :    92.400 MB/sec=0A=
   8regs_prefetch:    92.400 MB/sec=0A=
   32regs    :    90.800 MB/sec=0A=
   32regs_prefetch:    90.800 MB/sec=0A=
raid5: using function: 8regs_prefetch (92.400 MB/sec)=0A=
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27=0A=
md: Autodetecting RAID arrays.=0A=
md: autorun ...=0A=
md: ... autorun DONE.=0A=
NET4: Linux TCP/IP 1.0 for NET4.0=0A=
IP Protocols: ICMP, UDP, TCP, IGMP=0A=
IP: routing cache hash table of 2048 buckets, 16Kbytes=0A=
TCP: Hash tables configured (established 16384 bind 32768)=0A=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.=0A=
VFS: Mounted root (ext2 filesystem) readonly.=0A=
Freeing unused kernel memory: 264k freed=0A=
kernel BUG at slab.c:1130!=0A=
HIL KEYB: HIL keyboard found (did =3D 0xcf, lang =3D german)=0A=
input0: HIL keyboard on hil0=0A=
HIL PTR: HIL pointer device found (did: 0x68, axis: relative)=0A=
HIL PTR: HIL pointer has 3 buttons and 1 sets of 2 axes=0A=
input1: HIL mouse on hil0=0A=
Adding Swap: 249848k swap-space (priority -1)=0A=
eth0: link ok.=0A=

------=_NextPart_000_03A8_01C26276.E71F5B10
Content-Type: application/octet-stream;
	name="XFree86.0.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="XFree86.0.log"

=0A=
This is a pre-release version of XFree86, and is not supported in any=0A=
way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted=0A=
to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,=0A=
please check the latest version in the XFree86 CVS repository=0A=
(http://www.XFree86.Org/cvs)=0A=
=0A=
XFree86 Version 4.1.0.1 / X Window System=0A=
(protocol Version 11, revision 0, vendor release 6510)=0A=
Release Date: 21 December 2001=0A=
	If the server is older than 6-12 months, or if your card is=0A=
	newer than the above date, look for a newer version before=0A=
	reporting problems.  (See http://www.XFree86.Org/FAQ)=0A=
Build Operating System: Linux 2.4.16-64 parisc64 [ELF] =0A=
(=3D=3D) Log file: "/var/log/XFree86.0.log", Time: Thu Jan  1 01:44:53 =
1970=0A=
(=3D=3D) Using config file: "/etc/X11/XF86Config-4"=0A=
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,=0A=
         (++) from command line, (!!) notice, (II) informational,=0A=
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.=0A=
(=3D=3D) ServerLayout "Default Layout"=0A=
(**) |-->Screen "Default Screen" (0)=0A=
(**) |   |-->Monitor "Generic Monitor"=0A=
(**) |   |-->Device "Generic Video Card"=0A=
(**) |-->Input Device "Keyboard"=0A=
(=3D=3D) Keyboard: CustomKeycode disabled=0A=
(**) |-->Input Device "Mouse"=0A=
(WW) The directory "/usr/lib/X11/fonts/cyrillic" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/100dpi/" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/75dpi/" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/Type1" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/Speedo" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/100dpi" does not exist.=0A=
	Entry deleted from font path.=0A=
(WW) The directory "/usr/lib/X11/fonts/75dpi" does not exist.=0A=
	Entry deleted from font path.=0A=
(**) FontPath set to "unix/:7100,/usr/lib/X11/fonts/misc"=0A=
(=3D=3D) RgbPath set to "/usr/X11R6/lib/X11/rgb"=0A=
(--) using VT number 7=0A=
=0A=
(WW) Cannot open APM=0A=
(EE) No OS PCI support available=0A=
(II) Addressable bus resource ranges are=0A=
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]=0A=
	[1] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]=0A=
(II) OS-reported resource ranges:=0A=
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]=0A=
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]=0A=
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]=0A=
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]=0A=
(II) OS-reported resource ranges after removing overlaps with PCI:=0A=
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]=0A=
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]=0A=
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]=0A=
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]=0A=
(II) All system resource ranges:=0A=
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]=0A=
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]=0A=
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]=0A=
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]=0A=
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,=0A=
	mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400=0A=
(II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,=0A=
	pm2, pm, 300sx, 500tx, mx, delta=0A=
	S3VIdentify=0A=
(II) S3VIRGE: driver (version 1.6.13) for S3 ViRGE chipsets: virge, =
86C325,=0A=
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,=0A=
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,=0A=
	trio 3d/2x, 86C362, 86C368=0A=
(II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,=0A=
	SIS300, SIS630, SIS540=0A=
(II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,=0A=
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,=0A=
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,=0A=
	TwisterK=0A=
(II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320, =
cyber9388,=0A=
	cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,=0A=
	tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,=0A=
	providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d,=0A=
	cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,=0A=
	cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm=0A=
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,=0A=
	ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,=0A=
	ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300=0A=
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,=0A=
	3dfx Voodoo3, 3dfx Voodoo5=0A=
(II) FBDev: driver for framebuffer: fbdev, afb=0A=
(II) ATI: ATI driver (version 6.3.6) for chipsets: ati=0A=
(II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),=0A=
	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),=0A=
	ATI Rage 128 RL (AGP), ATI Rage 128 Pro PD (PCI),=0A=
	ATI Rage 128 Pro PF (AGP), ATI Rage 128 Pro PP (PCI),=0A=
	ATI Rage 128 Pro PR (PCI), ATI Rage 128 Mobility LE (PCI),=0A=
	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),=0A=
	ATI Rage 128 Mobility ML (AGP)=0A=
(II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),=0A=
	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),=0A=
	ATI Radeon VE (AGP)=0A=
(II) imstt: driver (version 1.0.0 for IMS TwinTurbo chipsets : imstt128,=0A=
	imstt3d=0A=
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic=0A=
(II) v4l driver for Video4Linux=0A=
	S3VProbe begin=0A=
(II) FBDev(0): using default device=0A=
(II) Running in FRAMEBUFFER Mode=0A=
(=3D=3D) FBDev(0): Depth 24, (=3D=3D) framebuffer bpp 24=0A=
(=3D=3D) FBDev(0): RGB weight 888=0A=
(=3D=3D) FBDev(0): Default visual is TrueColor=0A=
(=3D=3D) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)=0A=
(II) FBDev(0): Hardware:  (vidmem: 16384k)=0A=
(II) FBDev(0): Checking Modes against framebuffer device...=0A=
(II) FBDev(0): 	mode "1280x1024" ok=0A=
(II) FBDev(0): Checking Modes against monitor...=0A=
(--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)=0A=
(**) FBDev(0): Default mode "1280x1024": 108.0 MHz (scaled from 0.0 =
MHz), 64.0 kHz, 60.0 Hz=0A=
(II) FBDev(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 =
1025 1028 1066 +hsync +vsync=0A=
(++) FBDev(0): DPI set to (100, 100)=0A=
(**) FBDev(0): Using "Shadow Framebuffer"=0A=
(--) Depth 24 pixmap format is 24 bpp=0A=
(EE) FBDev(0): FBIOPUT_VSCREENINFO: Invalid argument=0A=
=0A=
Fatal server error:=0A=
AddScreen/ScreenInit failed for driver 0=0A=
=0A=
=0A=
When reporting a problem related to a server crash, please send=0A=
the full server output, not just the last messages.=0A=
This can be found in the log file "/var/log/XFree86.0.log".=0A=
Please report problems to submit@bugs.debian.org.=0A=
=0A=

------=_NextPart_000_03A8_01C26276.E71F5B10--
