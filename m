Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12368
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 11:03:50 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 27 Dec 2000 18:06:55 -0000
Subject: Re: [parisc-linux] performance
To: adevries@linuxcare.com (Alex deVries)
Date: Wed, 27 Dec 2000 18:08:29 +0000 (GMT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A4A214F.3DD53BAD@linuxcare.com> from "Alex deVries" at Dec 27, 2000 12:05:19 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14BL04-0002Zj-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> http://www.spec.org/osg/web99/results/res2000q4/
> 
> This shows some PA-RISC machines running HPUX performing reasonably
> well.

Specweb is basically a con. Its not a materially valuable benchmark. It benches
how fast your irq handler path is, how fast your memory cache is, how good
your DMA transfers are. It has almost nothing to do with how good a web
server the box is.

> What would it take to get parisc-linux to perform similiarly to HPUX for
> these kinds of numbers?  Showing that these kinds of numbers are
> possible for parisc-linux would certainly help in our quest to have real
> users.

Basically it comes down to using DMA, caching everything and using the fact
it is a completely hoax benchmark to write custom tuned code for the job. 
Even the people who 'use xyz webserver' and it sounds standard turn out to 
be embedding it or half of it in the kernel.

So it comes down to - tuning the network card driver, tuning the IRQ path, 
making sure the cache handling is optimal. The rest consists of loading the
machine with 8Gbytes of RAM, using obscenely smart ethernet cards and having
good memory bandwidth.

The 64bit pa-risc boxes have the hardware for it, in fact they have better 
hardware for it than x86. All you have to do is write better tlb, irq and pci
handling code than the HP/UX engineering team 8).

Alan
