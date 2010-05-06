From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] Parisc: Check kmalloc return value before use the
	buffer in ccio-dma.c
Date: Thu, 6 May 2010 00:03:31 -0400
Message-ID: <20100506040331.GC4902@bombadil.infradead.org>
References: <20100506024208.GB15956@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org
To: wzt.wzt@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100506024208.GB15956@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 06, 2010 at 10:42:08AM +0800, wzt.wzt@gmail.com wrote:
> +	if (!name) {
> +		printk(KERN_ERR "%s() failed to get enough memory\n", __func__);
> +		return ;
> +	}
> +
>  	snprintf(name, 14, "GSC Bus [%d/]", ioc->hw_path);

This code can't fail, since the failure case won't be handled by the
probe function, and will continue along without properly initializing
the resources and will fail later. While we could add proper error
handling, if these functions are called, the ccio IOMMU exists on the
machine, and without it, we can't do any DMA (amongst other things.)
So in that case, if this kmalloc fails (which it really shouldn't...)
we're pretty much screwed.

We can change it to GFP_ATOMIC|__GFP_NOFAIL so it will retry infinitely,
or we can panic in the error path with a nice error message so the users
knows why his machine isn't going to work.

I suggest the latter since you'll have the test to squelch gcc warnings
and such.

regards, Kyle

