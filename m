From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [patch 1/3] parisc/lib/: make code static
Date: Mon, 1 Dec 2008 22:45:42 -0700
Message-ID: <20081202054542.GC32569@colo.lackof.org>
References: <200812012228.mB1MSF7t017234@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org, bunk@kernel.org,
	grundler@parisc-linux.org, matthew@wil.cx
To: akpm@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812012228.mB1MSF7t017234@imap1.linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 01, 2008 at 02:28:15PM -0800, akpm@linux-foundation.org wrote:
> From: Adrian Bunk <bunk@kernel.org>
> 
> Make the following needlessly global code static:
> 
> - iomap.c: struct iomap_ops[]
> - memcpy.c: pa_memcpy()
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Matthew Wilcox <matthew@wil.cx>
> Cc: Grant Grundler <grundler@parisc-linux.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: Grant Grundler <grundler@parisc-linux.org>

thanks,
grant

> ---
> 
>  arch/parisc/lib/iomap.c  |    2 +-
>  arch/parisc/lib/memcpy.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff -puN arch/parisc/lib/iomap.c~parisc-lib-make-code-static arch/parisc/lib/iomap.c
> --- a/arch/parisc/lib/iomap.c~parisc-lib-make-code-static
> +++ a/arch/parisc/lib/iomap.c
> @@ -261,7 +261,7 @@ static const struct iomap_ops iomem_ops 
>  	iomem_write32r,
>  };
>  
> -const struct iomap_ops *iomap_ops[8] = {
> +static const struct iomap_ops *iomap_ops[8] = {
>  	[0] = &ioport_ops,
>  	[7] = &iomem_ops
>  };
> diff -puN arch/parisc/lib/memcpy.c~parisc-lib-make-code-static arch/parisc/lib/memcpy.c
> --- a/arch/parisc/lib/memcpy.c~parisc-lib-make-code-static
> +++ a/arch/parisc/lib/memcpy.c
> @@ -275,7 +275,7 @@ handle_store_error:
>  
>  
>  /* Returns 0 for success, otherwise, returns number of bytes not transferred. */
> -unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
> +static unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
>  {
>  	register unsigned long src, dst, t1, t2, t3;
>  	register unsigned char *pcs, *pcd;
> _
