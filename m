From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH][RFC] parisc: Optimize TLB flush functions based on timing
 results
Date: Fri, 29 May 2015 22:34:54 +0200
Message-ID: <5568CD6E.20204@gmx.de>
References: <20150529201317.GA4795@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150529201317.GA4795@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29.05.2015 22:13, Helge Deller wrote:
> This patch optimizes the TLB flushing functions flush_tlb_mm() and
> __flush_tlb_range() in a way that it adds timing routines to calculate
> the optimal size up to which flushes of small TLB ranges perform faster
> than when performing a full TLB shootdown.
>
> Here are some timing results for a rp5470 and J5000 machine:
>
> Machine: rp5470, PA8700, 875 MHz
> I-cache         : 768 KB
> D-cache         : 1536 KB (WB, direct mapped)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
>
> Whole cache flush 692084 cycles, flushing 13214592 bytes 5904392 cycles
> Setting cache flush threshold to 1512 kB.
> Whole TLB flush 40990 cycles, flushing 4096000 bytes 448989 cycles
> Setting TLB flush threshold to 368 kB.
>
> Machine: J5000/785, PA8500, 440MHz
> I-cache         : 512 KB
> D-cache         : 1024 KB (WB, direct mapped)
> ITLB entries    : 160
> DTLB entries    : 160 - shared with ITLB
>
> Whole cache flush 268605 cycles, flushing 13214592 bytes 1861037 cycles
> Setting cache flush threshold to 1024 kB
> Whole TLB flush 14131 cycles, flushing 13221888 bytes 769329 cycles
> Setting TLB flush threshold to 240 kB


One more machine:
Machine: C8000, PA8800, 2 CPUs each 900 MHz
I-cache         : 32768 KB
D-cache         : 32768 KB (WB, direct mapped)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB

Whole cache flush 4298354 cycles, flushing 13214592 bytes 1440513 cycles
Setting cache flush threshold to 32768 kB
Whole TLB flush 15625 cycles, flushing 13221888 bytes 781230 cycles
Setting TLB flush threshold to 260 kB

  
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
> index 9d086a5..5e81e17 100644
> --- a/arch/parisc/include/asm/tlbflush.h
> +++ b/arch/parisc/include/asm/tlbflush.h
> @@ -24,40 +24,25 @@ extern void flush_tlb_all_local(void *);
>
>   #define smp_flush_tlb_all()	flush_tlb_all()
>
> -/*
> - * flush_tlb_mm()
> - *
> - * XXX This code is NOT valid for HP-UX compatibility processes,
> - * (although it will probably work 99% of the time). HP-UX
> - * processes are free to play with the space id's and save them
> - * over long periods of time, etc. so we have to preserve the
> - * space and just flush the entire tlb. We need to check the
> - * personality in order to do that, but the personality is not
> - * currently being set correctly.
> - *
> - * Of course, Linux processes could do the same thing, but
> - * we don't support that (and the compilers, dynamic linker,
> - * etc. do not do that).
> - */
> +int __flush_tlb_range(unsigned long sid,
> +	unsigned long start, unsigned long end);
> +
> +#define flush_tlb_range(vma, start, end) \
> +	__flush_tlb_range((vma)->vm_mm->context, start, end)
> +
> +#define flush_tlb_kernel_range(start, end) \
> +	__flush_tlb_range(0, start, end)
>
>   static inline void flush_tlb_mm(struct mm_struct *mm)
>   {
> -	BUG_ON(mm == &init_mm); /* Should never happen */
> -
> -#if 1 || defined(CONFIG_SMP)
> -	flush_tlb_all();
> -#else
> -	/* FIXME: currently broken, causing space id and protection ids
> -	 *  to go out of sync, resulting in faults on userspace accesses.
> -	 */
> -	if (mm) {
> -		if (mm->context != 0)
> -			free_sid(mm->context);
> -		mm->context = alloc_sid();
> -		if (mm == current->active_mm)
> -			load_context(mm->context);
> +	struct vm_area_struct *vma;
> +
> +	for (vma = mm->mmap; vma; vma = vma->vm_next) {
> +		/* exit loop if flush_tlb_all() was called. */
> +		if (unlikely(__flush_tlb_range(mm->context,
> +				vma->vm_start, vma->vm_end)))
> +			return;
>   	}
> -#endif
>   }
>
>   static inline void flush_tlb_page(struct vm_area_struct *vma,
> @@ -76,11 +61,4 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>   	purge_tlb_end(flags);
>   }
>
> -void __flush_tlb_range(unsigned long sid,
> -	unsigned long start, unsigned long end);
> -
> -#define flush_tlb_range(vma,start,end) __flush_tlb_range((vma)->vm_mm->context,start,end)
> -
> -#define flush_tlb_kernel_range(start, end) __flush_tlb_range(0,start,end)
> -
>   #endif
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index f6448c7..4eac923 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -342,12 +342,15 @@ EXPORT_SYMBOL(flush_data_cache_local);
>   EXPORT_SYMBOL(flush_kernel_icache_range_asm);
>
>   #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
> -int parisc_cache_flush_threshold __read_mostly = FLUSH_THRESHOLD;
> +static unsigned long parisc_cache_flush_threshold __read_mostly = FLUSH_THRESHOLD;
> +
> +#define FLUSH_TLB_THRESHOLD (2*1024*1024) /* 2MB initial TLB threshold */
> +static unsigned long parisc_tlb_flush_threshold __read_mostly = FLUSH_TLB_THRESHOLD;
>
>   void __init parisc_setup_cache_timing(void)
>   {
>   	unsigned long rangetime, alltime;
> -	unsigned long size;
> +	unsigned long size, start;
>
>   	alltime = mfctl(16);
>   	flush_data_cache();
> @@ -364,14 +367,42 @@ void __init parisc_setup_cache_timing(void)
>   	/* Racy, but if we see an intermediate value, it's ok too... */
>   	parisc_cache_flush_threshold = size * alltime / rangetime;
>
> -	parisc_cache_flush_threshold = (parisc_cache_flush_threshold + L1_CACHE_BYTES - 1) &~ (L1_CACHE_BYTES - 1);
> +	parisc_cache_flush_threshold = L1_CACHE_ALIGN(parisc_cache_flush_threshold);
>   	if (!parisc_cache_flush_threshold)
>   		parisc_cache_flush_threshold = FLUSH_THRESHOLD;
>
>   	if (parisc_cache_flush_threshold > cache_info.dc_size)
>   		parisc_cache_flush_threshold = cache_info.dc_size;
>
> -	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
> +	printk(KERN_INFO "Setting cache flush threshold to %lu kB\n",
> +		parisc_cache_flush_threshold/1024);
> +
> +	/* calculate TLB flush threshold */
> +
> +	alltime = mfctl(16);
> +	flush_tlb_all();
> +	alltime = mfctl(16) - alltime;
> +
> +	size = PAGE_SIZE;
> +	start = (unsigned long) _text;
> +	rangetime = mfctl(16);
> +	while (start < (unsigned long) _end) {
> +		flush_tlb_kernel_range(start, start + PAGE_SIZE);
> +		start += PAGE_SIZE;
> +		size += PAGE_SIZE;
> +	}
> +	rangetime = mfctl(16) - rangetime;
> +
> +	printk(KERN_DEBUG "Whole TLB flush %lu cycles, flushing %lu bytes %lu cycles\n",
> +		alltime, size, rangetime);
> +
> +	parisc_tlb_flush_threshold = size * alltime / rangetime;
> +	parisc_tlb_flush_threshold = PAGE_ALIGN(parisc_tlb_flush_threshold);
> +	if (!parisc_tlb_flush_threshold)
> +		parisc_tlb_flush_threshold = FLUSH_TLB_THRESHOLD;
> +
> +	printk(KERN_INFO "Setting TLB flush threshold to %lu kB\n",
> +		parisc_tlb_flush_threshold/1024);
>   }
>
>   extern void purge_kernel_dcache_page_asm(unsigned long);
> @@ -418,32 +449,39 @@ void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
>   }
>   EXPORT_SYMBOL(purge_tlb_entries);
>
> -void __flush_tlb_range(unsigned long sid, unsigned long start,
> +/* __flush_tlb_range()
> + *
> + * returns 1 if all TLBs were flushed.
> + */
> +int __flush_tlb_range(unsigned long sid, unsigned long start,
>   		       unsigned long end)
>   {
> -	unsigned long npages;
> +	unsigned long size;
>
> -	npages = ((end - (start & PAGE_MASK)) + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
> -	if (npages >= 512)  /* 2MB of space: arbitrary, should be tuned */
> +	size = (end - start);
> +	if (size >= parisc_tlb_flush_threshold) {
>   		flush_tlb_all();
> +		return 1;
> +	}
>   	else {
>   		unsigned long flags;
>
>   		purge_tlb_start(flags);
>   		mtsp(sid, 1);
>   		if (split_tlb) {
> - 	 		while (npages--) {
> +			while (start < end) {
>   				pdtlb(start);
>   				pitlb(start);
>   				start += PAGE_SIZE;
>   			}
>   		} else {
> -			while (npages--) {
> +			while (start < end) {
>   				pdtlb(start);
>   				start += PAGE_SIZE;
>   			}
>   		}
>   		purge_tlb_end(flags);
> +		return 0;
>   	}
>   }
>
>

