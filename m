From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] PARISC: fix wrong assumption about bus->self
Date: Fri, 30 Jan 2009 10:10:17 -0500
Message-ID: <20090130151017.GC28304@bombadil.infradead.org>
References: <20090129053055.GA11718@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090129053055.GA11718@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 28, 2009 at 10:30:55PM -0700, Grant Grundler wrote:
> Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com> posted a patch series
> to linux-pci to fix a wrong assumption about pci_bus->self==NULL for
> all PCI host bus controllers. While PARISC platforms to not behave
> this way, I prefer to have the code consistent across architectures.
> The following patch replaces pci_bus->self with pci_bus->parent when
> used as a test to check for "root bus controller".
> 
> Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
> ---
> Kyle, AFAIK, this isn't urgent for parisc and can wait for 2.6.30.
> Not unless you or jejb feel strongly it should go in at around the
> same time as the patches from Kenji-san go in.
> 

Looks fairly unlikely to introduce any issues, applied.

Thanks Grant.

cheers, Kyle

> diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
> index d539d9d..f79266c 100644
> --- a/drivers/parisc/dino.c
> +++ b/drivers/parisc/dino.c
> @@ -587,7 +587,7 @@ dino_fixup_bus(struct pci_bus *bus)
>  			bus->resource[i+1] = &res[i];
>  		}
>  
> -	} else if(bus->self) {
> +	} else if (bus->parent) {
>  		int i;
>  
>  		pci_read_bridge_bases(bus);
> diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
> index 0797659..1cdfdea 100644
> --- a/drivers/parisc/iosapic.c
> +++ b/drivers/parisc/iosapic.c
> @@ -487,7 +487,7 @@ iosapic_xlate_pin(struct iosapic_info *isi, struct pci_dev *pcidev)
>  	}
>  
>  	/* Check if pcidev behind a PPB */
> -	if (NULL != pcidev->bus->self) {
> +	if (pcidev->bus->parent) {
>  		/* Convert pcidev INTR_PIN into something we
>  		** can lookup in the IRT.
>  		*/
> @@ -523,10 +523,9 @@ iosapic_xlate_pin(struct iosapic_info *isi, struct pci_dev *pcidev)
>  #endif /* PCI_BRIDGE_FUNCS */
>  
>  		/*
> -		** Locate the host slot the PPB nearest the Host bus
> -		** adapter.
> -		*/
> -		while (NULL != p->parent->self)
> +		 * Locate the host slot of the PPB.
> +		 */
> +		while (p->parent->parent)
>  			p = p->parent;
>  
>  		intr_slot = PCI_SLOT(p->self->devfn);
> diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
> index d8233de..59fbbf1 100644
> --- a/drivers/parisc/lba_pci.c
> +++ b/drivers/parisc/lba_pci.c
> @@ -644,7 +644,7 @@ lba_fixup_bus(struct pci_bus *bus)
>  	** Properly Setup MMIO resources for this bus.
>  	** pci_alloc_primary_bus() mangles this.
>  	*/
> -	if (bus->self) {
> +	if (bus->parent) {
>  		int i;
>  		/* PCI-PCI Bridge */
>  		pci_read_bridge_bases(bus);
> @@ -802,7 +802,7 @@ lba_fixup_bus(struct pci_bus *bus)
>  ** Can't fixup here anyway....garr...
>  */
>  	if (fbb_enable) {
> -		if (bus->self) {
> +		if (bus->parent) {
>  			u8 control;
>  			/* enable on PPB */
>  			(void) pci_read_config_byte(bus->self, PCI_BRIDGE_CONTROL, &control);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
