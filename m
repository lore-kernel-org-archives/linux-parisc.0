From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and
 PA8900 CPUs
Date: Thu, 24 Sep 2015 12:39:12 -0400
Message-ID: <56042730.2050706@bell.net>
References: <20150902162000.GC2444@ls3530.box>
 <1441287043.2235.6.camel@HansenPartnership.com>
 <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de>
 <56017FB3.5050709@gmx.de> <17069A9B-BA68-4BDA-9342-83E33A22D547@bell.net>
 <1443104427.2203.17.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1443104427.2203.17.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-24 10:20 AM, James Bottomley wrote:
> On Tue, 2015-09-22 at 20:12 -0400, John David Anglin wrote:
>> I question the the atomic hash changes as the original defines are
>> taken directly from generic code.
> It's about scaling.  The fewer locks, the more contention in a hash lock
> system.  The interesting question is where does the line tip over so
> that we see less speed up for more locks.
>
>> Optimally, we want one spinlock per cacheline.  Why do we care about
>> the size of atomic_t?
> OK, so I think we're not using the word 'line size' in the same way.
> When Linux says 'line size' it generally means the cache ownership line
> size: the minimum block the inter cpu coherence operates on.  Most of
> the architectural evidence for PA systems suggests that this is 16  We
> should be able to get this definitively: it's however many lower bits of
> a virtual address the LCI instruction truncates.  128 seems to be the
> cache burst fill size (the number of bytes that will be pulled into the
> cache by a usual operation touching any byte in the area).  For
> streaming operations, the burst fill size is what we want to use, but
> for coherence operations it's the ownership line size.  The reason is
> that different CPUs can own adjacent lines uncontended, so one spinlock
> per this region is optimal.
>
> The disadvantage to padding things out to the cache burst fill size is
> that we blow the cache footprint: data is too far apart and we use far
> more cache than we should meaning the cache thrashes much sooner as you
> load up the CPU.  On SMP systems, Linux uses SMP_CACHE_BYTES ==
> L1_CACHE_BYTES for padding on tons of critical structures if it's too
> big we'll waste a lot of cache footprint for no gain.
It looks to me like the LCI instruction must zero bits rather than 
truncate as drivers
(e.g., sba_iommu.c) drop the least significant 12 bits (ci >> 
PAGE_SHIFT).  I think we
should do the LCI test.  I had been assuming that the two lengths would 
be the same.

Dave

-- 
John David Anglin  dave.anglin@bell.net

