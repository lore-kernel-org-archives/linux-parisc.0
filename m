Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA13512
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 09:23:56 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 14 Jun 1999 15:23:38 -0000
Subject: Re: [parisc-linux] Dino PCI and I/O spaces
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 14 Jun 1999 16:21:29 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-Reply-To: <19990614172117.K31472@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 14, 99 05:21:17 pm
Content-Type: text
Message-Id: <E10tYYE-00067e-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, Jun 14, 1999 at 04:15:08PM +0100, Alan Cox wrote:
> > Also as a btw: PCI I/O port access will suck rocks on HP because we have
> > to grab a lock since it is a two stage operation. That may mean we want
> > to write smart copy/csum/io and ins* functions for PCI block I/O.
> 
> Do we only have to grab a lock on SMP machines, or can we sleep between
> the two accesses?

On a uniprocessor we might take an interrupt between the two cycles. So we
have to suffer anyway
