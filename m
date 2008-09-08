From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 14:29:57 -0700
Message-ID: <200809081429.57805.david-b@pacbell.net>
References: <1220889205.8074.16.camel@localhost.localdomain> <200809081213.37705.david-b@pacbell.net> <1220905689.8074.68.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220905689.8074.68.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, James Bottomley wrote:
>=20
> > > OK, I can look at that, but in the mean time could we make the op=
tion
> > > that causes the damage unselectable?
> >=20
> > I'd worry if "the mean time" takes too long. =A0But lacking a
> > PARISC laptop to fix this on, I'm unlikely to complain much.
>=20
> What is the expectation? =A0If you're expecting all the architectures=
 to
> migrate over to RTC_CLASS, actually telling linux-arch and saying why
> its a good idea would have been helpful.

=46olk have been migrating already.  IMO there's no rush ... but
similarly, retrograde motion should be discouraged.  (Same issue
with essentially all legacy code in the tree.)


> All the PDC real time clock calls can do are read and set, nothing el=
se,
> so it's idealy suited to the GEN_RTC infrastructure ... what's the
> benefit in moving it to RTC_CLASS?

The same benefit always found in sharing infrastructure.  Lots
of little differences/bugs go away.  Infrastructure improvements
and bugfixes get leveraged.  Dead and crufticious code can vanish.
And so forth.


> > >=A0=A0=A0=A0=A0 This is technically a regression=20
> > > because before your patch GEN_RTC would override RTC_CLASS, now i=
t's the
> > > other way around.
> >=20
> > Well, previously there was no override ... I think you mean
> > that parisc just completely ignored RTC_CLASS, treating it
> > like junk DNA.
>=20
> No, it's a regression. =A0... =A0This turns off the ability to select
> GEN_RTC if you've said yes to RTC_CLASS. =A0Since RTC_CLASS is curren=
tly
> unsupported on parisc, we need to fix that by making the RTC_CLASS
> option unselectable on parisc.

So you affirmed that there was no override, AND that it was
previously treated as junk DNA (ignored).  So just what were
you disagreeing with me about??

I have a hard time calling something a regression which
was never really a supported configuration.  And which
still *JUST WORKS* in those defconfigs ... given all that,
it's hard to argue that something is actually broken.

Kconfig is not about letting Aunt Tillie configure kernels
without being able to shoot herself in the foot.  That
discussion has been had (at length!) before.  Result, we
have a much better kernel config framework ... but still
don't facilitate "Kconfig-4-dummiez" audiences.

- Dave

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
