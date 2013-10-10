From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: call set_irq_regs() after disabling local irqs
Date: Thu, 10 Oct 2013 06:17:57 +0400
Message-ID: <1381371477.17669.62.camel@dabdike>
References: <20131009215413.GA30163@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131009215413.GA30163@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2013-10-09 at 23:54 +0200, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
> index 2e6443b..c439c05 100644
> --- a/arch/parisc/kernel/irq.c
> +++ b/arch/parisc/kernel/irq.c
> @@ -529,8 +529,8 @@ void do_cpu_irq_mask(struct pt_regs *regs)
>  	cpumask_t dest;
>  #endif
>  
> -	old_regs = set_irq_regs(regs);
>  	local_irq_disable();
> +	old_regs = set_irq_regs(regs);

I don't quite understand why.  set_irq_regs is just saving the current
regs pointer.  The design intent is to call it first thing in the
interrupt routine but because of the way we use them, it makes no
difference whether you do it before or after disabling interrupts
because it's stacked.  What was the reason for wanting to change it to a
non-standard calling pattern?

James


