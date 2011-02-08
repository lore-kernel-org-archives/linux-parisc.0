From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 08 Feb 2011 11:29:09 -0600
Message-ID: <1297186150.3088.81.camel@mulgrave.site>
References: <1295549658.3014.19.camel@mulgrave.site>
	 <20110208171532.GA286@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110208171532.GA286@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2011-02-08 at 12:15 -0500, John David Anglin wrote:
> On Thu, 20 Jan 2011, James Bottomley wrote:
> 
> > On parisc, we never implemented invalidate_kernel_vmap_range() because
> > it was unnecessary for the xfs use case.  However, we do need to
> > implement an invalidate for the opposite use case (which occurred in a
> > recent NFS change) where the user wants to read through the vmap range
> > and write via the kernel address.  There's an additional complexity to
> > this in that if the page has no userspace mappings, it might have dirty
> > cache lines in the kernel (indicated by the PG_dcache_dirty bit).  In
> > order to get full coherency, we need to flush these pages through the
> > kernel mapping before invalidating the vmap range.
> 
> The attached patch greatly improves SMP stability on my rp3440.  I
> have now done several full GCC builds with make -j4 without any random
> segmentation faults.  This is with the parisc next-for branch, built
> with gcc version 4.5.3 20110101 (prerelease) and binutils 2.21.51.20110108.
> 
> The change includes James' invalidate_kernel_vmap_range patch which
> as of last night, doesn't seem to be in linux-next..

doing this makes it a bit harder to see what you're changing.  It also
can't possibly affect your testing, because it's an edge case for xfs
journals currently.

> Notes:
> 
> 1) Changed spin_lock_irq to spin_lock in flush_dcache_mmap_lock because
>    the former causes a problem with timer interrupts.

This looks reasonable ... architectures which don't use the lock do
this.  Unfortunately, flush_dcache_page can be called from interrupt
context, so our only choices are to eliminate the lock or to use it in
an interrupt safe manner.  If we use a non interrupt safe lock, it will
cause a deadlock eventually.

> 2) Changed update_mmu_cache to return immediately if the PFN is not valid.
>    In testing, I found there was always a mapping, so this test was
>    eliminated.  I also changed to using test_and_clear_bit as on arm.

This is just an optimisation, so I'm fine with it.

> 3) Added a higher level lock to flush_dcache_page as I found in testing
>    that the user mappings appeared to change while the code iterated
>    over the user mappings.  Updated comment to better reflect the
>    current status WRT inequivalent aliases.  Only updated old_addr
>    for shared mappings.  This was simply to suppress the number of
>    "INEQUIVALENT" messages.  As noted previously, too many causes the
>    console getty process to stop working.  I think it may be possible
>    to further optimize this loop.

So this is a big problem.  The flush_dcache_mmap_lock/unlock is supposed
to be our protection against this.  If that's not working the generic
code is broken.  But I'm not clear what you think is changing.  The lock
protects the mapping prio tree ... that can't change as we iterate
otherwise we'll walk off a stale entry and go boom.  The actual status
of the mappings is allowed to change.

> 4) Changed arch_get_unmapped_area to enforce alignment of shared
>    MAP_FIXED regions as on arm.

This one looks good.

James


