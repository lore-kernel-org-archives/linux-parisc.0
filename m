Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA01046
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 13:10:11 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id F28D66B9
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 15:12:26 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id MAA21917
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 12:11:24 -0800 (PST)
Message-Id: <200011222011.MAA21917@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Tue, 21 Nov 2000 13:24:31 PST."
             <200011212124.NAA20426@milano.cup.hp.com>
Date: Wed, 22 Nov 2000 12:11:23 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> arch/parisc/kernel/ccio-dma.c    -> drivers/gsc/ccio-dma.c
> arch/parisc/kernel/ccio-rm-dma.c -> drivers/gsc/ccio-rm-dma.c
> 
>     ccio will *always* be associated with a GSC bus since that's
>     the secondary bus. And ccio supports devices below dino.c which
>     already lives in drivers/gsc.

Ryan - moving/keeping these files is up to you.
I was just sharing what I thought was "right".
Apologies for not making that clear earlier.


> arch/parisc/kernel/lba_pci.c     -> drivers/ropes/lba_pci.c
> arch/parisc/kernel/sba_iommu.c   -> drivers/ropes/sba_iommu.c
> arch/parisc/kernel/iosapic.c     -> drivers/ropes/iosapic.c

I've talked to one of the folks working on IA64-linux.
They are interested in merging iosapic code but haven't even
looked at the parisc version I wrote. We talked a bit about the
issues and it doesn't sound like it's going to happen anytime soon.
In any case, iosapic.c doesn't belong under "drivers/ropes".

So none of this needs to move in the forseeable future.
It can all stay in arch/parisc/kernel.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
