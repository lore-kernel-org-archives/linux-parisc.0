From: Helge Deller <deller@gmx.de>
Subject: Re: [patch 1/1] mm: use vm_unmapped_area() on parisc architecture
Date: Mon, 25 Feb 2013 22:15:34 +0100
Message-ID: <512BD476.1050409@gmx.de>
References: <20130221231233.1155D5A4174@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
	walken@google.com, riel@redhat.com
To: akpm@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130221231233.1155D5A4174@corp2gmr1-2.hot.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02/22/2013 12:12 AM, akpm@linux-foundation.org wrote:
> From: Michel Lespinasse <walken@google.com>
> Subject: mm: use vm_unmapped_area() on parisc architecture
> 
> Update the parisc arch_get_unmapped_area function to make use of
> vm_unmapped_area() instead of implementing a brute force search.
> 
> Signed-off-by: Michel Lespinasse <walken@google.com>
> Acked-by: Rik van Riel <riel@redhat.com>
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

James had two comments regarding this patch:
https://patchwork.kernel.org/patch/2027451/

Anyway, given the fact that this patch is a nice cleanup, that it does not do more
wrong than what was maybe wrong before, and that I tested a 32- and 64bit kernel 
with that patch, I would say:

Acked-by: Helge Deller <deller@gmx.de>


> ---
> 
>  arch/parisc/kernel/sys_parisc.c |   46 +++++++++++-------------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
> 
> diff -puN arch/parisc/kernel/sys_parisc.c~mm-use-vm_unmapped_area-on-parisc-architecture arch/parisc/kernel/sys_parisc.c
> --- a/arch/parisc/kernel/sys_parisc.c~mm-use-vm_unmapped_area-on-parisc-architecture
> +++ a/arch/parisc/kernel/sys_parisc.c
> @@ -35,18 +35,15 @@
>  
>  static unsigned long get_unshared_area(unsigned long addr, unsigned long len)
>  {
> -	struct vm_area_struct *vma;
> +	struct vm_unmapped_area_info info;
>  
> -	addr = PAGE_ALIGN(addr);
> -
> -	for (vma = find_vma(current->mm, addr); ; vma = vma->vm_next) {
> -		/* At this point:  (!vma || addr < vma->vm_end). */
> -		if (TASK_SIZE - len < addr)
> -			return -ENOMEM;
> -		if (!vma || addr + len <= vma->vm_start)
> -			return addr;
> -		addr = vma->vm_end;
> -	}
> +	info.flags = 0;
> +	info.length = len;
> +	info.low_limit = PAGE_ALIGN(addr);
> +	info.high_limit = TASK_SIZE;
> +	info.align_mask = 0;
> +	info.align_offset = 0;
> +	return vm_unmapped_area(&info);
>  }
>  
>  #define DCACHE_ALIGN(addr) (((addr) + (SHMLBA - 1)) &~ (SHMLBA - 1))
> @@ -63,30 +60,21 @@ static unsigned long get_unshared_area(u
>   */
>  static int get_offset(struct address_space *mapping)
>  {
> -	int offset = (unsigned long) mapping << (PAGE_SHIFT - 8);
> -	return offset & 0x3FF000;
> +	return (unsigned long) mapping >> 8;
>  }
>  
>  static unsigned long get_shared_area(struct address_space *mapping,
>  		unsigned long addr, unsigned long len, unsigned long pgoff)
>  {
> -	struct vm_area_struct *vma;
> -	int offset = mapping ? get_offset(mapping) : 0;
> -
> -	offset = (offset + (pgoff << PAGE_SHIFT)) & 0x3FF000;
> +	struct vm_unmapped_area_info info;
>  
> -	addr = DCACHE_ALIGN(addr - offset) + offset;
> -
> -	for (vma = find_vma(current->mm, addr); ; vma = vma->vm_next) {
> -		/* At this point:  (!vma || addr < vma->vm_end). */
> -		if (TASK_SIZE - len < addr)
> -			return -ENOMEM;
> -		if (!vma || addr + len <= vma->vm_start)
> -			return addr;
> -		addr = DCACHE_ALIGN(vma->vm_end - offset) + offset;
> -		if (addr < vma->vm_end) /* handle wraparound */
> -			return -ENOMEM;
> -	}
> +	info.flags = 0;
> +	info.length = len;
> +	info.low_limit = PAGE_ALIGN(addr);
> +	info.high_limit = TASK_SIZE;
> +	info.align_mask = PAGE_MASK & (SHMLBA - 1);
> +	info.align_offset = (get_offset(mapping) + pgoff) << PAGE_SHIFT;
> +	return vm_unmapped_area(&info);
>  }
>  
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> _
> 

