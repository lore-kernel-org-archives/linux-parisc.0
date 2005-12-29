From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] X startup failure
Date: Thu, 29 Dec 2005 10:12:35 +0000
Message-ID: <43B3B693.6030803@tiscali.be>
References: <200512271437.jBREbxA8021653@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200512271437.jBREbxA8021653@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

2 pence idea ;?

John David Anglin wrote:
> Hi Helge,
> 
> 
>>On Monday 26 December 2005 22:34, John David Anglin wrote:
>>
>>>X no longer starts on my c3k using unstable.  The problem seems
>>>to be:
>>>
>>>(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
>>>
this is definitely the pb?

>>>XF86Config-4 hasn't changed for at least a year.  Any ideas?
>>
>>I assume your screen resolution changed. 
> 
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
> 
> 
>>Maybe new monitor/setup or different graphic card is detected first ?
> 
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
> 
I just remember of a pb encountered a long time ago: is your pdc settings set well the graphic device to PCI_GRAFFITIX1280?

How could we check that fb0 point well to this PCI_GRAFFITIX1280 and not to A1262A?

sorry no such hw available to help more,
	Joel
