From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix interruption handler to respect pagefault_disable()
Date: Sat, 5 Oct 2013 20:28:58 -0400
Message-ID: <BLU0-SMTP320EE7B0D779332AA8137397120@phx.gbl>
References: <20131001195446.GA29580@p100.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131001195446.GA29580@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: John David Anglin  <dave.anglin@bell.net>

On 1-Oct-13, at 3:54 PM, Helge Deller wrote:

> Running an "echo t > /proc/sysrq-trigger" crashes the parisc  
> kernel.  The
> problem is, that in print_worker_info() we try to read the workqueue  
> info via
> the probe_kernel_read() functions which use pagefault_disable() to  
> avoid
> crashes like this:
>    probe_kernel_read(&pwq, &worker->current_pwq, sizeof(pwq));
>    probe_kernel_read(&wq, &pwq->wq, sizeof(wq));
>    probe_kernel_read(name, wq->name, sizeof(name) - 1);
>
> The problem here is, that the first probe_kernel_read(&pwq) might  
> return zero
> in pwq and as such the following probe_kernel_reads() try to access  
> contents of
> the page zero which is read protected and generate a kernel segfault.
>
> With this patch we fix the interruption handler to call  
> parisc_terminate()
> directly only if pagefault_disable() was not called (in which case
> preempt_count()==0).  Otherwise we hand over to the pagefault  
> handler which
> will try to look up the faulting address in the fixup tables.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v3.0+
>
> diff --git a/arch/parisc/include/asm/traps.h b/arch/parisc/include/ 
> asm/traps.h
> index 1945f99..4736020 100644
> --- a/arch/parisc/include/asm/traps.h
> +++ b/arch/parisc/include/asm/traps.h
> @@ -6,7 +6,7 @@ struct pt_regs;
>
> /* traps.c */
> void parisc_terminate(char *msg, struct pt_regs *regs,
> -		int code, unsigned long offset);
> +		int code, unsigned long offset) __noreturn __cold;
>
> /* mm/fault.c */
> void do_page_fault(struct pt_regs *regs, unsigned long code,
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 04e47c6..b3f87a3 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -805,14 +805,14 @@ void notrace handle_interruption(int code,  
> struct pt_regs *regs)
> 	else {
>
> 	    /*
> -	     * The kernel should never fault on its own address space.
> +	     * The kernel should never fault on its own address space,
> +	     * unless pagefault_disable() was called before.
> 	     */
>
> -	    if (fault_space == 0)
> +	    if (fault_space == 0 && !in_atomic())
> 	    {
> 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
> 		parisc_terminate("Kernel Fault", regs, code, fault_address);
> -	
> 	    }
> 	}
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
John David Anglin	dave.anglin@bell.net



