Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BBFE482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 10:39:28 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15yzKT-0005jT-00
	for parisc-linux@parisc-linux.org; Wed, 31 Oct 2001 17:39:05 +0000
Date: Wed, 31 Oct 2001 17:39:05 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011031173905.B5120@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in flush_dcache_page?
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

Thomas Bogendoerfer's being trying to get an L3000 to boot, and is seeing
similar problems to those seen by Bjorn on Superdome.  I think I have a lead.
Documentation/cachetlb.txt says:

  void flush_dcache_page(struct page *page)

        Any time the kernel writes to a page cache page, _OR_
        the kernel is about to read from a page cache page and
        user space shared/writable mappings of this page potentially
        exist, this routine is called.

Our implementation does:

static inline void flush_dcache_page(struct page *page)
{
        if (page->mapping && !page->mapping->i_mmap &&
                        !page->mapping->i_mmap_shared) {
                set_bit(PG_dcache_dirty, &page->flags);
        } else {
                flush_kernel_dcache_page(page_address(page));
        }
}

What we're missing is the case where the user has dirtied the page,
then the kernel calls flush_dcache_page before writing to the page.
This strikes me as a bad interface... there should be different interfaces
for `before the kernel writes' and `after the kernel writes', but let's
see if we can fix our implementation.

we have an interface to use, flush_user_dcache_range.  so we can iterate
over all the mappings and flush each of the user ranges.  btw, we're missing
an optimisation -- if page->mapping is NULL, we can set the PG_dcache_dirty
bit.  This lets us optimise a little more:

static inline void flush_dcache_page(struct page *page)
{
	if (!page->mapping || (page->mapping && !page->mapping->i_mmap &&
			!page->mapping->i_mmap_shared)) {
		set_bit(PG_dcache_dirty, &page->flags);
	} else {
		struct vm_area_struct *vma;
		for (vma = page->mapping->i_mmap; vma; vma = vma->vm_next) {
			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
		}
		if (page->mapping->i_mmap_shared) {
			vma = page->mapping->i_mmap_shared;
			flush_user_page(vma->vm_mm, vma->vm_start + page->index);
		}
		flush_kernel_dcache_page(page_address(page));
	}
}

We only need to flush the first shared mapping because they're all congruent
modulo 4MB.  I suspect there are other optimisations possible (is it
really possible to have multiple _dirty_ pages on the i_mmap list?)
but this might work better.

OTOH this is adding a lot of complexity for an inline function.  maybe we
should just call flush_data_cache() and have done with it :-(

-- 
Revolutions do not require corporate support.
