Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 384F14829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 11:59:31 -0700 (MST)
Subject: Re: [parisc-linux] [PATCH] highmem_io for the sym53c8xx_2 driver??
From: Ryan Bradetich <rbradetich@uswest.net>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021124024358.7D5B0482E@dsl2.external.hp.com>
References: <1038037106.14815.4.camel@beavis>  
	<20021124024358.7D5B0482E@dsl2.external.hp.com>
Content-Type: text/plain
Date: 25 Nov 2002 11:59:25 -0700
Message-Id: <1038250766.1385.2.camel@beavis>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Thanks Grant!

I will look look at this and try this out later this week after I get
back!

Nice catch.

- Ryan


On Sat, 2002-11-23 at 19:43, Grant Grundler wrote:
> Ryan Bradetich wrote:
> > I am not sure what the highmem_io flag does, but when it is enabled it
> > causes my C200 to HPMC.
> 
> yeah - ccio-dma.c isn't using sg_virt_address() to access to the virtual
> address of an SG list entry. It's defined in include/asm/scatterlist.h.
> See sba_iommu.c on how to use this correctly.
> 
> Attached diff is a first cut, untested. My advice is to rewrite the
> loop so sg_virt_address() result is saved once instead of referencing
> the macro 3 (or more) times in the main loop.
> 
> grant
> 
> 
> Index: ccio-dma.c
> ===================================================================
> RCS file: /var/cvs/linux/arch/parisc/kernel/ccio-dma.c,v
> retrieving revision 1.56
> diff -u -p -r1.56 ccio-dma.c
> --- ccio-dma.c	17 Nov 2002 20:44:11 -0000	1.56
> +++ ccio-dma.c	24 Nov 2002 02:42:09 -0000
> @@ -805,7 +805,7 @@ ccio_fill_pdir(struct ioc *ioc, struct s
>  
>  		DBG_RUN_SG(" %d : %08lx/%05x %p/%05x\n", nents,
>  			   (unsigned long)sg_dma_address(startsg), cnt,
> -			   startsg->address, startsg->length
> +			   sg_virt_address(startsg), startsg->length
>  		);
>  
>  		/*
> @@ -825,7 +825,7 @@ ccio_fill_pdir(struct ioc *ioc, struct s
>  		** Look for a VCONTIG chunk
>  		*/
>  		if (cnt) {
> -			unsigned long vaddr = (unsigned long)startsg->address;
> +			unsigned long vaddr = (unsigned long)sg_virt_address(startsg);
>  			ASSERT(pdirp);
>  
>  			/* Since multiple Vcontig blocks could make up
> @@ -878,8 +878,8 @@ ccio_coalesce_chunks(struct ioc *ioc, st
>  		*/
>  		dma_sg = vcontig_sg = startsg;
>  		dma_len = vcontig_len = vcontig_end = startsg->length;
> -		vcontig_end += (unsigned long) startsg->address;
> -		dma_offset = (unsigned long) startsg->address & ~IOVP_MASK;
> +		vcontig_end += (unsigned long) sg_virt_address(startsg);
> +		dma_offset = (unsigned long) sg_virt_address(startsg) & ~IOVP_MASK;
>  
>  		/* PARANOID: clear entries */
>  		sg_dma_address(startsg) = 0;
> @@ -893,7 +893,7 @@ ccio_coalesce_chunks(struct ioc *ioc, st
>  			unsigned long startsg_end;
>  
>  			startsg++;
> -			startsg_end = (unsigned long)startsg->address + 
> +			startsg_end = (unsigned long)sg_virt_address(startsg) + 
>  				startsg->length;
>  
>  			/* PARANOID: clear entries */
> @@ -912,7 +912,7 @@ ccio_coalesce_chunks(struct ioc *ioc, st
>  			/*
>  			** Append the next transaction?
>  			*/
> -			if(vcontig_end == (unsigned long) startsg->address) {
> +			if(vcontig_end == (unsigned long) sg_virt_address(startsg)) {
>  				vcontig_len += startsg->length;
>  				vcontig_end += startsg->length;
>  				dma_len     += startsg->length;
> @@ -981,7 +981,8 @@ ccio_map_sg(struct pci_dev *dev, struct 
>  
>  	/* Fast path single entry scatterlists. */
>  	if(nents == 1) {
> -		sg_dma_address(sglist)= ccio_map_single(dev, sglist->address,
> +		sg_dma_address(sglist)= ccio_map_single(dev,
> +							sg_virt_address(sglist),
>  							sglist->length, 
>  							direction);
>  		sg_dma_len(sglist)= sglist->length;
> @@ -1043,7 +1044,7 @@ ccio_unmap_sg(struct pci_dev *dev, struc
>  	ioc = GET_IOC(dev);
>  
>  	DBG_RUN_SG("%s() START %d entries,  %p,%x\n",
> -		__FUNCTION__, nents, sglist->address, sglist->length);
> +		__FUNCTION__, nents, sg_virt_address(sglist), sglist->length);
>  
>  #ifdef CONFIG_PROC_FS
>  	ioc->usg_calls++;
> 
