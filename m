Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 804724852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:46:08 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 11B79298045
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:46:08 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13840-07 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 22:46:05 -0700 (MST)
Date: Sat, 20 Dec 2003 22:46:05 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031221054605.GA14026@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] can't open /dev/input/mice on c3000?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
using the diff I just posted, I still can't fire up X11.
I do get parisc logo on the screen at boot.
fbset -i does indicate 1600x1200x8 and that matches
my XF86Config-4 file contents (nothing changed).

xserver can't open /dev/input/mice and it's not clear to me why not.
I have a USB Logitech "intellimouse" that seems to work fine
with 2.4.23 kernels.  2.6.0-pa3 (pre-release) finds the USB mouse.

I'd be interested in hearing if it works for someone else with
and c3000 or similar workstation.

Appended is XFree86.log file.

thanks,
grant


This is a pre-release version of XFree86, and is not supported in any
way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,
please check the latest version in the XFree86 CVS repository
(http://www.XFree86.Org/cvs)

XFree86 Version 4.2.1.1 (Debian 4.2.1-12.1 20031003044442 root@sarti.debian.org) / X Window System
(protocol Version 11, revision 0, vendor release 6600)
Release Date: 18 October 2002
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/)
Build Operating System: Linux 2.4.20-64 parisc64 [ELF] 
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/XFree86.0.log", Time: Sat Dec 20 21:37:31 2003
(==) Using config file: "/etc/X11/XF86Config-4"
(==) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Generic Monitor"
(**) |   |-->Device "Generic Video Card"
(**) |-->Input Device "Generic Keyboard"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "pc104"
(**) XKB: model: "pc104"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(==) Keyboard: CustomKeycode disabled
(**) |-->Input Device "USB Mouse"
(WW) The directory "/usr/lib/X11/fonts/cyrillic" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/75dpi/" does not exist.
	Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/75dpi" does not exist.
	Entry deleted from font path.
(**) FontPath set to "unix/:7100,/usr/lib/X11/fonts/misc,/usr/lib/X11/fonts/100dpi/:unscaled,/usr/lib/X11/fonts/Type1,/usr/lib/X11/fonts/Speedo,/usr/lib/X11/fonts/100dpi"
(==) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(--) using VT number 2

(WW) Open APM failed (/dev/apm_bios) (No such file or directory)
(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:0c:0: chip 1011,0019 card 103c,104f rev 41 class 02,00,00 hdr 00
(II) PCI: 00:0d:0: chip 11d4,1889 card 11d4,1889 rev 00 class 04,01,00 hdr 00
(II) PCI: 00:0e:0: chip 100b,0002 card 0000,0000 rev 03 class 01,01,8a hdr 80
(II) PCI: 00:0e:1: chip 100b,000e card 0000,0000 rev 01 class 06,80,00 hdr 80
(II) PCI: 00:0e:2: chip 100b,0012 card 0000,0000 rev 02 class 0c,03,10 hdr 80
(II) PCI: 00:0f:0: chip 1000,000b card 1000,1000 rev 04 class 01,00,00 hdr 80
(II) PCI: 00:0f:1: chip 1000,000b card 1000,1000 rev 04 class 01,00,00 hdr 80
(II) PCI: 01:05:0: chip 10b7,9050 card 0000,0000 rev 00 class 02,00,00 hdr 00
(II) PCI: 01:06:0: chip 8086,1229 card 103c,10cb rev 08 class 02,00,00 hdr 00
(II) PCI: 03:02:0: chip 103c,1005 card 0000,0000 rev 03 class 03,80,00 hdr 00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Host-to-PCI bridge:
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (-1,0,0), BCTRL: 0x00 (VGA_EN is cleared)
(II) Bus 0 I/O range:
	[0] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 1: bridge is at (0:0:0), (-1,1,0), BCTRL: 0x00 (VGA_EN is cleared)
(II) Bus 1 I/O range:
	[0] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 1 non-prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 3: bridge is at (0:0:0), (-1,3,0), BCTRL: 0x00 (VGA_EN is cleared)
(II) Bus 3 I/O range:
	[0] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 3 non-prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 3 prefetchable memory range:
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI:*(3:2:0) HP unknown chipset (0x1005) rev 3, Mem @ 0xfa000000/25, BIOS @ 0xf7000000/16
(II) Addressable bus resource ranges are
	[0] -1 0	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1 0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) Active PCI resource ranges:
	[0] -1 0	0xf4800000 - 0xf48fffff (0x100000) MX[B]
	[1] -1 0	0xf4900000 - 0xf4900fff (0x1000) MX[B]
	[2] -1 0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[3] -1 0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[4] -1 0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[5] -1 0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[6] -1 0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[7] -1 0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[8] -1 0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[9] -1 0	0xf7000000 - 0xf700ffff (0x10000) MX[B](B)
	[10] -1 0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[11] -1 0	0x00002000 - 0x0000203f (0x40) IX[B]
	[12] -1 0	0x00002100 - 0x0000213f (0x40) IX[B]
	[13] -1 0	0x00000800 - 0x000008ff (0x100) IX[B]
	[14] -1 0	0x00000900 - 0x000009ff (0x100) IX[B]
	[15] -1 0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[16] -1 0	0x00000b00 - 0x00000b00 (0x1) IX[B]
	[17] -1 0	0x00000d00 - 0x00000d00 (0x1) IX[B]
	[18] -1 0	0x00000e00 - 0x00000e00 (0x1) IX[B]
	[19] -1 0	0x00000f00 - 0x00000f00 (0x1) IX[B]
	[20] -1 0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) Active PCI resource ranges after removing overlaps:
	[0] -1 0	0xf4800000 - 0xf48fffff (0x100000) MX[B]
	[1] -1 0	0xf4900000 - 0xf4900fff (0x1000) MX[B]
	[2] -1 0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[3] -1 0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[4] -1 0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[5] -1 0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[6] -1 0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[7] -1 0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[8] -1 0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[9] -1 0	0xf7000000 - 0xf700ffff (0x10000) MX[B](B)
	[10] -1 0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[11] -1 0	0x00002000 - 0x0000203f (0x40) IX[B]
	[12] -1 0	0x00002100 - 0x0000213f (0x40) IX[B]
	[13] -1 0	0x00000800 - 0x000008ff (0x100) IX[B]
	[14] -1 0	0x00000900 - 0x000009ff (0x100) IX[B]
	[15] -1 0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[16] -1 0	0x00000b00 - 0x00000b00 (0x1) IX[B]
	[17] -1 0	0x00000d00 - 0x00000d00 (0x1) IX[B]
	[18] -1 0	0x00000e00 - 0x00000e00 (0x1) IX[B]
	[19] -1 0	0x00000f00 - 0x00000f00 (0x1) IX[B]
	[20] -1 0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[3] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) All system resource ranges:
	[0] -1 0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1 0	0x00000000 - 0x00000000 (0x1) MX[B]
	[2] -1 0	0xf4800000 - 0xf48fffff (0x100000) MX[B]
	[3] -1 0	0xf4900000 - 0xf4900fff (0x1000) MX[B]
	[4] -1 0	0xf4006000 - 0xf4006fff (0x1000) MX[B]
	[5] -1 0	0xf4007000 - 0xf4007fff (0x1000) MX[B]
	[6] -1 0	0xf4009000 - 0xf400900f (0x10) MX[B]
	[7] -1 0	0xf400a000 - 0xf400a00f (0x10) MX[B]
	[8] -1 0	0xf400b000 - 0xf400b00f (0x10) MX[B]
	[9] -1 0	0xf400c000 - 0xf400c1ff (0x200) MX[B]
	[10] -1 0	0xf4008000 - 0xf40083ff (0x400) MX[B]
	[11] -1 0	0xf7000000 - 0xf700ffff (0x10000) MX[B](B)
	[12] -1 0	0xfa000000 - 0xfbffffff (0x2000000) MX[B](B)
	[13] -1 0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[14] -1 0	0x00000000 - 0x00000000 (0x1) IX[B]
	[15] -1 0	0x00002000 - 0x0000203f (0x40) IX[B]
	[16] -1 0	0x00002100 - 0x0000213f (0x40) IX[B]
	[17] -1 0	0x00000800 - 0x000008ff (0x100) IX[B]
	[18] -1 0	0x00000900 - 0x000009ff (0x100) IX[B]
	[19] -1 0	0x00000a00 - 0x00000a0f (0x10) IX[B]
	[20] -1 0	0x00000b00 - 0x00000b00 (0x1) IX[B]
	[21] -1 0	0x00000d00 - 0x00000d00 (0x1) IX[B]
	[22] -1 0	0x00000e00 - 0x00000e00 (0x1) IX[B]
	[23] -1 0	0x00000f00 - 0x00000f00 (0x1) IX[B]
	[24] -1 0	0x00001000 - 0x0000107f (0x80) IX[B]
(II) ATI: ATI driver (version 6.4.16) for chipset: ati
(II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
	ATI Rage 128 RL (AGP), ATI Rage 128 SM (AGP),
	ATI Rage 128 Pro PD (PCI), ATI Rage 128 Pro PF (AGP),
	ATI Rage 128 Pro PP (PCI), ATI Rage 128 Pro PR (PCI),
	ATI Rage 128 Pro ULTRA TF (AGP), ATI Rage 128 Pro ULTRA TL (AGP),
	ATI Rage 128 Pro ULTRA TR (AGP), ATI Rage 128 Mobility LE (PCI),
	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
	ATI Rage 128 Mobility ML (AGP)
(II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
	ATI Radeon VE QY (AGP), ATI Radeon VE QZ (AGP),
	ATI Radeon Mobility LW (AGP), ATI Radeon Mobility LX (AGP),
	ATI Radeon Mobility LY (AGP), ATI Radeon Mobility LZ (AGP),
	ATI Radeon 8500 QL (AGP), ATI Radeon 8500 QM (AGP),
	ATI Radeon 8500 QN (AGP), ATI Radeon 8500 QO (AGP),
	ATI Radeon 8500 Ql (AGP), ATI Radeon 8500 BB (AGP),
	ATI Radeon 7500 QW (AGP), ATI Radeon 9000 If (AGP)
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
	mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400,
	mgag550
(II) GLINT: driver for 3Dlabs chipsets: gamma, gamma2, ti_pm2, ti_pm, r4,
	pm4, pm3, pm2v, pm2, pm, 300sx, 500tx, mx, delta
(II) NV: driver for NVIDIA chipsets: RIVA 128, RIVA TNT,
	RIVA TNT2/TNT2 Pro, RIVA TNT2 Ultra, Vanta, Riva TNT2 M64,
	Aladdin TNT2, GeForce 256, GeForce DDR, Quadro, GeForce2 MX/MX 400,
	GeForce2 MX 100/200, GeForce2 Go, Quadro2 MXR, GeForce2 GTS/Pro,
	GeForce2 Ti, GeForce2 Ultra, Quadro2 Pro, GeForce4 MX 460,
	GeForce4 MX 440, GeForce4 MX 420, GeForce4 440 Go, GeForce4 420 Go,
	GeForce4 420 Go M32, Quadro4 500XGL, GeForce4 440 Go M64,
	Quadro4 200/400NVS, Quadro4 550XGL, Quadro4 GoGL, 0x0180, 0x0181,
	0x0182, 0x0188, 0x018A, 0x018B, GeForce2 Integrated, 0x01F0,
	GeForce3, GeForce3 Ti 200, GeForce3 Ti 500, Quadro DCC,
	GeForce4 Ti 4600, GeForce4 Ti 4400, GeForce4 Ti 4200,
	Quadro4 900 XGL, Quadro4 750 XGL, Quadro4 700 XGL, 0x0280, 0x0281,
	0x0288, 0x0289
(II) S3: driver (version 0.3.5 for S3 chipset: 964-0, 964-1, 968,
	Trio32/64, Aurora64V+, Trio64V2/DX or /GX
(II) S3VIRGE: driver (version 1.8.3) for S3 ViRGE chipsets: virge, 86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597, SIS530, SIS6326, SIS300,
	SIS630, SIS540
(II) SAVAGE: driver (version 1.1.26) for S3 Savage chipsets: Savage4,
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133,
	ProSavage PN133, ProSavage KN133, SuperSavage/MX 128,
	SuperSavage/MX 64, SuperSavage/MX 64C, SuperSavage/IX 128,
	SuperSavage/IX 128, SuperSavage/IX 64, SuperSavage/IX 64,
	SuperSavage/IXC 64, SuperSavage/IXC 64, ProSavage DDR,
	ProSavage DDR-K
(II) TRIDENT: driver for Trident chipsets: tvga9000, tvga9000i, tvga8900c,
	tvga8900d, tvga9200cxr, tgui9400cxi, cyber9320, cyber9388, cyber9397,
	cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4, tgui9420dgi,
	tgui9440agi, tgui9660, tgui9680, providia9682, providia9685,
	cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d, cyberbladei7,
	cyberbladei7d, cyberbladei1, cyberbladei1d, cyberbladeAi1,
	cyberbladeAi1d, cyberbladeXPm/8, cyberbladeXPm/16, cyberbladeXPAi1
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,
	ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
	ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
	3dfx Voodoo3, 3dfx Voodoo5
(II) FBDEV: driver for framebuffer: fbdev
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) v4l driver for Video4Linux
(II) Primary Device is: PCI 03:02:0
(II) FBDEV(0): using default device
(II) Running in FRAMEBUFFER Mode
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(**) FBDEV(0): Default visual is TrueColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): Hardware: stifb (vidmem: 2400k)
(II) FBDEV(0): Checking Modes against framebuffer device...
(II) FBDEV(0): 	mode "1600x1200" ok
(II) FBDEV(0): Checking Modes against monitor...
(--) FBDEV(0): Virtual size is 1600x1200 (pitch 1600)
(**) FBDEV(0): Default mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
(II) FBDEV(0): Modeline "1600x1200"  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync
(==) FBDEV(0): DPI set to (75, 75)
(**) FBDEV(0): Using "Shadow Framebuffer"
(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
(==) FBDEV(0): Backing store disabled
(**) Option "dpms"
(**) FBDEV(0): DPMS enabled
(II) Keyboard "Generic Keyboard" handled by legacy driver
(**) Option "Protocol" "ImPS/2"
(**) USB Mouse: Protocol: "ImPS/2"
(**) Option "SendCoreEvents" "true"
(**) USB Mouse: always reports core events
(**) Option "CorePointer"
(**) USB Mouse: Core Pointer
(**) Option "Device" "/dev/input/mice"
(EE) xf86OpenSerial: Cannot open device /dev/input/mice
	No such device.
(EE) USB Mouse: cannot open input device
(EE) PreInit failed for input device "USB Mouse"
(WW) No core pointer registered
No core pointer

Fatal server error:
failed to initialize core devices

When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to submit@bugs.debian.org.
