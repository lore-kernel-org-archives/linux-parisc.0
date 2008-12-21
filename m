From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 23:52:10 +0100
Message-ID: <494EC89A.9000802@gmx.de>
References: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> I think the bug may be in flush_user_cache_page_non_current.  It hijacks
>> sr3 temporarily and I don't think cr8 is updated when this is done.  The
>> switch may need to be atomic.
> 
> The following might fix the protection ID bug.
> 
> --- cache.c.orig	2008-07-17 21:24:46.000000000 -0400
> +++ cache.c	2008-12-21 11:53:54.000000000 -0500
> @@ -312,14 +312,14 @@
>  
>  	/* make us current */
>  	mtctl(__pa(vma->vm_mm->pgd), 25);
> -	mtsp(vma->vm_mm->context, 3);
> +	load_context(vma->vm_mm->context);
>  
>  	flush_user_dcache_page(vmaddr);
>  	if(vma->vm_flags & VM_EXEC)
>  		flush_user_icache_page(vmaddr);
>  
>  	/* put the old current process back */
> -	mtsp(space, 3);
> +	load_context(space);

I came to the similar conclusion and tried exactly this patch earlier
today. It didn't fixed the problem (although I had the feeling that the
bug didn't appeared as often then).

Helge

