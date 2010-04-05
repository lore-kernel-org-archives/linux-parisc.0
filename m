From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 05 Apr 2010 09:39:09 +0900
Message-ID: <4BB9312D.6030409@fsij.org>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de>	 <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org>	 <4BB5594C.8050505@fsij.org> <1270179025.18981.19.camel@mulgrave.site>	 <4BB568FB.1090908@fsij.org> <1270210927.2899.27.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1270210927.2899.27.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thanks a lot for the discussion.

James Bottomley wrote:
> So your theory is that the data the kernel sees doing the page copy can
> be stale because of dirty cache lines in userspace (which is certainly
> possible in the ordinary way)?

Yes.

> By design that shouldn't happen: the idea behind COW breaking is
> that before it breaks, the page is read only ... this means that
> processes can have clean cache copies of it, but never dirty cache
> copies (because writes are forbidden).

That must be design, I agree.

To keep this condition (no dirty cache for COW page), we need to flush
cache before ptep_set_wrprotect.  That's my point.

Please look at the code path:
   (kernel/fork.c)
   do_fork -> copy_process -> copy_mm -> dup_mm -> dup_mmap ->
   (mm/memory.c)
   copy_page_range -> copy_p*d_range -> copy_one_pte -> ptep_set_wrprotect

The function flush_cache_dup_mm is called from dup_mmap, that's enough
for a case of a process with single thread.

I think that:
We need to flush cache before ptep_set_wrprotect for a process with
multiple threads.  Other threads may change memory after a thread
invokes do_fork and before calling ptep_set_wrprotect.  Specifically,
a process may sleep at pte_alloc function to get a page.
-- 
