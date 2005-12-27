From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] X startup failure
Date: Tue, 27 Dec 2005 23:38:10 +0100
Message-ID: <200512272338.10264.deller@gmx.de>
References: <200512271437.jBREbxA8021653@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512271437.jBREbxA8021653@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave,

On Tuesday 27 December 2005 15:37, John David Anglin wrote:
> > On Monday 26 December 2005 22:34, John David Anglin wrote:
> > > X no longer starts on my c3k using unstable.  The problem seems
> > > to be:
> > > 
> > > (EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument

This message has always been here.

> > > XF86Config-4 hasn't changed for at least a year.  Any ideas?
> > 
> > I assume your screen resolution changed. 
> 
> No.  I've had the following entries in XF86Config-4 since Sep 2003:
> 
> Section "Device"
>         Identifier      "HP Visualize-EG"
> 	Driver          "fbdev"
> 	Option          "UseFBDev"              "true"
> EndSection
> 
> Section "Monitor"
> 	Identifier      "NEC LCD1980SX"
> 	HorizSync       30-107
> 	VertRefresh     50-85
> 	Option          "DPMS"
> EndSection
> 
> Section "Screen"
> 	Identifier      "Default Screen"
> 	Device          "HP Visualize-EG"
> 	Monitor         "NEC LCD1980SX"
> 	DefaultDepth    8
> 	SubSection "Display"
> 		Depth           8
> 		Modes           "1280x1024"
> 	EndSubSection
> EndSection

Ok.

> > Maybe new monitor/setup or different graphic card is detected first ?
> 
> Possibly, the machine has two graphics cards.  However, the presence of
> the A1262A never caused a problem before:
> 
> STI GSC/PCI core graphics driver Version 0.9a
> STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
>     id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
>     graphics card name: PCI_GRAFFITIX1280
> STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
>     id 35acda30-9a02587, conforms to spec rev. 8.0d
>     graphics card name: A1262A
> sticon: Initializing STI text console.
> Console: switching to colour STI console 160x64
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf8100000
> stifb: 'A1262A' (id: 0x35acda30) not supported.


yep. neither..


> > Try fbset to get the current screen resolution.
> 
> mode "1280x1024"
>     geometry 1280 1024 1280 1024 8
>     timings 0 0 0 0 0 0 0
>     rgba 8/0,8/0,8/0,0/0
> endmode
> 
> From the above, it looks like the timings aren't beeing set.

They are always 0 for fb-devices.

I tried myself with current kernel.

- 32bit kernel on c3k works for me. Can you try again with current kernel ?

- 64bit kernel on my c3k crashes, but this doesn't seem (with strace) related to stifb. Maybe this is due to some mmap() problems ?

Sorry, no better idea...

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
