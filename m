Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail48.sdc1.sfba.home.com (femail48.sdc1.sfba.home.com [24.254.60.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 036E3482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 21:07:25 -0700 (MST)
Received: from w2kpro ([24.248.173.115]) by femail48.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with ESMTP
          id <20011214040723.NLBZ8989.femail48.sdc1.sfba.home.com@w2kpro>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 13 Dec 2001 20:07:23 -0800
From: "Edward Alfert" <edward@alfert.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] What keywords should I use to find the answer? 
Date: Thu, 13 Dec 2001 23:08:42 -0500
Message-ID: <001f01c18455$04d1cef0$0201a8c0@w2kpro>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <Pine.LNX.4.33.0112131359110.5844-100000@goliath.alaskatech.org>
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

Thanks... This is fun... 

New kernel 2.4.19 is up and running... I'm able to use my monitor ...
Initially I couldn't log in but found in the FAQ that I needed to
"uncomment" tty0 from /etc/inittab ... By the way, there is no entry for
tty0 in /etc/inittab, so I created one... So the FAQ shouldn't read
"uncomment" but instead "create".

I'm now trying to get Xfree working... I know I ask a lot of questions,
but I promise to return the favor to other newbies that experience the
same problems as me.

I executed /usr/X11R6/bin/xf86config and set all the parameters for the
mouse, monitor, and graphics card... But it doesn't work... The screen
goes black (as if it was changing resolutions) then comes back to text
mode and dumps the messages.

I have included the contents of /var/log/XFree86.0.log in hopes that one
of you will guide me in the right direction...

The system is a C240 with FX4 video card (that's HP Visualize FX-4 with
18mb RAM) ... The GRAPHICS(4) is set to 1280 x 1024 @ 72Hz.

c240:~# cat /var/log/XFree86.0.log

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
Build Operating System: Linux 2.4.9-pa79 parisc64 [ELF] 
(==) Log file: "/var/log/XFree86.0.log", Time: Thu Dec 13 22:59:57 2001
(==) Using config file: "/etc/X11/XF86Config"
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) ServerLayout "Simple Layout"
(**) |-->Screen "Screen 1" (0)
(**) |   |-->Monitor "Cornerstone p1500"
(**) |   |-->Device "HP Visualize FX4"
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
"/usr/X11R6/lib/X11/fonts/misc/,/usr/X11R6/lib/X11/fonts/75
dpi/:unscaled,/usr/X11R6/lib/X11/fonts/100dpi/:unscaled,/usr/X11R6/lib/X
11/fonts
/Type1/,/usr/X11R6/lib/X11/fonts/Speedo/,/usr/X11R6/lib/X11/fonts/75dpi/
,/usr/X1
1R6/lib/X11/fonts/100dpi/"
(**) RgbPath set to "/usr/X11R6/lib/X11/rgb"
(--) using VT number 2

(WW) Cannot open APM
(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:13:0: chip 1000,000f card 0000,0000 rev 04 class 01,00,00
hdr 00
(II) PCI: 00:14:0: chip 1011,0019 card 103c,104f rev 30 class 02,00,00
hdr 00
(II) PCI: 01:04:0: chip 103c,1008 card 0000,0000 rev 02 class 03,80,00
hdr 00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (-1,0,0), BCTRL: 0x00 (VGA_EN is
cleared)
(II) Bus 0 I/O range:
        [0] -1 0        0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 1: bridge is at (0:0:0), (-1,1,0), BCTRL: 0x00 (VGA_EN is
cleared)
(II) Bus 1 I/O range:
        [0] -1 0        0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 1 non-prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 1 prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI: (1:4:0) HP unknown chipset (0x1008) rev 2, Mem @
0xf6000000/25, BIOS @
 0xf1e00000/21
(II) Addressable bus resource ranges are
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
        [1] -1 0        0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
        [0] -1 0        0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1 0        0x00000000 - 0x00000000 (0x1) MX[B]
        [2] -1 0        0x0000ffff - 0x0000ffff (0x1) IX[B]
        [3] -1 0        0x00000000 - 0x00000000 (0x1) IX[B]
(II) Active PCI resource ranges:
        [0] -1 0        0xf2fff000 - 0xf2fff07f (0x80) MX[B]
        [1] -1 0        0xf2ffe000 - 0xf2ffefff (0x1000) MX[B]
        [2] -1 0        0xf2ffd000 - 0xf2ffd0ff (0x100) MX[B]
        [3] -1 0        0xf1e00000 - 0xf1ffffff (0x200000) MX[B](B)
        [4] -1 0        0xf6000000 - 0xf7ffffff (0x2000000) MX[B](B)
        [5] -1 0        0x0000ff00 - 0x0000ff7f (0x80) IX[B]
        [6] -1 0        0x0000fe00 - 0x0000feff (0x100) IX[B]
(II) Active PCI resource ranges after removing overlaps:
        [0] -1 0        0xf2fff000 - 0xf2fff07f (0x80) MX[B]
        [1] -1 0        0xf2ffe000 - 0xf2ffefff (0x1000) MX[B]
        [2] -1 0        0xf2ffd000 - 0xf2ffd0ff (0x100) MX[B]
        [3] -1 0        0xf1e00000 - 0xf1ffffff (0x200000) MX[B](B)
        [4] -1 0        0xf6000000 - 0xf7ffffff (0x2000000) MX[B](B)
        [5] -1 0        0x0000ff00 - 0x0000ff7f (0x80) IX[B]
        [6] -1 0        0x0000fe00 - 0x0000feff (0x100) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
        [0] -1 0        0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1 0        0x00000000 - 0x00000000 (0x1) MX[B]
        [2] -1 0        0x0000ffff - 0x0000ffff (0x1) IX[B]
        [3] -1 0        0x00000000 - 0x00000000 (0x1) IX[B]
(II) All system resource ranges:
        [0] -1 0        0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1 0        0x00000000 - 0x00000000 (0x1) MX[B]
        [2] -1 0        0xf2fff000 - 0xf2fff07f (0x80) MX[B]
        [3] -1 0        0xf2ffe000 - 0xf2ffefff (0x1000) MX[B]
        [4] -1 0        0xf2ffd000 - 0xf2ffd0ff (0x100) MX[B]
        [5] -1 0        0xf1e00000 - 0xf1ffffff (0x200000) MX[B](B)
        [6] -1 0        0xf6000000 - 0xf7ffffff (0x2000000) MX[B](B)
        [7] -1 0        0x0000ffff - 0x0000ffff (0x1) IX[B]
        [8] -1 0        0x00000000 - 0x00000000 (0x1) IX[B]
        [9] -1 0        0x0000ff00 - 0x0000ff7f (0x80) IX[B]
        [10] -1 0       0x0000fe00 - 0x0000feff (0x100) IX[B]
(II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
        mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI,
mgag400
(II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,
        pm2, pm, 300sx, 500tx, mx, delta
        S3VIdentify
(II) S3VIRGE: driver (version 1.6.0) for S3 ViRGE chipsets: virge,
86C325,
        virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
        86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
        trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
        SIS300, SIS630, SIS540
(II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
        Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
        Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133,
Twister,
        TwisterK
(II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320,
cyber9388,
        cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,
        tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,
        providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985,
blade3d,
        cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,
        cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520,
ct65525,
        ct65530, ct65535, ct65540, ct65545, ct65546, ct65548, ct65550,
        ct65554, ct65555, ct68554, ct69000, ct69030, ct64200, ct64300
(II) TDFX: Driver for 3dfx Banshee/Voodoo3 chipsets: 3dfx Banshee,
        3dfx Voodoo3, 3dfx Voodoo5
(II) FBDev: driver for framebuffer: fbdev, afb
(II) ATI: ATI driver (version 6.3.6) for chipsets: ati
(II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
        ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK
(PCI),
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
