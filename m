Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from priv-edtnes16-hme0.telusplanet.net (defout.telus.net [199.185.220.240])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9007482A
	for <parisc-linux@parisc-linux.org>; Mon, 20 May 2002 20:36:41 -0600 (MDT)
Received: from taz.ab.hsia.telus.net ([66.222.219.199])
          by priv-edtnes16-hme0.telusplanet.net
          (InterMail vM.5.01.04.02 201-253-122-122-102-20011128) with ESMTP
          id <20020521023638.XXWB17327.priv-edtnes16-hme0.telusplanet.net@taz.ab.hsia.telus.net>
          for <parisc-linux@parisc-linux.org>;
          Mon, 20 May 2002 20:36:38 -0600
From: Bob Corner <bcorner@telusplanet.net>
To: parisc-linux@parisc-linux.org
Content-Type: multipart/mixed; boundary="=-Sc9Di8tYQ68vV83PA33C"
Date: 20 May 2002 20:36:45 -0600
Message-Id: <1021948605.2030.15.camel@taz.ab.hsia.telus.net>
Mime-Version: 1.0
Subject: [parisc-linux] X on my machine?
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

--=-Sc9Di8tYQ68vV83PA33C
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I'm having a little trouble installing the PARISC 0.9.3 Linux on my HP
735/99.

The installation is OK but I could not get the X server to work.

I applied the patch from the ERRATA page and ran "dpkg-reconfigure
xserver-xfree86" to create a new XF86Config-4 file.

I've tried quite a few attempts with different parameters.

Same result ... it always says ... No devices detected  ...
Fatal server error:
no screens found.

I've tried different horizontal & vertical frequencies but always the
same result.

I've attached 3 files:

1) dmesg.txt ... what dmesg prints when I boot
2) XF86Config-4 ... the X server config file
3) the log when I try to start X.

Any help would be appreciated.

Thanks,

Bob Corner



--=-Sc9Di8tYQ68vV83PA33C
Content-Disposition: attachment; filename=dmesg.txt
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov =
30 19:36:30 MST 2001
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model	00002030 00000481 00000000 00000000 77b63c26 ffffffff 00000004 000000=
0a 0000000a
vers	0000000b
CPUID	vers 0 rev 0
model	9000/735
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/sda3 HOME=3D/ console=3Dtty0 sti=3D0 sti_f=
ont=3DVGA8x16 TERM=3Dlinux
Console: colour dummy device 160x64
Calibrating delay loop... 98.71 BogoMIPS
Memory: 126204k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77
2. Outfield Core BA (11) at 0xf082f000 [2], versions 0x9, 0x0, 0x70
3. Outfield Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x9, 0x0, 0x71
4. Outfield Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x9, 0x0,=
 0x72
5. Outfield Core HIL (10) at 0xf0821000 [2/0/3], versions 0x9, 0x0, 0x73
6. Outfield Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x9, 0x0, 0x75
7. Outfield Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x9, 0x0, 0x75
8. Outfield Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x9, 0x0, =
0x74
9. Outfield FW SCSI (10) at 0xf0830000 [2/0/7], versions 0x9, 0x0, 0x7c
10. Outfield Audio (10) at 0xf1000000 [2/0/8], versions 0x9, 0x0, 0x7f
11. Cobra EISA BA (11) at 0xfc000000 [4], versions 0x4, 0x0, 0x76
12. Hardball (735/99) (0) at 0xfffbe000 [8], versions 0x203, 0x0, 0x4
13. Hardball (1) at 0xfffbf000 [9], versions 0x19, 0x0, 0x9
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
STI byte mode ROM at f8000000, hpa=3Df8000000
STI byte mode ROM, id 26d1482a-40a00499, conforms to spec rev. 8.02
STI device: HPA1659A
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_P=
CI enabled
ttyS00 at iomem 0xf0823800 (irq =3D 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq =3D 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: keyboard found at id 0
HIL: keymap loaded.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=3D16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 62 8A 08 IRQ 87.
82596.c $Revision: 1.26 $
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0=20
scsi0 : LASI SCSI 53c700
  Vendor: DEC       Model: DSP3107LS         Rev: 441I
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
Partition check:
 sda: sda1 sda2 sda3
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 62396k swap-space (priority -1)
eth0: link ok.

--=-Sc9Di8tYQ68vV83PA33C
Content-Disposition: attachment; filename=XF86Config-4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

# XF86Config-4 (XFree86 server configuration file) generated by Dexconf, th=
e
# Debian X Configuration tool, using values from the debconf database.
#
# Edit this file with caution, and see the XF86Config manual page.
# (Type "man XF86Config" at the shell prompt.)

Section "Files"
	FontPath	"unix/:7100"			# local font server
	# if the local font server has problems, we can fall back on these
	FontPath	"/usr/lib/X11/fonts/misc"
	FontPath	"/usr/lib/X11/fonts/cyrillic"
	FontPath	"/usr/lib/X11/fonts/100dpi/:unscaled"
	FontPath	"/usr/lib/X11/fonts/75dpi/:unscaled"
	FontPath	"/usr/lib/X11/fonts/Type1"
	FontPath	"/usr/lib/X11/fonts/Speedo"
	FontPath	"/usr/lib/X11/fonts/100dpi"
	FontPath	"/usr/lib/X11/fonts/75dpi"
EndSection

Section "ServerFlags"
EndSection

Section "Module"
	Load	"ddc"
	Load	"GLcore"
	Load	"dbe"
	Load	"dri"
	Load	"extmod"
	Load	"glx"
	Load	"pex5"
	Load	"record"
	Load	"xie"
	Load	"bitmap"
	Load	"freetype"
	Load	"speedo"
	Load	"type1"
	Load	"vbe"
	Load	"int10"
EndSection

Section "InputDevice"
	Identifier	"Generic Keyboard"
	Driver		"keyboard"
	Option		"CoreKeyboard"
	Option		"XkbRules"	"xfree86"
	Option		"XkbModel"	"pc102"
	Option		"XkbLayout"	"us"
EndSection

Section "InputDevice"
	Identifier	"Configured Mouse"
	Driver		"mouse"
	Option		"CorePointer"
	Option		"Device"		"/dev/ttyS0"
	Option		"Protocol"		"Microsoft"
	Option		"Emulate3Buttons"	"true"
EndSection

Section "InputDevice"
	Identifier	"Generic Mouse"
	Driver		"mouse"
	Option		"SendCoreEvents"	"true"
	Option		"Device"		"/dev/input/mice"
	Option		"Protocol"		"ImPS/2"
	Option		"Emulate3Buttons"	"true"
EndSection

Section "Device"
	Identifier	"STI Framebuffer"
	Driver		"fbdev"
	Option		"UseFBDev"		"true"
EndSection

Section "Monitor"
	Identifier	"HP-A4033A"
	HorizSync	64
	VertRefresh	160
	Option		"DPMS"
EndSection

Section "Screen"
	Identifier	"Default Screen"
	Device		"STI Framebuffer"
	Monitor		"HP-A4033A"
	DefaultDepth	24
	SubSection "Display"
		Depth		1
		Modes		"1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		4
		Modes		"1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		8
		Modes		"1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		15
		Modes		"1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		16
		Modes		"1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		24
		Modes		"1280x1024"
	EndSubSection
EndSection

Section "ServerLayout"
	Identifier	"Default Layout"
	Screen		"Default Screen"
	InputDevice	"Generic Keyboard"
	InputDevice	"Configured Mouse"
	InputDevice	"Generic Mouse"
EndSection

Section "DRI"
	Mode	0666
EndSection

# end of XF86Config

--=-Sc9Di8tYQ68vV83PA33C
Content-Disposition: attachment; filename=XFree86.0.log
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-log; charset=ISO-8859-1


This is a pre-release version of XFree86, and is not supported in any
way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,
please check the latest version in the XFree86 CVS repository
(http://www.XFree86.Org/cvs)

XFree86 Version 4.1.0.1 / X Window System
(protocol Version 11, revision 0, vendor release 6510)
Release Date: xx August 2001
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/FAQ)
Build Operating System: Linux 2.4.9-pa79 parisc64 [ELF]=20
(=3D=3D) Log file: "/var/log/XFree86.0.log", Time: Mon May 20 02:03:20 2002
(=3D=3D) Using config file: "/etc/X11/XF86Config-4"
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "HP-A4033A"
(**) |   |-->Device "STI Framebuffer"
(**) |-->Input Device "Generic Keyboard"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "pc102"
(**) XKB: model: "pc102"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(=3D=3D) Keyboard: CustomKeycode disabled
(**) |-->Input Device "Configured Mouse"
(**) |-->Input Device "Generic Mouse"
(WW) The directory "/usr/lib/X11/fonts/cyrillic" does not exist.
	Entry deleted from font path.
(**) FontPath set to "unix/:7100,/usr/lib/X11/fonts/misc,/usr/lib/X11/fonts=
/100dpi/:unscaled,/usr/lib/X11/fonts/75dpi/:unscaled,/usr/lib/X11/fonts/Typ=
e1,/usr/lib/X11/fonts/Speedo,/usr/lib/X11/fonts/100dpi,/usr/lib/X11/fonts/7=
5dpi"
(=3D=3D) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(--) using VT number 7

(WW) Cannot open APM
(EE) No OS PCI support available
(II) Addressable bus resource ranges are
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) All system resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
	mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400
(II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,
	pm2, pm, 300sx, 500tx, mx, delta
	S3VIdentify
(II) S3VIRGE: driver (version 1.6.0) for S3 ViRGE chipsets: virge, 86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
	SIS300, SIS630, SIS540
(II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,
	TwisterK
(II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320, cyber9388,
	cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,
	tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,
	providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d,
	cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,
	cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,
	ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
	ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
	3dfx Voodoo3, 3dfx Voodoo5
(II) FBDev: driver for framebuffer: fbdev, afb
(II) ATI: ATI driver (version 6.3.6) for chipsets: ati
(II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
	ATI Rage 128 RL (AGP), ATI Rage 128 Pro PD (PCI),
	ATI Rage 128 Pro PF (AGP), ATI Rage 128 Pro PP (PCI),
	ATI Rage 128 Pro PR (PCI), ATI Rage 128 Mobility LE (PCI),
	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
	ATI Rage 128 Mobility ML (AGP)
(II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
	ATI Radeon VE (AGP)
(II) imstt: driver (version 1.0.0 for IMS TwinTurbo chipsets : imstt128,
	imstt3d
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) v4l driver for Video4Linux
	S3VProbe begin
(EE) No devices detected.

Fatal server error:
no screens found

When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to submit@bugs.debian.org.


--=-Sc9Di8tYQ68vV83PA33C--
