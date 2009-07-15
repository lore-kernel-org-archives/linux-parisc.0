From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Wierd code in Entry.S
Date: Wed, 15 Jul 2009 09:00:18 -0600
Message-ID: <20090715150018.GO24310@parisc-linux.org>
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
> > IIRC, only pa880 and pa8900 pay attention to the U-bit.
> > I thought all the previous CPUs ignored U-bit.
> 
> Um, no, almost all pa chips use it ... it's the way we make coherent
> memory on the very old 710 and similar systems: use an ordinary kmalloc
> and turn off caching in the map.  The 715 class systems with the oldest
> pa chips don't respect the U bit ... these are the ones we have to pull
> the driver cache flushing tricks on to get them working.

Even the 715-class systems respect the U bit.  The problem is that
the memory controller in use on those platforms cannot cope with
sub-cacheline-size accesses to memory.  So if we were to set the U bit
on memory, we would crash.

> > Yes - but only ZX1 chipset (e.g. rp3440 and C8000) uses IO space that
> > is outside of F-space. F-space is hardwired to be uncachable by the CPU.
> 
> OK, so we don't really use the concept of F-Space in the linux kernel
> virtual memory map on parisc linux.  What we do is map the whole of
> memory into the virtual address space, but none of the I/O space.  the
> readX/writeX macros actually go via absolute accesses.  Because the

Uhm, no.  The gsc_read/writeX macros go via absolute accesses.
__raw_read/writeX go via ioremapped addresses, as do the more common
readX/writeX.

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

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
