From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: drivers/parisc/ccio-dma.c: Removed duplicated include
Date: Wed, 23 Jul 2008 12:11:06 -0600
Message-ID: <20080723181106.GA22601@colo.lackof.org>
References: <20080723222729.943A.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: Huang Weiyi <weiyi.huang@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080723222729.943A.WEIYI.HUANG@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 23, 2008 at 10:45:11PM +0800, Huang Weiyi wrote:
> Removed duplicated include file <linux/proc_fs.h> in 
> drivers/parisc/ccio-dma.c.
> 
> Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

Thanks!
Acked-by: Grant Grundler <grundler@parisc-linux.org>

grant

> 
> diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
> index b30e38f..fc1dd6d 100644
> --- a/drivers/parisc/ccio-dma.c
> +++ b/drivers/parisc/ccio-dma.c
> @@ -77,7 +77,6 @@
>  #undef CCIO_MAP_STATS
>  #endif
> 
> -#include <linux/proc_fs.h>
>  #include <asm/runway.h>                /* for proc_runway_root */
> 
>  #ifdef DEBUG_CCIO_INIT
> 
