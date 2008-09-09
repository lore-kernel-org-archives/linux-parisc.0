From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 20:17:23 -0700
Message-ID: <200809082017.24152.david-b@pacbell.net>
References: <200809081629.21125.david-b@pacbell.net> <200809081755.26148.david-b@pacbell.net> <20080908.195235.200905674.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	alessandro.zummo@towertech.it
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080908.195235.200905674.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, David Miller wrote:
>=20
> > > int update_persistent_clock(struct timespec now)
> > > {
> > > =A0=A0=A0=A0struct rtc_device *rtc =3D rtc_class_open("rtc0");

One more point:  that should probably use CONFIG_RTC_HCTOSYS_DEVICE
instead of hard-wiring to "rtc0".  Yeah, I'm sure your SPARCs have
lots of RTCs to choose from -- not! -- but I'd like to see you end
up with code that many folk can reuse/recycle/pirate.  ;)


> >=20
> > I'd be tempted to cache that ... notice how you never
> > close it, too. =A0That will goof lots of refcounts...
>=20
> Well if I cache it then we'll hold it forever and that's not
> so nice right?

Why wouldn't it be, so long as it's eventually closed
to prevent leakage?  Other code can rtc_class_open() too;
unlike a userspace open("/dev/rtc0", ...) this isn't an
exclusive operation.


> I'm going to put the missing rtc_close() in there for now to
> fix the leak.
>=20
> I'm happy to cache this if you think it's warranted, but then
> this is like saying that the refcount doesn't matter :-)

If you're concerned about stuff like "rmmod my-i2c-rtc-driver"
losing (or "rmmod my-i2c-rtc-driver's-i2c-adapter") ... what's
supposed to happen is that you start getting an -ENODEV return
from your rtc_set_mmss() call, and then you close and null your
cached handle to free up its memory.

The next time you go through this routine you'd see nothing
is cached and then try to get an RTC.  Maybe it's available
again; maybe not.

- Dave
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
