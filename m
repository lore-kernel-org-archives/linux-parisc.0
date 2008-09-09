From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 19:52:35 -0700 (PDT)
Message-ID: <20080908.195235.200905674.davem@davemloft.net>
References: <200809081629.21125.david-b@pacbell.net>
	<20080908.164427.216880550.davem@davemloft.net>
	<200809081755.26148.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	alessandro.zummo@towertech.it
To: david-b@pacbell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809081755.26148.david-b@pacbell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: David Brownell <david-b@pacbell.net>
Date: Mon, 8 Sep 2008 17:55:25 -0700

> On Monday 08 September 2008, David Miller wrote:
> > From: David Brownell <david-b@pacbell.net>
> > Date: Mon, 8 Sep 2008 16:29:20 -0700
> > 
> > > That said, there's a bit of unresolved stuff around NTP hooks
> > > in the kernel.  Some patches are pending to let thtem work with
> > > the RTC framework -- where writing an RTC may need to sleep,
> > > for example because the RTC is on an I2C or SPI bus.  And
> > > then there's the discussion of whether that shouldn't all be
> > > handled by NTPD anyway, no special kernel support desired.
> > > Alessandro has opinions there.  ;)
> > 
> > My update_persistent_clock() on sparc64 is:
> > 
> > int update_persistent_clock(struct timespec now)
> > {
> > 	struct rtc_device *rtc = rtc_class_open("rtc0");
> 
> I'd be tempted to cache that ... notice how you never
> close it, too.  That will goof lots of refcounts...

Well if I cache it then we'll hold it forever and that's not
so nice right?

I'm going to put the missing rtc_close() in there for now to
fix the leak.

I'm happy to cache this if you think it's warranted, but then
this is like saying that the refcount doesn't matter :-)

> =============== CUT ON THE DOTTED LINE ==================
> Subject: ntp: let update_persistent_clock() sleep
> From: "Maciej W. Rozycki" <macro@linux-mips.org>

I see, as Paul mentioned this is needed for stuff like RTCs
behind I2C.

This change isn't in Linus's tree yet.
