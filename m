Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA01434
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Mar 2000 17:45:32 -0700
Date: Wed, 8 Mar 2000 00:45:43 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: huck@cup.hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000308004543.A5281@abacus.local>
References: <20000305194652.A9157@abacus.local> <200003071933.LAA02811@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003071933.LAA02811@lucy.cup.hp.com>; from jerry_huck@hp.com on Tue, Mar 07, 2000 at 11:33:09AM -0800
List-ID: <linux-parisc.vger.kernel.org>

> > Can you give us a concrete list of broken memory systems ?
> 
> Unfortunately not, since these memory systems weren't broken wrt
> the architecture, I didn't keep track of this feature.  We really need
> some interesting combination of memory system and I/O adapter coherence
> capability.  Grant has posted much more on this than I know.
> 
> > > If you set the U-bit on a main memory page and then reference the page,
> > > the processor will emit a sub-cacheline transaction and the memory system
> > > will do something bad (probably HPMC).
> > 
> > So there is a sub-cacheline transaction on Runway but current memory
> > controllers don't implement it ?
> 
> Yes.  The bus interface doesn't know the distinction between I/O accesses
> and main memory.  The processor relies on "F" extension and/or the U-bit
> to sort out how to treat an address dereference.  Sub-cacheline transactions
> are the normal memory-mapped I/O transactions.

Okay, so there are several things I'd like to resolve:

On Runway-based systems, we don't need uncached memory.
On PA7[13]00LC, uncached memory works.
On old 715s, we don't have PCI.


So, it looks to me like there's no case left we cannot handle except for
undocumented Runway interfaces we just hope don't get in our way (U2 / Uturn,
for now) (and even for those it's probably just one bit we'll have to set).

> > uncacheable main memory is the only sane way to deal with cache-incoherent
> > DMA - macros to flush the cache are both slower and harder to add to drivers
> > written with the assumption that dma is cache-coherent.
> 
> The architecture was not designed to import drivers written to a
> cache-coherent model.  This is not unique to PA-RISC.  Even IA-32 had
> a little trouble on the first write-back caches in the 486.  While it
> is not simple to convert all drivers, many drivers have a fairly clean
> design that make it manageable to add the appropriate flush calls.  Some
> drivers have byte granular interactions that make them impossible to
> re-work.

There won't be any flush calls left to add in 2.4.  Unless you want to
maintain a patch against Linus for every single PCI driver in the tree
there's really no way we can use those with systems that neither have
uncached memory nor coherent DMA (and still, we don't know of even one
such system).

	Philipp Rumpf
