From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: keep track of last shared mmap'ed address
Date: Thu, 27 Oct 2016 20:39:29 +0200
Message-ID: <20161027183929.GA10225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

shared mappings (v2)
Reply-To: 
In-Reply-To: <20140417204545.GA4567@ls3530.fritz.box>

* Helge Deller <deller@gmx.de>:
> [RFC,PATCH] mm,parisc: keep track of last mmap'ed address
> 
> Because of parisc's cache aliasing constraints we need to map shared pages at a
> multiple of 4MB while most other architectures can map files at any multiple of
> PAGE_SIZE. In the past this constraint was ensured by calculating a virtual
> offset into this 4MB region which is based on the physical address of the
> kernel mapping variable (right-shift value of filp->f_mapping by 8 bits).
> Since we only have a 32bit userspace (even when running on a 64bit kernel) this
> often leads to large gaps in the maps of the userspace processes and to out of
> memory situations even if physical memory was still free.  Of course I did
> played with other variants of shifting the f_mapping value to find better
> offsets but this didn't helped either.
> 
> This patch chooses a different approach.
> It adds the additional field i_mmap_lastmmap to the address_space struct to
> keep track of the last mapping of a shared file. With this bookkeeping it's
> possible for the parisc memory allocator to 
> a) choose a new mapping offset if the file hasn't been mapped yet, and
> b) take the last-used mapping if it was already mapped by another process.
> 
> Overall this approach leads to a more condensed memory usage on parisc because
> the shared files will now be mapped much closer to each other. This is e.g.
> visible with shared libraries which are now not any longer cluttered around
> in the userspace process but close to each other at the top of the userspace
> memory.

This is version 2 of this patch.

Instead of adding one additional field to the address space struct, it
now uses the private_data field of the file struct to store the last
used mmap address.

Additionally I tweaked the flush_dcache_page() function to warn for
INEQUIVALENT ALIASES only for shared mappings and ignore private
mappings. Without this change, stracing applications sometimes showed
those warnings. Not sure if this is the right thing to do.

My testing didn't showed any negative effects yet, although I'm not sure
if the usage of the private_data field may conflict with other use
cases, e.g. compressed file systems or such.

To benefit from the more effective/condensed memory usage one additional
patch is needed.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 629eb46..f72789b 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -321,10 +321,10 @@ void flush_dcache_page(struct page *page)
 
 	pgoff = page->index;
 
-	/* We have carefully arranged in arch_get_unmapped_area() that
-	 * *any* mappings of a file are always congruently mapped (whether
-	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
+	/* We have carefully arranged in arch_get_unmapped_area() that mappings
+	 * of a file are always congruently mapped (if declared as MAP_SHARED, not
+	 * MAP_PRIVATE), so we only need to flush one address here for them all to
+	 * become coherent */
 
 	flush_dcache_mmap_lock(mapping);
 	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
@@ -344,7 +344,7 @@ void flush_dcache_page(struct page *page)
 		if (old_addr == 0 || (old_addr & (SHM_COLOUR - 1))
 				      != (addr & (SHM_COLOUR - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (old_addr && (mpnt->vm_flags & VM_SHARED))
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %pD\n", old_addr, addr, mpnt->vm_file);
 			old_addr = addr;
 		}
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 0a393a0..c04d946 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -36,12 +36,11 @@
 #include <linux/personality.h>
 #include <linux/random.h>
 
-/* we construct an artificial offset for the mapping based on the physical
- * address of the kernel mapping variable */
+/* keep track of the last mapping address offset in the private_data field */
 #define GET_LAST_MMAP(filp)		\
-	(filp ? ((unsigned long) filp->f_mapping) >> 8 : 0UL)
+	(filp && (file_count(filp) > 0) ? (unsigned long) filp->private_data : 0UL)
 #define SET_LAST_MMAP(filp, val)	\
-	 { /* nothing */ }
+	{ if (filp) filp->private_data = (void *) (val); }
 
 static int get_offset(unsigned int last_mmap)
 {
