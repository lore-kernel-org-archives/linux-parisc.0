From: Kyle McMartin <kyle@infradead.org>
Subject: Re: parisc: expose 32/64-bit capabilities in cpuinfo
Date: Fri, 30 Jan 2009 10:09:40 -0500
Message-ID: <20090130150940.GB28304@bombadil.infradead.org>
References: <20090130010350.GH7367@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Colin Watson <cjwatson@canonical.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090130010350.GH7367@riva.ucam.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 30, 2009 at 01:03:50AM +0000, Colin Watson wrote:
> Also, this is against the Ubuntu 2.6.28 kernel tree since that's what I
> had handy and I was a bit tight on disk space to slurp down another
> tree. Sorry if it's skewed in any relevant way; I'll be happy to adjust
> if necessary.
> 

No big deal, this code doesn't change often.

> Thanks in advance!
> 
> Signed-off-by: Colin Watson <cjwatson@canonical.com>
> 

Looks good to me, applied.

cheers, Kyle

> diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
> index c584b00..01e8063 100644
> --- a/arch/parisc/include/asm/pdc.h
> +++ b/arch/parisc/include/asm/pdc.h
> @@ -49,6 +49,8 @@
>  #define PDC_MODEL_CPU_ID	6	/* returns cpu-id (only newer machines!) */
>  #define PDC_MODEL_CAPABILITIES	7	/* returns OS32/OS64-flags	*/
>  /* Values for PDC_MODEL_CAPABILITIES non-equivalent virtual aliasing support */
> +#define  PDC_MODEL_OS64			(1 << 0)
> +#define  PDC_MODEL_OS32			(1 << 1)
>  #define  PDC_MODEL_IOPDIR_FDC		(1 << 2)
>  #define  PDC_MODEL_NVA_MASK		(3 << 4)
>  #define  PDC_MODEL_NVA_SUPPORTED	(0 << 4)
> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
> index 03f26bd..cf118ef 100644
> --- a/arch/parisc/kernel/firmware.c
> +++ b/arch/parisc/kernel/firmware.c
> @@ -527,7 +527,11 @@ int pdc_model_capabilities(unsigned long *capabilities)
>          pdc_result[0] = 0; /* preset zero (call may not be implemented!) */
>          retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES, __pa(pdc_result), 0);
>          convert_to_wide(pdc_result);
> -        *capabilities = pdc_result[0];
> +        if (retval == PDC_OK) {
> +                *capabilities = pdc_result[0];
> +        } else {
> +                *capabilities = PDC_MODEL_OS32;
> +        }
>          spin_unlock_irqrestore(&pdc_lock, flags);
>  
>          return retval;
> diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
> index 370086f..4b54479 100644
> --- a/arch/parisc/kernel/processor.c
> +++ b/arch/parisc/kernel/processor.c
> @@ -362,6 +362,13 @@ show_cpuinfo (struct seq_file *m, void *v)
>  				 boot_cpu_data.cpu_hz / 1000000,
>  				 boot_cpu_data.cpu_hz % 1000000  );
>  
> +		seq_printf(m, "capabilities\t:");
> +		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS32)
> +			seq_printf(m, " os32");
> +		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS64)
> +			seq_printf(m, " os64");
> +		seq_printf(m, "\n");
> +
>  		seq_printf(m, "model\t\t: %s\n"
>  				"model name\t: %s\n",
>  				 boot_cpu_data.pdc.sys_model_name,
> 
> -- 
> Colin Watson                                    [cjwatson@canonical.com]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
