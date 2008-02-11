From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH?][arch/parisc/kernel/pci-dma.c]
	pcxl_dma_ops.alloc_noncoherent
Date: Mon, 11 Feb 2008 13:58:34 -0500
Message-ID: <20080211185834.GB4516@phobos.i.cabal.ca>
References: <200802111708.m1BH8q3p008073@hiauly1.hia.nrc.ca> <47B09A4A.3030907@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James.Bottomley@HansenPartnership.com, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Roel Kluin <12o3l@tiscali.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47B09A4A.3030907@tiscali.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 11, 2008 at 07:56:10PM +0100, Roel Kluin wrote:
> +/*
> + * dma_alloc_noncoherent is a fallback for boxes PA7200 and below which
> + * cannot allocate coherent memory.
> + */
>  static void *pa11_dma_alloc_noncoherent(struct device *dev, size_t size,
>  					  dma_addr_t *dma_handle, gfp_t flag)
>  {

Why? This is located below pcxl_dma_ops so its obviously only relevant
for pcx.

> @@ -586,6 +590,10 @@ static void pa11_dma_free_noncoherent(struct device *dev, size_t size,
>  	return;
>  }
>  
> +/*
> + * PCXL allocates coherent memory even for dma_alloc_noncoherent() due to the
> + * uncached trick for coherent memory.
> + */

This isn't correct either.

>  struct hppa_dma_ops pcx_dma_ops = {
>  	.dma_supported =	pa11_dma_supported,
>  	.alloc_consistent =	fail_alloc_consistent,
> 
