Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from exchange2.elgin.cc.il.us (exchange2.elgin.edu [66.158.60.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07AE6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 18:41:03 -0700 (MST)
Message-ID: <5D69EA3878E6D411B43C00508BFD7283049FB553@exchange2.elgin.edu>
From: "Mehta, Miten" <mmehta@elgin.edu>
To: 'Keith Hopkins' <kxh3@wwarc1.atl.hp.com>,
	"Mehta, Miten" <mmehta@elgin.edu>
Cc: 'Helge Deller' <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] RE: X windows setup on C110 with woody and ker
	nel-2.4.20pa22
Date: Wed, 29 Jan 2003 19:37:32 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2C800.2889A620"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C2C800.2889A620
Content-Type: text/plain;
	charset="iso-8859-1"

Hello,

I still get errors for depth 24 though some what different.

take a look at xfree log attached.

thanks.



-----Original Message-----
From: Keith Hopkins [mailto:kxh3@wwarc1.atl.hp.com]
Sent: Wednesday, January 29, 2003 7:15 PM
To: Mehta, Miten
Cc: 'Helge Deller'; parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: X windows setup on C110 with woody and
kernel-2.4.20pa22


Mehta, Miten wrote:
> Hey,
> 
> I tried it again and find here xfree log.  I was advised to take X window
> setup to debian-hppa so I did not post to parisc list.  Also find
> XF86Config-4.  
> 
> Actually what I just did I had done that in very first attempt ;-).
Thibaut
> VARENE pointed out some thing which I have not tried to use /dev/psaux in
> place of /dev/input/mice.  Just shall wait for your reponse.
> 
> thanks.
> 
> Miten.
> 
> 
> 
> -----Original Message-----
> From: Helge Deller [mailto:deller@gmx.de]
> Sent: Wednesday, January 29, 2003 1:57 PM
> To: Mehta, Miten
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: X windows setup on C110 with woody and kernel-2.4.20pa22
> 
> 
> Hi Miten,
> 
> Please don't remove parisc-linux@lists.parisc-linux.org from the receivers
> in the future.
> 
>>From your dmesg this is the important part:
> 
> STI GSC/PCI graphics driver version 0.9
> STI byte mode ROM at f4000000, hpa at f4000000
> STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
> STI device: HPA4071B
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xf4100000
> 
> So, if you change the in SubSection "Display" the Depth to 32 it should
> work:
> Example:
>     SubSection "Display"
>                 Depth           32               # 8, 16, 24 or 32
(acording
> to "fbset -i")
>                 Modes           "1280x1024"     # "1024x768" or
"1280x1024"
>         EndSubSection
> 
> You don't seem to have HIL, but IIRC the ps/2 driver uses the same
> /dev/input/mice 
> interface.
> 
> Regards,
> Helge
> 
>

Hi Miten,

   Your log now complains there is no Depth 24 section.  So, I suggest to
ADD that section just above/below the Depth 32 section.

Example:

Section "Screen"
	Identifier	"Default Screen"
	Device		"Generic Video Card"
	Monitor		"Generic Monitor"
	SubSection "Display"
		Depth		24		# 8, 16, 24 or 32
		Modes		"1280x1024"	# "1024x768" or "1280x1024"
	EndSubSection
	SubSection "Display"
		Depth		32		# 8, 16, 24 or 32
		Modes		"1280x1024"	# "1024x768" or "1280x1024"
	EndSubSection
EndSection

--
Best Regards,
   Keith


------_=_NextPart_000_01C2C800.2889A620
Content-Type: application/octet-stream;
	name="XFree86.0.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="XFree86.0.log"


This is a pre-release version of XFree86, and is not supported in any
way.  Bugs may be reported to XFree86@XFree86.Org and patches submitted
to fixes@XFree86.Org.  Before reporting bugs in pre-release versions,
please check the latest version in the XFree86 CVS repository
(http://www.XFree86.Org/cvs)

XFree86 Version 4.1.0.1 / X Window System
(protocol Version 11, revision 0, vendor release 6510)
Release Date: 21 December 2001
	If the server is older than 6-12 months, or if your card is
	newer than the above date, look for a newer version before
	reporting problems.  (See http://www.XFree86.Org/FAQ)
Build Operating System: Linux 2.4.16-64 parisc64 [ELF]=20
(=3D=3D) Log file: "/var/log/XFree86.0.log", Time: Thu Jan 30 01:41:26 =
2003
(=3D=3D) Using config file: "/etc/X11/XF86Config-4"
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Generic Monitor"
(**) |   |-->Device "Generic Video Card"
(**) |-->Input Device "Keyboard"
(=3D=3D) Keyboard: CustomKeycode disabled
(**) |-->Input Device "Mouse"
(WW) The directory "/usr/lib/X11/fonts/cyrillic" does not exist.
	Entry deleted from font path.
(**) FontPath set to =
"unix/:7100,/usr/lib/X11/fonts/misc,/usr/lib/X11/fonts/100dpi/:unscaled,=
/usr/lib/X11/fonts/75dpi/:unscaled,/usr/lib/X11/fonts/Type1,/usr/lib/X11=
/fonts/Speedo,/usr/lib/X11/fonts/100dpi,/usr/lib/X11/fonts/75dpi"
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
(II) GLINT: driver for 3Dlabs chipsets: gamma, ti_pm2, ti_pm, pm3, =
pm2v,
	pm2, pm, 300sx, 500tx, mx, delta
	S3VIdentify
(II) S3VIRGE: driver (version 1.6.13) for S3 ViRGE chipsets: virge, =
86C325,
	virge vx, 86C988, virge dx, virge gx, 86C375, 86C385, virge gx2,
	86C357, virge mx, 86C260, virge mx+, 86C280, trio 3d, 86C365,
	trio 3d/2x, 86C362, 86C368
(II) SIS: driver for SiS chipsets: SIS5597, SIS5598, SIS530, SIS6326,
	SIS300, SIS630, SIS540
(II) SAVAGE: driver (version 1.1.16) for S3 Savage chipsets: Savage4,
	Savage3D, Savage3D-MV, Savage2000, Savage/MX-MV, Savage/MX,
	Savage/IX-MV, Savage/IX, ProSavage PM133, ProSavage KM133, Twister,
	TwisterK
(II) TRIDENT: driver for Trident chipsets: tvga8900d, cyber9320, =
cyber9388,
	cyber9397, cyber9397dvd, cyber9520, cyber9525dvd, cyberblade/e4,
	tgui9420dgi, tgui9440agi, tgui9660, tgui9680, providia9682,
	providia9685, cyber9382, cyber9385, 3dimage975, 3dimage985, blade3d,
	cyberbladei7, cyberbladei7d, cyberbladei1, cyberbladei1d,
	cyberbladeAi1, cyberbladeAi1d, cyberbladeXP, cyberbladeXPm
(II) CHIPS: Driver for Chips and Technologies chipsets: ct65520, =
ct65525,
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
(II) imstt: driver (version 1.0.0 for IMS TwinTurbo chipsets : =
imstt128,
	imstt3d
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) v4l driver for Video4Linux
	S3VProbe begin
(II) FBDev(0): using default device
(II) Running in FRAMEBUFFER Mode
(=3D=3D) FBDev(0): Depth 24, (=3D=3D) framebuffer bpp 24
(=3D=3D) FBDev(0): RGB weight 888
(=3D=3D) FBDev(0): Default visual is TrueColor
(=3D=3D) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDev(0): Hardware:  (vidmem: 16384k)
(II) FBDev(0): Checking Modes against framebuffer device...
(II) FBDev(0): 	mode "1280x1024" ok
(II) FBDev(0): Checking Modes against monitor...
(--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDev(0): Default mode "1280x1024": 108.0 MHz (scaled from 0.0 =
MHz), 64.0 kHz, 60.0 Hz
(II) FBDev(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 =
1025 1028 1066 +hsync +vsync
(++) FBDev(0): DPI set to (100, 100)
(**) FBDev(0): Using "Shadow Framebuffer"
(--) Depth 24 pixmap format is 24 bpp

Fatal server error:
AddScreen/ScreenInit failed for driver 0


When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please report problems to submit@bugs.debian.org.


------_=_NextPart_000_01C2C800.2889A620--
