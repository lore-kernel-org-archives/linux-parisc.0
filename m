Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70085482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 01:28:54 -0600 (MDT)
Message-Id: <200106030721.BAA02755@puffin.external.hp.com>
To: Clement MOYROUD <moyroudc@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Patch for dino serial port on B-class workstations 
In-Reply-To: Your message of "Thu, 31 May 2001 17:53:06 +0200."
             <3B1668E2.3040003@esiee.fr>
Date: Sun, 03 Jun 2001 01:21:31 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Clement MOYROUD wrote:
> Hi all !
> 
> I have made a patch for dino. It's a bit ugly, but before going on with 
> a rewrite of the dino driver, I would like to have some feedback.

Clement! This is great!

Could you explain why you think yuo need to rewrite the dino driver?
This is basically how I expected it to work.

>  So 
> feel free to apply it on your kernel tree and give me some remarks about it.

I've neither applied nor tested it.

> diff -Nru linux.old/drivers/gsc/dino.c linux/drivers/gsc/dino.c
> --- linux.old/drivers/gsc/dino.c	Thu May 31 16:56:20 2001
> +++ linux/drivers/gsc/dino.c	Thu May 31 16:55:07 2001
> @@ -66,6 +66,7 @@
>  #include <asm/irq.h>		/* for "gsc" irq functions */
>  #include <asm/gsc.h>
>  
> +#include "busdevice.h"
>  
>  #undef DINO_DEBUG
>  
> @@ -542,6 +543,14 @@
>  	}
>  }
>  
> +/* Here is where the dino's serial port gets its irq on B-class workstations
>    */
> +
> +static int
> +dino_find_irq(struct busdevice *dino_dev, struct hp_device *dev)
> +{

Some upper portion of the address bits are already validated
but the code in bus_device.c.  Need to valid some of the lower
address bits here.

Want to make sure it's really the serial device that we want
to talk to and not the PS/2 port or "fire extinguisher" (only
used on 743 or Hitachi box, I forgot).


> +	return 10;
> +}
> +
>  static void __init
>  dino_bios_init(void)
>  {
> @@ -804,18 +813,33 @@
>  }
>  
>  static int __init
> -dino_common_init(struct dino_device *dino_dev)
> +dino_common_init(struct hp_device *d, struct dino_device *dino_dev)
>  {
>  	int status;
>  	u32 eim;
>  	struct gsc_irq gsc_irq;
>  	struct resource *res;
>  
> +	struct busdevice *dino;

Please call this dino_busdev or something like that to differentiate
it from the other "dino" data structures.

> +	int ret;
> +
>  	pcibios_register_hba((struct pci_hba_data *) dino_dev);
>  
>  	pci_bios = &dino_bios_ops;   /* used by pci_scan_bus() */
>  	pci_port = &dino_port_ops;
>  
> +
> +        /* Needed for the serial port to work. Quite ugly for now */
> +
> +	dino = kmalloc(sizeof(struct busdevice), GFP_KERNEL);
> +	if(!dino)
> +		return -ENOMEM;
> +	
> +	dino->name = "Dino";
> +	dino->hpa = d->hpa;
> +	dino->find_irq = dino_find_irq;

I don't think this in an ugly hack.
Overall, this is how I expected it to work.
Might not even need to fill in the rest of the functions
in the bus_device jump table.

> +	
> +
>  	/*
>  	** Note: SMP systems can make use of IRR1/IAR1 registers
>  	**   But it won't buy much performance except in very

offhand, the rest looks ok.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
