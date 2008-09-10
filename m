From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Wed, 10 Sep 2008 14:20:47 -0700 (PDT)
Message-ID: <20080910.142047.265458325.davem@davemloft.net>
References: <20080910140417.bc35c199.akpm@linux-foundation.org>
	<Pine.LNX.4.64.0809101407490.7159@shark.he.net>
	<200809101419.05499.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Cc: rdunlap@xenotime.net, akpm@linux-foundation.org,
	James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, alessandro.zummo@towertech.it,
	tglx@linutronix.de
To: david-b@pacbell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809101419.05499.david-b@pacbell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46rom: David Brownell <david-b@pacbell.net>
Date: Wed, 10 Sep 2008 14:19:04 -0700

> On Wednesday 10 September 2008, Randy.Dunlap wrote:
> >=20
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D CUT ON THE DOTT=
ED LINE =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > Subject: ntp: let update_persistent_clock() sleep
> > > > > From: "Maciej W. Rozycki" <macro@linux-mips.org>
> > > >=20
> > > > I see, as Paul mentioned this is needed for stuff like RTCs
> > > > behind I2C.
> > > >=20
> > > > This change isn't in Linus's tree yet.
> > >=20
> > > Should it be?
>=20
> IMO if it doesn't make 2.6.27, it should merge for 2.6.28 early-ish.
>=20
> =20
> > > Its current status is: stuck in -mm. =A0I've sent it to Thomas a =
couple
> > > of times marked "for 2.6.27?" and he might have applied it now (I=
'm a
> > > few days behind, waiting for linux-next to start up again).
> >=20
> > This is something that you can attempt (again) to address next week=
 along
> > with other process issues...
>=20
> I don't think anyone in particular has been _pushing_ to resolve thes=
e
> NTP related issues ... lack of urgency.  Maybe it's fair to think of
> that as a process issue.  If DaveM wants SPARC64 to completely remove
> its legacy RTC support for some release (which?) then:  (a) great! an=
d
> (b) that should be sufficient urgency.

Well, firstly my RTC sparc work is 2.6.28 targetted.

Secondly, that sleeping capability is only really needed for I2C based
RTC chips, of which sparc isn't currently making any use of.

PowerPC folks do, however, use I2C based RTC chips right now I thought?
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
