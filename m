From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix TLB related boot crash on SMP machines
Date: Thu, 8 Dec 2016 16:21:12 -0500
Message-ID: <b9bf1696-ad68-46c9-0c6d-13e25138a5ca@bell.net>
References: <20161207205240.GA5917@ls3530>
 <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
 <53d038e2-a697-8e20-4225-48034af5aaf4@gmx.de> <20161208200046.GA5248@ls3530>
 <788ad921-06b8-e2b5-afb1-c41fdcc791ab@bell.net>
 <22ef0d34-d205-ba11-bc97-0f04c8f4929b@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <22ef0d34-d205-ba11-bc97-0f04c8f4929b@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-12-08 4:15 PM, Helge Deller wrote:
> On 08.12.2016 21:49, John David Anglin wrote:
>> On 2016-12-08 3:00 PM, Helge Deller wrote:
>>> On a technical side, this seems to happen:
>>> The TLB measurement code uses flush_tlb_kernel_range() to flush specific TLB
>>> entries with a page size of 4k (pdtlb 0(sr1,addr)). On UP systems this purge
>>> instruction seems to work without problems even if the pages were mapped as
>>> huge pages.  But on SMP systems the TLB purge instruction is broadcasted to
>>> other CPUs. Those CPUs then crash the machine because the page size is not as
>>> expected.  C8000 machines with PA8800/PA8900 CPUs were not affected by this
>>> problem, because the required cache coherency prohibits to use huge pages at
>>> all.  Sadly I didn't found any documentation about this behaviour, so this
>>> finding is purely based on testing with phyiscal SMP machines (A500-44 and
>>> J5000, both were 2-way boxes).
>> I doubt the problem is the 4k iteration using pdtlb 0(sr1,addr). I
>> think the issue is the huge page size for the kernel. Each pdtlb
>> instruction knocks out the same tlb entry including the entry used
>> for tlb interruptions. This likely leads to stack overflow.
> Yes, likely.
>
>> In any
>> case, it probably doesn't provide accurate timing because each pdtlb
>> knocks out the entry for the interruption handler on systems with
>> combined tlb.
> True.
>
> So, how to continue?
> I see two options:
> a) skip the TLB measuring code as my patch does.
> b) kmalloc() another region and do measurement there.
>
> I'd like to submit some fix-patch for 4.9, else the machines won't boot 4.9.
> That's why I'd prefer option a).
> Opinions?
Go with option a) for 4.9

Dave

-- 
John David Anglin  dave.anglin@bell.net

