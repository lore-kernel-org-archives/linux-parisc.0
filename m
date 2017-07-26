From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Optimize switch_mm
Date: Wed, 26 Jul 2017 21:13:06 +0200
Message-ID: <1e8a8db0-cf16-cdeb-27f8-284de4b5e9a9@gmx.de>
References: <16F63B59-7A36-48F0-A5C7-670CA2ED9DED@bell.net>
 <20170726180252.GA1129@p100.box>
 <0C9BC40B-9C2C-4058-BC0A-EAF1B017F537@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0C9BC40B-9C2C-4058-BC0A-EAF1B017F537@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 26.07.2017 20:49, John David Anglin wrote:
> On 2017-07-26, at 2:02 PM, Helge Deller wrote:
> 
>> Instead I'd then suggest the patch below.
>> The if-clause in switch_mm_irqs_off() will then probably be optimized
>> away by the compiler.
>>
>> diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
>> index a812262..e4a6570 100644
>> --- a/arch/parisc/include/asm/mmu_context.h
>> +++ b/arch/parisc/include/asm/mmu_context.h
>> @@ -63,6 +63,9 @@ static inline void switch_mm(struct mm_struct *prev,
>> {
>> 	unsigned long flags;
>>
>> +	if (prev == next)
>> +		return;
>> +
>> 	local_irq_save(flags);
>> 	switch_mm_irqs_off(prev, next, tsk);
>> 	local_irq_restore(flags);
> 
> You are correct.  I missed the fact that switch_mm_irqs_off() is used by kernel/sched/core.c.
> 
> Maybe we should replace the "switch_mm_irqs_off(prev, next, tsk);" with the mtctl and load_context
> lines to ensure that the if-clause is optimized?

I think we should look at the generated assembly, and if it's not optimized away replace it with mtctl/load_context.

Helge
