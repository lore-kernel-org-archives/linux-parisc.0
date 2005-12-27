From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Tue, 27 Dec 2005 09:37:59 -0500 (EST)
Message-ID: <200512271437.jBREbxA8021653@hiauly1.hia.nrc.ca>
References: <200512270829.31463.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200512270829.31463.deller@gmx.de> from "Helge Deller" at Dec 27, 2005 08:29:31 am
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

> On Monday 26 December 2005 22:34, John David Anglin wrote:
> > X no longer starts on my c3k using unstable.  The problem seems
> > to be:
> > 
> > (EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
> > 
> > XF86Config-4 hasn't changed for at least a year.  Any ideas?
> 
> I assume your screen resolution changed. 

No.  I've had the following entries in XF86Config-4 since Sep 2003:

Section "Device"
        Identifier      "HP Visualize-EG"
	Driver          "fbdev"
	Option          "UseFBDev"              "true"
EndSection

Section "Monitor"
	Identifier      "NEC LCD1980SX"
	HorizSync       30-107
	VertRefresh     50-85
	Option          "DPMS"
EndSection

Section "Screen"
	Identifier      "Default Screen"
	Device          "HP Visualize-EG"
	Monitor         "NEC LCD1980SX"
	DefaultDepth    8
	SubSection "Display"
		Depth           8
		Modes           "1280x1024"
	EndSubSection
EndSection

> Maybe new monitor/setup or different graphic card is detected first ?

Possibly, the machine has two graphics cards.  However, the presence of
the A1262A never caused a problem before:

STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1280
STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
    id 35acda30-9a02587, conforms to spec rev. 8.0d
    graphics card name: A1262A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf8100000
stifb: 'A1262A' (id: 0x35acda30) not supported.

> Try fbset to get the current screen resolution.

mode "1280x1024"
    geometry 1280 1024 1280 1024 8
    timings 0 0 0 0 0 0 0
    rgba 8/0,8/0,8/0,0/0
endmode

>From the above, it looks like the timings aren't beeing set.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
