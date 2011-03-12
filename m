From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sat, 12 Mar 2011 18:36:17 -0500 (EST)
Message-ID: <20110312233617.CA5D9500F@hiauly1.hia.nrc.ca>
References: <1299963592.5366.26.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1299963592.5366.26.camel@mulgrave.site> from "James Bottomley" at Mar 12, 2011 02:59:52 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On Sat, 2011-03-12 at 12:08 -0500, John David Anglin wrote:
> > The attached change fixes the "SLOW!" timer_interrupt warning that I
> > occassionally see on my rp3440 (800 MHz).  We need to avoid using the
> > expensive div/mul method.  I have seen instances where it takes more
> > than 0x7000 cycles.
> 
> > Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>
> > 
> > Dave
> 
> Your change implies that more than 2^6 == 64 ticks (that's over half a
> second) can have elapsed between two calls to timer_interrupt().  That
> looks like an awfully large lacuna, and is like the cause of whatever
> problem you're seeing rather than the use of divide.  Parisc even has
> the DS instruction that would seem to make division not so expensive.

No, it's not ticks.  It's cycles.  One cycle is 1/800000000 of a second
on my rp3440, so another factor of two didn't seem that expensive.  I
think the change is ok even on a 75 MHz machine.

> How much more expensive is div than mul?  because if it's a lot more, we
> can use a logarithmic iteration to do the division.

I agree that there are probably better ways to do the caculation.  I'm
not sure of the exact numbers but div is always significantly more
expensive than multiplication.  The current code probably divides twice.

If one is willing to save a couple fp regs, 32-bit hardware multiplication
is available.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
