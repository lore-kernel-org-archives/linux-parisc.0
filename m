Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19028
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 11:27:36 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 18:30:52 -0000
Subject: Re: [parisc-linux] ZONE_DMA
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 1 Jan 2001 18:32:11 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), matthew@wil.cx (Matthew Wilcox),
        parisc-linux@thepuffingroup.com
In-Reply-To: <20010101182435.C21918@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 01, 2001 06:24:35 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14D9kj-00019e-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > EISA on PC can hit the full 32bits. DMA is meant to indicate the 16Mb lowest
> > memory segment that ISA can hit (which may not be at 0 depending on the box)
> 
> OK, so people who write EISA drivers are not going to specify GFP_DMA.
> Or shouldn't.

Or know something about their hardware being crap.

> > Some PCI cards have the same limit 8)
> But that's handled through the PCI DMA mapping interface these days.

Yes

> So how should we be populating our zones?  Put all of our memory in
> ZONE_DMA, like ppc, since the only people who'll be specifying GFP_DMA
> will have done so incorrectly?  Put the first 16MB of it in there,

That is a very dangerous assumption (as some PPC people have discovered when
they DMA stuff into the wrong place)

> since we might support ISA some day?  Put none of it in there on the
> grounds we don't support ISA at all?

I think none is safer. pci_alloc_consistent seems to address all the stuff
we worry about. 

Alan
