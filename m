From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Wed, 10 Sep 2008 14:36:25 -0700
Message-ID: <200809101436.26162.david-b@pacbell.net>
References: <20080910140417.bc35c199.akpm@linux-foundation.org> <200809101419.05499.david-b@pacbell.net> <20080910.142047.265458325.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: rdunlap@xenotime.net, akpm@linux-foundation.org,
	James.Bottomley@hansenpartnership.com,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, alessandro.zummo@towertech.it,
	tglx@linutronix.de
To: David Miller <davem@davemloft.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080910.142047.265458325.davem@davemloft.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 10 September 2008, David Miller wrote:
> >=20
> > I don't think anyone in particular has been _pushing_ to resolve th=
ese
> > NTP related issues ... lack of urgency. =A0Maybe it's fair to think=
 of
> > that as a process issue. =A0If DaveM wants SPARC64 to completely re=
move
> > its legacy RTC support for some release (which?) then: =A0(a) great=
! and
> > (b) that should be sufficient urgency.
>=20
> Well, firstly my RTC sparc work is 2.6.28 targetted.

=46ine; Andrew and Thomas won't need to worry about this patch
for now, then.


> Secondly, that sleeping capability is only really needed for I2C base=
d
> RTC chips, of which sparc isn't currently making any use of.

Not quite right.  The RTC calls you make grabs a mutex; *ALL* calls
into the framework are made in task context.  Even if the underlying
RTC happens to be the type with registers on the CPU bus, where
there's no need to sleep when reading values.

Of course, you're very unlikely to sleep while waiting for that
mutex; or even while holding it, if you stick to Sun hardware.
Someone running Linux on one of the FPGA-based SPARCs might well
use an I2C based RTC though.

- Dave
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
