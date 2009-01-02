From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 08:49:23 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net>
 <20090102115547.GB3027@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	sam@ravnborg.org, dave@hiauly1.hia.nrc.ca
To: Ingo Molnar <mingo@elte.hu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102115547.GB3027@elte.hu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Fri, 2 Jan 2009, Ingo Molnar wrote:
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -36,12 +36,25 @@ extern void __chk_io_ptr(const volatile void __iomem *);
>  
>  #ifdef __KERNEL__
>  
> -#if __GNUC__ >= 4
> +/*
> + * GCC 4.1.0 and 4.1.1 has a bug that can miscompile __weak symbols,
> + * by inlining __weak functions into same-file call sites - breaking the
> + * kernel if the __weak symbol is overriden later on.
> + *
> + * We have not found a clean way to work around this bug on the source
> + * code level, so we do not allow these compilers (which are quite
> + * rare these days, have other bugs and are superceded by the 4.1.2
> + * bugfix release anyway):
> + */
> +#define gcc41_inlining_bug \
> +	(__GNUC__ == 4 && __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1)
> +
> +#if __GNUC__ >= 4 && !gcc41_inlining_bug
>  # include <linux/compiler-gcc4.h>

I think this is wrong.

Just move the check into <linux/compiler-gcc4.h>

It makes no sense to do stuff that is specific to gcc4 in the general gcc 
header file. It seems you did this just in order to re-use a (bad) generic 
error case. 

			Linus
