From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC/PATCH 3/4] parisc: Provide default implementation for dma_{alloc,free}_attrs
Date: Sun, 28 Apr 2013 22:06:53 +0200
Message-ID: <517D815D.2070207@gmx.de>
References: <1366607407-3103-1-git-send-email-dhobsong@igel.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1366607407-3103-1-git-send-email-dhobsong@igel.co.jp>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/22/2013 07:10 AM, Damian Hobson-Garcia wrote:
> Most architectures that define CONFIG_HAVE_DMA, have implementations for
> both dma_alloc_attrs() and dma_free_attrs().  All achitectures that do
> not define CONFIG_HAVE_DMA also have both of these definitions provided by
> dma-mapping-broken.h.
> 
> Add default implementations for these functions on parisc.
> 
> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>

Thanks!
Queued up in the parisc tree for 3.10

Helge

> ---
>  arch/parisc/include/asm/dma-mapping.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/dma-mapping.h b/arch/parisc/include/asm/dma-mapping.h
> index 106b395..d0eae5f 100644
> --- a/arch/parisc/include/asm/dma-mapping.h
> +++ b/arch/parisc/include/asm/dma-mapping.h
> @@ -46,6 +46,9 @@ extern struct hppa_dma_ops pcx_dma_ops;
>  
>  extern struct hppa_dma_ops *hppa_dma_ops;
>  
> +#define dma_alloc_attrs(d, s, h, f, a) dma_alloc_coherent(d, s, h, f)
> +#define dma_free_attrs(d, s, h, f, a) dma_free_coherent(d, s, h, f)
> +
>  static inline void *
>  dma_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  		   gfp_t flag)
> 

