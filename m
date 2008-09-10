From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Wed, 10 Sep 2008 14:19:04 -0700
Message-ID: <200809101419.05499.david-b@pacbell.net>
References: <200809081629.21125.david-b@pacbell.net> <20080910140417.bc35c199.akpm@linux-foundation.org> <Pine.LNX.4.64.0809101407490.7159@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Miller <davem@davemloft.net>,
	James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, alessandro.zummo@towertech.it,
	Thomas Gleixner <tglx@linutronix.de>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0809101407490.7159@shark.he.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 10 September 2008, Randy.Dunlap wrote:
>=20
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D CUT ON THE DOTTED=
 LINE =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > Subject: ntp: let update_persistent_clock() sleep
> > > > From: "Maciej W. Rozycki" <macro@linux-mips.org>
> > >=20
> > > I see, as Paul mentioned this is needed for stuff like RTCs
> > > behind I2C.
> > >=20
> > > This change isn't in Linus's tree yet.
> >=20
> > Should it be?

IMO if it doesn't make 2.6.27, it should merge for 2.6.28 early-ish.

=20
> > Its current status is: stuck in -mm. =A0I've sent it to Thomas a co=
uple
> > of times marked "for 2.6.27?" and he might have applied it now (I'm=
 a
> > few days behind, waiting for linux-next to start up again).
>=20
> This is something that you can attempt (again) to address next week a=
long
> with other process issues...

I don't think anyone in particular has been _pushing_ to resolve these
NTP related issues ... lack of urgency.  Maybe it's fair to think of
that as a process issue.  If DaveM wants SPARC64 to completely remove
its legacy RTC support for some release (which?) then:  (a) great! and
(b) that should be sufficient urgency.

There was, I think, another patch related to this one.  Then there may
be a few other loose ends to tie up also.

- Dave
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
