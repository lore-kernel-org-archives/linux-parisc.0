From: John David Anglin <dave.anglin@bell.net>
Subject: Re: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Sun, 10 Dec 2017 16:42:50 -0500
Message-ID: <7FD0E306-71B6-44B5-8803-E4465CBFF200@bell.net>
References: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com> <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de> <alpine.LRH.2.02.1702011507040.25889@file01.intranet.prod.int.rdu2.redhat.com> <53b0b36a-32cd-2421-7d45-0c8ea8cc1ac1@bell.net> <alpine.LRH.2.02.1712080619070.10139@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1712080619070.10139@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-08, at 6:22 AM, Mikulas Patocka wrote:

> 
> On Wed, 1 Feb 2017, John David Anglin wrote:
> 
>> On 2017-02-01 3:10 PM, Mikulas Patocka wrote:
>>>> I'm not 100% convinced that 4.9 is fully stable and that the patch
>>>> is the reason for the crashes you see.
>>>> What kind of crashes do you see? Userspace or kernel ?
>>> Userspace crashes. Random crashes or internal errors in gcc when compiling
>>> the kernel. I once had "aptitude" crash.
>> The userspace crashes are present in 4.8 and 4.9 as well.  For example, this
>> build failed due to an OS problem:
>> https://buildd.debian.org/status/fetch.php?pkg=kdenlive&arch=hppa&ver=16.12.1-2&stamp=1485956026&raw=0
>> 
>> Probably, 10% or more large packages fail to build because of this. Note that
>> this only occurs on machines
>> (e.g., c8000) that only support equivalent aliases.  We don't see this on the
>> parisc buildd which has two PA8600 CPUs.
>> 
>> My current theory is the following functions are buggy:
>> 
>> /* vmap range flushes and invalidates.  Architecturally, we don't need
>> * the invalidate, because the CPU should refuse to speculate once an
>> * area has been flushed, so invalidate is left empty */
>> static inline void flush_kernel_vmap_range(void *vaddr, int size)
>> {
>>        unsigned long start = (unsigned long)vaddr;
>> 
>>        flush_kernel_dcache_range_asm(start, start + size);
>> }
>> static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
>> {
>>        unsigned long start = (unsigned long)vaddr;
>>        void *cursor = vaddr;
>> 
>>        for ( ; cursor < vaddr + size; cursor += PAGE_SIZE) {
>>                struct page *page = vmalloc_to_page(cursor);
>> 
>>                if (test_and_clear_bit(PG_dcache_dirty, &page->flags))
>>                        flush_kernel_dcache_page(page);
>>        }
>>        flush_kernel_dcache_range_asm(start, start + size);
>> }
> 
> BTW. if you flush a cache line, then - according to the pa-risc 
> specification - the page stays in the TLB and the CPU can fetch anything 
> that is in the TLB speculatively. So, such a flush could really have no 
> effect.
> 
> The kernel should first flush TLB for the affected range and then flush 
> the data using the tmpalias mapping.

I agree.  Flushing using the tmpalias mapping handles cache move-in correctly but at the moment
we only have routines to flush whole pages.  I think the big problem is we don't create translations
for non access TLB misses correctly.  See top of page F-11.  We should set access rights to 0 or 1
to prevent I-cache move-in, and the T bit to 1 to prevent D-cache move-in.  As things stands, set up
the TLB entry for non access exceptions the same as we do for normal access exceptions.  As a result,
cache flushes may themselves cause a problem.

I had always wondered why this code is backwards:

void flush_kernel_dcache_page_addr(void *addr)
{
        unsigned long flags;

        flush_kernel_dcache_page_asm(addr);
        purge_tlb_start(flags);
        pdtlb_kernel(addr);
        purge_tlb_end(flags);
}

I did try reversing the order yesterday and it it seemed to increase the number of random segmentation faults.
As it stands, there is a bit of a race between the cache flush and the TLB purge.

Dave
--
John David Anglin	dave.anglin@bell.net



