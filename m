From: rubisher <rubisher@scarlet.be>
Subject: Re: ccio_clear_io_tlb() and __raw_write() more question?
Date: Sun, 20 Jan 2008 10:06:30 +0000
Message-ID: <47931D26.50204@scarlet.be>
References: <JUQMH1$0E837D5F7A1526B30DCF5BF1A8BE2816@scarlet.be> <20080119170705.GC11553@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080119170705.GC11553@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Wed, Jan 16, 2008 at 01:53:25PM +0100, rubisher wrote:
>> Without doc I guess that this call to WRITE_U32() is supposed to do what it
>> name says: i.e purge a TLB entry?
> ...
>> puting all those stuff togther: for CPU, WRITE_U32 (aka __raw_writel), just
>> write something at some virtual address, right?
>>
>> So my worry is that this data write could be cached and btw the actual
>> CMD_TLB_PURGE operation could be delay untill this entry would be purged?
> 
> Willy is correct - writes to this IO space (0xf0000000) address is uncached.
> 
mmm, is it the reason why you (I mean hp engineers) call it "f-space": IO space addresses starting by 0xf?

> While the write is "posted", it's a fairly short path to the IOMMU (1 hop).
> Since this is the "unmap path" I don't expect any race conditions since
> we would have to call map using the same mapping right away in order to
> pickup the stale IOTLB entry. We avoid this race by allocating IO Pdir
> entries in a "circular" fashion (start at bottom and work through
> the entire resource bit map).
> 
> hth,
> grant
> 
> 
Tx,
	r.
