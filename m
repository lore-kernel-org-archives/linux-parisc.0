From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PARISC] Fix kernel panic in check_ivt
Date: Mon, 4 Jun 2007 00:04:07 -0600
Message-ID: <20070604060407.GA3925__10519.7378121831$1416624387$gmane$org@colo.lackof.org>
References: <20070604054954.GA12289@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070604054954.GA12289@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 04, 2007 at 01:49:54AM -0400, Kyle McMartin wrote:
> From: Kyle McMartin <kyle@parisc-linux.org>
> 
> check_ivt had some seriously broken code wrt function pointers on
> parisc64. Instead of referencing the hpmc code via a function pointer,
> export symbols and reference it as a const array.
> 
> Thanks to jda for pointing out the broken 64-bit func ptr handling.
> 
> Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

This looks good to me...please push to your git tree.
Tested on 32-bit (c3k).

Acked-by: Grant Grundler <grundler@parisc-linux.org>

thanks (jda and kyle),
grant

> ---
>  arch/parisc/kernel/hpmc.S  |    7 ++++---
>  arch/parisc/kernel/traps.c |    8 ++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
> index d8baa15..abda491 100644
> --- a/arch/parisc/kernel/hpmc.S
> +++ b/arch/parisc/kernel/hpmc.S
> @@ -79,6 +79,8 @@ END(hpmc_pim_data)
>  	.text
>  
>  	.import intr_save, code
> +	.export __os_hpmc, data
> +__os_hpmc:
>  ENTRY(os_hpmc)
>  
>  	/*
> @@ -295,8 +297,7 @@ os_hpmc_6:
>  	b .
>  	nop
>  ENDPROC(os_hpmc)
> -
> -	/* this label used to compute os_hpmc checksum */
> -ENTRY(os_hpmc_end)
> +__os_hpmc_end:
> +	.export __os_hpmc_end, data 	/* this label used to compute os_hpmc checksum */
>  
>  	nop
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 0ba1d3d..e8b977a 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -807,8 +807,8 @@ int __init check_ivt(void *iva)
>  	u32 *ivap;
>  	u32 *hpmcp;
>  	u32 length;
> -	extern void os_hpmc(void);
> -	extern void os_hpmc_end(void);
> +	extern const u32 __os_hpmc[];
> +	extern const u32 __os_hpmc_end[];
>  
>  	if (strcmp((char *)iva, "cows can fly"))
>  		return -1;
> @@ -820,10 +820,10 @@ int __init check_ivt(void *iva)
>  
>  	/* Compute Checksum for HPMC handler */
>  
> -	length = (u32)((unsigned long)os_hpmc_end - (unsigned long)os_hpmc);
> +	length = __os_hpmc_end - __os_hpmc;
>  	ivap[7] = length;
>  
> -	hpmcp = (u32 *)os_hpmc;
> +	hpmcp = (u32 *)__os_hpmc;
>  
>  	for (i=0; i<length/4; i++)
>  	    check += *hpmcp++;
> -- 
> 1.5.1.3
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
