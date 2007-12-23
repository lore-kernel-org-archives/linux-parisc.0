From: rubisher <rubisher@scarlet.be>
Subject: Re: dma_addr_t: which comment is correct?
Date: Sun, 23 Dec 2007 22:50:34 +0000
Message-ID: <476EE63A.9080807@scarlet.be>
References: <476CFFE3.3040102@scarlet.be> <20071223093903.GA30259@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071223093903.GA30259@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Sat, Dec 22, 2007 at 12:15:31PM +0000, rubisher wrote:
>> Hello *,
>>
>> Continuing my blind investigation on ccio-dma stuff, I read those 2 
>> different comments:
>> in include/asm-parisc/scatterlist.h, scartterlist structure is defined like 
>> this:
>> struct scatterlist {
>> #ifdef CONFIG_DEBUG_SG
>>         unsigned long sg_magic;
>> #endif
>>         unsigned long page_link;
>>         unsigned int offset;
>>
>>         unsigned int length;
>>
>>         /* an IOVA can be 64-bits on some PA-Risc platforms. */
>>         dma_addr_t iova;        /* I/O Virtual Address */
>>         __u32      iova_length; /* bytes mapped */
>> };
>>
>> in absolute the comment "an IOVA can be 64-bits on some PA-Risc platforms." 
>> seems ok.
> 
> Yes, it's correct. pa8800 allows 64-bit capabale devices to bypass the IOMMU.
> But I don't think we allow it yet since we would need to add code that stuffs
> the Virtual Index (for DMA to be cache coherent) into the high bits of the IOVA.
> 
> 
>> but otoh, include/asm-parisc/types.h, defined dma_addr_t like this:
>>
>> /* Dma addresses are 32-bits wide.  */
>>
>> typedef u32 dma_addr_t;
>> typedef u64 dma64_addr_t;
>>
>> #endif /* __ASSEMBLY__ */
> 
> Yes, this matches the current implementation.
> Adding support for "bypass" on zx1 chipsets (pa8800/pa8900 CPUs) will
> require something more clever.
> 
>> OK it's just a comment but imho there is interesting matter in x86:
>>
>> typedef u64 dma64_addr_t;
>> #if defined(CONFIG_X86_64) || defined(CONFIG_HIGHMEM64G)
>> /* DMA addresses come in 32-bit and 64-bit flavours. */
>> typedef u64 dma_addr_t;
>> #else
>> typedef u32 dma_addr_t;
>> #endif
>>
>> But I simply have no idea which "#if defined" would be the most relevant 
>> for parisc, any idea?
> 
> u32 is correct now. u64 could be used for 64-bit builds when someone decides
> we should bypass the IOMMU to improve DMA mapping/unmapping performance.
> 
> 3-4 years ago I saw about 3% better performance for Storage Devices
> _with_ the IOMMU enabled. IIRC, it was because of coalescing the longer
> SG lists into a single IOMMU entry was more efficient for the PCI device.
> Smaller, non-contiguous IOs would benefit from IOMMU bypass - e.g. NIC
> workloads.
> 
> hth,
> grant
> 
Ok,

btw do you notice how much way are there (in so few lines) to use a unsigned 32bits integer: u32, __u32 but also uint32_t, 
u_int32_t, ...

Is there some advise om the best pratice?

Ah also related to ccio-dma patch test on my c110, it seems that removing DELAYED_RESOURCE_CNT code help a bit this system 
with few ram (64Mb only) to survive a bit longer (enough to debootstrap and download 800Mb to be installed) but that didn't 
make the drill: there are still fs corruption from time to time and some reset on the lasi disk ;-(.
This test just seems to confirm an issue of i/o coherency somewhere but where those rules could be broken???

Merry Xmas,
	r.
