Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29504
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 13:43:30 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 20:46:26 -0000
Subject: Re: [parisc-linux] SuckyIO support
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 20 Dec 2000 20:47:45 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), adevries@linuxcare.com (Alex deVries),
        grundler@cup.hp.com (Grant Grundler), parisc-linux@thepuffingroup.com,
        grundler@milano.cup.hp.com
In-Reply-To: <200012201731.JAA17254@milano.cup.hp.com> from "Grant Grundler" at Dec 20, 2000 09:30:30 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E148q9M-0001y8-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> In our case, it's the IRQ region plus IRQ offset right now.
> I've proposed another IRQ scheme which would replace the math with
> a lookup table. But we haven't done anything with it yet since
> the region+offset is "good enough" for now.

Providing dev->irq is a suitable size putting a pointer into it is also 
perfectly acceptable although it makes the error reports look odd. Which
reminds me that someday we need canonicalise_irq(irq) for reporting stuff
nicely cross arch
