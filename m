From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and PA8900 CPUs
Date: Fri, 25 Sep 2015 08:20:34 -0400
Message-ID: <BA678D0F-591B-4925-A50B-852C0C3419F7@bell.net>
References: <20150902162000.GC2444@ls3530.box> <1441287043.2235.6.camel@HansenPartnership.com> <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de> <56017FB3.5050709@gmx.de> <17069A9B-BA68-4BDA-9342-83E33A22D547@bell.net> <1443104427.2203.17.camel@HansenPartnership.com> <56042730.2050706@bell.net> <1443113829.2203.39.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1443113829.2203.39.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 2015-09-24, at 12:57 PM, James Bottomley wrote:

> On Thu, 2015-09-24 at 12:39 -0400, John David Anglin wrote:
>> On 2015-09-24 10:20 AM, James Bottomley wrote:
>>> On Tue, 2015-09-22 at 20:12 -0400, John David Anglin wrote:
>>>> I question the the atomic hash changes as the original defines are
>>>> taken directly from generic code.
>>> It's about scaling.  The fewer locks, the more contention in a hash lock
>>> system.  The interesting question is where does the line tip over so
>>> that we see less speed up for more locks.
>>> 
>>>> Optimally, we want one spinlock per cacheline.  Why do we care about
>>>> the size of atomic_t?
>>> OK, so I think we're not using the word 'line size' in the same way.
>>> When Linux says 'line size' it generally means the cache ownership line
>>> size: the minimum block the inter cpu coherence operates on.  Most of
>>> the architectural evidence for PA systems suggests that this is 16  We
>>> should be able to get this definitively: it's however many lower bits of
>>> a virtual address the LCI instruction truncates.  128 seems to be the
>>> cache burst fill size (the number of bytes that will be pulled into the
>>> cache by a usual operation touching any byte in the area).  For
>>> streaming operations, the burst fill size is what we want to use, but
>>> for coherence operations it's the ownership line size.  The reason is
>>> that different CPUs can own adjacent lines uncontended, so one spinlock
>>> per this region is optimal.
>>> 
>>> The disadvantage to padding things out to the cache burst fill size is
>>> that we blow the cache footprint: data is too far apart and we use far
>>> more cache than we should meaning the cache thrashes much sooner as you
>>> load up the CPU.  On SMP systems, Linux uses SMP_CACHE_BYTES ==
>>> L1_CACHE_BYTES for padding on tons of critical structures if it's too
>>> big we'll waste a lot of cache footprint for no gain.
>> It looks to me like the LCI instruction must zero bits rather than 
>> truncate as drivers
>> (e.g., sba_iommu.c) drop the least significant 12 bits (ci >> 
>> PAGE_SHIFT).  I think we
>> should do the LCI test.  I had been assuming that the two lengths would 
>> be the same.
> 
> It's a backwards compatibility problem: You get to fix the cache
> ownership size once per incompatible architecture.  Once PA produced 64
> bit chips was the last opportunity to do this because an older 64 bit
> kernel (for PA and Linux) must work reasonably well on newer processors.
> This means that if you increase the actual ownership size and the older
> kernel suddenly starts thrashing because of SMP cache interference,
> everyone blames you and says your new chips are rubbish (this did
> actually happen to Intel once, if I remember correctly).  That's why
> it's usually avoided.

The division by L1_CACHE_BYTES in ATOMIC_HASH simply reflects the alignment of
atomic_t types.  We want a hash value that's not always zero.

On systems with hardware atomic operations, atomic variables need to be on separate
cache lines to minimize contention.  Thus, the L1_CACHE_BYTES alignment.

Our atomic_t types are guarded by ldcw locks.  So, they are not really subject to contention.
You could be correct that L1_CACHE_BYTES could be reduced to 16 (i.e., maximum alignment
needed for any type on parisc) provided it isn't used somewhere where we need the actual L1
cache line size as returned by the PDC.

When this started, I was pushing to see if placing our ldcw locks on different lines
helped performance.  Possibly, the number could be increased as well.  On PA20, we currently
align __atomic_hash to __lock_aligned (16 bytes).  So, all four locks are on the same line.

Dave

--
John David Anglin	dave.anglin@bell.net



