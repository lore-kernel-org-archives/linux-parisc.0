From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 29 Dec 2010 08:49:43 -0600
Message-ID: <1293634183.2803.2.camel@fuzzy>
References: <1293034931.3019.8.camel@mulgrave.site>  <4D166793.30901@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4D166793.30901@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-12-25 at 22:52 +0100, Helge Deller wrote:
> On 12/22/2010 05:22 PM, James Bottomley wrote:
> > The kernel has an 8M tmpailas space (originally designed for copying
> > and clearing pages but now only used for clearing).  The idea is
> > to place zeros into the cache above a physical page rather than into
> > the physical page and flush the cache, because often the zeros end up
> > being replaced quickly anyway.
> > 
> > We can also use the tmpalias space for flushing a page.  The difference
> > here is that we have to do tmpalias processing in the non access data and
> > instruction traps.  The principle is the same: as long as we know the physical
> > address and have a virtual address congruent to the real one, the flush will
> > be effective.
> > 
> > In order to use the tmpalias space, the icache miss path has to be enhanced to
> > check for the alias region to make the fic instruction effective.
> > 
> > Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> 
> Hi James,
> 
> Cool, I assume this patch intends to fix the "Threads and fork on
> VIPT-WB machines" bug as described here:
> http://wiki.parisc-linux.org/TestCases ?

Well, not really ... it's meant  to provide data to fix that case.  The
theory behind them is that if we flush in the wrong place (say after the
mapping has been torn down), then the flush becomes ineffective.  The
idea of flushing through the tmpalias space is that the flush becomes
effective regardless of placement.  I didn't really think we had any
ineffective flushes, but it's good to demonstrate that.

> I did some initial testing and it seems to really fix it...
> I'll continue testing during the next few days (with 2.6.37-rc7-32bit).

That's an interesting data point ... it certainly doesn't fix the
problem with me on pa8800 SMP.

James


