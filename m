Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA07807
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 14:23:24 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 53D021E8
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 13:25:38 -0800 (PST)
Message-Id: <200011212124.NAA20426@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Tue, 21 Nov 2000 11:34:32 PST."
             <20001121113432.B883@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 21 Nov 2000 13:24:31 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> Someone (probably me) sends him a patch.  He told me at the Toronto
> show that he was quite happy to apply anything that only touched those
> two directories. (oh, and drivers/gsc wouldn't be a problem either).
> Can I just check that no-one wants to rename drivers/gsc again?  :-)

Hi Mathew,
I don't and it's a good question.
I would like a few files moved:

arch/parisc/kernel/ccio-dma.c    -> drivers/gsc/ccio-dma.c
arch/parisc/kernel/ccio-rm-dma.c -> drivers/gsc/ccio-rm-dma.c

    ccio will *always* be associated with a GSC bus since that's
    the secondary bus. And ccio supports devices below dino.c which
    already lives in drivers/gsc.

arch/parisc/kernel/lba_pci.c     -> drivers/ropes/lba_pci.c
arch/parisc/kernel/sba_iommu.c   -> drivers/ropes/sba_iommu.c
arch/parisc/kernel/iosapic.c     -> drivers/ropes/iosapic.c

    lba/sba code is equivalent to dino/ccio code for another set
    of platforms. And long term, I'm certain iosapic.c does not
    belong under arch/parisc. I can do this move if there are no
    major objections.

Any reason why we couldn't do these moves *after* you submit a patch?


FWIW, here are issues I see with merging IA64 iosapic code with mine:
o iosapic "discovery" (I invented register_iosapic() interface for parisc)
o parisc PDC calls (initialization)
o interrupt policy decisions (eg EOI generation and picking a CPU)
o I don't have time to do it in the near future.

Folks working on IA64 stuff inside HP need to think about:
(a) if they want to do the merge any time soon
(b) which iosapic.c they want to start with
(c) where the final version should live

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
