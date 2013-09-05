From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Export flush_cache_page() (needed by lustre)
Date: Thu, 05 Sep 2013 09:01:59 -0700
Message-ID: <1378396919.2142.5.camel@dabdike.int.hansenpartnership.com>
References: <1378373595-29471-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1378373595-29471-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2013-09-05 at 11:33 +0200, Geert Uytterhoeven wrote:
> ERROR: "flush_cache_page" [drivers/staging/lustre/lustre/libcfs/libcfs.ko] undefined!
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/parisc/kernel/cache.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index c035673..b521c0a 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -602,6 +602,7 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
>  		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
>  	}
>  }
> +EXPORT_SYMBOL_GPL(flush_cache_page);

This is an internal API: no architecture exports this.  Whoever is
trying to use it needs to use the correct API, so this is the wrong
patch.

James


