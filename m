From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix cache flushing in kmap/kunmap API
 implementation for aio
Date: Tue, 03 Dec 2013 16:08:02 -0800
Message-ID: <1386115682.2166.125.camel@dabdike.int.hansenpartnership.com>
References: <20131201211832.GA15998@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131201211832.GA15998@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-12-01 at 22:18 +0100, Helge Deller wrote:
> This is now the next try to fix the aio bug in our kmap/kunmap
> implementation. It's basically stuff from 

I thought the implementation required us to move to coherency management
in the kmap API?, in which case ...

[...]
> -void kunmap_parisc(void *addr);
> -
>  static inline void *kmap(struct page *page)
>  {
>  	might_sleep();
> +	/* Flush dcache page on CPUs that require coherency. */
> +	if (parisc_requires_coherency())
> +		flush_dcache_page(page);
>  	return page_address(page);
>  }

We have to call flush_dcache_page() unconditionally here.  It's the API
that coheres all the user space mappings.  It has to be called somehow
before the kernel begins operating on the mapped address.

>  static inline void kunmap(struct page *page)
>  {
> -	kunmap_parisc(page_address(page));
> +	/* Always flush kernel dcache, even if CPU doesn't require conherency.
> +	 * Needed on CPUs < PA8800/PA8900 for AIO support. */
> +	flush_kernel_dcache_page_addr(page_address(page));
>  }
>  
>  static inline void *kmap_atomic(struct page *page)
>  {
>  	pagefault_disable();
> +	/* Flush dcache page on CPUs that require coherency. */
> +	if (parisc_requires_coherency())
> +		flush_dcache_page(page);
>  	return page_address(page);
>  }

And unconditionally here too.

And if we do that, I don't see that we need special code for the
pa88/8900 any more.

James


