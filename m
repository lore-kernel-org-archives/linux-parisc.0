From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: remove gratuitous cpu_online_map declaration.
Date: Mon, 8 Dec 2008 22:54:07 -0500
Message-ID: <20081209035407.GF30783@bombadil.infradead.org>
References: <200812041012.41496.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-parisc@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812041012.41496.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 04, 2008 at 10:12:41AM +1030, Rusty Russell wrote:
> This is defined in linux/cpumask.h (included in this file already),
> and this will break when the definition changes (in a following patch).
> 
> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

Accepted, though it would have been nice if it had either hit all the
maintainers, or hit the list too...

cheers, Kyle

> ---
>  arch/parisc/include/asm/smp.h |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
> --- a/arch/parisc/include/asm/smp.h
> +++ b/arch/parisc/include/asm/smp.h
> @@ -15,8 +15,6 @@
>  #include <linux/threads.h>	/* for NR_CPUS */
>  #include <linux/cpumask.h>
>  typedef unsigned long address_t;
> -
> -extern cpumask_t cpu_online_map;
>  
>  
>  /*
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
