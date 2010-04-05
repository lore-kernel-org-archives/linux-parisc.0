From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 4 Apr 2010 22:51:53 -0400 (EDT)
Message-ID: <20100405025154.DE1D55160@hiauly1.hia.nrc.ca>
References: <4BB9312D.6030409@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: gniibe@fsij.org (NIIBE Yutaka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB9312D.6030409@fsij.org> from "NIIBE Yutaka" at Apr 5, 2010 09:39:09 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Thanks a lot for the discussion.
> 
> James Bottomley wrote:
> > So your theory is that the data the kernel sees doing the page copy can
> > be stale because of dirty cache lines in userspace (which is certainly
> > possible in the ordinary way)?
> 
> Yes.
> 
> > By design that shouldn't happen: the idea behind COW breaking is
> > that before it breaks, the page is read only ... this means that
> > processes can have clean cache copies of it, but never dirty cache
> > copies (because writes are forbidden).
> 
> That must be design, I agree.
> 
> To keep this condition (no dirty cache for COW page), we need to flush
> cache before ptep_set_wrprotect.  That's my point.
> 
> Please look at the code path:
>    (kernel/fork.c)
>    do_fork -> copy_process -> copy_mm -> dup_mm -> dup_mmap ->
>    (mm/memory.c)
>    copy_page_range -> copy_p*d_range -> copy_one_pte -> ptep_set_wrprotect
> 
> The function flush_cache_dup_mm is called from dup_mmap, that's enough
> for a case of a process with single thread.
> I think that:
> We need to flush cache before ptep_set_wrprotect for a process with
> multiple threads.  Other threads may change memory after a thread
> invokes do_fork and before calling ptep_set_wrprotect.  Specifically,
> a process may sleep at pte_alloc function to get a page.

I agree.  It is interesting that in the case of the Debian bug that
a thread of the parent process causes the COW break and thereby corrupts
its own memory.  As far as I can tell, the fork'd child never writes
to the memory that causes the fault.

My testing indicates that your suggested change fixes the Debian
bug.  I've attached below my latest test version.  This seems to fix
the bug on both SMP and UP kernels.

However, it doesn't fix all page/cache related issues on parisc
SMP kernels that I commonly see.

My first inclination after even before reading your analysis was
to assume that copy_user_page was broken (i.e, that even if a
processor cache was dirty when the COW page was write protected,
it should be possible to do the flush before the page is copied).
However, this didn't seem to work...  Possibly, there are issues
with aliased addresses.

I note that sparc flushes the entire cache and purges the entire
tlb in kmap_atomic/kunmap_atomic for highmem.  Although the breakage
that I see is not limited to PA8800/PA8900, I'm not convinced
that we maintain coherency that is required for these processors
in copy_user_page when we have multiple threads.

As a side note, kmap_atomic/kunmap_atomic seem to lack calls to
pagefault_disable()/pagefault_enable() on PA8800.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..b140d5c 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
+extern void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -456,17 +457,22 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	unsigned long new, old;
+#endif
+	pte_t old_pte = *ptep;
+
+	if (atomic_read(&mm->mm_users) > 1)
+		flush_cache_page(vma, addr, pte_pfn(old_pte));
 
+#ifdef CONFIG_SMP
 	do {
 		old = pte_val(*ptep);
 		new = pte_val(pte_wrprotect(__pte (old)));
 	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
 #else
-	pte_t old_pte = *ptep;
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
 #endif
 }
diff --git a/mm/memory.c b/mm/memory.c
index 09e4b1b..21c2916 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -616,7 +616,7 @@ copy_one_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	 * in the parent and the child
 	 */
 	if (is_cow_mapping(vm_flags)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
+		ptep_set_wrprotect(vma, src_mm, addr, src_pte);
 		pte = pte_wrprotect(pte);
 	}
 
