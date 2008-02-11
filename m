From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c]
	pcxl_dma_ops.alloc_noncoherent = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 10:55:04 -0600
Message-ID: <1202748904.3122.37.camel@localhost.localdomain>
References: <47B07685.5000606@tiscali.nl>
	 <20080211164215.GM5299@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Roel Kluin <12o3l@tiscali.nl>, kyle@parisc-linux.org,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080211164215.GM5299@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Mon, 2008-02-11 at 09:42 -0700, Matthew Wilcox wrote:
> On Mon, Feb 11, 2008 at 05:23:33PM +0100, Roel Kluin wrote:
> > duplicate pa11_dma_alloc_consistent; more appropriate appears
> > pa11_dma_alloc_noncoherent here. 
> > 
> > Not tested, please confirm that this fix is correct
> 
> I don't think it is.  The memories are fading, so I don't recall why it
> is we do it this way, but I'm pretty sure it's correct the way it is.

dma_alloc_noncoherent is a fallback for boxes with coherency problems
which cannot allocate coherent memory.  The API asks for coherent memory
but the driver promises to behave correctly even if an incoherent area
is returned.  dma_alloc_coherent() requires only coherent memory.  The
pcx boxes (PA7200 and below) can't do the uncached trick for coherent
memory, so the API is designed for them.  The PCXL can, so we allocate
coherent memory even for dma_alloc_noncoherent() in that case (and nop
out the coherency handlers the driver uses).

James
