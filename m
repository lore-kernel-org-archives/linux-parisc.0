Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA30098
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 03:28:55 -0700
Date: Fri, 10 Nov 2000 02:16:11 -0800
Message-Id: <200011101016.CAA12058@pizda.ninka.net>
From: "David S. Miller" <davem@redhat.com>
To: matthew@wil.cx
CC: grundler@cup.hp.com, parisc-linux@thepuffingroup.com,
        jgarzik@mandrakesoft.com
In-reply-to: <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk>
	(message from Matthew Wilcox on Fri, 10 Nov 2000 10:18:08 +0000)
Subject: Re: [parisc-linux] tulip DMA mapping
References: <200011092012.MAA06943@milano.cup.hp.com> <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

   Date: Fri, 10 Nov 2000 10:18:08 +0000
   From: Matthew Wilcox <matthew@wil.cx>

   > Should I be mailing Jeff Garzik <jgarzik@mandrakesoft.com> directly?
   > Or can someone who knows Jeff point this out to him?

   i've cc'd jeff & dave miller on this.

In 2.4.x there is _NO_ error return from the PCI dma functions except
the consistent DMA mapping ones.

This was an explicit design decision, the dynamic mapping functions
should never fail, and if they do it is a hard error.

Therefore no drivers need to check for failure, as far as they are
concerned, there is no failure.

So what is the issue?  In 2.5.x I'll add an error return facility
(BTW: -1 ie. 0xfffffff would probably work as an error value on all
 platforms :-)

Later,
David S. Miller
davem@redhat.com
