From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] The new iomap interface
Date: Fri, 17 Sep 2004 10:24:30 -0600
Message-ID: <20040917162430.GA7984@colo.lackof.org>
References: <20040917124612.GS642@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040917124612.GS642@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 17, 2004 at 01:46:12PM +0100, Matthew Wilcox wrote:
> Shortly after 2.6.9-rc2, Linus introduced a new way of accessing IO devices
> called iomap.  This gives us the opportunity to overhaul our device IO
> accessors.  Let's go over how this works:
> 
> There are various ways to get hold of an iomem cookie, such as calling
> pci_iomap() or ioport_map().  One then passes this cookie to a different
> set of functions ioread8(), ioread16(), ioread32(), iowrite8(),
> iowrite16() and iowrite32().  When one is done with it, one calls something
> like pci_iounmap() or ioport_unmap().

Interesting. I'm not sure this new scheme provides any special hooks
that we can't already do today.
Did Linus write why he wants iomap? Have a URL handy?

I don't like IO Port space being mixed with MMIO space.
But I guess that's the point of Linus' new scheme - drivers can
use either one with the same accessors. He's pushing the
indirection from the drivers to the platform support.

The problem with this scheme are the semantics are slightly
different for IO Port vs MMIO. IO Port space is "non-Postable"
for writes and MMIO space is "Postable". The former must stall
the CPU. Because of this, drivers can be written for MMIO space
and then seamlessly switch to IO Port space.
But the converse is usually not true.

I'm only aware of a few drivers that attempt to support both
address spaces in one binary. A few make it a compile time option.

iomap would make it easier to completely drop IO port space support
in the future when no driver in a given system needs it.
But I didn't think it was hard to do currently.

> There are several cases we have to be able to handle.  Obviously,
> we have to handle PCI/EISA/ISA io memory and PCI/EISA/ISA io ports.
> It'd also be good to handle native PA io memory.  I'd like to resurrect
> the USE_HPPA_IOREMAP code that Helge worked on at one point (it's really
> time to do away with the rsm/mtsm around byte loads/stores).

Yes - I forgot readb/readw don't have PARISC instructions to
do "absolute" accesses.

Moving to virtually mapped address would be a win for byte/short
accesses. But I don't consider those performance path either.
Access to any type of IO is 20-100X slower than rsm/mtsm.

> So here's the hardware constraints.  All the EISA and PCI adapters map
> IO memory space into PA memory space, but we have to do byte swapping.

[ insert paragraph break - discuss MMIO and IO Port accessors seperately
since they have different mechanisms and semantics ]

> The EISA adapter maps IO port space into PA memory space, but does so in
> such a convoluted way that we may not be able to fulfill a request for
> a contiguous chunk of ports.  The Dino PCI adapter requires reads and writes
> to control registers to access port space.  Astro-based systems have a
> dense mapping for IO ports into memory ... but sometimes require
> additional hacks to work around bugs.  PAT-based systems have a sparse
> mapping for IO ports into memory, but require an additional read to flush
> the write.

The mechanism to access IO port space varies more by chipset than
by firmware. The firmware might happen to advertise an alternate
"view" of IO Port space. And PAT PDC support falls into the
"we have to do this different for 64-bit" bucket.

> 
> Phew.  OK.  How to make that lot work?  Well .. looks to me like we want:
> 
> /*
>  * Technically, this should be 'if (VMALLOC_START < addr < VMALLOC_END),
>  * but that's slow and we know it'll be within the first 2GB.
>  */
> #define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0x80000000) != 0)

AFAIK, all machines capable of running 32-bit kernel, use *ONLY* the
top 256MB (F-space) of address space for IO.
I think the 32-bit implementation could be tightened up to be 

#define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0xf0000000UL) != 0xf0000000UL)

The 64-bit kernel implementation is going to be uglier.
It will have to support 2GB LMMIO and GMMIO as well.
(GMMIO are IO addresses > 4GB and live above 4GB CPU address as well).

> static inline int ioread16(void __iomem *addr)
> {
>         if (unlikely(INDIRECT_ADDR(addr)))
>                 return __ioread16(addr);
>         return le16_to_cpup((u16 *)addr);
> }
> 
> This should be a test, a non-executed branch and a load in the direct-load
> case.

plus 3 instructions for the swap (for 32 bit).

> Then __ioread16() can look something like ... 
> 
> struct iomem_ops {
>         int (*read8)(void __iomem *addr);
>         int (*read16)(void __iomem *addr);
>         int (*read32)(void __iomem *addr);
>         void (*write8)(u8, void __iomem *addr);
>         void (*write16)(u16, void __iomem *addr);
>         void (*write32)(u32, void __iomem *addr);
> };
> 
> struct iomem_ops *iomem_ops[8]; 
> 
> #define ADDR_TO_REGION(addr)    (((unsigned long)addr >> 28) & 7)
> 
> int __ioread16(void __iomem *addr)
> {
>         return iomem_ops[ADDR_TO_REGION(addr)]->read16(addr);
> }
> 
> That gives us 256MB of io space in each handler, and 8 possible handlers.
> Anything that can be directly mapped like PCI io memory will be, and therefore
> much quicker than the current io port ops mess.

Not really. Besides, difference between the proposed scheme and the
existing scheme will not be measurable.

>   We'll need handlers for:
> 
> 0 -- ISA/EISA port space that isn't contiguous
> 1 -- PCI port space for Dino
> 2 -- PCI port space for Astro w/Elroy < 2.2
> 3 -- PCI port space for PAT PDC
> 4 -- Non-byteswapped GSC IO memory
> 7 -- Legacy drivers that are passing an old-style readX() cookie to the
>      new-style ioreadX() functions.  Doh.

So basically you want to alias all of 32-bit address into 512MB chunks.
Each "region" maps to a particular accessor.

> Note that these interfaces give us the opportunity to do much more work
> at IO map time, and much less mucking around at IO access time.  The
> design here is clearly 32-bit centric, but the macros can be ifdeffed to
> work differently on 64-bit.
> 
> Comments, suggestions, alternative designs?

Overall, I think it can be made to work.

But I'm not convinced it's worth turning the world upside down for.
If you think it's significantly better, go for it.

Personally, I think the work you, jejb, and tausq are doing for
cache/TLB flushing means alot more in terms of performance.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
