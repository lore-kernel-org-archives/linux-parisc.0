Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C786482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 12:44:14 -0600 (MDT)
Message-Id: <200107291842.MAA15066@puffin.external.hp.com>
To: Reinhard.Gimbel@freenet.de
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
   of "Sat, 28 Jul 2001 12:35:20 +0200." <01072812322001.00935@octopus>
Date: Sun, 29 Jul 2001 12:42:56 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: C180 DINO/PCI problem; was: Help on install (2)
List-ID: <linux-parisc.vger.kernel.org>

Reinhard Gimbel wrote:
> > You have Dino 1.x ? I didn't think HP ever shipped those to
> > customers. Or did you mean another chip?
> > Perhaps post the console log output?
> 
> A friend of mine has a C180 with DINO v1.x (according to the
> boot messages of that box; I do not have a log of that box on 
> hand at present).

Ok. IIRC, early revs of dino mostly had problems with nested PCI-PCI
bridges. I'd need to review the dino errata and I don't have that with
me here.

> Dino version 2.1 (bridge mode) found at 0xf2000000
...
> dino_bridge_init: IO_ADDR_EN hasn't been configured.
> kernel BUG at dino.c:808!

hmm...the newer PDC isn't programming Dino or anything
below it since the PDC knows it's buggy. Seems like dino code
should just give up trying to walk the bus at this point.
I suspect that's crashing the box later.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
