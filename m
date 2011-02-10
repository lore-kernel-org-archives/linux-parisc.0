From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Thu, 10 Feb 2011 12:00:32 -0500 (EST)
Message-ID: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
References: <1297353833.4933.50.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1297353833.4933.50.camel@mulgrave.site> from "James Bottomley" at Feb 10, 2011 10:03:53 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Can we assume these addresses are some type of artifact and just apply
> the patch below anyway?  On current parisc, it's what we do (we don't
> flush anything beyond the first mapping).

I like the idea but using the first mapping is not correct.  All pages
get flushed during core dumps and there is almost always inequivalent
aliases for the page containing the boundary between text and data.
The text map usually comes first.

I don't think the addresses are an artifact.  However, I don't know
how they occur.  I saw another bunch in the C testsuite last night.
There are thousands of tests, so it's hard to know which test triggered
the messages.

I'm now thinking that the dynamic loader sometimes does multiple maps
of libc.  It's using MAP_FIXED.  The current code changes old_addr
everytime an inequivalent alias occurs.  This makes it a bit difficult
to see what's happening.

The usual case would be just one address to flush.  Would it be too
much overhead to do a prescan to determine if there are inequivalent
aliases before doing any flushes?  I think I'll try this.

Dave

> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 3f11331..c60cc42 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -276,10 +276,13 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
>  void flush_dcache_page(struct page *page)
>  {
>  	struct address_space *mapping = page_mapping(page);
> -	struct vm_area_struct *mpnt;
> +	struct vm_area_struct *mpnt = NULL;
>  	struct prio_tree_iter iter;
>  	unsigned long offset;
> -	unsigned long addr, old_addr = 0;
> +	unsigned long addr = 0;
> +#ifdef DEBUG_ALIASES
> +	unsigned long old_addr = 0;
> +#endif
>  	pgoff_t pgoff;
>  
>  	if (mapping && !mapping_mapped(mapping)) {
> @@ -304,14 +307,25 @@ void flush_dcache_page(struct page *page)
>  		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>  		addr = mpnt->vm_start + offset;
>  
> +#ifdef DEBUG_ALIASES
>  		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
>  			__flush_cache_page(mpnt, addr, page_to_phys(page));
>  			if (old_addr)
>  				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
>  			old_addr = addr;
>  		}
> +#else
> +		break;
> +#endif
>  	}
>  	flush_dcache_mmap_unlock(mapping);
> +#ifndef DEBUG_ALIASES
> +	/* since we have only one page, flush outside the lock.  If the loop
> +	 * didn't happen (no mappings), mpnt will be NULL */
> +	if (mpnt)
> +		__flush_cache_page(mpnt, addr, page_to_phys(page));
> +#endif
> +
>  }
>  EXPORT_SYMBOL(flush_dcache_page);
>  
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
