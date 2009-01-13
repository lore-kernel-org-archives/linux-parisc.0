From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] remove klist iterators
Date: Tue, 13 Jan 2009 21:54:15 +0100
Message-ID: <496CFF77.8090101@gmx.de>
References: <1231549026.3235.84.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1231549026.3235.84.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

James Bottomley wrote:
> commit 11c3b5c3e08f4d855cbef52883c266b9ab9df879
> Author: Greg Kroah-Hartman <gregkh@suse.de>
> Date:   Tue Dec 16 12:24:56 2008 -0800
> 
>     driver core: move klist_children into private structure
> 
> Broke our parisc build pretty badly because we touch the klists directly
> in three cases (AGP, SBA and GSC).  Although GregKH will revert this
> patch, there's no reason we should be using the iterators directly, we
> can just move to the standard device_for_each_child() API.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

I just tested this patch on my 715/64 and c3000 with 2.6.29-rc1. Everything OK.

Tested-by: Helge Deller <deller@gmx.de>



> ---
> 
> diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
> index db60539..699e342 100644
> --- a/drivers/char/agp/parisc-agp.c
> +++ b/drivers/char/agp/parisc-agp.c
> @@ -359,9 +359,16 @@ fail:
>  	return error;
>  }
>  
> -static struct device *next_device(struct klist_iter *i) {
> -	struct klist_node * n = klist_next(i);
> -	return n ? container_of(n, struct device, knode_parent) : NULL;
> +static int
> +find_quicksilver(struct device *dev, void *data)
> +{
> +	struct parisc_device **lba = data;
> +	struct parisc_device *padev = to_parisc_device(dev);
> +
> +	if (IS_QUICKSILVER(padev))
> +		*lba = padev;
> +
> +	return 0;
>  }
>  
>  static int
> @@ -372,8 +379,6 @@ parisc_agp_init(void)
>  	int err = -1;
>  	struct parisc_device *sba = NULL, *lba = NULL;
>  	struct lba_device *lbadev = NULL;
> -	struct device *dev = NULL;
> -	struct klist_iter i;
>  
>  	if (!sba_list)
>  		goto out;
> @@ -386,13 +391,7 @@ parisc_agp_init(void)
>  	}
>  
>  	/* Now search our Pluto for our precious AGP device... */
> -	klist_iter_init(&sba->dev.klist_children, &i);
> -	while ((dev = next_device(&i))) {
> -		struct parisc_device *padev = to_parisc_device(dev);
> -		if (IS_QUICKSILVER(padev))
> -			lba = padev;
> -	}
> -	klist_iter_exit(&i);
> +	device_for_each_child(&sba->dev, &lba, find_quicksilver);
>  
>  	if (!lba) {
>  		printk(KERN_INFO DRVPFX "No AGP devices found.\n");
> diff --git a/drivers/parisc/gsc.c b/drivers/parisc/gsc.c
> index e76db9e..ea8f600 100644
> --- a/drivers/parisc/gsc.c
> +++ b/drivers/parisc/gsc.c
> @@ -186,29 +186,34 @@ void gsc_asic_assign_irq(struct gsc_asic *asic, int local_irq, int *irqp)
>  	*irqp = irq;
>  }
>  
> -static struct device *next_device(struct klist_iter *i)
> +struct gsc_fixup_struct {
> +	void (*choose_irq)(struct parisc_device *, void *);
> +	void *ctrl;
> +};
> +
> +static int gsc_fixup_irqs_callback(struct device *dev, void *data)
>  {
> -	struct klist_node * n = klist_next(i);
> -	return n ? container_of(n, struct device, knode_parent) : NULL;
> +	struct parisc_device *padev = to_parisc_device(dev);
> +	struct gsc_fixup_struct *gf = data;
> +
> +	/* work-around for 715/64 and others which have parent 
> +	   at path [5] and children at path [5/0/x] */
> +	if (padev->id.hw_type == HPHW_FAULTY)
> +		gsc_fixup_irqs(padev, gf->ctrl, gf->choose_irq);
> +	gf->choose_irq(padev, gf->ctrl);
> +
> +	return 0;
>  }
>  
>  void gsc_fixup_irqs(struct parisc_device *parent, void *ctrl,
>  			void (*choose_irq)(struct parisc_device *, void *))
>  {
> -	struct device *dev;
> -	struct klist_iter i;
> -
> -	klist_iter_init(&parent->dev.klist_children, &i);
> -	while ((dev = next_device(&i))) {
> -		struct parisc_device *padev = to_parisc_device(dev);
> -
> -		/* work-around for 715/64 and others which have parent 
> -		   at path [5] and children at path [5/0/x] */
> -		if (padev->id.hw_type == HPHW_FAULTY)
> -			return gsc_fixup_irqs(padev, ctrl, choose_irq);
> -		choose_irq(padev, ctrl);
> -	}
> -	klist_iter_exit(&i);
> +	struct gsc_fixup_struct data = {
> +		.choose_irq	= choose_irq,
> +		.ctrl		= ctrl,
> +	};
> +
> +	device_for_each_child(&parent->dev, &data, gsc_fixup_irqs_callback);
>  }
>  
>  int gsc_common_setup(struct parisc_device *parent, struct gsc_asic *gsc_asic)
> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> index 3fac8f8..1f5ebc2 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -1206,31 +1206,49 @@ sba_alloc_pdir(unsigned int pdir_size)
>  	return (void *) pdir_base;
>  }
>  
> -static struct device *next_device(struct klist_iter *i)
> +struct ibase_data_struct {
> +	struct ioc *ioc;
> +	int ioc_num;
> +};
> +
> +static int setup_ibase_imask_callback(struct device *dev, void *data)
>  {
> -        struct klist_node * n = klist_next(i);
> -        return n ? container_of(n, struct device, knode_parent) : NULL;
> +	/* lba_set_iregs() is in drivers/parisc/lba_pci.c */
> +        extern void lba_set_iregs(struct parisc_device *, u32, u32);
> +	struct parisc_device *lba = to_parisc_device(dev);
> +	struct ibase_data_struct *ibd = data;
> +	int rope_num = (lba->hpa.start >> 13) & 0xf;
> +	if (rope_num >> 3 == ibd->ioc_num)
> +		lba_set_iregs(lba, ibd->ioc->ibase, ibd->ioc->imask);
> +	return 0;
>  }
>  
>  /* setup Mercury or Elroy IBASE/IMASK registers. */
>  static void 
>  setup_ibase_imask(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
>  {
> -	/* lba_set_iregs() is in drivers/parisc/lba_pci.c */
> -        extern void lba_set_iregs(struct parisc_device *, u32, u32);
> -	struct device *dev;
> -	struct klist_iter i;
> -
> -	klist_iter_init(&sba->dev.klist_children, &i);
> -	while ((dev = next_device(&i))) {
> -		struct parisc_device *lba = to_parisc_device(dev);
> -		int rope_num = (lba->hpa.start >> 13) & 0xf;
> -		if (rope_num >> 3 == ioc_num)
> -			lba_set_iregs(lba, ioc->ibase, ioc->imask);
> -	}
> -	klist_iter_exit(&i);
> +	struct ibase_data_struct ibase_data = {
> +		.ioc		= ioc,
> +		.ioc_num	= ioc_num,
> +	};
> +
> +	device_for_each_child(&sba->dev, &ibase_data,
> +			      setup_ibase_imask_callback);
>  }
>  
> +#ifdef SBA_AGP_SUPPORT
> +static int
> +sba_ioc_find_quicksilver(struct device *dev, void *data)
> +{
> +	int *agp_found = data;
> +	struct parisc_device *lba = to_parisc_device(dev);
> +
> +	if (IS_QUICKSILVER(lba))
> +		*agp_found = 1;
> +	return 0;
> +}
> +#endif
> +
>  static void
>  sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
>  {
> @@ -1332,9 +1350,6 @@ sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
>  	WRITE_REG(ioc->ibase | 31, ioc->ioc_hpa + IOC_PCOM);
>  
>  #ifdef SBA_AGP_SUPPORT
> -{
> -	struct klist_iter i;
> -	struct device *dev = NULL;
>  
>  	/*
>  	** If an AGP device is present, only use half of the IOV space
> @@ -1344,13 +1359,7 @@ sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
>  	** We program the next pdir index after we stop w/ a key for
>  	** the GART code to handshake on.
>  	*/
> -	klist_iter_init(&sba->dev.klist_children, &i);
> -	while ((dev = next_device(&i))) {
> -		struct parisc_device *lba = to_parisc_device(dev);
> -		if (IS_QUICKSILVER(lba))
> -			agp_found = 1;
> -	}
> -	klist_iter_exit(&i);
> +	device_for_each_child(&sba->dev, &agp_found, sba_ioc_find_quicksilver);
>  
>  	if (agp_found && sba_reserve_agpgart) {
>  		printk(KERN_INFO "%s: reserving %dMb of IOVA space for agpgart\n",
> 
> 

