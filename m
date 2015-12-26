From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Sat, 26 Dec 2015 13:31:54 +0100
Message-ID: <567E88BA.4010607@gmx.de>
References: <20151122115153.GA28471@p100.box>
 <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
 <5654892D.1030707@gmx.de>
 <alpine.LRH.2.02.1511241136440.14442@file01.intranet.prod.int.rdu2.redhat.com>
 <20151124170020.GA13198@p100.box>
 <alpine.LRH.2.02.1511241343200.30334@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1512260645560.7692@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1512260645560.7692@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 26.12.2015 13:09, Mikulas Patocka wrote:
>> On Tue, 24 Nov 2015, Helge Deller wrote:
>>> * Mikulas Patocka <mpatocka@redhat.com>:
>>>> On Tue, 24 Nov 2015, Helge Deller wrote:
>>>>>> Hi
>>>>>>
>>>>>> Since the kernel 4.4-rc2 I'm getting frequent boot failures on PA-RISC. 
>>>>>> When I revert this patchset, the crashes are gone.
>>>>>
>>>>>> [    3.296666] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
>>>>>
>>>>> Hi Mikulas,
>>>>>
>>>>> Yes, I've seen this as well.
>>>>> It affects only the PA8900 CPUs, while all PA8500-PA8700 machines seem to work fine.
>>>>> I do have a temporary 3-line patch to avoid the crashes which I'll push to my tree shortly.
>>>>> I'm still investigating why it only affects the PA8900 CPUs, but I assume
>>>>> it's related to the cache aliasing of those CPUs.
>>>>> I'll keep you updated.
>>>>>
>>>>> Helge
>>>>
>>>> The PA-RISC specification doesn't allow aliasing on non-equaivalent 
>>>> addresses. Can the kernel map a piece of kernel data to other virtual 
>>>> address? If yes, we can't use big pages to map kernel data.
>>>
>>> Can you please try the two patches below?
>>> The first one disables mapping kernel text/data on huge pages on
>>> PA8800/PA8900 CPUs. Patch works for me on my Mako PA8800.
>>>
>>> Independend of my huge page patch the second patch disables the tlb
>>> flush optimization we added earlier. It seems calling flush_tlb_all()
>>> doesn't reliably flushes tlbs on all CPUs so it's better to fall back to
>>> the loop implementation.
>>>
>>> Helge
>>
>> The kernel with these patches works fine so far.
>>
>> Mikulas
> 
> BTW. I looked at this in arch/parisc/mm/hugetlbpage.c:set_huge_pte_at 
> "*ptep = entry;" and it seems like a bad bug. PA-RISC doesn't have atomic 
> instructions to modify page table entries, so it takes spinlock in the TLB 
> handler and modifies the page table entry non-atomically. If you modify 
> the page table entry without the spinlock, you may race with TLB handler 
> on another CPU and your modification may be lost.

Right.

> The comment says something about double locking on pa_tlb_lock, but 
> pa_tlb_lock isn't held when that function is called.

I have a work-in-progress patch for that in one of my trees, e.g.:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-next&id=5c76b525cbdb097401f46522b27b1eb6244f34f9
It's lightly tested though.

Helge

