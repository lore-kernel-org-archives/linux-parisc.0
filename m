Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DA7B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Mar 2003 23:41:17 -0700 (MST)
Date: Wed, 5 Mar 2003 22:32:01 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030306063201.GW11363@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] RFC: mmap patch
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

Hi all,

Looking for some vm gurus to verify that this is correct. This fixes a
problem where the kernel-view of a page vs the user-view can get out of
sync because of the virtually tagged cache of PA. This fixes a bug
reported some time back where write(2)s to a mmaped fd doesn't get 
updated properly in the mmap'ed region.

Many thanks to willy for his advice in putting this together :)

This is tested on 2.5.64-pa1 on a500, but should also apply to 2.4.

Any comments before I apply?

randolph

Index: include/asm-parisc/cacheflush.h
===================================================================
RCS file: /var/cvs/linux-2.5/include/asm-parisc/cacheflush.h,v
retrieving revision 1.5
diff -u -p -r1.5 cacheflush.h
--- include/asm-parisc/cacheflush.h	6 Mar 2003 04:20:45 -0000	1.5
+++ include/asm-parisc/cacheflush.h	6 Mar 2003 06:35:41 -0000
@@ -67,13 +67,15 @@ flush_user_icache_range(unsigned long st
 #endif
 }
 
+extern void __flush_dcache_page(struct page *page);
+
 static inline void flush_dcache_page(struct page *page)
 {
 	if (page->mapping && list_empty(&page->mapping->i_mmap) &&
 			list_empty(&page->mapping->i_mmap_shared)) {
 		set_bit(PG_dcache_dirty, &page->flags);
 	} else {
-		flush_kernel_dcache_page(page_address(page));
+		__flush_dcache_page(page);
 	}
 }
 
Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/cache.c,v
retrieving revision 1.9
diff -u -p -r1.9 cache.c
--- arch/parisc/kernel/cache.c	5 Mar 2003 21:15:37 -0000	1.9
+++ arch/parisc/kernel/cache.c	6 Mar 2003 06:35:41 -0000
@@ -222,3 +222,42 @@ void disable_sr_hashing(void)
 
 	disable_sr_hashing_asm(srhash_type);
 }
+
+void __flush_dcache_page(struct page *page)
+{
+	struct mm_struct *mm = current->active_mm;
+	struct list_head *l;
+
+	flush_kernel_dcache_page(page_address(page));
+
+	if (!page->mapping)
+		return;
+
+	list_for_each(l, &page->mapping->i_mmap_shared) {
+		struct vm_area_struct *mpnt;
+		unsigned long off;
+
+		mpnt = list_entry(l, struct vm_area_struct, shared);
+
+		/*
+		 * If this VMA is not in our MM, we can ignore it.
+		 */
+		if (mpnt->vm_mm != mm)
+			continue;
+
+		if (page->index < mpnt->vm_pgoff)
+			continue;
+
+		off = page->index - mpnt->vm_pgoff;
+		if (off >= (mpnt->vm_end - mpnt->vm_start) >> PAGE_SHIFT)
+			continue;
+
+		flush_cache_page(mpnt, mpnt->vm_start + (off << PAGE_SHIFT));
+
+		/* All user shared mappings should be equivalently mapped,
+		 * so once we've flushed one we should be ok
+		 */
+		break;
+	}
+}
+
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
