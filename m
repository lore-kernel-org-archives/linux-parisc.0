Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id B101C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 18:09:15 -0600 (MDT)
Subject: Re: [parisc-linux] request_region()
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Wed, 4 Apr 2001 01:10:42 +0100 (BST)
Cc: rhirst@linuxcare.com (Richard Hirst),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <200104032357.RAA18650@puffin.external.hp.com> from "Grant Grundler" at Apr 03, 2001 05:57:22 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14kaso-0000m3-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Someone (willy or prumpf?) told me Linus (and/or perhaps others)
> have rejected such "automagic" redirection of IO space access functions.
> IIRC, the reason was complexity and extra CPU cycles.
> But it seems any multibus driver ends up doing it on its own anyway.

Some drivers do this andit works out fine. The real reason for suggesting
people generally avoid it is the cost of all the conditions and stuff.

If its done intelligently its not a problem because driver authors write

	if(dev->bus==GSC)
	{
		for(i=0;i<256;i++)
			*b++=raw_readl(foo+i);
	}
	else
	{
	}

not

	for(i=0;i<256;i++)
		*b++=magic_readl(foo+i);

The latter produces pretty hideous efficiency as you can imagine

> I was thinking perhaps the sim700 driver could be compiled
> *twice* to produce two binaries from the same source. One flavor
> to access devices which use MMIO and the other flavor would claim
> devices which only use IO port space. Thoughts?

In some cases that may be appropriate, eg if both devices are almost never
found in the same box.

One final comment. Every rule Linus makes you can get him to ignore if you have
a good case for it.

Alan
