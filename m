From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sat, 12 Mar 2011 14:59:52 -0600
Message-ID: <1299963592.5366.26.camel@mulgrave.site>
References: <20110312170831.GA15698@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110312170831.GA15698@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2011-03-12 at 12:08 -0500, John David Anglin wrote:
> The attached change fixes the "SLOW!" timer_interrupt warning that I
> occassionally see on my rp3440 (800 MHz).  We need to avoid using the
> expensive div/mul method.  I have seen instances where it takes more
> than 0x7000 cycles.

> Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>
> 
> Dave

Your change implies that more than 2^6 == 64 ticks (that's over half a
second) can have elapsed between two calls to timer_interrupt().  That
looks like an awfully large lacuna, and is like the cause of whatever
problem you're seeing rather than the use of divide.  Parisc even has
the DS instruction that would seem to make division not so expensive.

How much more expensive is div than mul?  because if it's a lot more, we
can use a logarithmic iteration to do the division.

James


