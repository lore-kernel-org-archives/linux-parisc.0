From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 23 May 2009 21:34:37 +0200
Message-ID: <4A184FCD.90903@gmx.de>
References: <20090523153430.A246E4FB4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090523153430.A246E4FB4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>> -#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
>>> -#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
>>> +#define purge_tlb_start(x)	do { unsigned long flags; spin_lock_irqsave(&pa_tlb_lock, flags)
>>> +#define purge_tlb_end(x)	     spin_unlock_irqrestore(&pa_tlb_lock, flags); } while (0)
>> To my taste, the handling of the "flags" variable is ugly and potentially
>> error prone.
>>
>> I think it would be better to add another argument to the macros, and declare
>> the variable flags in the routines that use the macros (as is done for the
>> current users of spin_lock_irqsave macro).
> 
> Actually, the 'x' argument could be used for this.

I mentioned in my original mail that this is not the final version:
> The patch below is just a hack. It will need a cleanup and is just to open
> discussions here on the list.

But instead of cleaning it up right now, I would be very much interested if
this patch fixes the kernel stalls you see as well?

If it does, then I agree that we should add a "flags" argument to purge_tlb_xxx() functions, e.g.
- purge_tlb_start(lock, flags) 
- purge_tlb_end(lock, flags)

Helge
