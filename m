From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: remove driver_data direct access of struct
	device
Date: Mon, 4 May 2009 17:33:49 -0400
Message-ID: <20090504213349.GD5468@bombadil.infradead.org>
References: <20090504201359.GA23098@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org, Greg KH <greg@kroah.com>
To: Greg Kroah-Hartman <gregkh@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090504201359.GA23098@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 04, 2009 at 01:13:59PM -0700, Greg Kroah-Hartman wrote:
> From: Greg Kroah-Hartman <gregkh@suse.de>
> 
> In the near future, the driver core is going to not allow direct access
> to the driver_data pointer in struct device.  Instead, the functions
> dev_get_drvdata() and dev_set_drvdata() should be used.  These functions
> have been around since the beginning, so are backwards compatible with
> all older kernel versions.
> 

Cool, applied and will be sent along tonight unless you'd rather merge
it yourself in which case:

Acked-by: Kyle McMartin <kyle@mcmartin.ca>

> Cc: linux-parisc@vger.kernel.org
> Cc: Helge Deller <deller@gmx.de>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> ---
>  drivers/parisc/eisa.c      |    2 +-
>  drivers/parisc/sba_iommu.c |    6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/drivers/parisc/eisa.c
> +++ b/drivers/parisc/eisa.c
> @@ -373,7 +373,7 @@ static int __init eisa_probe(struct pari
>  	if (result >= 0) {
>  		/* FIXME : Don't enumerate the bus twice. */
>  		eisa_dev.root.dev = &dev->dev;
> -		dev->dev.driver_data = &eisa_dev.root;
> +		dev_set_drvdata(&dev->dev, &eisa_dev.root);
>  		eisa_dev.root.bus_base_addr = 0;
>  		eisa_dev.root.res = &eisa_dev.hba.io_space;
>  		eisa_dev.root.slots = result;
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -2010,7 +2010,7 @@ void __init sba_init(void)
>  void * sba_get_iommu(struct parisc_device *pci_hba)
>  {
>  	struct parisc_device *sba_dev = parisc_parent(pci_hba);
> -	struct sba_device *sba = sba_dev->dev.driver_data;
> +	struct sba_device *sba = dev_get_drvdata(&sba_dev->dev);
>  	char t = sba_dev->id.hw_type;
>  	int iocnum = (pci_hba->hw_path >> 3);	/* rope # */
>  
> @@ -2031,7 +2031,7 @@ void * sba_get_iommu(struct parisc_devic
>  void sba_directed_lmmio(struct parisc_device *pci_hba, struct resource *r)
>  {
>  	struct parisc_device *sba_dev = parisc_parent(pci_hba);
> -	struct sba_device *sba = sba_dev->dev.driver_data;
> +	struct sba_device *sba = dev_get_drvdata(&sba_dev->dev);
>  	char t = sba_dev->id.hw_type;
>  	int i;
>  	int rope = (pci_hba->hw_path & (ROPES_PER_IOC-1));  /* rope # */
> @@ -2073,7 +2073,7 @@ void sba_directed_lmmio(struct parisc_de
>  void sba_distributed_lmmio(struct parisc_device *pci_hba, struct resource *r )
>  {
>  	struct parisc_device *sba_dev = parisc_parent(pci_hba);
> -	struct sba_device *sba = sba_dev->dev.driver_data;
> +	struct sba_device *sba = dev_get_drvdata(&sba_dev->dev);
>  	char t = sba_dev->id.hw_type;
>  	int base, size;
>  	int rope = (pci_hba->hw_path & (ROPES_PER_IOC-1));  /* rope # */
> 
