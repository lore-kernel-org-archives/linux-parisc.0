Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA09789
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Mar 2000 12:47:42 -0700
Received: (from prumpf@localhost)
	by inwestnet.de (8.9.3/8.9.3) id TAA09192
	for parisc-linux@thepuffingroup.com; Sun, 5 Mar 2000 19:48:40 +0100
Resent-Message-Id: <200003051848.TAA09192@inwestnet.de>
Date: Sun, 5 Mar 2000 19:46:52 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: huck@cup.hp.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000305194652.A9157@abacus.local>
References: <006601bf8487$e057e010$a94abc0f@hungary.hp.com> <200003031910.LAA19111@lucy.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003031910.LAA19111@lucy.cup.hp.com>; from jerry_huck@hp.com on Fri, Mar 03, 2000 at 12:18:22PM -0700

> While the PA-RISC processor architecture supports the notion of a
> non-cacheable page, most HP memory systems do not - certainly not the
> most recent memory systems.

Can you give us a concrete list of broken memory systems ?

> If you set the U-bit on a main memory page and then reference the page,
> the processor will emit a sub-cacheline transaction and the memory system
> will do something bad (probably HPMC).

So there is a sub-cacheline transaction on Runway but current memory
controllers don't implement it ?

> So don't ever get in the situation where you need uncacheable main memory.

uncacheable main memory is the only sane way to deal with cache-incoherent
DMA - macros to flush the cache are both slower and harder to add to drivers
written with the assumption that dma is cache-coherent.

	Philipp Rumpf
