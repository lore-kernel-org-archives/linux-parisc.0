Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA29188
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Feb 2000 08:37:14 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id HAA02028
	for <parisc-linux@thepuffingroup.com>; Thu, 17 Feb 2000 07:37:52 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id HAA08803 for parisc-linux@thepuffingroup.com; Thu, 17 Feb 2000 07:37:52 -0700 (MST)
Date: Thu, 17 Feb 2000 07:37:52 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002171437.HAA08803@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Virtual mapping of IO cards
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> >
> > Drivers for memory mapped register only cards, i.e. cards without any
> > type of onboard memory (i.e. framebuffers, script memory, etc.) are
> > not very likely to ever run into a bug of this type, since register
> pointers are usually set up once and never changed.
>
> Agreed. "not very likely" and "never" are not the same. When bringing
> up new drivers, it is in fact more likely than for a mostly working
>  driver. So while I agree with the statement, I don't agree with the
> conclusion.

I guess I was mostly talking from a released version perspective, not a
development perspective.  During development you would actually get even
more debug information if you just put driver specific range checking into
a private version of the read/write macro's (i.e. you could get source
code line numbers, etc.)

I really am not trying to argue strongly against mapping the cards. I
see only two performance issues:

    1) PCXL2 processors require that the U bit be set for IO mappings.
    As far as I can tell, this is the only processor that requires this.
    The TLB miss handlers don't currently support this. We would have
    to add support for it in the D miss handler. Since the U bit is
    in an inconvenient location it would require a separate test and
    deposit, making all code pay the penalty of the additional
    instructions. Perhaps we would eventually want to add the U bit
    support anyway, but not all processors support it (the
    PCXS and PCXT processors do not support it).

    2) I really would like to avoid mapping the framebuffer into
    the kernel address space. Perhaps maybe that is not really an
    issue, since after boot the user will bring up X windows and
    the kernel mapping won't actually be actively used (I'm assuming
    that graphics on Linux maps the framebuffer into the user address
    space, but I haven't checked to be sure).

So, if you want to map the cards, I'm not going to oppose that.

John
