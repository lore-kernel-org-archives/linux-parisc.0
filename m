Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23501
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 11:00:45 -0700
Message-Id: <200012011748.JAA01316@milano.cup.hp.com>
To: Xavier Debacker <xavier.debacker@esiee.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] sti rom access on B132/B180 
In-reply-to: Your message of "Fri, 01 Dec 2000 16:42:20 PST."
             <3A27C6DC.EA6F6965@esiee.net>
Date: Fri, 01 Dec 2000 09:47:59 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Xavier Debacker wrote:
> the bios indicates that the graphics are at 0xf8000000

s/bios/PDC/

> - it's pci based card, so the sti rom must be accessible through the pci
> expansion rom space and optionally, the base hpa.

The built-in graphics for B/C-class w/PCX-L2 CPU are *not* PCI devices.
No PCI expansion ROM.

[ In private exchange, Xavier confirmed the device in question is:
  Gecko GSC Core Graphics (10) at 0xf8000000...
]

And I have to confess out of ignorance I broke PCI Expansion ROM
support for A500.  I'll fix it in the near future.
PCI expansion ROM support should work on all other platforms.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
