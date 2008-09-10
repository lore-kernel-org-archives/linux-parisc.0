From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Wed, 10 Sep 2008 14:09:31 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0809101407490.7159@shark.he.net>
References: <200809081629.21125.david-b@pacbell.net>
 <20080908.164427.216880550.davem@davemloft.net> <200809081755.26148.david-b@pacbell.net>
 <20080908.195235.200905674.davem@davemloft.net> <20080910140417.bc35c199.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Miller <davem@davemloft.net>, david-b@pacbell.net,
	James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, alessandro.zummo@towertech.it,
	Thomas Gleixner <tglx@linutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080910140417.bc35c199.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 10 Sep 2008, Andrew Morton wrote:

> On Mon, 08 Sep 2008 19:52:35 -0700 (PDT)
> David Miller <davem@davemloft.net> wrote:
> 
> > From: David Brownell <david-b@pacbell.net>
> > Date: Mon, 8 Sep 2008 17:55:25 -0700
> > 
> > > On Monday 08 September 2008, David Miller wrote:
> > > > From: David Brownell <david-b@pacbell.net>
> > > > Date: Mon, 8 Sep 2008 16:29:20 -0700
> > > > 
> > > > > That said, there's a bit of unresolved stuff around NTP hooks
> > > > > in the kernel.  Some patches are pending to let thtem work with
> > > > > the RTC framework -- where writing an RTC may need to sleep,
> > > > > for example because the RTC is on an I2C or SPI bus.  And
> > > > > then there's the discussion of whether that shouldn't all be
> > > > > handled by NTPD anyway, no special kernel support desired.
> > > > > Alessandro has opinions there.  ;)
> > > > 
> > > > My update_persistent_clock() on sparc64 is:
> > > > 
> > > > int update_persistent_clock(struct timespec now)
> > > > {
> > > > 	struct rtc_device *rtc = rtc_class_open("rtc0");
> > > 
> > > I'd be tempted to cache that ... notice how you never
> > > close it, too.  That will goof lots of refcounts...
> > 
> > Well if I cache it then we'll hold it forever and that's not
> > so nice right?
> > 
> > I'm going to put the missing rtc_close() in there for now to
> > fix the leak.
> > 
> > I'm happy to cache this if you think it's warranted, but then
> > this is like saying that the refcount doesn't matter :-)
> > 
> > > =============== CUT ON THE DOTTED LINE ==================
> > > Subject: ntp: let update_persistent_clock() sleep
> > > From: "Maciej W. Rozycki" <macro@linux-mips.org>
> > 
> > I see, as Paul mentioned this is needed for stuff like RTCs
> > behind I2C.
> > 
> > This change isn't in Linus's tree yet.
> 
> Should it be?
> 
> Its current status is: stuck in -mm.  I've sent it to Thomas a couple
> of times marked "for 2.6.27?" and he might have applied it now (I'm a
> few days behind, waiting for linux-next to start up again).

This is something that you can attempt (again) to address next week along
with other process issues...

Maybe travel time/delay is also involved (for people other than Mr. Rothwell).


> It was not included in Thomas's recent mainline pull request:
> 
> From: Thomas Gleixner <tglx@tglx.de>
> Subject: [GIT pull] timer updates for 2.6.27
> Date: Tue, 9 Sep 2008 22:32:39 +0200 (CEST)

-- 
~Randy
