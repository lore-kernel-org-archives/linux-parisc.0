Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A8D64953
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 11:15:41 -0600 (MDT)
Message-Id: <200110101711.LAA19860@puffin.external.hp.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] b132l pci question 
In-Reply-To: Message from Sonny Cook <sonny@aspersion.org>
   of "Wed, 10 Oct 2001 08:36:54 -0000." <Pine.LNX.4.33.0110100833420.4675-100000@lefou.zayda.com>
Date: Wed, 10 Oct 2001 11:11:31 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Sonny Cook wrote:
> I just got a b132l (woohoo).  How well is the pci bus supported.

It works. I wrote the original code but don't maintain it now.
(hint-hint)

>   There
> seem to be some voltage caveats with 5v and 3.3v, but I am not clear on
> the issues.

Yeah. I believe dino is capable of running up to 66 Mhz PCI (2x-PCI)
even though it's not clear that was ever done because of trace lengths.
Bus speeds above 33Mhz require 3.3v signalling.

>   Are there cards which are know to work, specifically, I am
> interested in wunning extra nics in it.

Yes - Tulip 100BT and all Symbios SCSI wun just fine. :^)

General advice:
"Universal PCI" cards (cards which are keyed to fit both 3.3v and 5v slots)
in general should work if you find a driver. Otherwise look at the product
specs to determine which voltage slots your B132L supports. Oh and the slots
are keyed to prevent folks from installing incompatible cards in the slot.
So if you already have the cards and know a driver is available, just try
to install the card.

grant
