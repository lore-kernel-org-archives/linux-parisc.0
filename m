From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Mon, 04 Feb 2013 00:04:56 +0100
Message-ID: <510EED18.404@gmx.de>
References: <20130203225909.GA14573@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130203225909.GA14573@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Need to mention here:

Author of this patch series is:
Author: John David Anglin <dave.anglin@bell.net>

When I sent the mail the "Author" tag vanished in the mail header...

Helge

On 02/03/2013 11:59 PM, Helge Deller wrote:
> This is the first patch in a series of 4, with which the page cache flushing of
> parisc will gets fixed and enhanced. This even fixes the nasty "minifail" bug
> (http://wiki.parisc-linux.org/TestCases?highlight=%28minifail%29) which
> prevented parisc to stay an official debian port.  Basically the flush in
> copy_user_page together with the TLB patch from commit
> 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail bug. 
> 
> This patch still uses the TMPALIAS approach.  The new copy_user_page
> implementation calls flush_dcache_page_asm to flush the user dcache page
> (crucial for minifail fix) via a kernel TMPALIAS mapping.  After that, it just
> copies the page using the kernel mapping.  It does a final flush if needed.
> Generally it is hard to avoid doing some cache flushes using the kernel mapping
> (e.g., copy_to_user_page and copy_from_user_page).
> 
> This patch depends on a subsequent change to pacache.S implementing
> clear_page_asm and copy_page_asm.  These are optimized routines to clear and
> copy a page.  The calls in clear_user_page and copy_user_page could be replaced
> by calls to memset and memcpy, respectively.  I tested prefetch optimizations
> in clear_page_asm and copy_page_asm but didn't see any significant performance
> improvement on rp3440.  I'm not sure if these are routines are significantly
> faster than memset and/or memcpy, but they are there for further performance
> evaluation. 
> 
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> 
> diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
> index 4e0e7db..d9812d8 100644
> --- a/arch/parisc/include/asm/page.h
> +++ b/arch/parisc/include/asm/page.h
> @@ -21,15 +21,27 @@
>  #include <asm/types.h>
>  #include <asm/cache.h>
>  
> -#define clear_page(page)	memset((void *)(page), 0, PAGE_SIZE)
> -#define copy_page(to,from)      copy_user_page_asm((void *)(to), (void *)(from))
> +#define clear_page(page)	clear_page_asm((void *)(page))
> +#define copy_page(to, from)	copy_page_asm((void *)(to), (void *)(from))
>  
>  struct page;
>  
> -void copy_user_page_asm(void *to, void *from);
> +void clear_page_asm(void *page);
> +void copy_page_asm(void *to, void *from);
> +void clear_user_page(void *vto, unsigned long vaddr, struct page *pg);
>  void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
>  			   struct page *pg);
> -void clear_user_page(void *page, unsigned long vaddr, struct page *pg);
> +
> +/* #define CONFIG_PARISC_TMPALIAS */
> +
> +#ifdef CONFIG_PARISC_TMPALIAS
> +void clear_user_highpage(struct page *page, unsigned long vaddr);
> +#define clear_user_highpage clear_user_highpage
> +struct vm_area_struct;
> +void copy_user_highpage(struct page *to, struct page *from,
> +	unsigned long vaddr, struct vm_area_struct *vma);
> +#define __HAVE_ARCH_COPY_USER_HIGHPAGE
> +#endif
>  
>  /*
>   * These are used to make use of C type-checking..
> 
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index b89a85a..703ed48 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -329,17 +331,6 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
>  EXPORT_SYMBOL(flush_data_cache_local);
>  EXPORT_SYMBOL(flush_kernel_icache_range_asm);
>  
> -void clear_user_page_asm(void *page, unsigned long vaddr)
> -{
> -	unsigned long flags;
> -	/* This function is implemented in assembly in pacache.S */
> -	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
> -
> -	purge_tlb_start(flags);
> -	__clear_user_page_asm(page, vaddr);
> -	purge_tlb_end(flags);
> -}
> -
>  #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
>  int parisc_cache_flush_threshold __read_mostly = FLUSH_THRESHOLD;
>  
> @@ -373,20 +364,9 @@ void __init parisc_setup_cache_timing(void)
>  	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
>  }
>  
> -extern void purge_kernel_dcache_page(unsigned long);
> -extern void clear_user_page_asm(void *page, unsigned long vaddr);
> -
> -void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
> -{
> -	unsigned long flags;
> -
> -	purge_kernel_dcache_page((unsigned long)page);
> -	purge_tlb_start(flags);
> -	pdtlb_kernel(page);
> -	purge_tlb_end(flags);
> -	clear_user_page_asm(page, vaddr);
> -}
> -EXPORT_SYMBOL(clear_user_page);
> +extern void purge_kernel_dcache_page_asm(unsigned long);
> +extern void clear_user_page_asm(void *, unsigned long);
> +extern void copy_user_page_asm(void *, void *, unsigned long);
>  
>  void flush_kernel_dcache_page_addr(void *addr)
>  {
> @@ -399,11 +379,26 @@ void flush_kernel_dcache_page_addr(void *addr)
>  }
>  EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
>  
> +void clear_user_page(void *vto, unsigned long vaddr, struct page *page)
> +{
> +	clear_page_asm(vto);
> +	if (!parisc_requires_coherency())
> +		flush_kernel_dcache_page_asm(vto);
> +}
> +EXPORT_SYMBOL(clear_user_page);
> +
>  void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
> -		    struct page *pg)
> +	struct page *pg)
>  {
> -	/* no coherency needed (all in kmap/kunmap) */
> -	copy_user_page_asm(vto, vfrom);
> +	/* Copy using kernel mapping.  No coherency is needed
> +	   (all in kmap/kunmap) on machines that don't support
> +	   non-equivalent aliasing.  However, the `from' page
> +	   needs to be flushed before it can be accessed through
> +	   the kernel mapping. */
> +	preempt_disable();
> +	flush_dcache_page_asm(__pa(vfrom), vaddr);
> +	preempt_enable();
> +	copy_page_asm(vto, vfrom);
>  	if (!parisc_requires_coherency())
>  		flush_kernel_dcache_page_asm(vto);
>  }
> diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
> index ceec85d..6795dc6 100644
> --- a/arch/parisc/kernel/parisc_ksyms.c
> +++ b/arch/parisc/kernel/parisc_ksyms.c
> @@ -157,5 +157,6 @@ extern void _mcount(void);
>  EXPORT_SYMBOL(_mcount);
>  #endif
>  
> -/* from pacache.S -- needed for copy_page */
> -EXPORT_SYMBOL(copy_user_page_asm);
> +/* from pacache.S -- needed for clear/copy_page */
> +EXPORT_SYMBOL(clear_page_asm);
> +EXPORT_SYMBOL(copy_page_asm);
> 

