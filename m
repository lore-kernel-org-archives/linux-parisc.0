Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.khk.be (unknown [193.190.63.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id B83624829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 02:02:39 -0600 (MDT)
Received: (from uucp@localhost)
	by mailhost.khk.be (8.11.6/8.11.6) id g9882a031755
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Oct 2002 10:02:36 +0200
Received: (from uucp@localhost)
	by zohra.khk.be (8.9.3/8.8.7) id KAA01904
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Oct 2002 10:02:28 +0200
Message-Id: <5.1.0.14.2.20021008095852.00ad3d58@pophost.khk.be>
Date: Tue, 08 Oct 2002 10:02:16 +0200
To: parisc-linux@lists.parisc-linux.org
From: Peter Karsmakers <peter.karsmakers@khk.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Can't start X-windows on HP C240 with HP FX4 graphics card ?
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

This port would be very interesting.  I hope someone can help us.

 >Hi,
 >
 >the FX? Cards are unsupported at the moment. However, if I understand
 >correctly, there has been a port for x86 linux at times of kernel
 >2.2.16. I am not a kernel hacker, but I would like to know if there is a
 >possibility to port the beta quality  driver from
 >http://www.hp.com/workstations/support/software/drivers/linux/video/fxvideo/
 >to current kernels.
 >
 >
 >Berthold
 >
 >>Peter Karsmakers wrote:
 > > Hi,
 > > I have a HP visualize C240 with a FX4 graphics card.  I've mananged to
 > install linux parisc but can't get the X windows to work.  Is my graphics
 > adapter supported?
 > > The following output is dumped on the screen when I give the xstart 
command.
 > > Thanks,
 > > Peter Karsmakers
 > > debianC240:~# startx
 > > warning: process set to nice value 0 instead of -10 as requested
 > > This is a pre-release version of XFree86, and is not supported in any
 > way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
 > to fixes@XFree86.Org. Before reporting bugs in pre-release versions,
 > please check the latest version in the XFree86 CVS repository
 > (http://www.XFree86.Org/cvs)
 > > XFree86 Version 4.1.0.1 / X Window System
 > (protocol Version 11, revision 0, vendor release 6510)
 > Release Date: 21 December 2001
 > If the server is older than 6-12 months, or if your card is
 > newer than the above date, look for a newer version before
 > reporting problems.  (See http://www.XFree86.Org/FAQ)
 > Build Operating System: Linux 2.4.16-64 parisc64 [ELF]
 > (==) Log file: "/var/log/XFree86.0.log", Time: Fri Oct  4 16:46:28 2002
 > (==) Using config file: "/etc/X11/XF86Config-4"
 > Markers: (--) probed, (**) from config file, (==) default setting,
 > (++) from command line, (!!) notice, (II) informational,
 > (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
 > (==) ServerLayout "Default Layout"
 > (**) |-->Screen "Default Screen" (0)
 > (**) |   |-->Monitor "compaq qvision"
 > (**) |   |-->Device "HP 4FX"
 > (**) |-->Input Device "Generic Keyboard"
 > (**) XKB: rules: "xfree86"
 > (**) XKB: model: "pc104"
 > (**) XKB: layout: "us"
 > (**) |-->Input Device "Configured Mouse"
 > (**) |-->Input Device "Generic Mouse"
 > (WW) The directory "/usr/lib/X11/fonts/cyrillic" does not exist.
 > Entry deleted from font path.
 > (**) FontPath set to
 > "unix/:7100,/usr/lib/X11/fonts/misc,/usr/lib/X11/fonts/100d
 > 
pi/:unscaled,/usr/lib/X11/fonts/75dpi/:unscaled,/usr/lib/X11/fonts/Type1,/usr/li
 > b/X11/fonts/Speedo,/usr/lib/X11/fonts/100dpi,/usr/lib/X11/fonts/75dpi"
 > (==) RgbPath set to "/usr/X11R6/lib/X11/rgb"
 > (--) using VT number 7
 > > (--) PCI: (1:4:0) HP unknown chipset (0x1008) rev 2, Mem @ 0xf6000000/25,
 > BIOS @
 > 0xf1e00000/21
 > (II) MGA: driver for Matrox chipsets: mga2064w, mga1064sg, mga2164w,
 > mga2164w AGP, mgag100, mgag100 PCI, mgag200, mgag200 PCI, mgag400
 > (II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, pm2v,
 > pm2, pm, 300sx, 500tx, mx, delta
 > (II) S3VIRGE: driver (version 1.6.13) for S3 ViRGE chipsets: virge, 86C325,
 > virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
 > 86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
 > trio 3d/2x, 86C362, 86C368
 > (II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
 > SIS300, SIS630, SIS540
 > (II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
 > Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
 > Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,
 > TwisterK
 > (II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320, cyber9388,
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
 > (EE) No devices detected.
 > > Fatal server error:
 > no screens found
 > > When reporting a problem related to a server crash, please send
 > the full server output, not just the last messages.
 > This can be found in the log file "/var/log/XFree86.0.log".
 > Please report problems to submit@bugs.debian.org.
 > > XIO:  fatal IO error 232 (Connection reset by peer) on X server ":0.0"
 > after 0 requests (0 known processed) with 0 events remaining.
 > > _______________________________________________
 > parisc-linux mailing list
 > parisc-linux@lists.parisc-linux.org
 > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
