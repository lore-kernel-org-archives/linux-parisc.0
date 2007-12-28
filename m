From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: iommu-helpers.h patch
Date: Fri, 28 Dec 2007 00:56:10 -0700
Message-ID: <20071228075610.GD17782@colo.lackof.org>
References: <476D1509.1070601@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <476D1509.1070601@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 22, 2007 at 01:45:45PM +0000, rubisher wrote:
> Hello *,
>
> This seems to be missed a while ago ;-)
>
> --- drivers-parisc-iommu-helpers.h-git20071218	2007-12-21 
> 19:02:38.000000000 +0000
> +++ drivers-parisc-iommu-helpers.h-git20071218.new	2007-12-22 
> 13:39:04.000000000 +0000
> @@ -29,7 +29,7 @@
>  		long size;
>
>  		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
> -			   (unsigned long)sg_dma_address(startsg), cnt,
> +			   (unsigned long)sg_dma_address(startsg), size,

Sorry - but this is wrong. "size" isn't initialized until later.
"cnt" was the thing I needed/wanted dumped.

cheers,
grant

>  			   sg_virt_addr(startsg), startsg->length
>  		);
> === <> ===
>
> Cheers,
> 	r.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
