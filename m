From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Patch for segfaults in minifail tests
Date: Mon, 3 May 2010 17:54:30 -0400
Message-ID: <20100503215429.GA168@hiauly1.hia.nrc.ca>
References: <20100501231355.851335057@hiauly1.hia.nrc.ca> <1272757191.4570.97.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	T-Bone@parisc-linux.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1272757191.4570.97.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 01 May 2010, James Bottomley wrote:

> On Sat, 2010-05-01 at 19:13 -0400, John David Anglin wrote:
> > Hi Helge,
> > 
> > > I tried your patch on top of a 2.6.33.2 kernel (SMP, 32bit, PA8500 (PCX-W) CPU).
> > > I still do see all the page faults as before. They even seem to trigger 
> > > faster than with a few of Dave's patches.
> > > 
> > > I usually run this command
> > > 	i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail_dave; done;
> > > in a few screen sessions in parallel.
> > 
> > The reason running multiple screens in parallel exposes further problems
> > is the implementation of ptep_set_wrprotect is broken.  It simply sets the
> > write protect bit in the pte and doesn't purge the existing translation.
> > So, the parent continues to merrily write to the write protected page until
> > the TLB entry is purged and reloaded.  More processes make it more likely the
> > entry will be replaced and trigger a COW break.
> > 
> > This is why my versions of the minifail test which monitor the stack region
> > used by the thread don't cause a COW break immediately after the fork.  When
> > compiled at -O0, the loop index is constantly being stored to the stack.
> 
> Actually, no, this explanation isn't correct.

I stand by the observation that COW breaks do not happen when expected,
or consistently with the minifail testcase.

> The way linux works.  You can see roughly how this works in
> copy_page_range() where we prepare the COW.  If it's going to be a COW
> range, we call mmu notifiers before and after the pte settings.  The
> after mmu notifier is supposed to flush the TLB.   Linux always does
> memory operations in the form
> 
> prepare();
> do_something_with_the_ptes()
> activate()

That is certainly consistent with the existing code in pgtable.h.
The ptes can only be handled in this manner if there is a different
page table for each process.  I couldn't find the notifier hooks...
include/asm-generic/pgtable.h contains flush implementations which
do the TLB flush for several pte operations.  However, there is no
generic implementation of ptep_set_wrprotect as far as I can tell.

In the minifail testcase, we have three processes: "parent", "thread"
and "child".  Parent and thread have the same space id.  Child has
a different space id and therefore a different global virtual address
range.  All processes reference the same physical memory.

The ptes for parent and thread have to be consistent since the idtlbt
instruction will remove one or more entries whose virtual address ranges
overlap the virtual address range of the new translation.  Parisc
cpus have a relatively small translation lookaside buffer; so when
many processes are running, it is easy to lose an entry.  If we lose
entries, a page could randomly alternate from being write protected
to not write protected.

As far as I can tell, copy_one_pte only write protects the mms for
the parent (src_pte) and the child (pte).  The pte of thread is not
write protected.  As far as I can tell, we don't purge TLBs on
context switches, so it would appear that we have to have a consistent
set of ptes for all processes with the same space id.

Originally, I had assumed that parent and thread had the same page
directory.  In that case, one has to handle race conditions in setting
and updating ptes.  My rp3440 is more stable when I try to force
insertion of the write protect bit.  However, there are still some faults
that look like cache corruption when I push the system load up.

> It's only after the activate() through the mmu notifiers that we're
> supposed to be consistent.
> 
> Now the outstanding question is whether we're correctly hooked into the
> post mmu update notifier ... but I suspect we are (sorry, heading to a
> plane for boston, will try to check this next week).

Hope you spot something.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
