From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: ccio-dma: is issue could be related to too much io_tlb entries?
Date: Tue, 5 Aug 2008 21:19:36 -0600
Message-ID: <20080806031936.GB22269@colo.lackof.org>
References: <K54T7W$01C58047996F3451AE396720C28F9E08@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler <grundler@parisc-linux.org>, kyle <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K54T7W$01C58047996F3451AE396720C28F9E08@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 05, 2008 at 03:21:32PM +0100, Joel Soete wrote:
> > On Thu, Jul 24, 2008 at 02:13:55PM +0100, Joel Soete wrote:
> > > Hello Grant, Kyle, et al.,
> > >
> > > Iirc the number of io_tlb enties on this u2/uturn ioa is of 256?
> >
> > ISTR that u2 and uturn have different number of IO TLB entries.
> > But I don't recall how many exactly. Need the ERSs to look that up.
> >
> Well, I don't yet find the right way to get access, sorry.
> 
> > > Because issue occur only when I do a lot of I/O on scsi disk (sometime request
> > > of mapping reach 128 pages), the idea was that it could induce some exceed of
> > > iotlb entries.
> > >
> [snip]
> >
> > The number of "used" entries include "in flight" DMA and pci_consistent
> allocations. This generally isn't that many pages of RAM.
> >
> Ok,
> But the idea was that if so much pdir entries was mapped in a so short time
> (1s), it should be also that the device will try to use them on the fly (just
> an hypothesis.)
> And so far as I can observe, the pb occurs when os operate on numerous huge
> data blocks (i.e. a tar -xvf of a linux tree into a single fs); so in this
> case it should be that the i/o device trigger many i/o tlb miss and may be
> much more i/o tlb entries then it can be freed?

Yes, that's certainly possible. 
But it's not the only behavior triggered by lots of in-flight IO traffic.


> What I observe also is that the pb become worse either with a system with few
> ram (like my c110 with 64M) or when I resurrect CCIO_MEM_RATIO (e.g. 2 or 4)
> on a system with 256Mb of RAM). In those last 2 cases the effect is the same:
>   a/ it makes the pdir_size and the number of pdir entries smaller

Yes.

>   b/ as well for chainid_shift.

I've forgotten exactly the role of the chainid...I'd have to study
the code again.


> This last point (b/) make me thought that it would also make smaller the
> number of 4k-byte per chainid and so for a same DMA block size it would
> required more iotlb entries.

No. The number of IO TLB entries (192 or something like that) and IO MMU
page size (4k) are both fixed.
Both are also completely unrelated to the size of the IO Pdir.

> 
> Obviously just speculation ;<).
> 
> Even thought 3 things sure:
>   - issue occurs for huge I/O
>   - become worse with reduced iov_space_size (physical or logical)
>   - backport sba help a bit but doesn't fix issue

Yeah, those suggest IO TLB flushing is failing or IO Pdir isn't coherent.
There might be other things broken too.

> > > Anyway, difference between those last 2 samples (718 - 444) = 274 increase of
> > > io_pdir entries.
> >
> > That's about right for a SCSI device since it can't have that much
> > IO in flight for one or two disks.
> >
> [snip]
> >
> > Of course. The number of "used" entries in the IO Pdir has no direct
> > correlation to the number of "in use" IO TLB entries. IO TLB is fixed
> > size while the IO Pdir size can vary between boots.
> >
> > >
> > > Well as scatterlist is still puzzling me, I can still be confused between
> > > iommu and mmu pages mapping, sorry so in advance if it's yet another annoying
> > > comment.
> >
> > IOMMU is an MMU for IO devices. MMU is the same thing for CPU.
> > Differences exist between those two. DMA is generally to larger
> > chunks/regions of RAM (256-2K bytes) while CPUs need to enforce
> > access rights (X/R/W) to memory and deal with cachelines or less.
> >
> (well I still have difficulties in the relationship between all those buffers
> which are caches and tlb and over that I/O DMA with its own set of cache and
> iotlb. Fortunately there are now good doc freely available and good engine to
> look for it, but it's not yet so easy to me)

Agreed - it's not easy.

grant

> 
> Tx again for advises,
>     J.
> 
> > hth,
> > grant
> > --
> 
