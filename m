Received: from rhirst.linuxcare.com (user-83-59.jakinternet.co.uk [194.88.83.59] (may be forged))
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA27848
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 13:11:08 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1991BB007; Thu, 30 Nov 2000 20:09:23 +0000 (GMT)
Date: Thu, 30 Nov 2000 20:09:23 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Gunneswara Marripudi <raomg@cup.hp.com>,
        parisc-linux@puffin.external.hp.com
Subject: Re: Question on Linux DMA routines
Message-ID: <20001130200923.Q22285@linuxcare.com>
References: <200011301731.JAA29335@milano.cup.hp.com> <200011301801.KAA29413@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011301801.KAA29413@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Nov 30, 2000 at 10:01:13AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 30, 2000 at 10:01:13AM -0800, Grant Grundler wrote:
> Grant Grundler wrote:
> ...
> > The HW *is* fully coherent when the CPU doesn't cache the pages.
> > Only systems with PCX-L/L2 CPU (need to) operate this way.
> > All other platforms have an I/O MMU which manages the coherency.
> 
> Correction - PCX-T and older platforms are not coherent and U-bit
> isn't available/useable on those machines. Drivers must do their own
> cache flushing. sim700 (LASI SCSI) does this and I think Apricot
> (LASI LAN) too. I'm suspecting this might be part of the 735 problems.

That's right, sim700 and apricot call pci_alloc_consistent() and if
that fails they fall back to get_free_pages() and explicit cache
flushing and invalidating with dma_cache_wback/dma_cache_inv calls.
pci_alloc_consistent() should fail on pcx, pcxs and pcxt according
to setup.c.

When sim700 complains at startup that it "Couldn't get consistent
shared memory", it means pci_alloc_consistent() failed and therefore
you have one of these older CPUs, and it will drop back to doing its
own cache management.

At startup the driver does a test where it writes memory, flushes
it, writes something else to the same location, then gets the scsi chip
to read that location.  If the scsi chip gets the old data, the driver
says "WARNING: target data areas are not dma coherent".  This is
just for information, it has no effect on how the driver operates.

Richard
