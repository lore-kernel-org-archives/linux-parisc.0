Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA16084
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 18:48:48 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id UAA15699
	for <parisc-linux@thepuffingroup.com>; Mon, 14 Jun 1999 20:48:21 -0400 (EDT)
Message-Id: <199906150048.RAA19186@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino PCI and I/O spaces 
In-reply-to: Your message of "Tue, 15 Jun 1999 00:05:46 PDT."
             <E10tfnY-0006em-00@the-village.bc.nu>
Date: Mon, 14 Jun 1999 17:48:20 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> > > accesses. There seems to be no way to do byte sized config accesses, do
> > > I just read 32bits mask and write 32bits ?
> > 
> > I thought Dino will forward the byte enables to the PCI bus.
> > PCI-PCI bridge numbering I think depends on this.
> 
> So how do I set those. The documentaiton also says the low two bits of
> the register read back as 0. I guess that doesnt actually imply that the
> write of it has no affect. 

The PCI_CONFIG_ADDR register (offset 0x64) is used to source the
word address. So it's not surprising the lower order bits are RO.

"Byte enables" are GSC and PCI bus signals - not register contents.
The PA processor generates byte enable signals on the GSC bus and
Dino forwards those for the appropriate bytes (swapped to match
the swapping/endian conversion done for the PCI_CONFIG_DATA register.)
The byte enable signals are taken when a processor read/write targets
the PCI_CONFIG_DATA register (offset 0x68). The contents of PCI_CONFIG_ADDR
and bytes enable signals from GSC bus are combined to generate a read/write
transaction on the PCI bus.

(Disclaimer: I'm not as certain of the above as it sounds though I
believe it's correct - remember, I'm a SW engineer :^)


> > On these boxes it's "uncomplicated" since the host physical address
> > is the same as the PCI bus address. I mention this since it's not
> > the case for all HP platforms.
> 
> Ok. We have a clear notion of bus/physical/virtual seperation, and
> translation macros. Linux stuff all uses
> 
> virt_to_bus() - to convert to bus space
> virt_to_phys() - to convert to physical space

Excellent.

later,
grant

> 
> Alan
> 

Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
