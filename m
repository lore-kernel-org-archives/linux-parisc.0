Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA16461
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 22:58:34 -0700
Sender: rbrad@puffin.external.hp.com
Message-ID: <3A1B6D93.3B7D2474@uswest.net>
Date: Tue, 21 Nov 2000 22:54:11 -0800
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Matthew Wilcox <matthew@wil.cx>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
References: <200011212124.NAA20426@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Matthew Wilcox wrote:
> ...
> > Someone (probably me) sends him a patch.  He told me at the Toronto
> > show that he was quite happy to apply anything that only touched those
> > two directories. (oh, and drivers/gsc wouldn't be a problem either).
> > Can I just check that no-one wants to rename drivers/gsc again?  :-)
>
> Hi Mathew,
> I don't and it's a good question.
> I would like a few files moved:
>
> arch/parisc/kernel/ccio-dma.c    -> drivers/gsc/ccio-dma.c
> arch/parisc/kernel/ccio-rm-dma.c -> drivers/gsc/ccio-rm-dma.c

Grant,

Do you really want to merget the ccio-rm-dma.c file into Linus's tree?
It is just a reference file used to construct the real ccio-dma.c file ... I
don't believe it is referenced anywhere.

I'll double check this in the morning.

- Ryan


>     ccio will *always* be associated with a GSC bus since that's
>     the secondary bus. And ccio supports devices below dino.c which
>     already lives in drivers/gsc.
>
> arch/parisc/kernel/lba_pci.c     -> drivers/ropes/lba_pci.c
> arch/parisc/kernel/sba_iommu.c   -> drivers/ropes/sba_iommu.c
> arch/parisc/kernel/iosapic.c     -> drivers/ropes/iosapic.c
>
>     lba/sba code is equivalent to dino/ccio code for another set
>     of platforms. And long term, I'm certain iosapic.c does not
>     belong under arch/parisc. I can do this move if there are no
>     major objections.
>
> Any reason why we couldn't do these moves *after* you submit a patch?
>
> FWIW, here are issues I see with merging IA64 iosapic code with mine:
> o iosapic "discovery" (I invented register_iosapic() interface for parisc)
> o parisc PDC calls (initialization)
> o interrupt policy decisions (eg EOI generation and picking a CPU)
> o I don't have time to do it in the near future.
>
> Folks working on IA64 stuff inside HP need to think about:
> (a) if they want to do the merge any time soon
> (b) which iosapic.c they want to start with
> (c) where the final version should live
>
> thanks,
> grant
>
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
