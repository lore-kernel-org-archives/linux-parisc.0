Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id A262E4872
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 04:48:08 -0600 (MDT)
Date: Mon, 1 Oct 2001 04:48:07 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110011048.EAA03389@udlkern.fc.hp.com>
To: tsbogend@alpha.franken.de
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] shm cache flush bug
List-ID: <linux-parisc.vger.kernel.org>

> I've tested following patch:
>
> diff -u -r1.32 pgalloc.h
> --- pgalloc.h   2001/09/06 09:44:12     1.32
> +++ pgalloc.h   2001/09/30 12:13:57
> @@ -17,6 +17,7 @@
>  static inline void
>  flush_page_to_ram(struct page *page)
>  {
> +       flush_kernel_dcache_page (page_address(page));
>  }
>
> That one fixes the problem, too. Is this patch something you would see
> as the right thing to do ?
>
> Thomas.

No. flush_page_to_ram() is the old cache flushing interface. It is called
in a bunch of other places. Enabling it would wind up doing a lot of
redundant cache flushing.

> >
> > flush_dcache_page() is perhaps the function you are looking for?  I'm
> > not sure I understand what the problem is since you didn't post a diff.
>
> flush_kernel_dcache_page() works and it should even be the right fix.
>

flush_dcache_page() is the right interface to use in machine independent
code. It calls flush_kernel_dcache_page(), but it also has an additional
performance tweak that delays flushing if the mapping is not in place yet
(it sets a bit that causes the flush to happen when the translation is
mapped).  This avoids flushing in some circumstances.

I've tracked the bug down to root cause.  The root cause of the problem is
that shmem_getpage_locked() calls clear_highpage() for a page when it is
first allocated, without flushing the page.  The appropriate interface is
clear_user_highpage(), similar to what is done in do_anonymous_page() in
mm/memory.c.  However, clear_user_highpage() requires the user address,
and that would need to get passed down from shmem_nopage() through
shmem_getpage()/shmem_getpage_locked(). shmem_getpage() and
shmem_getpage_locked() get called in a few other places, so that change
starts to get a little ugly.  I decided to take the easy way out by adding
a flush_dcache_page() call after the call to clear_highpage(). Of course,
this change will need to be sold to Linus eventually, so we will probably
need to consult further to determine if this is an appropriate final fix.

Thomas, thank you for finding this bug and providing a test case.

John

Here is the patch that I committed to mm/shmem.c:

--- shmem.c.old	Mon Oct  1 03:01:47 2001
+++ shmem.c	Mon Oct  1 04:08:13 2001
@@ -377,6 +377,7 @@ repeat:
 		if (!page)
 			return ERR_PTR(-ENOMEM);
 		clear_highpage(page);
+		flush_dcache_page(page);
 		inode->i_blocks += BLOCKS_PER_PAGE;
 		add_to_page_cache (page, mapping, idx);
 	}
