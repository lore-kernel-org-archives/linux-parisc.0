Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA01365
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 15:45:22 -0700
Received: from bimbo.hungary.hp.com (bimbo.hungary.hp.com [15.188.72.201])
	by palrel1.hp.com (Postfix) with ESMTP id C1B70B48
	for <parisc-linux@puffin.external.hp.com>; Thu,  2 Mar 2000 13:46:23 -0800 (PST)
Message-ID: <007901bf8490$8db01ef0$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <grundler@cup.hp.com>
Cc: <parisc-linux@puffin.external.hp.com>
References: <200003022119.NAA11506@milano.cup.hp.com>
Subject: Re: [parisc-linux] lasi scsi driver
Date: Thu, 2 Mar 2000 22:44:56 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> Aside from the mailbox problems, have you added code to flush/purge
> entries for payload data?

It is not a clean mailbox system. It is mixing data and commands in the
mailbox...

> > I know that the architecture supports setting a page non-cacheable.
> > My question is if it is possible / good idea to set the mailbox page
> > to non-cacheable?
> 
> Philipp Rumpf mentioned a possible implementation to me in a private
> e-mail (make_page_uncached()). He's open to other ideas and/or
> interfaces if another architecture has already solved this problem.

The driver was originally written for m68k and one can find this code
fragments in it:

    cache_push(virt_to_phys((void *)(instance->hostdata[0])), 8192);
    cache_clear(virt_to_phys((void *)(instance->hostdata[0])), 8192);
    kernel_set_cachemode(instance->hostdata[0], 8192, IOMAP_NOCACHE_SER);

> in Documentation/DMA-mapping.txt. (I reccomend version 2.3.47

OK, i'll read it.

Gyula
