Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA05336
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 09:35:30 -0700
Message-Id: <200011021642.IAA28616@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16 
In-reply-to: Your message of "Thu, 02 Nov 2000 12:01:58 PST."
             <20001102120158.B3632@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 02 Nov 2000 08:42:06 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Thu, Nov 02, 2000 at 11:30:47AM +0000, Richard Hirst wrote:
> > > Note sym53c8xx.c doesn't seem to bother with request_mem_region(), so
> > > maybe request_mem_region() is just broken.
> > 
> > It is broken because of the following line in kernel/resource.c:
> > 
> > struct resource iomem_resource = { "PCI mem", 0x00000000, 0xffffffff, IORES
>   OURCE_MEM };
> > 
> > 'end' needs to be rather higher than 0xffffffff on 64 bit.  I changed it to
> > 
> > struct resource iomem_resource = { "PCI mem", 0x00000000, ~0, IORESOURCE_ME
>   M };
> > 
> > and it works.  I havn't committed that 'fix' though.
> 
> Probably just as well... the pci_consistent interfaces were designed
> partly to stop 32-bit PCI cards having to do dual-address-cycle on
> machines with an IOMMU.  if you can, this card should get mapped below
> the 32-bit boundary.

Mathew,
That's not the whole story. The value (0xfffffffff8020000) seen by
the PCI driver *is* a 32-bit PCI address - dual address cycles are
not needed. pcibios_update_resource() mangles the address the PCI
device driver uses to fit the BAR it's supposed to get written to.
See arch/parisc/kernel/pci.c and I think you'll understand.

I think you are confusing DMA with PIO (register accesses). The
address above is only used to PIO to access registers and has
nothing to do with DMA (or I/O MMUs).

And PCI device's that can do dual address cycle *should* in
order to *avoid* the I/O MMU. The I/O MMU introduces a latency
in the DMA path which ideally would be avoided. Of course, there
are lots of issues with making that actually work...but it can work.

I haven't looked at the whole issue of 64-bit BAR's yet.
Mostly because I haven't had to. 64-bit BAR's work just fine
when the upper 32-bits are zero'd. :^)   But also because the 896 chip
(older rev's at least) has 64-bit BARs and it didn't work during
N-class bringup in Feb 1999. Currently shipping revs may work.
A hack needs to go into pci_quirks.c to support 896 64-bit BARs.

thanks for the ideas though,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
