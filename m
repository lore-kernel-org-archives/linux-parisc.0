From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Wierd code in Entry.S
Date: Tue, 21 Jul 2009 23:34:53 -0600
Message-ID: <20090722053453.GA12539@lackof.org>
References: <20090710155559.CFAA44FC4@hiauly1.hia.nrc.ca> <1247242701.3936.28.camel@mulgrave.site> <20090715063800.GA26739@lackof.org> <1247661690.4236.10.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1247661690.4236.10.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 15, 2009 at 08:41:30AM -0400, James Bottomley wrote:
> On Wed, 2009-07-15 at 00:38 -0600, Grant Grundler wrote:
> > On Fri, Jul 10, 2009 at 11:18:21AM -0500, James Bottomley wrote:
> > > On Fri, 2009-07-10 at 11:55 -0400, John David Anglin wrote:
> > ...
> > > > Your comment would explain why I
> > > > don't see this on c3750.  Could this affect PA8700?
> > > 
> > > In theory it would affect every box running a 64 bit kernel.
> > 
> > Yes, regarding corrupting bit-44 but not U-bit.
> > 
> > IIRC, only pa880 and pa8900 pay attention to the U-bit.
> > I thought all the previous CPUs ignored U-bit.
> 
> Um, no, almost all pa chips use it ... it's the way we make coherent
> memory on the very old 710 and similar systems: use an ordinary kmalloc
> and turn off caching in the map.  The 715 class systems with the oldest
> pa chips don't respect the U bit ... these are the ones we have to pull
> the driver cache flushing tricks on to get them working.

Sorry - I was thinking only in the context of F-space but didn't make
that distinction clear.  I wasn't thinking about about the use of U-bit
for DMA coherence. 

thanks,
grant

> We also use the U bit for ioremaps.
> 
> > > We
> > > actually set PAGE_NO_CACHE on ioremaps(), so it's spreading out from the
> > > PCI device space.
> > 
> > Yes - but only ZX1 chipset (e.g. rp3440 and C8000) uses IO space that
> > is outside of F-space. F-space is hardwired to be uncachable by the CPU.
> 
> OK, so we don't really use the concept of F-Space in the linux kernel
> virtual memory map on parisc linux.  What we do is map the whole of
> memory into the virtual address space, but none of the I/O space.  the
> readX/writeX macros actually go via absolute accesses.  Because the
> kernel virtual addresses are offset mapped from the absolute addresses,
> we do get a hole in the virtual map corresponding to F-Space (simply
> because there's no accessible memory there) but we're actually able to
> fill that hole later with virtual mappings if we choose.  The net result
> is that I/O devices aren't mapped into the kernel at all until we call
> ioremap.  If a device uses readX/writeX only, it never actually gets an
> appearance in our virtual space because we simply use absolute accesses
> to get the data to and from the device.  If it really needs a remapped
> area, we use ioremap, then it does appear in our virtual map, and we set
> the U bit on the mapping.
> 
> James
> 
