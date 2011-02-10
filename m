From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Thu, 10 Feb 2011 10:03:53 -0600
Message-ID: <1297353833.4933.50.camel@mulgrave.site>
References: <20110208184509.2E2C74ED8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110208184509.2E2C74ED8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2011-02-08 at 13:45 -0500, John David Anglin wrote:
> > > The change includes James' invalidate_kernel_vmap_range patch which
> > > as of last night, doesn't seem to be in linux-next..
> > 
> > doing this makes it a bit harder to see what you're changing.  It also
> > can't possibly affect your testing, because it's an edge case for xfs
> > journals currently.
> 
> I'll pull that part out and retest.
> 
> > > 1) Changed spin_lock_irq to spin_lock in flush_dcache_mmap_lock because
> > >    the former causes a problem with timer interrupts.
> > 
> > This looks reasonable ... architectures which don't use the lock do
> > this.  Unfortunately, flush_dcache_page can be called from interrupt
> > context, so our only choices are to eliminate the lock or to use it in
> > an interrupt safe manner.  If we use a non interrupt safe lock, it will
> > cause a deadlock eventually.
> 
> I see occassional slow timer interrupt messages and I suspect the expect
> timeouts that I see during the GCC testsuite are also caused by disabling
> interrupts for too long.  I also encountered situations in the GCC
> build where certain applications (gnat1) would run much longer than
> normal (seemed like scheduling was broken).  At the smae time, xntpd
> seemed to be consuming more cycles than normal.

Right, the problem here is the inequivalent aliases I picked up in
testing.  To flush them I loop over all the vma's prio tree.  For a vma
shared by a lot of processes (like the ones in glibc) that's a pretty
large tree traversal.  Once we're sure we don't get inequivalent
aliases, I can apply the patch below and the lock will be held for a
minute fraction of what it was previously.


> Arm has some checks in __flush_dcache_aliase that may eliminate some
> flushes and reduce the time interrupts are disabled in flush_dcache_page,
> but I don't trust the VM_MAYSHARE one.
> 
> > > 3) Added a higher level lock to flush_dcache_page as I found in testing
> > >    that the user mappings appeared to change while the code iterated
> > >    over the user mappings.  Updated comment to better reflect the
> > >    current status WRT inequivalent aliases.  Only updated old_addr
> > >    for shared mappings.  This was simply to suppress the number of
> > >    "INEQUIVALENT" messages.  As noted previously, too many causes the
> > >    console getty process to stop working.  I think it may be possible
> > >    to further optimize this loop.
> > 
> > So this is a big problem.  The flush_dcache_mmap_lock/unlock is supposed
> > to be our protection against this.  If that's not working the generic
> > code is broken.  But I'm not clear what you think is changing.  The lock
> > protects the mapping prio tree ... that can't change as we iterate
> > otherwise we'll walk off a stale entry and go boom.  The actual status
> > of the mappings is allowed to change.
> 
> Specifically, what led me to assume that there was an issue with the
> code as is was various "INEQUIVALENT" messages with a difference between
> old_addr and addr of 0x150000.  This is the only difference other
> than +/- 0x1000 that I have seen.  The GCC libmudflap testsuite triggers
> a number of these odd messages.  Here's some samples.
> 
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x4014b000 and 0x4014a000 in file ld-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406b8000 and 0x40568000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406b9000 and 0x40569000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406ba000 and 0x4056a000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406bb000 and 0x4056b000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406bc000 and 0x4056c000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406bd000 and 0x4056d000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406be000 and 0x4056e000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406bf000 and 0x4056f000 in file libc-2.11.2.so
> Feb  6 04:50:56 mx3210 kernel: INEQUIVALENT ALIASES 0x406c1000 and 0x406c0000 in file libc-2.11.2.so
> 
> The messages occur because there is a core dump when the test is run is
> run by the expect/dejagnu framework.  I think all the messages above
> were generated by a single core dump.  The test doesn't fail when I compile
> and run manually.  From the above, I had the sense that the addresses
> were changing while the loop while it was being iterated.  With the extra
> lock, I haven't seen this. 
> 
> Possibly, the answer is to disable interrupts at the &mapping->i_mmap_lock
> lock, and skip VMAs if they are not in current mm.  What do you think?

They already are distabled by the flush_dcache_mmap_lock

Can we assume these addresses are some type of artifact and just apply
the patch below anyway?  On current parisc, it's what we do (we don't
flush anything beyond the first mapping).

James

---

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..c60cc42 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -276,10 +276,13 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 void flush_dcache_page(struct page *page)
 {
 	struct address_space *mapping = page_mapping(page);
-	struct vm_area_struct *mpnt;
+	struct vm_area_struct *mpnt = NULL;
 	struct prio_tree_iter iter;
 	unsigned long offset;
-	unsigned long addr, old_addr = 0;
+	unsigned long addr = 0;
+#ifdef DEBUG_ALIASES
+	unsigned long old_addr = 0;
+#endif
 	pgoff_t pgoff;
 
 	if (mapping && !mapping_mapped(mapping)) {
@@ -304,14 +307,25 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 
+#ifdef DEBUG_ALIASES
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
 			if (old_addr)
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
 			old_addr = addr;
 		}
+#else
+		break;
+#endif
 	}
 	flush_dcache_mmap_unlock(mapping);
+#ifndef DEBUG_ALIASES
+	/* since we have only one page, flush outside the lock.  If the loop
+	 * didn't happen (no mappings), mpnt will be NULL */
+	if (mpnt)
+		__flush_cache_page(mpnt, addr, page_to_phys(page));
+#endif
+
 }
 EXPORT_SYMBOL(flush_dcache_page);
 


