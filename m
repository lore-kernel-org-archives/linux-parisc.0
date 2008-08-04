From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: ccio-dma: is issue could be related to too much io_tlb entries?
Date: Mon, 4 Aug 2008 00:20:21 -0600
Message-ID: <20080804062021.GC10519@colo.lackof.org>
References: <K4II37$FC5730FEE6DF5668DA61E723AC34CF60@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler <grundler@parisc-linux.org>, kyle <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K4II37$FC5730FEE6DF5668DA61E723AC34CF60@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 24, 2008 at 02:13:55PM +0100, Joel Soete wrote:
> Hello Grant, Kyle, et al.,
> 
> Iirc the number of io_tlb enties on this u2/uturn ioa is of 256?

ISTR that u2 and uturn have different number of IO TLB entries.
But I don't recall how many exactly. Need the ERSs to look that up.

> Because issue occur only when I do a lot of I/O on scsi disk (sometime request
> of mapping reach 128 pages), the idea was that it could induce some exceed of
> iotlb entries.
> 
> I so turn on some STAT (just used_pages) and grab following data:
> [snip]
> IO PDIR size    : 131072 bytes (16384 entries)
> IO PDIR entries : 16384 total  170 used (16214 free, 1%)
> Resource bitmap : 2048 bytes (16384 pages)
>   Bitmap search : 36221/36430/38793 (min/avg/max CPU Cycles)
> 
> IO PDIR size    : 131072 bytes (16384 entries)
> IO PDIR entries : 16384 total  235 used (16149 free, 1%)
> Resource bitmap : 2048 bytes (16384 pages)
>   Bitmap search : 36220/36346/37806 (min/avg/max CPU Cycles)
> 
> IO PDIR size    : 131072 bytes (16384 entries)
> IO PDIR entries : 16384 total  718 used (15666 free, 4%)
> Resource bitmap : 2048 bytes (16384 pages)
>   Bitmap search : 36222/36342/38472 (min/avg/max CPU Cycles)
> 
> ## issue occurs just when I ready above message.
> 
> IO PDIR size    : 131072 bytes (16384 entries)
> IO PDIR entries : 16384 total  444 used (15940 free, 2%)
> Resource bitmap : 2048 bytes (16384 pages)
>   Bitmap search : 36220/36330/37830 (min/avg/max CPU Cycles)
> [snip]
> 
> Even thought, I ended the stress test, the system continue to work smoothly
> with 444 used entries?

The number of "used" entries include "in flight" DMA and pci_consistent allocations. This generally isn't that many pages of RAM.

> Anyway, difference between those last 2 samples (718 - 444) = 274 increase of
> io_pdir entries.

That's about right for a SCSI device since it can't have that much
IO in flight for one or two disks.

> I also add a loop to bitcount entries of res_map and grab more:
> [snip]
> IO PDIR size    : 262144 bytes (32768 entries)
> IO PDIR entries : 32768 total  329 used (32439 free, 1%)
> IO PDIR entries : 329 res_map_count
> Resource bitmap : 4096 bytes (32768 pages)
>   Bitmap search : 36221/36626/38310 (min/avg/max CPU Cycles)
> 
> IO PDIR size    : 262144 bytes (32768 entries)
> IO PDIR entries : 32768 total  801 used (31967 free, 2%)
> IO PDIR entries : 801 res_map_count
> Resource bitmap : 4096 bytes (32768 pages)
>   Bitmap search : 36215/36325/37852 (min/avg/max CPU Cycles)
> 
> IO PDIR size    : 262144 bytes (32768 entries)
> IO PDIR entries : 32768 total  329 used (32439 free, 1%)
> IO PDIR entries : 329 res_map_count
> Resource bitmap : 4096 bytes (32768 pages)
>   Bitmap search : 36222/36883/38742 (min/avg/max CPU Cycles)
> 
> [...]
> 
> (in 1 second 801 - 329 = 472)
> 
> But continuing a bit test (by accident), I noticed that system can survive with:
> 
> IO PDIR size    : 262144 bytes (32768 entries)
> IO PDIR entries : 32768 total  1478 used (31290 free, 4%)
> IO PDIR entries : 1478 res_map_count
> Resource bitmap : 4096 bytes (32768 pages)
>   Bitmap search : 36223/36696/38463 (min/avg/max CPU Cycles)

Of course. The number of "used" entries in the IO Pdir has no direct
correlation to the number of "in use" IO TLB entries. IO TLB is fixed
size while the IO Pdir size can vary between boots.

> 
> Well as scatterlist is still puzzling me, I can still be confused between
> iommu and mmu pages mapping, sorry so in advance if it's yet another annoying
> comment.

IOMMU is an MMU for IO devices. MMU is the same thing for CPU.
Differences exist between those two. DMA is generally to larger
chunks/regions of RAM (256-2K bytes) while CPUs need to enforce
access rights (X/R/W) to memory and deal with cachelines or less.

hth,
grant
