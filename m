Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA30175
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 14:08:39 -0700
Message-Id: <200012202112.NAA17564@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Wed, 20 Dec 2000 20:47:45 PST."
             <E148q9M-0001y8-00@the-village.bc.nu>
Date: Wed, 20 Dec 2000 13:12:19 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> > In our case, it's the IRQ region plus IRQ offset right now.
> > I've proposed another IRQ scheme which would replace the math with
> > a lookup table. But we haven't done anything with it yet since
> > the region+offset is "good enough" for now.
> 
> Providing dev->irq is a suitable size putting a pointer into

only for 32-bit ILP. 64-bit LP (hppa) can't do that.
"int" is only 32-bits for both. Good idea though.

HP-UX has used "intr_obj" (iirc, void *) since 10.x and probably before.
The idea of a lookup table (I mentioned it above) would be obsoleted by
dev->irq defined as void *.
Maybe 2.5 kernel could use void * for dev->irq?

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
