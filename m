Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19439
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 11:52:50 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 18:56:05 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14DA7h-0006hp-00; Mon, 01 Jan 2001 18:55:57 +0000
Date: Mon, 1 Jan 2001 18:55:57 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA
Message-ID: <20010101185557.A25603@parcelfarce.linux.theplanet.co.uk>
References: <20010101182435.C21918@parcelfarce.linux.theplanet.co.uk> <E14D9kj-00019e-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14D9kj-00019e-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Mon, Jan 01, 2001 at 06:32:11PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 01, 2001 at 06:32:11PM +0000, Alan Cox wrote:
> Or know something about their hardware being crap.

Hm.

> > So how should we be populating our zones?  Put all of our memory in
> > ZONE_DMA, like ppc, since the only people who'll be specifying GFP_DMA
> > will have done so incorrectly?  Put the first 16MB of it in there,
> 
> That is a very dangerous assumption (as some PPC people have discovered when
> they DMA stuff into the wrong place)
> 
> > since we might support ISA some day?  Put none of it in there on the
> > grounds we don't support ISA at all?
> 
> I think none is safer. pci_alloc_consistent seems to address all the stuff
> we worry about. 

But if we have none, then all GFP_DMA allocations will fail.  Which
includes the scsi midlayers.  Ooh, I just noticed that scsi_scan.c
is broken...  expect a patch RSN.

-- 
Revolutions do not require corporate support.
