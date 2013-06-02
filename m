From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Fix cache coherency for copy/clear_user_page
 operations
Date: Sun, 02 Jun 2013 11:02:05 -0700
Message-ID: <1370196125.1977.26.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP5D57135C2483B5BA307F2979C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP5D57135C2483B5BA307F2979C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-06-02 at 12:09 -0400, John David Anglin wrote:
> As noted by James E.J. Bottomley, we need to purge the kernel TLB  
> entries used when copying/clearing
> to user pages on PA 2.0 systems that require cache coherency.   
> Otherwise, we generate inequivalent
> aliases and incorrect cache operation.

What I meant was we have to remove the tmpalias tlb entry at the end of
the tmpalias operation.  This means in the asm of pacache.S.  Like the
patch below (untested because all my boxes are currently in a shipping
container on the docks at Seattle).  


> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 65fb4cb..a16ede352 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -383,7 +383,7 @@ void clear_user_page(void *vto, unsigned long
> vaddr, struct page *page)
>  {
>         clear_page_asm(vto);
>         if (!parisc_requires_coherency())
> -               flush_kernel_dcache_page_asm(vto);
> +               flush_kernel_dcache_page_addr(vto);
>  }
>  EXPORT_SYMBOL(clear_user_page);
>  
> @@ -397,10 +397,10 @@ void copy_user_page(void *vto, void *vfrom,
> unsigned long vaddr,
>            the kernel mapping. */
>         preempt_disable();
>         flush_dcache_page_asm(__pa(vfrom), vaddr);
> -       preempt_enable();
>         copy_page_asm(vto, vfrom);
>         if (!parisc_requires_coherency())
> -               flush_kernel_dcache_page_asm(vto);
> +               flush_kernel_dcache_page_addr(vto);
> +       preempt_enable();
>  }
>  EXPORT_SYMBOL(copy_user_page);
> 
These two changes should be ineffective.  The only time
clear_user_page() and copy_user_page() are used is if the architecture
doesn't supply clear_user_highpage() and copy_user_highpage() along with
the necessary defines for highmem.h, which we do.

If we go back to the non highpage defines, we've effectively double
purged, because the kunmap_atomic will do the kernel tlb purge for us as
well.

James


