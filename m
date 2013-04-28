From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: remove the second argument of kmap_atomic
Date: Sun, 28 Apr 2013 21:56:39 +0200
Message-ID: <517D7EF7.1080702@gmx.de>
References: <517BAB83.2060308@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Zhao Hongjiang <zhaohongjiang@huawei.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <517BAB83.2060308@huawei.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/27/2013 12:42 PM, Zhao Hongjiang wrote:
> kmap_atomic allows only one argument now, just move the second.
> 
> Signed-off-by: Zhao Hongjiang <zhaohongjiang@huawei.com>

Thanks!
Queued up in parisc tree for 3.10.

Helge


> ---
>  arch/parisc/kernel/cache.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 4b12890..6df734a 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -609,7 +609,7 @@ void clear_user_highpage(struct page *page, unsigned long vaddr)
>  	/* Clear using TMPALIAS region.  The page doesn't need to
>  	   be flushed but the kernel mapping needs to be purged.  */
>  
> -	vto = kmap_atomic(page, KM_USER0);
> +	vto = kmap_atomic(page);
>  
>  	/* The PA-RISC 2.0 Architecture book states on page F-6:
>  	   "Before a write-capable translation is enabled, *all*
> @@ -644,8 +644,8 @@ void copy_user_highpage(struct page *to, struct page *from,
>  	   the `to' page must be flushed in copy_user_page_asm since
>  	   it can be used to bring in executable code.  */
>  
> -	vfrom = kmap_atomic(from, KM_USER0);
> -	vto = kmap_atomic(to, KM_USER1);
> +	vfrom = kmap_atomic(from);
> +	vto = kmap_atomic(to);
>  
>  	purge_kernel_dcache_page_asm((unsigned long)vto);
>  	purge_tlb_start(flags);
> 

