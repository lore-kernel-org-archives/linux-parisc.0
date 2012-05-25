From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Fix parisc compile failure after smp: Add task_struct argument
 to __cpu_up()
Date: Fri, 25 May 2012 14:21:07 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1205251420311.3231@ionos>
References: <1337943565.2932.24.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <jbottomley@parallels.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337943565.2932.24.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 25 May 2012, James Bottomley wrote:

> commit 8239c25f47d2b318156993b15f33900a86ea5e17 added an argument to our
> __cpu_up() function, but didn't notice we have an extra definition for
> this in asm/smp.h resulting in a compile failure.
> 
> Fix by removing the extraneous parisc definition of __cpu_up().  While
> we're at it, remove the duplicated definition of smp_send_reschedule().

Ooops. Sorry.

> James
> 
> ---
> 
> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
> index e8f8037..a5dc906 100644
> --- a/arch/parisc/include/asm/smp.h
> +++ b/arch/parisc/include/asm/smp.h
> @@ -25,7 +25,6 @@ typedef unsigned long address_t;
>  #define cpu_number_map(cpu)	(cpu)
>  #define cpu_logical_map(cpu)	(cpu)
>  
> -extern void smp_send_reschedule(int cpu);
>  extern void smp_send_all_nop(void);
>  
>  extern void arch_send_call_function_single_ipi(int cpu);
> @@ -50,6 +49,5 @@ static inline void __cpu_die (unsigned int cpu) {
>    while(1)
>      ;
>  }
> -extern int __cpu_up (unsigned int cpu);
>  
>  #endif /*  __ASM_SMP_H */
> 
> 
