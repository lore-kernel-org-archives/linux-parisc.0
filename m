From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 15:31:53 -0500
Message-ID: <1300739513.10634.39.camel@mulgrave.site>
References: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103212212040.27981@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2011-03-21 at 22:18 +0200, Meelis Roos wrote:
> Currently, 2.6.38 compile fails on parisc64 because binutils complains 
> that .size expression does not evaluate to a constant. The problem is 
> confusion between flush_alias_page and flush_user_dcache_range_asm.
> 
> This patch fixes pacache.s compilation by adding ENDPROC to flush_alias 
> page and ENTRY and correct ENDPROC to flush_user_dcache_range_asm.
> 
> Signed-off-by: Meelis Roos <mroos@linux.ee>
> 
> diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
> index 09b77b2..f3d7da6 100644
> --- a/arch/parisc/kernel/pacache.S
> +++ b/arch/parisc/kernel/pacache.S
> @@ -842,11 +842,10 @@ ENTRY(flush_alias_page)
>  	.exit
>  
>  	.procend
> +ENDPROC(flush_alias_page)
>  #endif
>  
> -	.export flush_user_dcache_range_asm
> -
> -flush_user_dcache_range_asm:
> +ENTRY(flush_user_dcache_range_asm)
>  	.proc
>  	.callinfo NO_CALLS
>  	.entry
> @@ -865,7 +864,7 @@ flush_user_dcache_range_asm:
>  	.exit
>  
>  	.procend
> -ENDPROC(flush_alias_page)
> +ENDPROC(flush_user_dcache_range_asm)
>  
>  ENTRY(flush_kernel_dcache_range_asm)
>  	.proc

This won't apply because of upstream changes to the file
(flush_alias_page got removed) ... does the problem even still exist
upstream?

James


