From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Mon, 4 Jan 2016 16:48:11 -0500
Message-ID: <568AE89B.9030606@bell.net>
References: <20151122115153.GA28471@p100.box>
 <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
 <5654892D.1030707@gmx.de>
 <alpine.LRH.2.02.1511241136440.14442@file01.intranet.prod.int.rdu2.redhat.com>
 <20151124170020.GA13198@p100.box>
 <alpine.LRH.2.02.1511241343200.30334@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1512260645560.7692@file01.intranet.prod.int.rdu2.redhat.com>
 <567E88BA.4010607@gmx.de>
 <alpine.LRH.2.02.1601041619070.20474@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1601041619070.20474@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-01-04 4:24 PM, Mikulas Patocka wrote:
>
> On Sat, 26 Dec 2015, Helge Deller wrote:
>
>> On 26.12.2015 13:09, Mikulas Patocka wrote:
>>
>>> BTW. I looked at this in arch/parisc/mm/hugetlbpage.c:set_huge_pte_at
>>> "*ptep = entry;" and it seems like a bad bug. PA-RISC doesn't have atomic
>>> instructions to modify page table entries, so it takes spinlock in the TLB
>>> handler and modifies the page table entry non-atomically. If you modify
>>> the page table entry without the spinlock, you may race with TLB handler
>>> on another CPU and your modification may be lost.
>> Right.
>>
>>> The comment says something about double locking on pa_tlb_lock, but
>>> pa_tlb_lock isn't held when that function is called.
>> I have a work-in-progress patch for that in one of my trees, e.g.:
>> http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-next&id=5c76b525cbdb097401f46522b27b1eb6244f34f9
>> It's lightly tested though.
>>
>> Helge
> I tested the patch and it works OK for me so far.
>
> BTW. what happens if some kernel code takes the TLB spinlock and then TLB
> miss in kernel space happens? (it would attempt to lock the spinlock
> recursively) Is it assumed that the TLB is big enough that this can't
> happen?
No.  If you look at the TLB handler, you will see that locking is not 
done for misses in
kernel space.  So, this deadlock doesn't occur.

Dave

-- 
John David Anglin  dave.anglin@bell.net

