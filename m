Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id BAA20151
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 01:10:57 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id C9BB240A
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 03:13:12 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id BAA14756 for parisc-linux@puffin.external.hp.com; Wed, 22 Nov 2000 01:11:57 -0700 (MST)
Date: Wed, 22 Nov 2000 01:11:57 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011220811.BAA14756@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Ryan Bradetich wrote:
> > Do you really want to merget the ccio-rm-dma.c file into Linus's tree?
> > It is just a reference file used to construct the real ccio-dma.c file ... I
> > don't believe it is referenced anywhere.
>
> Hi Ryan,
> Yes I do. It is supposed to work for ccio+PCX-W platforms (eg C360).
> Keeping it arround will document the pro/con's of that approach and
> give folks who have time (and the right machine) something to experiment
> with instead of writing it from scratch.  If someone finds an application
> it's good for (short transactions with low latency requirements perhaps),
> it's worth having around.
>
> It's not referenced because I didn't add a CONFIG_CCIO_RM_IOMMU flag
> or ccio_rm_init() call to drivers/gsc/gsc.c:gsc_init().  You are welcome
> add this CONFIG flag by hacking arch/parisc/config.in and defconfig.
> If you do, please add rules which only allow one or the other
> CONFIG_CCIO* option to be enabled.
>
Well, personally i'd vote to get rid of it. It works for ONE machine only,
and MAY have an advantage in some small case. But if we keep it, lets make
sure that it is real clear that it should NOT be the default choice.

It should be marked CONFIG_EXPERIMENTAL, and the text associated with it
should clearly show that it works on a C360 only. If possible, it should
also be made clear that ccio-dma.c works for C360, so people who have
C360's don't think they have to choose ccio-rm-dma.c.

Grant, I hope you are prepared to answer the parisc-linux mailing list
questions this is going to generate once parisc-linux starts becoming more
visible.  Another FAQ entry perhaps? :-)

John Marvin
jsm@fc.hp.com
