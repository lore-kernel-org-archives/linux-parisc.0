Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA18304
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 11:05:19 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 18:08:36 -0000
Subject: Re: [parisc-linux] ZONE_DMA
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 1 Jan 2001 18:09:53 +0000 (GMT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20010101174331.A21918@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 01, 2001 05:43:31 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14D9PA-00017j-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I'm not familiar with the hardware problem here.  Must EISA cards be
> restricted to a certain part of the address space?  I can glean from

EISA on PC can hit the full 32bits. DMA is meant to indicate the 16Mb lowest
memory segment that ISA can hit (which may not be at 0 depending on the box)

> the source that ISA cards are restricted to a 16MB address space --
> are we going to support ISA cards?

Some PCI cards have the same limit 8)

> I presume that no machine which supports ISA cards has an IOMMU that is
> capable of mapping a chunk of higher ram into the 16MB bus address space.

Some Alpha's probably can but we don't support that. The pci side API
pci_alloc_consistent does
