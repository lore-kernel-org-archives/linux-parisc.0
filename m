From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: compile failure: pacache.S and .size
Date: Sun, 20 Mar 2011 18:20:26 -0400
Message-ID: <20110320222026.GA25697@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103130235020.7773@math.ut.ee> <20110313041046.GA19769@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103132139410.24035@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103132139410.24035@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 13 Mar 2011, Meelis Roos wrote:

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

Suggest officially submitting above change.  It corrects obvious
problems with pacache.S.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
