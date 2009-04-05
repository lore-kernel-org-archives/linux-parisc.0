From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] Remove casts from atomic macros
Date: Sun, 5 Apr 2009 11:04:27 -0600
Message-ID: <20090405170427.GA25876@lackof.org>
References: <20090404205426.GA27225@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Bastian Blank <waldi@debian.org>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090404205426.GA27225@wavehammer.waldi.eu.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 04, 2009 at 10:54:26PM +0200, Bastian Blank wrote:
> The atomic operations on parisc are defined as macros. The macros
> includes casts which disallows the use of some syntax elements and
> produces error like this:
> 
> net/phonet/pep.c: In function 'pipe_rcv_status':
> net/phonet/pep.c:262: error: lvalue required as left operand of assignment
> 
> The patch removes this superfluous casts.

Since parisc is "special" for atomic ops, I was worried we would
introduce new warnings into the build because __atomic_add_return()
takes an int as a parameter. No new warnings for my 64-bit build.

thanks,
grant

> 
> Signed-off-by: Bastian Blank <waldi@debian.org>
> 
> diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
> index edbfe25..43e101b 100644
> --- a/arch/parisc/include/asm/atomic.h
> +++ b/arch/parisc/include/asm/atomic.h
> @@ -222,13 +222,13 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
>  
>  #define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
>  
> -#define atomic_add(i,v)	((void)(__atomic_add_return( ((int)i),(v))))
> -#define atomic_sub(i,v)	((void)(__atomic_add_return(-((int)i),(v))))
> +#define atomic_add(i,v)	((void)(__atomic_add_return( (i),(v))))
> +#define atomic_sub(i,v)	((void)(__atomic_add_return(-(i),(v))))
>  #define atomic_inc(v)	((void)(__atomic_add_return(   1,(v))))
>  #define atomic_dec(v)	((void)(__atomic_add_return(  -1,(v))))
>  
> -#define atomic_add_return(i,v)	(__atomic_add_return( ((int)i),(v)))
> -#define atomic_sub_return(i,v)	(__atomic_add_return(-((int)i),(v)))
> +#define atomic_add_return(i,v)	(__atomic_add_return( (i),(v)))
> +#define atomic_sub_return(i,v)	(__atomic_add_return(-(i),(v)))
>  #define atomic_inc_return(v)	(__atomic_add_return(   1,(v)))
>  #define atomic_dec_return(v)	(__atomic_add_return(  -1,(v)))
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
