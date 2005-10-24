From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: [PATCH 3/9] mm: parisc pte atomicity
Date: Mon, 24 Oct 2005 17:49:22 +0100 (BST)
Message-ID: <Pine.LNX.4.61.0510241714280.4543__24617.4028645784$1416624566$gmane$org@goblin.wat.veritas.com>
References: <Pine.LNX.4.61.0510221716380.18047@goblin.wat.veritas.com>
	<Pine.LNX.4.61.0510221722260.18047@goblin.wat.veritas.com>
	<20051022163330.GD3364@parisc-linux.org>
	<1130000925.6461.15.camel@mulgrave>
	<Pine.LNX.4.61.0510230930470.19527@goblin.wat.veritas.com>
	<1130079931.3437.21.camel@mulgrave>
	<Pine.LNX.4.61.0510240441570.22402@goblin.wat.veritas.com>
	<1130165784.3325.13.camel@mulgrave>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: Andrew Morton <akpm@osdl.org>,
 parisc-linux@parisc-linux.org,
 linux-kernel@vger.kernel.org,
 Matthew Wilcox <matthew@wil.cx>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1130165784.3325.13.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Good, I think we're converging.

On Mon, 24 Oct 2005, James Bottomley wrote:
> On Mon, 2005-10-24 at 05:36 +0100, Hugh Dickins wrote:

> Actually, I think what we need to ascertain is whether _PAGE_FLUSH is
> still necessary.  A long time ago, Linux would do stupid things like
> clear the page table entry and then flush (which is legal on PIPT
> architectures like x86).  If it's no longer doing that then we no-longer
> need to worry about _PAGE_FLUSH.

I can't quite work out the sequence here.  That issue was fixed four
years ago in 2.4.10: I sent the patch which moved the flush_cache_page
in vmscan.c, incorporating one posted by NIIBE Yutaka and David Miller,
to get SH right.  Whereas PA-RISC's _PAGE_FLUSH got added a year later
in 2.4.20 and 2.5.45.

Ah, yes, it got switched around the wrong side again in 2.5, because
the pte_chains rmap (based on 2.4.9) propagated that error for a while.
Well, it's simply an error if flush_cache_page is called after clearing
the pte, and it now looks like _PAGE_FLUSH was the wrong fix.  It would
be a nice simplification if you can now get rid of _PAGE_FLUSH (but I
won't be sending patches to do that myself).

> > > For the flush to be effective in the VIPT cache, we have to have a
> > > virtual address with a valid translation that points to the correct
> > > physical address.  I suppose we could flush through the tmpalias space
> > > instead.  That's where we set up an artifical translation that's not the
> > > actual vaddr but instead is congruent to the vaddr so the mapping is
> > > effective in cache aliasing terms.  Our congruence boundary is 4MB, so
> > > we set up a private (per cpu) 4MB space (tmpalias) where we can set up
> > > our pte's (or actually manufacture them in the tlb miss handler)
> > > securely.
> 
> Well ... it appeals because we could now implement flush_dcache_page()
> without walking the vmas.  All we need is the offset (because vm_start
> is always congruent) which we can work out from the page->index, so we
> never need any locking.

If the overhead of setting them up and flushing them out after is low,
then yes, using your own tmpalias area sounds much better than getting
involved in the vma_prio_tree stuff.  ARM would then be the only
architecture having to dabble in that.

> No ... we'll go with the racer already did it theory, I think ...

Okay, just don't blame me if it's horribly wrong ;)
I've simply not wrapped my head around the races, and would
need a much better understanding of SMP on PA-RISC to do so.

Right, it looks like we agree that my patch is necessary and valid as is;
but that the further races which worried me are not an issue, because the
racer will have done the necessary flush_cache_page.  And two cleanups may
be done later: remove _PAGE_FLUSH, and use tmpalias instead of vma_prio_tree.

Hugh
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
