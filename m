Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56101482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 07:59:37 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1003154375.3bcaebc713db3@webmail.tiscalinet.be>
Date: Mon, 15 Oct 2001 15:59:35 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Xfree86 failled with -pa57
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

Just finished some test of -pa57.

It seems to work very fine as well as on my 712 Model (with scsi terminator) as 
on B180L model (Diagnostic Led working and logo appears well on screen top). 
Disconect-reconnect kbd does not present any problem.

I try now to start xdm (which works more or less with some previous kernel 
release). This time it failed with following message (same on each model):
XFree86 Version 4.1.0 / X Window System
(protocol Version 11, revision 0, vendor release 6510)
Release Date: 2 June 2001
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/FAQ)
Build Operating System: Linux 2.4.0-pa51 parisc64 [ELF] 
(==) Log file: "/var/log/XFree86.0.log", Time: Mon Oct 15 15:07:57 2001
(==) Using config file: "/etc/X11/XF86Config-4"
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) ServerLayout "Simple Layout"
(**) |-->Screen "Screen 1" (0)
(**) |   |-->Monitor "lcd"
(**) |   |-->Device "fbdev"
(**) |-->Input Device "Mouse1"
(**) |-->Input Device "Keyboard1"
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xfree86"
(**) XKB: rules: "xfree86"
(**) Option "XkbModel" "pc101"
(**) XKB: model: "pc101"
(**) Option "XkbLayout" "us"
(**) XKB: layout: "us"
(==) Keyboard: CustomKeycode disabled
(**) FontPath set to 
"/usr/X11R6/lib/X11/fonts/misc/,/usr/X11R6/lib/X11/fonts/75dpi/:unscaled,/usr/X1
1R6/lib/X11/fonts/100dpi/:unscaled,/usr/X11R6/lib/X11/fonts/Type1/,/usr/X11R6/li
b/X11/fonts/Speedo/,/usr/X11R6/lib/X11/fonts/75dpi/,/usr/X11R6/lib/X11/fonts/100
dpi/"
(**) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(++) using VT number 7

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
	ATI Rage 128 Pro PF (AGP), ATI Rage 128 Mobility LE (PCI),
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
(II) FBDev(0): using default device
(II) Running in FRAMEBUFFER Mode
(**) FBDev(0): Depth 8, (--) framebuffer bpp 8
(==) FBDev(0): Default visual is PseudoColor
(==) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDev(0): Hardware:  (vidmem: 2048k)
(II) FBDev(0): Checking Modes against framebuffer device...
(II) FBDev(0): 	mode "640x480" ok
(II) FBDev(0): Checking Modes against monitor...
(--) FBDev(0): Virtual size is 640x480 (pitch 640)
(**) FBDev(0): Default mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 
60.0 Hz
(II) FBDev(0): Modeline "640x480"   25.20  640 656 752 800  480 490 492 525 
-hsync -vsync
(++) FBDev(0): DPI set to (100, 100)
(**) FBDev(0): Using "Shadow Framebuffer"

Fatal server error:
AddScreen/ScreenInit failed for driver 0


When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to submit@bugs.debian.org.


On the B180 I use the same XF86config (may be now outdated) as on 712/80, the 
one from Thomas Bogendoerfer available at:

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012928.html

Thanks in advance for help,
        Joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
