From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: parisc: struct device - replace bus_id with dev_name(),
	dev_set_name()
Date: Sun, 25 Jan 2009 21:55:23 -0700
Message-ID: <20090126045523.GB4376@colo.lackof.org>
References: <1232923996.2924.17.camel@nga>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	gregkh <gregkh@suse.de>
To: Kay Sievers <kay.sievers@vrfy.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1232923996.2924.17.camel@nga>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 25, 2009 at 11:53:16PM +0100, Kay Sievers wrote:
> From: Kay Sievers <kay.sievers@vrfy.org>
> Subject: parisc: struct device - replace bus_id with dev_name(), dev_set_name()

In general, no objection. Just one nit below.

Otherwise, please add:
Reviewed-by: Grant Grundler <grundler@parisc-linux.org>

> 
> Cc: kyle@mcmartin.ca
> Cc: matthew@wil.cx
> Cc: linux-parisc@vger.kernel.org
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
> ---
>  drivers/parisc/dino.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> --- a/drivers/parisc/dino.c
> +++ b/drivers/parisc/dino.c
> @@ -479,7 +479,7 @@ dino_card_setup(struct pci_bus *bus, voi
>  	res = &dino_dev->hba.lmmio_space;
>  	res->flags = IORESOURCE_MEM;
>  	size = scnprintf(name, sizeof(name), "Dino LMMIO (%s)", 
> -			 bus->bridge->bus_id);
> +			 dev_name(bus->bridge));
>  	res->name = kmalloc(size+1, GFP_KERNEL);
>  	if(res->name)
>  		strcpy((char *)res->name, name);
> @@ -493,7 +493,7 @@ dino_card_setup(struct pci_bus *bus, voi
>  		struct list_head *ln, *tmp_ln;
>  
>  		printk(KERN_ERR "Dino: cannot attach bus %s\n",
> -		       bus->bridge->bus_id);
> +		       dev_name(bus->bridge));

I think the "cannot attach bus" string needs to be changed to
"cannot attach dev" or whatever dev_name() is supposed to represent.
While the code in include/linux/device.h is using "bus_id",
the comments say:

static inline const char *dev_name(const struct device *dev)
{
        /* will be changed into kobject_name(&dev->kobj) in the near future */
        return dev->bus_id;
}

And that could mean anything.
The rest look fine.

thanks,
grant

>  		/* kill the bus, we can't do anything with it */
>  		list_for_each_safe(ln, tmp_ln, &bus->devices) {
>  			struct pci_dev *dev = pci_dev_b(ln);
> @@ -611,12 +611,12 @@ dino_fixup_bus(struct pci_bus *bus)
>  			}
>  					
>  			DBG("DEBUG %s assigning %d [0x%lx,0x%lx]\n",
> -			    bus->self->dev.bus_id, i,
> +			    dev_name(&bus->self->dev), i,
>  			    bus->self->resource[i].start,
>  			    bus->self->resource[i].end);
>  			pci_assign_resource(bus->self, i);
>  			DBG("DEBUG %s after assign %d [0x%lx,0x%lx]\n",
> -			    bus->self->dev.bus_id, i,
> +			    dev_name(&bus->self->dev), i,
>  			    bus->self->resource[i].start,
>  			    bus->self->resource[i].end);
>  		}
> @@ -1026,7 +1026,8 @@ static int __init dino_probe(struct pari
>  		dino_current_bus = bus->subordinate + 1;
>  		pci_bus_assign_resources(bus);
>  	} else {
> -		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n", dev->dev.bus_id, dino_current_bus);
> +		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n",
> +		       dev_name(&dev->dev), dino_current_bus);
>  		/* increment the bus number in case of duplicates */
>  		dino_current_bus++;
>  	}
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
