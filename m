From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 16:37:40 -0500
Message-ID: <1220909860.8074.77.camel@localhost.localdomain>
References: <1220889205.8074.16.camel@localhost.localdomain>
	 <200809081213.37705.david-b@pacbell.net>
	 <1220905689.8074.68.camel@localhost.localdomain>
	 <200809081429.57805.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809081429.57805.david-b@pacbell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2008-09-08 at 14:29 -0700, David Brownell wrote:
> > No, it's a regression.  ...  This turns off the ability to select
> > GEN_RTC if you've said yes to RTC_CLASS.  Since RTC_CLASS is currently
> > unsupported on parisc, we need to fix that by making the RTC_CLASS
> > option unselectable on parisc.
> 
> So you affirmed that there was no override, AND that it was
> previously treated as junk DNA (ignored).  So just what were
> you disagreeing with me about??

The fact that the override you put in to disable GEN_RTC is causing a
regression.

> I have a hard time calling something a regression which
> was never really a supported configuration.  And which
> still *JUST WORKS* in those defconfigs ... given all that,
> it's hard to argue that something is actually broken.

On 2.6.25 the parisc users got a working realtime clock.  On 2.6.26 they
can find themselves without one using the same .config file.  This is
the regression.  The fix is to disable RTC_CLASS until we have it
working for parisc.

> Kconfig is not about letting Aunt Tillie configure kernels
> without being able to shoot herself in the foot.  That
> discussion has been had (at length!) before.  Result, we
> have a much better kernel config framework ... but still
> don't facilitate "Kconfig-4-dummiez" audiences.

Kconfig is complex enough that we try not to trip users up by hiding
things, especially when it's the wrong thing to hide on this platform.
If an option specifically doesn't work or causes harm on a platform, it
shouldn't be selectable on that platform.  This isn't Aunt Tillieism,
this is called common sense.

James


