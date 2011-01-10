From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Mon, 10 Jan 2011 17:18:09 -0500
Message-ID: <20110110221809.GA4396@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20110109215207.GA29305@hiauly1.hia.nrc.ca> <1294692282.6706.959.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1294692282.6706.959.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 10 Jan 2011, James Bottomley wrote:

> > Since I began testing this change, I have started seeing problems with the
> > console input on gsyprf11 and my rp3440.  If I HUP getty, the console works
> > for awhile and then stops working again.  Suspect the "INEQIVALENT ALIAS"
> > messages somehow kill the console.  I get a lot of these doing make check
> > for GCC from the tests that intentionally generate a segv to test exception
> > support.
> 
> In theory, the patch is actually stricter than our original flushing
> support because it eliminates the ineffective flushes and detects
> inequvalent aliases (and flushes all inequivalent addresses).

It might be that I only became aware of the console issue while
testing your patch.  Probably, I should retest without the patch.
It might just have to do with console messages and not cache flushing.

The stricter flushing would definitely appear to be an improvement
and indeed the messages have been useful in locating inequivalent
aliases.

As I have found, we have inequivalent aliases for almost every executable
when the boundary between text and data isn't exactly on a page boundary.
I would think this would be an issue for all machines with a VIPT
architecture, so I'm surprised that it hasn't come up before.

I'm a bit worried about the ordering of the flushes on processors that
don't support inequivalent aliases.  It would appear we generally flush
the text page first with the current code.

I can still cause random segvs on rp3440 if I use make -j4 or higher
building GCC ;(

> > I have also had at least one console related HPMC.  Analysis is attached.
> > I don't fully understand the actual cause of the HPMC (buffer overrun?).
> > The kernel was built with GCC 4.5.3.  The faulting instruction appears
> > to have the base and index interchanged, although this shouldn't affect
> > linux.  I thought this issue was fixed as a fair bit of work on this was
> > done in the middle-end.
> > 
> > I have to say that gsyprf11 running a SMP kernel built with 4.5.3 is
> > more stable with your change than it has been for a long time.
> 
> So I'm not sure what to make of this ... any memory fault shouldn't
> result in a HPMC ... I probably need to decode the HPMC to see what its
> saying ... I'll get around to that on the Weekend, hopefully.

That would be great.  I don't have the documentation needed to decode
HPMCs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
