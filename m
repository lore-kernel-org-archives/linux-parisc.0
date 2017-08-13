From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: pci memory bar assignment fails with 64bit
 kernels on dino/cujo
Date: Sun, 13 Aug 2017 09:56:26 +0200
Message-ID: <49d641cb-78be-e1fc-9c72-c8deefee6177@gmx.de>
References: <20170812214418.DB60D50835D@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170812214418.DB60D50835D@solo.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thomas,

On 12.08.2017 23:36, Thomas Bogendoerfer wrote:
> For 64bit kernels the lmmio_space_offset of the host bridge window
> isn't set correctly on systems with dino/cujo PCI host bridges.
> This leads to not assigned memory bars and failing drivers, which
> need to use these bars.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Acked-by: Helge Deller <deller@gmx.de>

Very good finding!
Does it mean that your mach64 card will then generally not being
able to work on a 32bit kernel (due to PCI resource shortage) ?

Now, if we find the issue why the FireGL cards don't work accelerated
on the C8000 it would be great.

Helge

> ---
>  drivers/parisc/dino.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
> index 5c63b92..ed92c12 100644
> --- a/drivers/parisc/dino.c
> +++ b/drivers/parisc/dino.c
> @@ -956,7 +956,7 @@ static int __init dino_probe(struct parisc_device *dev)
>  
>  	dino_dev->hba.dev = dev;
>  	dino_dev->hba.base_addr = ioremap_nocache(hpa, 4096);
> -	dino_dev->hba.lmmio_space_offset = 0;	/* CPU addrs == bus addrs */
> +	dino_dev->hba.lmmio_space_offset = PCI_F_EXTEND;
>  	spin_lock_init(&dino_dev->dinosaur_pen);
>  	dino_dev->hba.iommu = ccio_get_iommu(dev);
>  
> 

