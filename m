Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout1.freenet.de (mout1.freenet.de [194.97.50.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id D192D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Jul 2001 04:36:39 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: Grant Grundler <grundler@puffin.external.hp.com>,
	Matthew Wilcox <willy@debian.org>
Date: Sat, 28 Jul 2001 12:34:46 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <200107261842.MAA19577@puffin.external.hp.com>
In-Reply-To: <200107261842.MAA19577@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <01072812114300.00935@octopus>
Subject: [parisc-linux] C180 DINO/PCI problem; was: Help on install (1)
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Matthew Wilcox wrote:
> > ** "HP has discovered a potential system defect that can affect
> > ** the behavior of five models of HP VISUALIZE workstations when
> > ** equipped with third-party or customer-installed PCI I/O expansion
> > ** cards. The defect is limited to the HP C180, C160, C160L, B160L,
> > ** and B132L VISUALIZE workstations, and will only be encountered
> > ** when data is transmitted through PCI I/O expansion cards on the
> > ** PCI bus. HP-supplied graphics cards that utilize the PCI bus are
> > ** not affected."

Expect the GRAPHICS(3) graphics adaptor (which is an EISA card)
there is no expansion card installed in my C180. The 2 PCI slots
are not occupied by expansion cards.

I don't have too much knowledge of the architecture of HP
workstations, but aren't NCR SCSI chips part of the PCI
architecture in ordinary PCs ? Of course there must not be the
same way to implement the SCSI chip in the HP architecture ! But
who knowns ...

On the other hand the C180 had a working HP-UX 10.20 as I bought
it weeks ago. So there must be a software solution for the DINO
problem.

> > Maybe we're triggering this bug... grant?
>
> Perhaps...updating the firmware to the latest will not let
> the system boot if in fact that's the case. remove all PCI
> devices and then the system will boot.

No PCI device to remove (as an expansion card) ...

... but how about a firmware update ? My box has firmware
version 2.7. Is that o.k. so far ? Or is there a newer firmware
available ? The other questions is: Would a firmware upgrade
help to solve my problem ?

Reinhard.
