Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA18692
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 11:21:26 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 18:24:44 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14D9dL-0006L9-00; Mon, 01 Jan 2001 18:24:35 +0000
Date: Mon, 1 Jan 2001 18:24:35 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA
Message-ID: <20010101182435.C21918@parcelfarce.linux.theplanet.co.uk>
References: <20010101174331.A21918@parcelfarce.linux.theplanet.co.uk> <E14D9PA-00017j-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14D9PA-00017j-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Mon, Jan 01, 2001 at 06:09:53PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 01, 2001 at 06:09:53PM +0000, Alan Cox wrote:
> > I'm not familiar with the hardware problem here.  Must EISA cards be
> > restricted to a certain part of the address space?  I can glean from
> 
> EISA on PC can hit the full 32bits. DMA is meant to indicate the 16Mb lowest
> memory segment that ISA can hit (which may not be at 0 depending on the box)

OK, so people who write EISA drivers are not going to specify GFP_DMA.
Or shouldn't.

> > the source that ISA cards are restricted to a 16MB address space --
> > are we going to support ISA cards?
> 
> Some PCI cards have the same limit 8)

But that's handled through the PCI DMA mapping interface these days.

So how should we be populating our zones?  Put all of our memory in
ZONE_DMA, like ppc, since the only people who'll be specifying GFP_DMA
will have done so incorrectly?  Put the first 16MB of it in there,
since we might support ISA some day?  Put none of it in there on the
grounds we don't support ISA at all?

-- 
Revolutions do not require corporate support.
