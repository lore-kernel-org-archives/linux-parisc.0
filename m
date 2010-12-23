From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 22 Dec 2010 22:04:52 -0500
Message-ID: <20101223030451.GA4080@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293034931.3019.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 22 Dec 2010, James Bottomley wrote:

> The kernel has an 8M tmpailas space (originally designed for copying
> and clearing pages but now only used for clearing).  The idea is
> to place zeros into the cache above a physical page rather than into
> the physical page and flush the cache, because often the zeros end up
> being replaced quickly anyway.
> 
> We can also use the tmpalias space for flushing a page.  The difference
> here is that we have to do tmpalias processing in the non access data and
> instruction traps.  The principle is the same: as long as we know the physical
> address and have a virtual address congruent to the real one, the flush will
> be effective.
> 
> In order to use the tmpalias space, the icache miss path has to be enhanced to
> check for the alias region to make the fic instruction effective.

Very cool. "dependent" is misspelled in a couple places.  Will test.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
