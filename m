Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA14311
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 10:11:37 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 14 Jun 1999 16:11:24 -0000
Subject: Re: [parisc-linux] Dino PCI and I/O spaces
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 14 Jun 1999 17:10:28 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, Matthew.Wilcox@genedata.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19990614173757.L31472@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 14, 99 05:37:57 pm
Content-Type: text
Message-Id: <E10tZJe-0006Bu-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > On a uniprocessor we might take an interrupt between the two cycles. So we
> > have to suffer anyway
> 
> Then we ought to disable interrupts, surely?  Otherwise we can have:
> 
> Grab lock
> interrupt taken
> driver attempts to perform IO, tries to take lock, machine hangs solid.
> 
> Or what sort of locking scheme did you have in mind?

Im already using spinlock_irqsave, for the obvious reason you enumerate above
