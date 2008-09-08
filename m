From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 16:32:25 -0700
Message-ID: <200809081632.26166.david-b@pacbell.net>
References: <200809081429.57805.david-b@pacbell.net> <20080908.160441.124972717.davem@davemloft.net> <1220916186.8074.84.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: David Miller <davem@davemloft.net>, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220916186.8074.84.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, James Bottomley wrote:
>=20
> > All the powerpc folks are doing is providing a dummy shim into the
> > RTC layer using their machine description vector, and not really us=
ing
> > the RTC layer drivers at all.
>=20
> But realistically that's all we need. =A0Our RTC is controlled by two
> calls into firmware: a get and a set; nothing else. =A0We don't have =
the
> docs to get at the clock without the firmware calls.

True for PARISC ... but not for PowerPC.  Lots of PowerPC
system boards use off-the-shelf RTCs with more capabilities
than the machine description vector acknowledges.

- Dave

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
