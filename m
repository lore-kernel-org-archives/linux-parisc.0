From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: [PATCH 3/9] mm: parisc pte atomicity
Date: Sat, 22 Oct 2005 10:33:30 -0600
Message-ID: <20051022163330.GD3364__40516.2402931184$1416624564$gmane$org@parisc-linux.org>
References: <Pine.LNX.4.61.0510221716380.18047@goblin.wat.veritas.com>
	<Pine.LNX.4.61.0510221722260.18047@goblin.wat.veritas.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.61.0510221722260.18047@goblin.wat.veritas.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 22, 2005 at 05:23:27PM +0100, Hugh Dickins wrote:
> There's a worrying function translation_exists in parisc cacheflush.h,
> unaffected by split ptlock since flush_dcache_page is using it on some
> other mm, without any relevant lock.  Oh well, make it a slightly more
> robust by factoring the pfn check within it.  And it looked liable to
> confuse a camouflaged swap or file entry with a good pte: fix that too.

I have to say I really don't understand VM at all.  cc'ing the
parisc-linux list in case anyone there has a better understanding than I
do.

> Signed-off-by: Hugh Dickins <hugh@veritas.com>
> ---
> 
>  arch/parisc/kernel/cache.c      |   24 +++++++++---------------
>  include/asm-parisc/cacheflush.h |   35 +++++++++++++++++++----------------
>  2 files changed, 28 insertions(+), 31 deletions(-)
> 
> --- mm2/arch/parisc/kernel/cache.c	2005-03-02 07:38:56.000000000 +0000
> +++ mm3/arch/parisc/kernel/cache.c	2005-10-22 14:06:30.000000000 +0100
> @@ -266,7 +266,6 @@ void flush_dcache_page(struct page *page
>  	unsigned long offset;
>  	unsigned long addr;
>  	pgoff_t pgoff;
> -	pte_t *pte;
>  	unsigned long pfn = page_to_pfn(page);
>  
>  
> @@ -297,21 +296,16 @@ void flush_dcache_page(struct page *page
>  		 * taking a page fault if the pte doesn't exist.
>  		 * This is just for speed.  If the page translation
>  		 * isn't there, there's no point exciting the
> -		 * nadtlb handler into a nullification frenzy */
> -
> -
> -  		if(!(pte = translation_exists(mpnt, addr)))
> -			continue;
> -
> -		/* make sure we really have this page: the private
> +		 * nadtlb handler into a nullification frenzy.
> +		 *
> +		 * Make sure we really have this page: the private
>  		 * mappings may cover this area but have COW'd this
> -		 * particular page */
> -		if(pte_pfn(*pte) != pfn)
> -  			continue;
> -
> -		__flush_cache_page(mpnt, addr);
> -
> -		break;
> +		 * particular page.
> +		 */
> +  		if (translation_exists(mpnt, addr, pfn)) {
> +			__flush_cache_page(mpnt, addr);
> +			break;
> +		}
>  	}
>  	flush_dcache_mmap_unlock(mapping);
>  }
> --- mm2/include/asm-parisc/cacheflush.h	2005-10-11 12:07:49.000000000 +0100
> +++ mm3/include/asm-parisc/cacheflush.h	2005-10-22 14:06:30.000000000 +0100
> @@ -100,30 +100,34 @@ static inline void flush_cache_range(str
>  
>  /* Simple function to work out if we have an existing address translation
>   * for a user space vma. */
> -static inline pte_t *__translation_exists(struct mm_struct *mm,
> -					  unsigned long addr)
> +static inline int translation_exists(struct vm_area_struct *vma,
> +				unsigned long addr, unsigned long pfn)
>  {
> -	pgd_t *pgd = pgd_offset(mm, addr);
> +	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
>  	pmd_t *pmd;
> -	pte_t *pte;
> +	pte_t pte;
>  
>  	if(pgd_none(*pgd))
> -		return NULL;
> +		return 0;
>  
>  	pmd = pmd_offset(pgd, addr);
>  	if(pmd_none(*pmd) || pmd_bad(*pmd))
> -		return NULL;
> +		return 0;
>  
> -	pte = pte_offset_map(pmd, addr);
> +	/* We cannot take the pte lock here: flush_cache_page is usually
> +	 * called with pte lock already held.  Whereas flush_dcache_page
> +	 * takes flush_dcache_mmap_lock, which is lower in the hierarchy:
> +	 * the vma itself is secure, but the pte might come or go racily.
> +	 */
> +	pte = *pte_offset_map(pmd, addr);
> +	/* But pte_unmap() does nothing on this architecture */
> +
> +	/* Filter out coincidental file entries and swap entries */
> +	if (!(pte_val(pte) & (_PAGE_FLUSH|_PAGE_PRESENT)))
> +		return 0;
>  
> -	/* The PA flush mappings show up as pte_none, but they're
> -	 * valid none the less */
> -	if(pte_none(*pte) && ((pte_val(*pte) & _PAGE_FLUSH) == 0))
> -		return NULL;
> -	return pte;
> +	return pte_pfn(pte) == pfn;
>  }
> -#define	translation_exists(vma, addr)	__translation_exists((vma)->vm_mm, addr)
> -
>  
>  /* Private function to flush a page from the cache of a non-current
>   * process.  cr25 contains the Page Directory of the current user
> @@ -175,9 +179,8 @@ flush_cache_page(struct vm_area_struct *
>  {
>  	BUG_ON(!vma->vm_mm->context);
>  
> -	if(likely(translation_exists(vma, vmaddr)))
> +	if (likely(translation_exists(vma, vmaddr, pfn)))
>  		__flush_cache_page(vma, vmaddr);
>  
>  }
>  #endif
> -
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
