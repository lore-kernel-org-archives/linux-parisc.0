Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA31806
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Mar 2000 13:32:34 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by atlrel2.hp.com (Postfix) with ESMTP id 04D38451
	for <parisc-linux@thepuffingroup.com>; Tue,  7 Mar 2000 14:34:26 -0500 (EST)
Message-Id: <200003071933.LAA02811@lucy.cup.hp.com>
Subject: Re: [parisc-linux] lasi scsi driver
To: prumpf@inwestnet.de
Date: Tue, 7 Mar 2000 11:33:09 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20000305194652.A9157@abacus.local> from Philipp Rumpf at Mar "5," 2000 "07:46:52" pm
From: Jerry Huck <jerry_huck@hp.com>
Reply-To: huck@cup.hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: huck@cup.hp.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Sun, 5 Mar 2000 19:46:52 +0100
> From: Philipp Rumpf <prumpf@inwestnet.de>
> To: huck@cup.hp.com
> Subject: Re: [parisc-linux] lasi scsi driver

> > While the PA-RISC processor architecture supports the notion of a
> > non-cacheable page, most HP memory systems do not - certainly not the
> > most recent memory systems.
> 
> Can you give us a concrete list of broken memory systems ?

Unfortunately not, since these memory systems weren't broken wrt
the architecture, I didn't keep track of this feature.  We really need
some interesting combination of memory system and I/O adapter coherence
capability.  Grant has posted much more on this than I know.

> > If you set the U-bit on a main memory page and then reference the page,
> > the processor will emit a sub-cacheline transaction and the memory system
> > will do something bad (probably HPMC).
> 
> So there is a sub-cacheline transaction on Runway but current memory
> controllers don't implement it ?

Yes.  The bus interface doesn't know the distinction between I/O accesses
and main memory.  The processor relies on "F" extension and/or the U-bit
to sort out how to treat an address dereference.  Sub-cacheline transactions
are the normal memory-mapped I/O transactions.

> > So don't ever get in the situation where you need uncacheable main memory.
> 
> uncacheable main memory is the only sane way to deal with cache-incoherent
> DMA - macros to flush the cache are both slower and harder to add to drivers
> written with the assumption that dma is cache-coherent.

The architecture was not designed to import drivers written to a
cache-coherent model.  This is not unique to PA-RISC.  Even IA-32 had
a little trouble on the first write-back caches in the 486.  While it
is not simple to convert all drivers, many drivers have a fairly clean
design that make it manageable to add the appropriate flush calls.  Some
drivers have byte granular interactions that make them impossible to
re-work.

Sorry I couldn't be more helpful with specific characteristics.

Jerry
