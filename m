Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA16880
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 06:03:15 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 1 Dec 2000 13:05:43 -0000
Subject: Re: [parisc-linux] XFree status
To: grundler@cup.hp.com (Grant Grundler)
Date: Fri, 1 Dec 2000 12:55:59 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), parisc-linux@thepuffingroup.com
In-Reply-To: <200012010740.XAA01023@milano.cup.hp.com> from "Grant Grundler" at Nov 30, 2000 11:40:10 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141pjO-0000Cr-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > For I/O it seems that on things like the A180 the only way to do it is to use
> > /dev/port and pread/pwrite the file handle for each port I/O.
> 
> Why do you think only I/O port space can be used for XFree86?

The initial card bring up is done as if it was an ISA device (PCI bus 
has hacks for this). The emulator will use entirely I/O cycles to bring the
card up in most cases.

> Is the BIOS/x86 emulator wanting to talk to VGA registers the issue?

To start with. Not all PC devices have MMIO at all.

> jsm tells me VGA MMIO lives at 0xA0000.

That is the frame buffer memory.

> Dino only forwards 0xf0800000 through FF80_0000-1 to the PCI bus below.
> (See section 7.9 "Accessing PCI Memory Space" in dino3.pdf).

Thats ok. PCI has BAR{n} registers to set base addresses. The rest is down to
lying in the correct way to everybody concerned

So we just need to set it up so that the PCI mapping of the registers is 
put in the F080->FF80 range, and that XFree is told to mmap F080->FF80 range
addresses but believing they are 0->n ranges.

That kind of PCI fixup is quite doable. The older Alphas for example have
byte, word and long access windows (the early alphas had no byte operations
internally or at bus level) which was far worse.

Alan
