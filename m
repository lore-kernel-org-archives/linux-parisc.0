Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA11291
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 12:09:10 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 7 Jul 1999 18:09:39 -0000
Subject: Re: [parisc-linux] Whee! Dino is recognized.
To: adevries@thepuffingroup.com (Alex deVries)
Date: Wed, 7 Jul 1999 19:07:41 +0100 (BST)
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <37839773.AE65FE8E@thepuffingroup.com> from "Alex deVries" at Jul 7, 99 02:07:47 pm
Content-Type: text
Message-Id: <E111w6h-0006sg-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > You don't need to. It doesn't help on single processor systems
> > and only adds complexity in the IRQ management.
> >
> 
> Oh, that wasn't quite clear in the dino docs.  I'll just ignore IAR1
> then.

Right now the code treats the IRQ off IAR0 and IAR1 as the same - so you 
register an IRQ and SMP folks can load balance it later.

> The kernel already has generic PCI bus walking code, so this shouldn't
> be too difficult

It assumes the bus has been configured. If not then Russ King has a set
of nastiness for configuring the PCI bus on his ebsa285 we can half inch
