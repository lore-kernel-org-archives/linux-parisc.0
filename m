Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 190CC482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 11:08:47 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15yzn6-0006Hg-00; Wed, 31 Oct 2001 18:08:40 +0000
Date: Wed, 31 Oct 2001 18:08:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Bug in flush_dcache_page?
Message-ID: <20011031180840.C5120@parcelfarce.linux.theplanet.co.uk>
References: <20011031173905.B5120@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011031173905.B5120@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 31, 2001 at 05:39:05PM +0000
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

On Wed, Oct 31, 2001 at 05:39:05PM +0000, Matthew Wilcox wrote:
> static inline void flush_dcache_page(struct page *page)
> {
> 	if (!page->mapping || (page->mapping && !page->mapping->i_mmap &&
> 			!page->mapping->i_mmap_shared)) {
> 		set_bit(PG_dcache_dirty, &page->flags);
> 	} else {
> 		struct vm_area_struct *vma;
> 		for (vma = page->mapping->i_mmap; vma; vma = vma->vm_next) {
> 			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
> 		}
> 		if (page->mapping->i_mmap_shared) {
> 			vma = page->mapping->i_mmap_shared;
> 			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
> 		}
> 		flush_kernel_dcache_page(page_address(page));
> 	}
> }

Aha.  A couple of things from talking to various VM/VFS people...
1. page->mapping is guaranteed to exist for pages in the page cache --
   this is how they're located.
2. If a page is simultaneously mapped in both user and kernel space, and
   user space touches it, either it leaves the page cache or it was mapped
   shared.

flush_dcache_page is only called on pages in the page cache, so we can
assume that page->mapping exists, and we don't need to flush any user
mappings of this page.

	if (!page->mapping->i_mmap & !page->mapping->i_mmap_shared) {
		set_bit(PG_dcache_dirty, &page->flags);
	} else {
		struct vm_area_struct *vma = page->mapping->i_mmap_shared;
		if (vma) {
			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
		}
		flush_kernel_dcache_page(page_address(page));
	}

-- 
Revolutions do not require corporate support.
