From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 21:14:00 -0700
Message-ID: <200809082114.01347.david-b@pacbell.net>
References: <200809081755.26148.david-b@pacbell.net> <200809082017.24152.david-b@pacbell.net> <20080908.205128.192725776.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	alessandro.zummo@towertech.it
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080908.205128.192725776.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, David Miller wrote:
> > > > > =A0=A0=A0=A0struct rtc_device *rtc =3D rtc_class_open("rtc0")=
;
> >=20
> > One more point:  that should probably use CONFIG_RTC_HCTOSYS_DEVICE
> > instead of hard-wiring to "rtc0".  Yeah, I'm sure your SPARCs have
> > lots of RTCs to choose from -- not! -- but I'd like to see you end
> > up with code that many folk can reuse/recycle/pirate.  ;)
>=20
> Can you be more specific?  Oh, you want me to use the string defined
> by that config option.  Ok :-)
>=20
> But as far as I can tell this will only be set of RTC_HCTOSYS and
> users currently are allowed to not set that.
>=20
> If this code goes somewhere generic you would need to ifdef test on
> that, depending upon where you'd want to put it and how it would
> be provided generically.

OK.


> > > > I'd be tempted to cache that ... notice how you never
> > > > close it, too. =A0That will goof lots of refcounts...
> > >=20
> > > Well if I cache it then we'll hold it forever and that's not
> > > so nice right?
> >=20
> > Why wouldn't it be, so long as it's eventually closed
> > to prevent leakage?  Other code can rtc_class_open() too;
> > unlike a userspace open("/dev/rtc0", ...) this isn't an
> > exclusive operation.
>=20
> When would be "eventually closed" if I open it here and remember
> the pointer in a static local variable, and don't close it?
>=20
> I guess you need to be more specific about what you mean by
> caching :)

I'll translate that as "-ENOPATCH".  :)

It'd suffice to fire a timer every 15 minutes or so, and
close it if the NTP logic hasn't refreshed the clock since
last time.  You're right that the simplest scheme is to just
open/close on each call.  The extra work is so infrequent it
may not be measurable.


> > If you're concerned about stuff like "rmmod my-i2c-rtc-driver"
> > losing (or "rmmod my-i2c-rtc-driver's-i2c-adapter") ... what's
> > supposed to happen is that you start getting an -ENODEV return
> > from your rtc_set_mmss() call, and then you close and null your
> > cached handle to free up its memory.
>=20
> I see... god that's ugly.  If you want to do this in the generic
> RTC layer helper routines,

=2E.. when they get created ...


> 	that's fine, but I don't feel like=20
> adding all sorts of stuff like that to the sparc specific routine
> at the moment.
>=20
> I'm trying to do things that are practical and that I can check
> into sparc-next-2.6 right now.

OK by me.



--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
