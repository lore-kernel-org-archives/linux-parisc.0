Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D6C44849
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Feb 2002 13:07:38 -0700 (MST)
Message-ID: <2F1E6AB90ECAD311943700A0C9E3B15407DAD6C5@xatl03.atl.hp.com>
From: "FAUCHER,DENNIS (HP-USA,ex1)" <dennis_faucher@hp.com>
To: Cataldo_Urso@hotmail.com
Cc: parisc-linux@lists.parisc-linux.org
Date: Thu, 14 Feb 2002 12:07:21 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] RE: xf86 Config Files for 715/100
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

Cataldo,

The key to my success was not the config files, but a new kernel and the
right bit depth.  Here is the cookbook I published yesterday:

Hello,
I wanted to document how easy it was to get X and gnome running on a
715/100.  I experienced much pain until  I found the easy process. Here is
what worked for me:
1) Create boot CD from 0.9.3.iso
2) Install from boot CD
3) Choose to install packages over http from debian.org
4) Re-boot and make sure everything is working (X won't work)
5) dselect the latest kernel
6) Re-boot with the latest kernel (Mine is vmlinux-2.4.16-32).
7) Make sure you are using a serial mouse
7) Run dpkg-reconfigure xserver-xfree86
8) Use all the defaults except for 24 for default bit depth and Auto for
mouse type
This is what worked for me.  X wouldn't work until I dselected to a new
kernel and the mouse wouldn't work  until I attached a serial mouse and
chose Auto.
Sincerely,
Dennis Faucher
dennis_faucher@hp_dot_com

Sincerely,
Dennis Faucher
Technical Consultant
Hewlett-Packard Company
https://www.ecardfile.com/id/dennis_faucher (Contact)
http://e-services.hp.com (E-Services) 

-----Original Message-----
From: Cataldo_Urso@hotmail.com [mailto:Cataldo_Urso@hotmail.com]
Sent: Thursday, February 14, 2002 2:49 PM
To: FAUCHER,DENNIS (HP-USA,ex1)
Subject: Re: xf86 Config Files for 715/100


Hello,

I just installed linux (0.9.3) on my 712/60 and I appreciate if you can help
me by sending me the config file you received.

Best regards,
Cataldo URSO.

----- Original Message -----
From: "FAUCHER,DENNIS (HP-USA,ex1)" <dennis_faucher@hp.com>
Newsgroups: linux.debian.ports.hppa
Sent: Wednesday, January 23, 2002 5:20 PM
Subject: xf86 Config Files for 715/100


> Hello,
>
> Does anyone have X working on an HP 715/100 with an A1097C monitor and
0.9.3
> Linux?  Joel Soete was nice enough to send me his config files from his
712
> and B180, but they have not solved the problem.  Thank you for any input.
I
> have included my XFree86.0.log for fun.
>
> Sincerely,
> Dennis Faucher
> Technical Consultant
> Hewlett-Packard Company
> https://www.ecardfile.com/id/dennis_faucher (Contact)
> http://e-services.hp.com (E-Services)
>
>
> This is a pre-release version of XFree86, and is not supported in any
> way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
> to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,
> please check the latest version in the XFree86 CVS repository
> (http://www.XFree86.Org/cvs)
>
> XFree86 Version 4.1.0.1 / X Window System
> (protocol Version 11, revision 0, vendor release 6510)
> Release Date: 21 December 2001
> If the server is older than 6-12 months, or if your card is
> newer than the above date, look for a newer version before
> reporting problems.  (See http://www.XFree86.Org/FAQ)
> Build Operating System: Linux 2.4.16-64 parisc64 [ELF]
> (==) Log file: "/var/log/XFree86.0.log", Time: Fri Jan 18 19:58:34 2002
> (==) Using config file: "/etc/X11/XF86Config-4"
> Markers: (--) probed, (**) from config file, (==) default setting,
>          (++) from command line, (!!) notice, (II) informational,
>          (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (==) ServerLayout "Simple Layout"
> (**) |-->Screen "Screen 1" (0)
> (**) |   |-->Monitor "HP A1097C"
> (**) |   |-->Device "HP Framebuffer"
> (**) |-->Input Device "Mouse1"
> (**) |-->Input Device "Keyboard1"
> (**) Option "AutoRepeat" "500 30"
> (**) Option "XkbRules" "xfree86"
> (**) XKB: rules: "xfree86"
> (**) Option "XkbModel" "pc101"
> (**) XKB: model: "pc101"
> (**) Option "XkbLayout" "us"
> (**) XKB: layout: "us"
> (==) Keyboard: CustomKeycode disabled
> (**) FontPath set to
>
"/usr/X11R6/lib/X11/fonts/misc/,/usr/X11R6/lib/X11/fonts/75dpi/:unscaled,/us
>
r/X11R6/lib/X11/fonts/100dpi/:unscaled,/usr/X11R6/lib/X11/fonts/Type1/,/usr/
>
X11R6/lib/X11/fonts/Speedo/,/usr/X11R6/lib/X11/fonts/75dpi/,/usr/X11R6/lib/X
> 11/fonts/100dpi/"
> (**) RgbPath set to "/usr/X11R6/lib/X11/rgb"
> (--) using VT number 7
>
> (WW) Cannot open APM
> (EE) No OS PCI support available
> (II) Addressable bus resource ranges are
> [0] -1 0 0x00000000 - 0xffffffff (0x0) MX[B]
> [1] -1 0 0x00000000 - 0x0000ffff (0x10000) IX[B]
> (II) OS-reported resource ranges:
> [0] -1 0 0xffffffff - 0xffffffff (0x1) MX[B]
> [1] -1 0 0x00000000 - 0x00000000 (0x1) MX[B]
> [2] -1 0 0x0000ffff - 0x0000ffff (0x1) IX[B]
> [3] -1 0 0x00000000 - 0x00000000 (0x1) IX[B]
> (II) OS-reported resource ranges after removing overlaps with PCI:
> [0] -1 0 0xffffffff - 0xffffffff (0x1) MX[B]
> [1] -1 0 0x00000000 - 0x00000000 (0x1) MX[B]
> [2] -1 0 0x0000ffff - 0x0000ffff (0x1) IX[B]
> [3] -1 0 0x00000000 - 0x00000000 (0x1) IX[B]
> (II) All system resource ranges:
> [0] -1 0 0xffffffff - 0xffffffff (0x1) MX[B]
> [1] -1 0 0x00000000 - 0x00000000 (0x1) MX[B]
> [2] -1 0 0x0000ffff - 0x0000ffff (0x1) IX[B]
> [3] -1 0 0x00000000 - 0x00000000 (0x1) IX[B]
> (II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
> mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400
> (II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,
> pm2, pm, 300sx, 500tx, mx, delta
> S3VIdentify
> (II) S3VIRGE: driver (version 1.6.13) for S3 ViRGE chipsets: virge,
86C325,
> virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
> 86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
> trio 3d/2x, 86C362, 86C368
> (II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
> SIS300, SIS630, SIS540
> (II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
> Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
> Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,
> TwisterK
> (II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320,
cyber9388,
> cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,
> tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,
> providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d,
> cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,
> cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm
> (II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, ct65525,
> ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
> ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
> (II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
> 3dfx Voodoo3, 3dfx Voodoo5
> (II) FBDev: driver for framebuffer: fbdev, afb
> (II) ATI: ATI driver (version 6.3.6) for chipsets: ati
> (II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
> ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
> ATI Rage 128 RL (AGP), ATI Rage 128 Pro PD (PCI),
> ATI Rage 128 Pro PF (AGP), ATI Rage 128 Pro PP (PCI),
> ATI Rage 128 Pro PR (PCI), ATI Rage 128 Mobility LE (PCI),
> ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
> ATI Rage 128 Mobility ML (AGP)
> (II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
> ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
> ATI Radeon VE (AGP)
> (II) imstt: driver (version 1.0.0 for IMS TwinTurbo chipsets : imstt128,
> imstt3d
> (II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
> (II) v4l driver for Video4Linux
> S3VProbe begin
> (II) FBDev(0): using default device
> (II) Running in FRAMEBUFFER Mode
> (**) FBDev(0): Depth 8, (--) framebuffer bpp 8
> (==) FBDev(0): Default visual is PseudoColor
> (==) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
> (II) FBDev(0): Hardware:  (vidmem: 8192k)
> (II) FBDev(0): Checking Modes against framebuffer device...
> (II) FBDev(0): mode "1280x1024" ok
> (II) FBDev(0): Checking Modes against monitor...
> (--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)
> (**) FBDev(0): Built-in mode "current": 28000.0 MHz, 21875.0 kHz, 21362.3
Hz
> (II) FBDev(0): Modeline "current"  28000.00  1280 1280 1280 1280  1024
1024
> 1024 1024 -hsync -vsync -csync
> (==) FBDev(0): DPI set to (75, 75)
> (**) FBDev(0): Using "Shadow Framebuffer"
>
> Fatal server error:
> AddScreen/ScreenInit failed for driver 0
>
>
> When reporting a problem related to a server crash, please send
> the full server output, not just the last messages.
> This can be found in the log file "/var/log/XFree86.0.log".
> Please report problems to submit@bugs.debian.org.
>
>
> --
> To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org
