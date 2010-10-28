From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Thu, 28 Oct 2010 11:55:12 -0500
Message-ID: <1288284912.3043.151.camel@mulgrave.site>
References: <20101028060439.5FA924CFC@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: mikulas@artax.karlin.mff.cuni.cz, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101028060439.5FA924CFC@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2010-10-28 at 02:04 -0400, John David Anglin wrote:
> > > BTW. if you flush cache on kmap, I think it couldn't work in multithreaded 
> > > environment at all --- i.e. the program has "int a, b;" both variables 
> > > share the cacheline, one thread is accessing "a" via kmap and the other 
> > > thread writes to b directly, for example "b = 5". Then, cache flushing 
> > > won't help and one of the variables will be trashed. You need kmap address 
> > > to be congruent with the linear address. But I think it's not reason for 
> > > my crash because neither gmake nor bash (that crashes) is multithreaded.
> 
> Agree.
> 
> > That statement assumes the threads share a data structure but are not
> > congruent ... which certainly isn't true for userspace.  Our only
> > incongruency which gives rise to aliasing is between the kernel and user
> > address spaces and we don't do data sharing between the two without
> > pretty severe accessor restrictions.
> 
> My sense is the above isn't correct.  Even if userspace is congruent,
> it would seem to me that another thread could dirty the cache line after
> kmap does its flush.  The design of the Linux memory management system
> might prevent this from happening, but it's not obvious.

Look at it this way:  it only happens if the kernel and userspace share
a data structure, which they never do.  If they did, it wouldn't just
show up on parisc, it would be seen on every risc system (since they're
almost all VIPT).

A far more dangerous form of cache line induced incoherence is actually
DMA.  If you DMA into a line which the kernel also touches
simultaneously, only one modification will survive.  Again we fix this
with a similar ownership model: either the kernel uses the region or the
device driver.

>   That's why
> I thought the kernel should use also use congruent mappings.

That would be ideal, but unfortunately memory in the kernel is currently
at fixed mappings (the physical to virtual offset is fixed).  If we
could get all mappings congruent, we'd actually be operating the pa88/89
processors within spec instead of having to pull kmap tricks.  Ralf has
some strange mips system that needs full congruency as well ... it's
just I don't think he's managed to get it working yet.

James

> My 32-bit UP c3750 is fully stable.  It has run for months and I don't
> see any wierd segmentation faults in userspace doing gcc builds.  On
> the otherhand, the testcases on the wiki crash with high probabiity.
> So, I think we are dealing with two different, but possibly related
> issues.  One is a MP issue.  The other is a clone/fork race.
> 
> Dave


