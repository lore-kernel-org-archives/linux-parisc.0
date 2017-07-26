From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Optimize switch_mm
Date: Wed, 26 Jul 2017 20:02:52 +0200
Message-ID: <20170726180252.GA1129@p100.box>
References: <16F63B59-7A36-48F0-A5C7-670CA2ED9DED@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <16F63B59-7A36-48F0-A5C7-670CA2ED9DED@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* John David Anglin <dave.anglin@bell.net>:
> We only need to switch contexts when prev != next, and we don't need to disable interrupts
> to do the check.
> 
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> 
> 

> diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
> index a81226257878..b1dc6e3f0dd0 100644
> --- a/arch/parisc/include/asm/mmu_context.h
> +++ b/arch/parisc/include/asm/mmu_context.h
> @@ -49,26 +49,19 @@ static inline void load_context(mm_context_t context)
>  	mtctl(__space_to_prot(context), 8);
>  }
>  
> -static inline void switch_mm_irqs_off(struct mm_struct *prev,
> +static inline void switch_mm(struct mm_struct *prev,
>  		struct mm_struct *next, struct task_struct *tsk)
>  {
> +	unsigned long flags;
> +
>  	if (prev != next) {
> +		local_irq_save(flags);
>  		mtctl(__pa(next->pgd), 25);
>  		load_context(next->context);
> +		local_irq_restore(flags);
>  	}
>  }
>  
> -static inline void switch_mm(struct mm_struct *prev,
> -		struct mm_struct *next, struct task_struct *tsk)
> -{
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
> -	switch_mm_irqs_off(prev, next, tsk);
> -	local_irq_restore(flags);
> -}
> -#define switch_mm_irqs_off switch_mm_irqs_off
> -
>  #define deactivate_mm(tsk,mm)	do { } while (0)
>  
>  static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)


Instead I'd then suggest the patch below.
The if-clause in switch_mm_irqs_off() will then probably be optimized
away by the compiler.

diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
index a812262..e4a6570 100644
--- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -63,6 +63,9 @@ static inline void switch_mm(struct mm_struct *prev,
 {
 	unsigned long flags;
 
+	if (prev == next)
+		return;
+
 	local_irq_save(flags);
 	switch_mm_irqs_off(prev, next, tsk);
 	local_irq_restore(flags);
