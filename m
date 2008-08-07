From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: ccio-dma: is issue could be related to too much io_tlb entries?
Date: Thu,  7 Aug 2008 08:54:02 +0100
Message-ID: <K580M2$AC089974BA401B2D6711347E41C95F6E@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "grundler" <grundler@parisc-linux.org>, "kyle" <kyle@mcmartin.ca>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Aug 05, 2008 at 03:21:32PM +0100, Joel Soete wrote:
> > > On Thu, Jul 24, 2008 at 02:13:55PM +0100, Joel Soete wrote:
> > > > Hello Grant, Kyle, et al.,
> > > >
> > > > Iirc the number of io_tlb enties on this u2/uturn ioa is of 256?
> > >
> > > ISTR that u2 and uturn have different number of IO TLB entries.
> > > But I don't recall how many exactly. Need the ERSs to look that up.
> > >
> > Well, I don't yet find the right way to get access, sorry.
> > 
> > > > Because issue occur only when I do a lot of I/O on scsi disk (sometime
request
> > > > of mapping reach 128 pages), the idea was that it could induce some
exceed of
> > > > iotlb entries.
> > > >
> > [snip]
> > >
> > > The number of "used" entries include "in flight" DMA and pci_consistent
> > allocations. This generally isn't that many pages of RAM.
> > >
> > Ok,
> > But the idea was that if so much pdir entries was mapped in a so short time
> > (1s), it should be also that the device will try to use them on the fly (just
> > an hypothesis.)
> > And so far as I can observe, the pb occurs when os operate on numerous huge
> > data blocks (i.e. a tar -xvf of a linux tree into a single fs); so in this
> > case it should be that the i/o device trigger many i/o tlb miss and may be
> > much more i/o tlb entries then it can be freed?
> 
> Yes, that's certainly possible. 
> But it's not the only behavior triggered by lots of in-flight IO traffic.
> 
Ok 
(that's just the simplest way I found to reproduce the day to day issue I
encounter when I do an update of my system: this is not during the download of
pkg but during 'Unpacking' step and that already broken my fs ;_()

> 
> > What I observe also is that the pb become worse either with a system with few
> > ram (like my c110 with 64M) or when I resurrect CCIO_MEM_RATIO (e.g. 2 or 4)
> > on a system with 256Mb of RAM). In those last 2 cases the effect is the same:
> >   a/ it makes the pdir_size and the number of pdir entries smaller
> 
> Yes.
> 
> >   b/ as well for chainid_shift.
> 
> I've forgotten exactly the role of the chainid...I'd have to study
> the code again.
>
no pb
 
> 
> > This last point (b/) make me thought that it would also make smaller the
> > number of 4k-byte per chainid and so for a same DMA block size it would
> > required more iotlb entries.
> 
> No. The number of IO TLB entries (192 or something like that) and IO MMU
> page size (4k) are both fixed.
> Both are also completely unrelated to the size of the IO Pdir.
> 
Totaly agree.
But I wrongly explain my idea, my understanding was that chainid_shift allow
to compute a chainid_mask to setup the U2 (in my case) iommu.
After my reading of hp paper: "Hardware Cache Coherent Input/Output", I
supposed (that's certainly where I am wrong) that this chainid_mask was a hint
to instruct iommu the max size of an I/O data block (e.g. for the d380 with
256Mb I got chainid_shift = 19 [18 with ccio_mem_ratio = 2] and so chain_size
= 2 ^ 19 = 128 * 4k pages (at least that's only what clear_io_tlb() does)). So
for a big data block of 128*4k pages (I realy read such request of mapping)
the scsi device would just need 1 io_tlb entry while it would request 2 (with
ccio_mem_ratio = 2) and even 4 (with a c110 with only 64Mb).
That's obviously  my own reading (without any coach ;-), sorry in advance if
that's more confusing.

> > 
> > Obviously just speculation ;<).
> > 
> > Even thought 3 things sure:
> >   - issue occurs for huge I/O
> >   - become worse with reduced iov_space_size (physical or logical)
> >   - backport sba help a bit but doesn't fix issue
> 
> Yeah, those suggest IO TLB flushing is failing or IO Pdir isn't coherent.
> There might be other things broken too.
> 
Yes
(with relayfs I tried to trace as much as I can but it have the default to not
capture all messages and so just give me a overview of the execution path.
Next step in my investigation: coalesce_chunks();
but I am still looking for sg_list detail, though what kind of sg sump I could
grab (after coalesce_chunks()):

this one is easy to understand:
[0]- page_link: 0x10692980 (275327360), offset:0x0, length: 4096,
iova(dma_address): 0xad0000, iova_length(dma_length): 40960.
[1]- page_link: 0x10692960 (275327328), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[2]- page_link: 0x10692940 (275327296), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[3]- page_link: 0x10692920 (275327264), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[4]- page_link: 0x10692900 (275327232), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[5]- page_link: 0x106928e0 (275327200), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[6]- page_link: 0x106928c0 (275327168), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[7]- page_link: 0x10692a80 (275327616), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[8]- page_link: 0x10692c40 (275328064), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[9]- page_link: 0x10692c22 (275328034), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.

i.e. 10 * 4k pages fused (coalesce?) in one dma data block of 40K using iova
0xad0000 (ok?)

but I don't yet understand following ones:
[0]- page_link: 0x10681b40 (275258176), offset:0x0, length: 4096,
iova(dma_address): 0x198000, iova_length(dma_length): 12288.
[1]- page_link: 0x10681b20 (275258144), offset:0x0, length: 4096,
iova(dma_address): 0x19bc00, iova_length(dma_length): 1024.
[2]- page_link: 0x10681b00 (275258112), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[3]- page_link: 0x10681a82 (275257986), offset:0xc00, length: 1024,
iova(dma_address): 0x8019bc00, iova_length(dma_length): 0.

why not fuse in only one block?

or this one:
[0]- page_link: 0x10692f00 (275328768), offset:0x0, length: 12288,
iova(dma_address): 0x1a30000, iova_length(dma_length): 49152.
[1]- page_link: 0x10693060 (275329120), offset:0x0, length: 4096,
iova(dma_address): 0x1a40000, iova_length(dma_length): 40960.
[2]- page_link: 0x106930a0 (275329184), offset:0x0, length: 8192,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[3]- page_link: 0x10693240 (275329600), offset:0x0, length: 24576,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[4]- page_link: 0x106935e0 (275330528), offset:0x0, length: 20480,
iova(dma_address): 0x81a40000, iova_length(dma_length): 0.
[5]- page_link: 0x106937a0 (275330976), offset:0x0, length: 4096,
iova(dma_address): 0x0, iova_length(dma_length): 0.
[6]- page_link: 0x106937e2 (275331042), offset:0x0, length: 16384,
iova(dma_address): 0x0, iova_length(dma_length): 0.

as the chainid_size is of 128*4k pages (=512k) why not coalescing all stuff in
one data block? 
Or it's not the place where scatterlist blocks are put together to form one
contiguous block for dma access?
(well my understanding of the beginning of sg list management was to put
together scattered blocks at contiguous _physical_ address for dma access. But
with those U2 we work now with _virtual_ address and index so am I a bit lost ;-)
 
But this next one are totally puzzling me:
[0]- page_link: 0x10667600 (275150336), length: 1024, iova(dma_address):
0x800ae000, iova_length(dma_length): 1024.
[1]- page_link: 0x1072e2e0 (275964640), length: 1024, iova(dma_address):
0x800afc00, iova_length(dma_length): 1024.
[2]- page_link: 0x10676180 (275210624), length: 1024, iova(dma_address):
0x800b0800, iova_length(dma_length): 1024.
[3]- page_link: 0x10541d00 (273947904), length: 1024, iova(dma_address):
0x800b1c00, iova_length(dma_length): 1024.
[4]- page_link: 0x1072dd00 (275963136), length: 1024, iova(dma_address):
0x800b2800, iova_length(dma_length): 1024.
[5]- page_link: 0x1072dd20 (275963168), length: 1024, iova(dma_address):
0x800b3800, iova_length(dma_length): 1024.
[6]- page_link: 0x107284c0 (275940544), length: 1024, iova(dma_address):
0x800b4c00, iova_length(dma_length): 1024.

(sorry, here I don't have offsets but I doubt it would help me to understand
why no gather occurs here?)


> > > > Anyway, difference between those last 2 samples (718 - 444) = 274
increase of
> > > > io_pdir entries.
> > >
> > > That's about right for a SCSI device since it can't have that much
> > > IO in flight for one or two disks.
> > >
> > [snip]
> > >
> > > Of course. The number of "used" entries in the IO Pdir has no direct
> > > correlation to the number of "in use" IO TLB entries. IO TLB is fixed
> > > size while the IO Pdir size can vary between boots.
> > >
> > > >
> > > > Well as scatterlist is still puzzling me, I can still be confused between
> > > > iommu and mmu pages mapping, sorry so in advance if it's yet another
annoying
> > > > comment.
> > >
> > > IOMMU is an MMU for IO devices. MMU is the same thing for CPU.
> > > Differences exist between those two. DMA is generally to larger
> > > chunks/regions of RAM (256-2K bytes) while CPUs need to enforce
> > > access rights (X/R/W) to memory and deal with cachelines or less.
> > >
> > (well I still have difficulties in the relationship between all those buffers
> > which are caches and tlb and over that I/O DMA with its own set of cache and
> > iotlb. Fortunately there are now good doc freely available and good engine to
> > look for it, but it's not yet so easy to me)
> 
> Agreed - it's not easy.
> 
Tx (when a master said 'it's not easy' that sincerely encourage me to continue
my learning)

Again thanks a lot for your kind attention,
    J.

> grant
> 
> > 
> > Tx again for advises,
> >     J.
> > 
> > > hth,
> > > grant
> > > --
> > 
> --


