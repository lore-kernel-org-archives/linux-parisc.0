From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: call set_irq_regs() after disabling local irqs
Date: Thu, 10 Oct 2013 10:32:22 +0200
Message-ID: <52566616.80101@gmx.de>
References: <20131009215413.GA30163@p100.box> <1381371477.17669.62.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1381371477.17669.62.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

On 10/10/2013 04:17 AM, James Bottomley wrote:
> On Wed, 2013-10-09 at 23:54 +0200, Helge Deller wrote:
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
>> index 2e6443b..c439c05 100644
>> --- a/arch/parisc/kernel/irq.c
>> +++ b/arch/parisc/kernel/irq.c
>> @@ -529,8 +529,8 @@ void do_cpu_irq_mask(struct pt_regs *regs)
>>  	cpumask_t dest;
>>  #endif
>>  
>> -	old_regs = set_irq_regs(regs);
>>  	local_irq_disable();
>> +	old_regs = set_irq_regs(regs);
> 
> I don't quite understand why.  set_irq_regs is just saving the current
> regs pointer.

...and setting a new one...

> The design intent is to call it first thing in the
> interrupt routine but because of the way we use them, it makes no
> difference whether you do it before or after disabling interrupts
> because it's stacked.  What was the reason for wanting to change it to a
> non-standard calling pattern?

Is it really non-standard?

My first intention was to align the set_irq_regs() and entrance and exit 
to the irq_enter() and irq_exit() functions.
With my change above it's now:
	
	old_regs = set_irq_regs(regs);
	irq_enter();
	do_something...();
	irq_exit();
	set_irq_regs(old_regs);

That's the same syntax as all other arches use.

I think the main question is, if we need local_irq_disable() at all?
At least moving the "old_regs = set_irq_regs(regs);" down after local_irq_disable()
ensures that nobody else modifies the irq_regs pointer before we save it into old_regs.

Helge

