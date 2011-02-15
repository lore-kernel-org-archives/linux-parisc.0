From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Mon, 14 Feb 2011 20:58:53 -0500
Message-ID: <20110215015852.GA6615@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: James.Bottomley@HansenPartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110213193934.GA28834@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 13 Feb 2011, John David Anglin wrote:

> Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075

I'm testing a binutils change to the default linker scrip for ld to
align the file offset for the data segment to a page boundary.  This
should eliminate this source of inequivalent aliases.

> It might be two passes over the list should be used to first flush shared
> writeable maps, and then another pass to invalidate the other maps.

I made the following change to flush_dcache_page().  Although a bit ugly,
it handles the boundary page issue in one pass.

With it, I see another type of inequivalent aliases in the GCC C testsuite:

Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x40738000 in file libc-2.11.2.so with flags 0x8100075
Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x40738000 in file libc-2.11.2.so with flags 0x8100075
Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x40738000 in file libc-2.11.2.so with flags 0x8100075
...
Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x4033
8000 in file libc-2.11.2.so with flags 0x8100075
Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x40f3
8000 in file libc-2.11.2.so with flags 0x8100075
Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x411e
8000 in file libc-2.11.2.so with flags 0x8000071

i haven't tracked down where these come from but this looks like a glibc issue.
Note the final vm_flags value for the final map.  This is the inequivalent one.
As far as I know, the GCC testsuite does not play with MAP_FIXED maps.

Carlos, any thoughts on where this might come from?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..f90a330 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -276,10 +278,10 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 void flush_dcache_page(struct page *page)
 {
 	struct address_space *mapping = page_mapping(page);
-	struct vm_area_struct *mpnt;
+	struct vm_area_struct *mpnt, *mpnt_wrt, *mpnt_nwrt;
 	struct prio_tree_iter iter;
 	unsigned long offset;
-	unsigned long addr, old_addr = 0;
+	unsigned long addr, addr_wrt, addr_nwrt;
 	pgoff_t pgoff;
 
 	if (mapping && !mapping_mapped(mapping)) {
@@ -292,26 +294,69 @@ void flush_dcache_page(struct page *page)
 	if (!mapping)
 		return;
 
+	addr_wrt = 0;
+	mpnt_wrt = NULL;
+	addr_nwrt = 0;
+	mpnt_nwrt = NULL;
 	pgoff = page->index << (PAGE_CACHE_SHIFT - PAGE_SHIFT);
 
 	/* We have carefully arranged in arch_get_unmapped_area() that
-	 * *any* mappings of a file are always congruently mapped (whether
-	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
+	 * all shared mappings of a file are congruently mapped, so we
+	 * only need to flush one address here for them all to become
+	 * coherent.  However, non-shared fixed mappings of executables
+	 * are not congruently mapped on the boundary page between text
+	 * and data.  Further, the data segment sometimes occurs before
+	 * the text segment.  While it is unlikely that a dirty cache
+	 * line would result from accesses through the text mapping,
+	 * it is possible that this could occur since binutils doesn't
+	 * ensure that the data segment starts on a page boundary.  */
 
 	flush_dcache_mmap_lock(mapping);
+
+	/* Scan for inequivalent aliases.  */
 	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 
-		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
-			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
-				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
-			old_addr = addr;
+		if (mpnt->vm_flags & VM_WRITE) {
+			if (addr_wrt == 0) {
+				addr_wrt = addr;
+				mpnt_wrt = mpnt;
+			}
+			else if ((addr_wrt & (SHMLBA - 1)) != (addr & (SHMLBA - 1)))
+				goto flush_inequivalent;
 		}
+		else {
+			if (addr_nwrt == 0) {
+				addr_nwrt = addr;
+				mpnt_nwrt = mpnt;
+			}
+			else if ((addr_nwrt & (SHMLBA - 1)) != (addr & (SHMLBA - 1)))
+				goto flush_inequivalent;
+		}
+	}
+	flush_dcache_mmap_unlock(mapping);
+
+	/* Common case where all writeable aliases are equivalent and
+	 * all non writeable aliases are equivalent.  */
+	if (addr_wrt)
+		__flush_cache_page(mpnt_wrt, addr_wrt, page_to_phys(page));
+	if (addr_nwrt &&
+	    (!addr_wrt || (addr_nwrt & (SHMLBA - 1)) != (addr_wrt & (SHMLBA - 1))))
+		__flush_cache_page(mpnt_nwrt, addr_nwrt, page_to_phys(page));
+	return;
+
+flush_inequivalent:
+	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
+		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
+		addr = mpnt->vm_start + offset;
+
+		printk(KERN_ERR "INEQUIVALENT ALIASES: page 0x%lx addr 0x%lx in file %s with flags 0x%lx\n", (unsigned long) page, addr, mpnt->vm_file ? (char *) mpnt->vm_file->f_path.dentry->d_name.name : "(null)", mpnt->vm_flags);
+
+		__flush_cache_page(mpnt, addr, page_to_phys(page));
 	}
 	flush_dcache_mmap_unlock(mapping);
+	return;
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
