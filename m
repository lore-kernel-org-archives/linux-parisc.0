Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA15507
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 17:26:02 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 14 Jun 1999 23:25:48 -0000
Subject: Re: [parisc-linux] Dino PCI and I/O spaces
To: grundler@cup.hp.com (Grant Grundler)
Date: Tue, 15 Jun 1999 00:05:46 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199906142015.NAA18426@milano.cup.hp.com> from "Grant Grundler" at Jun 14, 99 01:15:10 pm
Content-Type: text
Message-Id: <E10tfnY-0006em-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > accesses. There seems to be no way to do byte sized config accesses, do
> > I just read 32bits mask and write 32bits ?
> 
> I thought Dino will forward the byte enables to the PCI bus.
> PCI-PCI bridge numbering I think depends on this.

So how do I set those. The documentaiton also says the low two bits of
the register read back as 0. I guess that doesnt actually imply that the
write of it has no affect. 

> It does for I/O space. I suspect all spaces are handled the
> same in this regard.
> See section 7.7.3 "Configuration Access Endianness".
> Other sections may talk more about the "byte enable" signals.

Ok

> > Im guessing you simply do that sized memory access to the 0x6C offset.
> That's been my experience.

Cool

> Enabling memory mapped I/O requires programming Dino to respond
> to a unique host address range. On the A/B/C/J class boxes, firmware
> takes care of this and programming PCI devices BAR registers to match.
> The OS can pick this up and pass it too device drivers.

Excellent. So I can relatively easily stuff an S3 card in the box and
use it as a debugging buffer once we get booting

> On these boxes it's "uncomplicated" since the host physical address
> is the same as the PCI bus address. I mention this since it's not
> the case for all HP platforms.

Ok. We have a clear notion of bus/physical/virtual seperation, and translation
macros. Linux stuff all uses

virt_to_bus() - to convert to bus space
virt_to_phys() - to convert to physical space

Alan
