Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (dns1.rz.fh-heilbronn.de [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4393E484B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 17:26:07 -0600 (MDT)
Message-ID: <001e01c274a2$5ae73120$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: "Roland Hauff" <rhauff@yahoo.com>,
	<parisc-linux@lists.parisc-linux.org>
References: <20021015024957.67971.qmail@web40101.mail.yahoo.com>
Subject: Re: [parisc-linux] Xfree86 doesn't run on 700
Date: Wed, 16 Oct 2002 01:26:57 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_001B_01C274B3.1E20A8A0"
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

------=_NextPart_000_001B_01C274B3.1E20A8A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,
take a look at your dmesg output. There you find something like:
model 9000/735
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
STI GSC/PCI graphics driver version 0.9
STI device: HPA1439A
fb0: stifb 1280x1024-32 frame buffer device, id: 26d148ee, mmio: 0xf8100000

So it tells me I have a HP 9000/735/125 with 1280x1024x32 framebuffer...
On http://www.openpa.net/index.html you find descriptions and pictures of HP
700 machines. I also attached my XFree86conf-4, that should work, but you
may have to change color depth.

Greetings,
Yves...

> Hi,
> I just installed Debian 3.0 on an Apollo Series 700.
> I'm not sure of the model, but it has 96 Meg memory
> and a beautiful 19" 1280x1024 Sync on Green monitor.
>
> I have gotten it to boot fine, but cannot get xfree86
> configured for graphics.  It does not come up with any
> info during the install, and I cannot find any info on
> what graphics system it has.  I did see on a hardware
> list that it may have Coral SGC, but do not see this
> supported by XFree86.
>
> Thank you!
> Roland Hauff


------=_NextPart_000_001B_01C274B3.1E20A8A0
Content-Type: application/octet-stream;
	name="XF86Config-4"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="XF86Config-4"

#=0A=
# This XFree86 config files is usable for HIL and USB keyboards and mice=0A=
# by Helge Deller <deller@gmx.de> 2002-07-06=0A=
#=0A=
# Please adjust the "depth" and "Modes" entries below in the Screen =
Section=0A=
# acording to your system configuration.=0A=
# =0A=
# EXAMPLE:=0A=
# Run the following command on the bash prompt:=0A=
#=0A=
# dmesg | grep stifb=0A=
#=0A=
# and my system gives:=0A=
# fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: =
0xf8100000=0A=
# so I'm using "Depth 8" and "Modes 1280x1024" below.=0A=
#=0A=
=0A=
Section "Files"=0A=
	FontPath	"unix/:7100"			# local font server=0A=
	# if the local font server has problems, we can fall back on these=0A=
	FontPath	"/usr/lib/X11/fonts/misc"=0A=
	FontPath	"/usr/lib/X11/fonts/cyrillic"=0A=
	FontPath	"/usr/lib/X11/fonts/100dpi/:unscaled"=0A=
	FontPath	"/usr/lib/X11/fonts/75dpi/:unscaled"=0A=
	FontPath	"/usr/lib/X11/fonts/Type1"=0A=
	FontPath	"/usr/lib/X11/fonts/Speedo"=0A=
	FontPath	"/usr/lib/X11/fonts/100dpi"=0A=
	FontPath	"/usr/lib/X11/fonts/75dpi"=0A=
EndSection=0A=
=0A=
Section "Module"=0A=
	Load	"GLcore"=0A=
	Load	"bitmap"=0A=
	Load	"dbe"=0A=
	Load	"ddc"=0A=
	Load	"dri"=0A=
	Load	"extmod"=0A=
	Load	"freetype"=0A=
	Load	"glx"=0A=
	Load	"int10"=0A=
	Load	"pex5"=0A=
	Load	"record"=0A=
	Load	"speedo"=0A=
	Load	"type1"=0A=
	Load	"vbe"=0A=
	Load	"xie"=0A=
EndSection=0A=
=0A=
Section "InputDevice"=0A=
	Identifier	"Keyboard"=0A=
	Driver		"keyboard"=0A=
	Option		"CoreKeyboard"=0A=
#	Option		"XkbLayout"	"de"=0A=
EndSection=0A=
=0A=
Section "InputDevice"=0A=
	Identifier	"Mouse"=0A=
	Driver		"mouse"=0A=
	Option		"CorePointer"=0A=
	Option		"Device"		"/dev/input/mice"=0A=
	Option		"Protocol"		"ImPS/2"=0A=
	Option		"ZAxisMapping"		"4 5"=0A=
EndSection=0A=
=0A=
					     =0A=
Section "Device"=0A=
	Identifier	"Generic Video Card"=0A=
	Driver		"fbdev"=0A=
	Option		"UseFBDev"		"true"=0A=
EndSection=0A=
=0A=
Section "Monitor"=0A=
	Identifier	"Generic Monitor"=0A=
	HorizSync	30-70=0A=
	VertRefresh	50-160=0A=
	Option		"DPMS"=0A=
EndSection=0A=
=0A=
Section "Screen"=0A=
	Identifier	"Default Screen"=0A=
	Device		"Generic Video Card"=0A=
	Monitor		"Generic Monitor"=0A=
	DefaultDepth	24=0A=
	DefaultFbBpp	32=0A=
	SubSection "Display"=0A=
		Depth		24		# 8 or 24=0A=
		Modes		"1280x1024"	# "1024x768" or "1280x1024"=0A=
	EndSubSection=0A=
EndSection=0A=
=0A=
Section "ServerLayout"=0A=
	Identifier	"Default Layout"=0A=
	Screen		"Default Screen"=0A=
	InputDevice	"Keyboard"=0A=
	InputDevice	"Mouse"=0A=
EndSection=0A=
=0A=
Section "DRI"=0A=
	Mode	0666=0A=
EndSection=0A=

------=_NextPart_000_001B_01C274B3.1E20A8A0--
