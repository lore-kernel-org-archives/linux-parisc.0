From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: check hardcoded value of SHMLBA against value
 reported by firmware
Date: Tue, 29 Oct 2013 17:10:36 -0400
Message-ID: <BLU0-SMTP812DBA341716B80C3A40A597090@phx.gbl>
References: <20131029210544.GA18167@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131029210544.GA18167@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I seem to recall the aliasing boundary value returned by my rp3440 is 
"unknown".

On 10/29/2013 5:05 PM, Helge Deller wrote:
> Our value of SHMLBA is hardcoded to 4MB on parisc due to aliasing restrictions
> of the platform. The firmware function PDC_CACHE does return the machine
> dependend value of this aliasing requirement.
> So, if there is a difference between those two - which we don't expect - let's
> report it at least.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index c035673..3523e20 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -142,6 +142,15 @@ parisc_cache_init(void)
>   	if (pdc_cache_info(&cache_info) < 0)
>   		panic("parisc_cache_init: pdc_cache_info failed");
>   
> +	/*
> +	 * The alias field returned by PDC_CACHE specifies the aliasing
> +	 * boundaries for virtual addresses.  So, let's verify if our hardcoded
> +	 * value of SHMLBA (4 MB) is correct for this machine.
> +	 */
> +	if ((4096UL << (cache_info.dc_conf.cc_alias-1)) != SHMLBA)
> +		pr_warn("WARNING: PDC_CACHE returns aliasing of %lu kB.\n",
> +			(4UL << (cache_info.dc_conf.cc_alias-1)));
> +
>   #if 0
>   	printk("ic_size %lx dc_size %lx it_size %lx\n",
>   		cache_info.ic_size,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


-- 
John David Anglin    dave.anglin@bell.net

