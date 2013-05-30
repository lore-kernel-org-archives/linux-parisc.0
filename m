From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix race conditions flushing user cache pages
Date: Thu, 30 May 2013 08:11:30 -0700
Message-ID: <1369926690.1972.18.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP84F3DE8CE6D8B9F60C5C2597970@phx.gbl>
	 <1369925711.1972.11.camel@dabdike.int.hansenpartnership.com>
	 <51A769B6.50801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51A769B6.50801@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2013-05-30 at 17:01 +0200, Helge Deller wrote:
> On 05/30/2013 04:55 PM, James Bottomley wrote:
> > On Tue, 2013-05-28 at 08:09 -0400, John David Anglin wrote:
> >> There are two issues addressed by this patch:
> >>
> >> 1) When we flush user instruction and data pages using the kernel  
> >> tmpalias region, we need to
> >> ensure that the local TLB entry for the tmpalias page is never  
> >> replaced with a different mapping.
> >> Previously, we purged the entry before and after the cache flush  
> >> loop.  Although preemption was
> >> disabled, it seemed possible that the value might change during  
> >> interrupt processing.  The patch
> >> removes the purge and disables interrupts during the initial TLB entry  
> >> purge and cache flush.
> >>
> >> 2) In a number of places, we flush the TLB for the page and then flush  
> >> the page.  We disabled
> >> preemption around the flush.  This change disables preemption around  
> >> both the TLB and cache
> >> flushes as it seemed the effect of the purge might be lost.
> >>
> >> Without this change, I saw four random segmentation faults in about  
> >> 1.5 days of intensive package
> >> building last weekend.  With the change, I haven't seen a single  
> >> random segmentation fault in about
> >> one week of building Debian packages on 4-way rp3440.  So, there is a  
> >> significant improvement
> >> in system stability.
> > 
> > an rp3440 is PA2.0, so you weren't really testing any of the tlb purge
> > locking changes.
> 
> Which kind of system do we need to test those "tlb purge locking changes" (PAx.y)?

the #ifdef is CONFIG_PA20, so any 1.x system should work.  The actual
locks are only needed for the Merced systems, which are N class because
they have an architectural bug where there can only be one purge active
on the CPU bus at any one time.

> At least I can confirm, that Dave's patches have made all my systems 
> absolutely stable.

Can we try the proper fix before things like disabling interrupts.
copy_page_asm and clear_page_asm don't have the necessary purges at the
end.  I don't think this ever mattered for clear_page_asm since it's
only used in the memory backend for pages going to userspace (so not at
interrupt), but for some reason we've suddenly started using
copy_page_asm, which could be used at interrupt.

I honestly don't think we should be using copy_page_asm at all.  The
speed up we get from it isn't realised because we have to flush the
cache after we've finished to try and make I/D coherence.  This makes
the call the same cost as the kmapped memcpy but requires twice the
tmpalias space to be allocated because of the from and to mappings.

James

> > Also, I don't know what happened, but the actual tmpalias theory
> > requires a TLB purge before and after and I though we used to have them.
> > The reason is twofold:
> > 
> >      1. You don't want the caches to speculate in the tmpalias region
> >      2. A flush after makes the routines interrupt safe (because you can
> >         interrupt in a tmpalias operation, do another tmpalias
> >         operation, purge the cache and restart within the non interrupt
> >         tmpalias and expect everything to work).
> > 
> > Trying to disable interrupts sounds like problem 2.  Can we return to
> > the proper tmpalias operations rather than trying to hack around them?
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



