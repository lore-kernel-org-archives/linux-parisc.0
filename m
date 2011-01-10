From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc: flush pages through tmpalias space
Date: Mon, 10 Jan 2011 23:44:42 +0300
Message-ID: <1294692282.6706.959.camel@mulgrave.site>
References: <1293034931.3019.8.camel@mulgrave.site>
	 <20110109215207.GA29305@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110109215207.GA29305@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-01-09 at 16:52 -0500, John David Anglin wrote:
> On Wed, 22 Dec 2010, James Bottomley wrote:
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
> 
> Since I began testing this change, I have started seeing problems with the
> console input on gsyprf11 and my rp3440.  If I HUP getty, the console works
> for awhile and then stops working again.  Suspect the "INEQIVALENT ALIAS"
> messages somehow kill the console.  I get a lot of these doing make check
> for GCC from the tests that intentionally generate a segv to test exception
> support.

In theory, the patch is actually stricter than our original flushing
support because it eliminates the ineffective flushes and detects
inequvalent aliases (and flushes all inequivalent addresses).

> I have also had at least one console related HPMC.  Analysis is attached.
> I don't fully understand the actual cause of the HPMC (buffer overrun?).
> The kernel was built with GCC 4.5.3.  The faulting instruction appears
> to have the base and index interchanged, although this shouldn't affect
> linux.  I thought this issue was fixed as a fair bit of work on this was
> done in the middle-end.
> 
> I have to say that gsyprf11 running a SMP kernel built with 4.5.3 is
> more stable with your change than it has been for a long time.

So I'm not sure what to make of this ... any memory fault shouldn't
result in a HPMC ... I probably need to decode the HPMC to see what its
saying ... I'll get around to that on the Weekend, hopefully.

James


