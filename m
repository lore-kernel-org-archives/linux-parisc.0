Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA03654
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 09:22:26 -0700
Message-Id: <200011101629.IAA07872@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] tulip DMA mapping 
In-reply-to: Your message of "Fri, 10 Nov 2000 10:18:08 PST."
             <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 10 Nov 2000 08:29:25 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Mathew,
I think the situation is clarified. This is just FYI.

Matthew Wilcox wrote:
> On Thu, Nov 09, 2000 at 12:12:25PM -0800, Grant Grundler wrote:
> > 0 is a valid pci_map_single() return value when the system has an IO MMU.
> 
> Oh dear.  You can bet tulip won't be the only driver which assumes it
> isn't a valid return value.

Well, then:
1) the driver writer made a wrong assumption that the "spec"
   does not support.
2) that wasn't the case here - 0 was used as a flag to indicate
   a mapping had (or hadn't rather) been done - not that the
   mapping call had failed.

> Can't our IOMMU code be limited in such a
> way that 0 is not a valid return value?  Say, constrain all allocated
> addresses to the top half of the device bus?

It could pretty easily by reserving the dma_map[0] entry during
init time. Dave Miller already made it clear that's not desirable.

> (um, just check me on this, map_single returns a device bus address,
> not a processor bus address, right?)

Yes. It's the address a device must use to master DMA transactions.
pci_map_single() input parameters are "struct pci_dev *", virtual host
memory address, and buffer size. The return is a device specific I/O
DMA address - ie this mapping cannot be shared with other devices.

FWIW, "I/O DMA address" are called IOVAs in HPUX (I/O Virtual Address).
The HW guys prefer another name but this one stuck.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
