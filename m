Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA11694
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 17:52:52 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13yO9t-0007M4-00; Wed, 22 Nov 2000 00:53:09 +0000
Date: Wed, 22 Nov 2000 00:53:09 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Message-ID: <20001122005309.A27306@parcelfarce.linux.theplanet.co.uk>
References: <20001121113432.B883@parcelfarce.linux.theplanet.co.uk> <200011212124.NAA20426@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011212124.NAA20426@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Nov 21, 2000 at 01:24:31PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 01:24:31PM -0800, Grant Grundler wrote:
> I would like a few files moved:
> 
> arch/parisc/kernel/ccio-dma.c    -> drivers/gsc/ccio-dma.c
> arch/parisc/kernel/ccio-rm-dma.c -> drivers/gsc/ccio-rm-dma.c
> arch/parisc/kernel/lba_pci.c     -> drivers/ropes/lba_pci.c
> arch/parisc/kernel/sba_iommu.c   -> drivers/ropes/sba_iommu.c
> arch/parisc/kernel/iosapic.c     -> drivers/ropes/iosapic.c

> Any reason why we couldn't do these moves *after* you submit a patch?

Better to get our house in order before we patchbomb Linus, I think.
Renames are hard enough in CVS; renames in diff -u format are a real
stinker :-)

-- 
Revolutions do not require corporate support.
