Received: from P100.ruhr-uni-bochum.de (root@pec-31-36.tnt4.me2.uunet.de [149.225.31.36])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA03411
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 19:40:44 -0700
Received: from localhost (localhost [[UNIX: localhost]])
	by P100.ruhr-uni-bochum.de (8.8.8/8.8.8) id CAA20289
	for parisc-linux@puffin.external.hp.com; Fri, 3 Mar 2000 02:41:45 +0100
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: <parisc-linux@puffin.external.hp.com>
Subject: Re: [parisc-linux] lasi scsi driver
Date: Fri, 3 Mar 2000 02:34:03 +0100
Content-Type: text/plain
References: <200003022119.NAA11506@milano.cup.hp.com> <007901bf8490$8db01ef0$a94abc0f@hungary.hp.com>
In-Reply-To: <007901bf8490$8db01ef0$a94abc0f@hungary.hp.com>
MIME-Version: 1.0
Message-Id: <00030302414501.19213@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Am Thu, 02 Mar 2000 schrieb Gyula Matics:
> > Aside from the mailbox problems, have you added code to flush/purge
> > entries for payload data?
> 
> It is not a clean mailbox system. It is mixing data and commands in the
> mailbox...
> 
> > > I know that the architecture supports setting a page non-cacheable.
> > > My question is if it is possible / good idea to set the mailbox page
> > > to non-cacheable?
> > 
> > Philipp Rumpf mentioned a possible implementation to me in a private
> > e-mail (make_page_uncached()). He's open to other ideas and/or
> > interfaces if another architecture has already solved this problem.
> 
> The driver was originally written for m68k and one can find this code
> fragments in it:
> 
>     cache_push(virt_to_phys((void *)(instance->hostdata[0])), 8192);
>     cache_clear(virt_to_phys((void *)(instance->hostdata[0])), 8192);
>     kernel_set_cachemode(instance->hostdata[0], 8192, IOMAP_NOCACHE_SER);

Theese function (in the same order) was used in the lasi-ethernet-driver too.
Maybe you want to take a look at the functions dma_cache_inv() and
dma_cache_wback(), which I defined  at the top of the lasi_82596.c driver.
Currently this is really only a bad hack, but I think this is the way you could
go until make_page_uncached() is available.... ?
This means:
cache_push() -> dma_cache_wback()   and
cache_clear() -> dma_cache_inv().
I just added this hack, since currently dma_cache_inv() is defined as
flush_all_caches(), and this function doesn´t INVALIDATES the cache.

> 
> > in Documentation/DMA-mapping.txt. (I reccomend version 2.3.47
> 
> OK, i'll read it.
> 
> Gyula

Helge.
