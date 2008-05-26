From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [patch] ccio: use the same statistics defines as sba_iommu
Date: Mon, 26 May 2008 01:11:33 -0600
Message-ID: <20080526071133.GC20871@colo.lackof.org>
References: <20080526055955.GA493@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080526055955.GA493@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 26, 2008 at 01:59:55AM -0400, Kyle McMartin wrote:
> Looks like the difference was hysterical raisins?

I don't remember.
But we can use "COLLECT_STATS" just as well.
Please push this patch if it makes your life easier.

Acked-by: Grant Grundler <grundler@parisc-linux.org>

> Also, was it
> intentional that CCIO_SEARCH_TIME has been on for all this time?

No. I'm pretty sure we want CCIO_SEARCH_TIME disabled.
I disabled this for SBA driver years ago.

thanks,
grant

> index b30e38f..dcc1e99 100644
> --- a/drivers/parisc/ccio-dma.c
> +++ b/drivers/parisc/ccio-dma.c
> @@ -66,15 +66,8 @@
>  #undef DEBUG_CCIO_RUN_SG
>  
>  #ifdef CONFIG_PROC_FS
> -/*
> - * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
> - * impacts performance though - ditch it if you don't use it.
> - */
> -#define CCIO_SEARCH_TIME
> -#undef CCIO_MAP_STATS
> -#else
> -#undef CCIO_SEARCH_TIME
> -#undef CCIO_MAP_STATS
> +/* depends on proc fs support. But costs CPU performance. */
> +#undef CCIO_COLLECT_STATS
>  #endif
>  
>  #include <linux/proc_fs.h>
> @@ -239,12 +232,10 @@ struct ioc {
>  	u32 res_size;		    	/* size of resource map in bytes */
>  	spinlock_t res_lock;
>  
> -#ifdef CCIO_SEARCH_TIME
> +#ifdef CCIO_COLLECT_STATS
>  #define CCIO_SEARCH_SAMPLE 0x100
>  	unsigned long avg_search[CCIO_SEARCH_SAMPLE];
>  	unsigned long avg_idx;		  /* current index into avg_search */
> -#endif
> -#ifdef CCIO_MAP_STATS
>  	unsigned long used_pages;
>  	unsigned long msingle_calls;
>  	unsigned long msingle_pages;
> @@ -351,7 +342,7 @@ ccio_alloc_range(struct ioc *ioc, struct device *dev, size_t size)
>  	unsigned int pages_needed = size >> IOVP_SHIFT;
>  	unsigned int res_idx;
>  	unsigned long boundary_size;
> -#ifdef CCIO_SEARCH_TIME
> +#ifdef CCIO_COLLECT_STATS
>  	unsigned long cr_start = mfctl(16);
>  #endif
>  	
> @@ -406,7 +397,7 @@ resource_found:
>  	DBG_RES("%s() res_idx %d res_hint: %d\n",
>  		__func__, res_idx, ioc->res_hint);
>  
> -#ifdef CCIO_SEARCH_TIME
> +#ifdef CCIO_COLLECT_STATS
>  	{
>  		unsigned long cr_end = mfctl(16);
>  		unsigned long tmp = cr_end - cr_start;
> @@ -416,7 +407,7 @@ resource_found:
>  	ioc->avg_search[ioc->avg_idx++] = cr_start;
>  	ioc->avg_idx &= CCIO_SEARCH_SAMPLE - 1;
>  #endif
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->used_pages += pages_needed;
>  #endif
>  	/* 
> @@ -452,7 +443,7 @@ ccio_free_range(struct ioc *ioc, dma_addr_t iova, unsigned long pages_mapped)
>  	DBG_RES("%s():  res_idx: %d pages_mapped %d\n", 
>  		__func__, res_idx, pages_mapped);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->used_pages -= pages_mapped;
>  #endif
>  
> @@ -764,7 +755,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
>  	size = ALIGN(size + offset, IOVP_SIZE);
>  	spin_lock_irqsave(&ioc->res_lock, flags);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->msingle_calls++;
>  	ioc->msingle_pages += size >> IOVP_SHIFT;
>  #endif
> @@ -828,7 +819,7 @@ ccio_unmap_single(struct device *dev, dma_addr_t iova, size_t size,
>  
>  	spin_lock_irqsave(&ioc->res_lock, flags);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->usingle_calls++;
>  	ioc->usingle_pages += size >> IOVP_SHIFT;
>  #endif
> @@ -894,7 +885,7 @@ ccio_free_consistent(struct device *dev, size_t size, void *cpu_addr,
>  */
>  #define PIDE_FLAG 0x80000000UL
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  #define IOMMU_MAP_STATS
>  #endif
>  #include "iommu-helpers.h"
> @@ -938,7 +929,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
>  	
>  	spin_lock_irqsave(&ioc->res_lock, flags);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->msg_calls++;
>  #endif
>  
> @@ -997,13 +988,13 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
>  	DBG_RUN_SG("%s() START %d entries,  %08lx,%x\n",
>  		__func__, nents, sg_virt_addr(sglist), sglist->length);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  	ioc->usg_calls++;
>  #endif
>  
>  	while(sg_dma_len(sglist) && nents--) {
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
>  #endif
>  		ccio_unmap_single(dev, sg_dma_address(sglist),
> @@ -1048,7 +1039,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
>  		len += seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
>  			       total_pages * 8, total_pages);
>  
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  		len += seq_printf(m, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
>  				  total_pages - ioc->used_pages, ioc->used_pages,
>  				  (int)(ioc->used_pages * 100 / total_pages));
> @@ -1057,7 +1048,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
>  		len += seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n", 
>  				  ioc->res_size, total_pages);
>  
> -#ifdef CCIO_SEARCH_TIME
> +#ifdef CCIO_COLLECT_STATS
>  		min = max = ioc->avg_search[0];
>  		for(j = 0; j < CCIO_SEARCH_SAMPLE; ++j) {
>  			avg += ioc->avg_search[j];
> @@ -1070,7 +1061,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
>  		len += seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
>  				  min, avg, max);
>  #endif
> -#ifdef CCIO_MAP_STATS
> +#ifdef CCIO_COLLECT_STATS
>  		len += seq_printf(m, "pci_map_single(): %8ld calls  %8ld pages (avg %d/1000)\n",
>  				  ioc->msingle_calls, ioc->msingle_pages,
>  				  (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
> @@ -1088,7 +1079,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
>  		len += seq_printf(m, "pci_unmap_sg()  : %8ld calls  %8ld pages (avg %d/1000)\n\n\n",
>  				  ioc->usg_calls, ioc->usg_pages,
>  				  (int)((ioc->usg_pages * 1000)/ioc->usg_calls));
> -#endif	/* CCIO_MAP_STATS */
> +#endif	/* CCIO_COLLECT_STATS */
>  
>  		ioc = ioc->next;
>  	}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
