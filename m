Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 618D8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Aug 2001 01:11:11 -0600 (MDT)
Message-Id: <200108210709.BAA20985@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: caslivkoff@yahoo.com, xpert@XFree86.Org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [Xpert][parisc-linux] white is blue 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sat, 18 Aug 2001 21:46:46 +0200." <20010818194852.79AE7482A@dsl2.external.hp.com>
Date: Tue, 21 Aug 2001 01:09:07 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> The 715/64 has the Artist graphics chip too, so I suspect we
> just need some more initialization for the "older revisions" of the Artist
> chip in the 712 machines.

It's possible the 715/64 firmware and 712 firmware behave differently.
ie artist chip initialization by firmware could be different.

I'm assuming stifb doesn't send a RESET command to the Artist chip directly
and start initializing from scratch.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
