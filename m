Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7158482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 12:59:05 -0600 (MDT)
Message-Id: <200107291857.MAA15094@puffin.external.hp.com>
To: Reinhard.Gimbel@freenet.de
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
   of "Sat, 28 Jul 2001 12:34:46 +0200." <01072812114300.00935@octopus>
Date: Sun, 29 Jul 2001 12:57:51 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: C180 DINO/PCI problem; was: Help on install (1)
List-ID: <linux-parisc.vger.kernel.org>

Reinhard Gimbel wrote:
> Expect the GRAPHICS(3) graphics adaptor (which is an EISA card)
> there is no expansion card installed in my C180. The 2 PCI slots
> are not occupied by expansion cards.
...
> On the other hand the C180 had a working HP-UX 10.20 as I bought
> it weeks ago. So there must be a software solution for the DINO
> problem.

Trust me. There isn't. On some of the boxes a HW workarond is possible.
But I'm not clear on if that ever got pushed out in replacement motherboards
to customers. I was under the impression the problem was "fixed" by
swapping for a motherboard with dino 3.1.

> > Perhaps...updating the firmware to the latest will not let
> > the system boot if in fact that's the case. remove all PCI
> > devices and then the system will boot.
> 
> No PCI device to remove (as an expansion card) ...

Ok.

> ... but how about a firmware update ? My box has firmware
> version 2.7. Is that o.k. so far? Or is there a newer firmware
> available ? The other questions is: Would a firmware upgrade
> help to solve my problem?

Definitely update. You want to know if your box is useable or not.

The FAQ has a nice section on firmware updates which I think
answers this set of questions.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
