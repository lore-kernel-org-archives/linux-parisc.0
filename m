Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA09438
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Mar 2000 12:34:49 -0700
Date: Sun, 5 Mar 2000 19:34:43 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: willy@thepuffingroup.com, huck@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000305193443.A8727@abacus.local>
References: <20000304144938.A9944@thepuffingroup.com> <200003050549.VAA03562@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003050549.VAA03562@milano.cup.hp.com>; from grundler@cup.hp.com on Sat, Mar 04, 2000 at 09:49:49PM -0800
List-ID: <linux-parisc.vger.kernel.org>

> In personal conversations, two knowledgable folks have suggested
> the following:
> o PA-7100LC systems support uncacheable memory and subcacheline access.
>   So these boxes should be supportable.
> 
> o PA-7300LC systems *might* support uncacheable memory and subcacheline...
>   (Could anyone definitively answer this for any PA-7300LC box?)

It does, according to our documentation.

> o PA-7000 systems are pretty much SOL.
>   (But they could be perfectly useful if folks add cache flushing to
>    the few device drivers needed for graphics and stuff off of LASI.)

More importantly, they don't use PCI (and not even GSC).  It's perfectly
fine for us to require HP-PB drivers aso to do cache flushing.

> In summary, the number of "unsupportable" systems isn't as big
> as I first thought.

I'm still not convinced there's going to be any problem at all, even on
runway systems.

	Philipp Rumpf
