From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PATCH/RFC: discontig mem support for hppa
Date: Sat, 3 Jul 2004 13:16:43 -0600
Message-ID: <20040703191643.GB10458@colo.lackof.org>
References: <20040703180852.GD18628@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040703180852.GD18628@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 03, 2004 at 11:08:52AM -0700, Randolph Chung wrote:
...
> +/* We have these possible memory map layouts:
> + * Astro: 0-3.75, 67.75-68, 4-64
> + * zx1: 0-1, 257-260, 4-256
> + * Stretch (N-class): 0-2, 4-32, 34-xxx
> + */
> +
> +/* Since all the boundaries are on a 1GB-boundary, we can create
> + * an index table for pfn to nid lookup; each entry in pfnnid_map 
> + * represents 1GB, and contains the node that the memory belongs to. */

The comment and the above table don't exactly agree.
3.75 is not a 1GB boundary. Is that important for
what pfnnid_map[] is being used for?

Can someone explain the K-class memory layout for inclusion here?
Or did K-class never support more than 4GB?

Even though we don't support it, to be complete, can Bjorn or
someone explain Superdome memory holes? (chipset name?)

Secondly, ISTR a legacy VGA hole on ZX1 below 1GB.

Astro was supposed to suport legacy VGA as well but the HW was never
tested or officially supported.


> +
> +#define PFNNID_SHIFT (30 - PAGE_SHIFT)
> +extern unsigned char pfnnid_map[];
> +
> +static inline int pfn_to_nid(unsigned long pfn)
> +{
> +	unsigned int i;
> +    unsigned char r;
> +    i = pfn >> PFNNID_SHIFT;
> +    r = pfnnid_map[i];
> +    BUG_ON(r == 0xff);
> +
> +    return (int)r;
> +}
> +
> +static inline int pfn_valid(int pfn)
> +{
> +	int nid = pfn_to_nid(pfn);
> +
> +	if (nid >= 0)
> +		return (pfn < node_end_pfn(nid));
> +	return 0;
> +}
> +
> +#else /* !CONFIG_DISCONTIGMEM */
> +#define MAX_PHYSMEM_RANGES 	1 
> +#endif
> +#endif /* _PARISC_MMZONE_H */
> Index: include/asm-parisc/page.h
> ===================================================================
> RCS file: /var/cvs/linux-2.6/include/asm-parisc/page.h,v
> retrieving revision 1.9
> diff -u -p -r1.9 page.h
> --- include/asm-parisc/page.h	5 May 2004 23:02:47 -0000	1.9
> +++ include/asm-parisc/page.h	3 Jul 2004 06:55:49 -0000
> @@ -83,12 +83,6 @@ extern __inline__ int get_order(unsigned
>  	return order;
>  }
>  
> -#ifdef __LP64__
> -#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
> -#else
> -#define MAX_PHYSMEM_RANGES 1 /* First range is only range that fits in 32 bits */
> -#endif
> -
>  typedef struct __physmem_range {
>  	unsigned long start_pfn;
>  	unsigned long pages;       /* PAGE_SIZE pages */
> @@ -144,15 +138,16 @@ extern int npmem_ranges;
>  #define __pa(x)			((unsigned long)(x)-PAGE_OFFSET)
>  #define __va(x)			((void *)((unsigned long)(x)+PAGE_OFFSET))
>  
> +#ifndef CONFIG_DISCONTIGMEM
>  #define pfn_to_page(pfn)	(mem_map + (pfn))
>  #define page_to_pfn(page)	((unsigned long)((page) - mem_map))
>  #define pfn_valid(pfn)		((pfn) < max_mapnr)
> +#endif /* CONFIG_DISCONTIGMEM */
> +
>  #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
>  
> -#ifndef CONFIG_DISCONTIGMEM
> -#define virt_to_page(kaddr)     (mem_map + (__pa(kaddr) >> PAGE_SHIFT))
> -#define VALID_PAGE(page)	((page - mem_map) < max_mapnr)
> -#endif  /* !CONFIG_DISCONTIGMEM */
> +#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
> +#define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
>  
>  #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
>  				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
> Index: include/asm-parisc/pgtable.h
> ===================================================================
> RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
> retrieving revision 1.13
> diff -u -p -r1.13 pgtable.h
> --- include/asm-parisc/pgtable.h	1 Jul 2004 20:24:38 -0000	1.13
> +++ include/asm-parisc/pgtable.h	3 Jul 2004 06:55:49 -0000
> @@ -353,11 +353,7 @@ extern inline pte_t pte_modify(pte_t pte
>  
>  #define pte_pfn(x) (pte_val(x) >> PAGE_SHIFT)
>  
> -#ifdef CONFIG_DISCONTIGMEM
> -#define pte_page(x) (phys_to_page(pte_val(x)))
> -#else
> -#define pte_page(x) (mem_map+(pte_val(x) >> PAGE_SHIFT))
> -#endif
> +#define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
>  
>  #define pmd_page_kernel(pmd)	((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
>  
> --- include/asm-parisc/numnodes.h	Sat Jul  3 00:55:49 2004
> +++ include/asm-parisc/numnodes.h	Sat Jul  3 00:55:49 2004
> @@ -0,0 +1,9 @@
> +#ifndef _ASM_MAX_NUMNODES_H
> +#define _ASM_MAX_NUMNODES_H
> +
> +#include <linux/config.h>
> +
> +/* Max 8 Nodes */
> +#define NODES_SHIFT	3
> +
> +#endif /* _ASM_MAX_NUMNODES_H */
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
