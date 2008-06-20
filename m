From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Yet another inline asm worry: mtsp() macro (and may be other)?
Date: Fri, 20 Jun 2008 11:11:51 -0600
Message-ID: <20080620171151.GU4392@parisc-linux.org>
References: <K2RLMV$5D6B8CC1910705073A720C99B9A05EBA@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	deller <deller@gmx.de>, kyle <kyle@mcmartin.ca>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K2RLMV$5D6B8CC1910705073A720C99B9A05EBA@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 20, 2008 at 03:01:43PM +0100, Joel Soete wrote:
> Well I tried something:
> @@ -103,10 +108,23 @@
>  	cr;				\
>  })
>  
> -#define mtsp(gr, cr) \
> -	__asm__ __volatile__("mtsp %0,%1" \
> -		: /* no outputs */ \
> -		: "r" (gr), "i" (cr) : "memory")
> +#define mtsp(lval, i_sr)					\
> +{								\
> +	if (lval) {						\
> +		unsigned long reg = (unsigned long)(lval);	\
> +		__asm__ __volatile__(				\
> +			"mtsp %0, %%sr%1"			\
> +			: /* no outputs */			\
> +			: "r" (reg), "i" (i_sr)			\
> +			: "memory");				\
> +	} else {						\
> +		__asm__ __volatile__(				\
> +			"mtsp %%r0, %%sr%0"			\
> +			: /* no outputs */			\
> +			: "i" (i_sr)				\
> +			: "memory");				\
> +	};							\
> +}
>  
> that does well the drill for ccio-dma driver but else where (memcpy or cache)
> it looks worse then the original, so get rid of this idea.

Try this instead:

#define mtsp(space, cr)	{						\
	if (__builtin_constant_p(space) && (space == 0)) {		\
		__asm__ __volatile__("mtsp %%r0, %0" :			\
			/* no outputs */ : "i" (cr) : "memory");	\
	} else {							\
		__asm__ __volatile__("mtsp %0, %1" :			\
			/* no outputs */ : "r" (space), "i" (cr) :	\
				"memory");				\
	}								\
}

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
