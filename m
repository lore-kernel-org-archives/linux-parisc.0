Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12DA44829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Mar 2003 07:14:55 -0700 (MST)
Date: Thu, 6 Mar 2003 07:14:53 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200303061414.HAA26321@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: davem@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: RFC: mmap patch
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

>
> Looking for some vm gurus to verify that this is correct. This fixes a
> problem where the kernel-view of a page vs the user-view can get out of
> sync because of the virtually tagged cache of PA. This fixes a bug
> reported some time back where write(2)s to a mmaped fd doesn't get
> updated properly in the mmap'ed region.
>
> Many thanks to willy for his advice in putting this together :)
>
> This is tested on 2.5.64-pa1 on a500, but should also apply to 2.4.
>
> Any comments before I apply?
>

In my opinion this patch is a hack workaround for a real bug. parisc is
not the only architecture that has virtual tagged caches.  Some mips
machines, sparc and ultrasparc machines have virtual tagged caches,
although none of them have virtual tagged caches as large as parisc (the
other architectures typically have a larger physical cache at a higher
level in the cache hierarchy).

Dave Miller designed the cache flushing strategy to have hooks in the
machine independent code to support virtual tagged caches.  Probably there
is simply a cache flush that is missing that doesn't show itself as a bug
as easily on the smaller virtually tagged caches of the other
architectures. At most this particular scenario wasn't considered
for virtual tagged caches (maintaining coherence between fd writes and
mmap'ed regions) and will require a design change to fix.

The fix for this bug should be made in machine independent code, not in
our machine dependent code.

John Marvin
jsm@fc.hp.com

P.S. I am cc'ing Dave Miller to see if he cares to comment.

> Index: include/asm-parisc/cacheflush.h
> ===================================================================
> RCS file: /var/cvs/linux-2.5/include/asm-parisc/cacheflush.h,v
> retrieving revision 1.5
> diff -u -p -r1.5 cacheflush.h
> --- include/asm-parisc/cacheflush.h     6 Mar 2003 04:20:45 -0000       1.5
> +++ include/asm-parisc/cacheflush.h     6 Mar 2003 06:35:41 -0000
> @@ -67,13 +67,15 @@ flush_user_icache_range(unsigned long st
>  #endif
>  }
>
> +extern void __flush_dcache_page(struct page *page);
> +
>  static inline void flush_dcache_page(struct page *page)
>  {
>         if (page->mapping && list_empty(&page->mapping->i_mmap) &&
>                         list_empty(&page->mapping->i_mmap_shared)) {
>                 set_bit(PG_dcache_dirty, &page->flags);
>         } else {
> -               flush_kernel_dcache_page(page_address(page));
> +               __flush_dcache_page(page);
>         }
>  }
>
> Index: arch/parisc/kernel/cache.c
> ===================================================================
> RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/cache.c,v
> retrieving revision 1.9
> diff -u -p -r1.9 cache.c
> --- arch/parisc/kernel/cache.c  5 Mar 2003 21:15:37 -0000       1.9
> +++ arch/parisc/kernel/cache.c  6 Mar 2003 06:35:41 -0000
> @@ -222,3 +222,42 @@ void disable_sr_hashing(void)
>
>         disable_sr_hashing_asm(srhash_type);
>  }
> +
> +void __flush_dcache_page(struct page *page)
> +{
> +       struct mm_struct *mm = current->active_mm;
> +       struct list_head *l;
> +
> +       flush_kernel_dcache_page(page_address(page));
> +
> +       if (!page->mapping)
> +               return;
> +
> +       list_for_each(l, &page->mapping->i_mmap_shared) {
> +               struct vm_area_struct *mpnt;
> +               unsigned long off;
> +
> +               mpnt = list_entry(l, struct vm_area_struct, shared);
> +
> +               /*
> +                * If this VMA is not in our MM, we can ignore it.
> +                */
> +               if (mpnt->vm_mm != mm)
> +                       continue;
> +
> +               if (page->index < mpnt->vm_pgoff)
> +                       continue;
> +
> +               off = page->index - mpnt->vm_pgoff;
> +               if (off >= (mpnt->vm_end - mpnt->vm_start) >> PAGE_SHIFT)
> +                       continue;
> +
> +               flush_cache_page(mpnt, mpnt->vm_start + (off << PAGE_SHIFT));
> +
> +               /* All user shared mappings should be equivalently mapped,
> +                * so once we've flushed one we should be ok
> +                */
> +               break;
> +       }
> +}
> +
>
