From: John David Anglin <dave.anglin@bell.net>
Subject: Re: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Mon, 11 Dec 2017 10:12:15 -0500
Message-ID: <1aebd112-ac84-11fb-e3ab-246b5de4b823@bell.net>
References: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com>
 <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de>
 <alpine.LRH.2.02.1702011507040.25889@file01.intranet.prod.int.rdu2.redhat.com>
 <53b0b36a-32cd-2421-7d45-0c8ea8cc1ac1@bell.net>
 <alpine.LRH.2.02.1712080619070.10139@file01.intranet.prod.int.rdu2.redhat.com>
 <7FD0E306-71B6-44B5-8803-E4465CBFF200@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7FD0E306-71B6-44B5-8803-E4465CBFF200@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-10 4:42 PM, John David Anglin wrote:
> I had always wondered why this code is backwards:
>
> void flush_kernel_dcache_page_addr(void *addr)
> {
>          unsigned long flags;
>
>          flush_kernel_dcache_page_asm(addr);
>          purge_tlb_start(flags);
>          pdtlb_kernel(addr);
>          purge_tlb_end(flags);
> }
>
> I did try reversing the order yesterday and it it seemed to increase the number of random segmentation faults.
> As it stands, there is a bit of a race between the cache flush and the TLB purge.
Actually, the order is understandable given that 
flush_kernel_dcache_page_asm uses the same translation
as regular accesses.  So, purging the translation before the cache flush 
does nothing and speculation can
corrupt the cache.

I think there are a few places where we have the order wrong.

We might be able to use the tmpalias flush_dcache_page_asm routine for 
the above.

Dave

-- 
John David Anglin  dave.anglin@bell.net

