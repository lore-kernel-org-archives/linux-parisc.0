Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954412;
	b=J1XI/Qqnk0giMWHdSCj1s0Kq3Ltyl3fczpKKTjxjpriHOXlz50yAjkAT+ADHtB+UxusY
	 BjdDJcdTssAem8wulexeRFcrhe0+NsJP6JAJfobEM+EEWltybeg078RxrPtJ+UtamVdnT
	 D1feVyBCkiDxBw6noCIS1Vv7W+qkD6M5kLi1I7rvSGhAQFIaMytK2V92hhYxGGuOOLu2R
	 vDCh1nfXd2oPGiXLNFz9TKYKivEItEYGYYuYVjnjp3zFQo2vLCzUJrNvWx5WG1tS0WxcN
	 4IBStNTv3VUdVZ3taGwTrpX+eX1+15l0FTdiqp0kGWqYVEwsDUqQJn2Kd+AutRap+Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954412;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/31bCM2ovlpu2K4bSt5f7VHuu+LiqSKydvIPGk5RvOQ=;
	b=fsWJzLkew7Y5a9hHFuxig9bgJ2yspB5I2Flm0FZ5sp44Y2crvT1iElXU7MalQGVy3wB3
	 HyGuOeIPbtV46nBGqw5cfwNG2jX6YWssF3o3g1771/wcgZ/Hdh3neOI3XKC0VGI9IUarv
	 mUPDw2zkjeL5Qjfz2XZoSVqrxxcd4kV81vhYpcwF4FWGgdHyXcv0yGyzaDNYt+HvCapBc
	 9iN30wki1Vtp8IWi5RyORUm0uV7sEwRWsRj0tdVoU4L02YlkEaMqtUyYs1aBnSugf9WRC
	 RxFWM1yO023RlssVEPNrh0aCMXm/AERCDFuJ8YsWjUveQXBHeqs4RaBEdf4+4QhxSmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RmRboVBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95183606A32F;
	Tue, 17 Nov 2026 22:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95183606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RmRboVBj
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 04A67200668;
	Tue, 17 Nov 2026 23:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794954405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/31bCM2ovlpu2K4bSt5f7VHuu+LiqSKydvIPGk5RvOQ=;
	b=RmRboVBj1cinEoHlfIjH3pAYV/+mOZ/4ZXDMSnvrK1cygQd5bbUC9mRAj0H+KzE9TRPiIw
	UbitB/gQ+Sc5t5NucY6rdRIzI8BnMr093lO/WYltokH8fBdfgWK1zTqiqw1DG2VQ+gB8J0
	q/aCfKLYSYH3gKoHlVHnrNwK/ylBikfBmNX8DhNo+4+bRcacQXUF8DIpQhZaLfZ8u5iays
	2r6VqnYFwFwi9kF4uR2e5OLmnh4tPuuB4LZQOsZpbs/MtRN6UQ03WXltWUW/7vJfaSZnis
	ZztQZB+LipQItCgxgOvumlRy8D6EXNTyG9LTMWD9pz2khdBHHw6EkZiV8w3MZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794954405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/31bCM2ovlpu2K4bSt5f7VHuu+LiqSKydvIPGk5RvOQ=;
	b=QifEOcgbuJMqe+ZgyUXsQQ2tfBzqunZv6fB4sigQl24qGtMOsXj1uHsu4fwicXVqz+pRys
	h6S0h81e4qC+01ibeea5O8QvfFKxi9+I3Rrhv5VRbEk01vYZf2Dr8WwCEHn0CxNKC+EUuD
	Tf4SXR2kilPK1miSS8yxdDJcOThl/Sbf9FaNh/t/hBql2vdboI/fdhP3sMOqboPkOQd7jP
	A75NRHoCNJM/WR9oO8ZLzWPFDgay8hdzF4TLgV0iJXhWFX5jy/RpHFbUbu8exklhAFFsMZ
	IfG21VjXd3Qv1tUi1zw8m2ooyDKAvezpWp1C54fP3kndGl3dHVcqrG3z27enYw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794954405; a=rsa-sha256;
	cv=none;
	b=D398tp43DV4i9gHd449DjbQeI0zVvVKQxeD/I1YeuSiWR9NPybg+0BsEfG2eqVzc9hDPOj
	WgA9/6DZx9lu5Cmuw6RJfWCrhFrE6/yD8tiIe1YyWw4RHyZF/i1MY7NmahXO6RiSomOsJm
	jZx2VbGn3/yJ/3grCQNa7J/S9sF2Svw/TjsBWG0aAdYYm72N4iSS3Qz0GEdf+vlnffv4gV
	mE+AUdj5zLknAisWJjJaXsQ/GdIUhVkCt3lkeP907kSNmjNOvpo/xW33W1IKsgFF/zH1om
	PXZa0ORiPcqQH9YZxqg5Fcne7IcnAFxHjPoI6Zp1u5IU8QH9zcu2AICDDvT9gQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Tue, 17 Nov 2026 23:26:44 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261117-slick-limpet-of-sympathy-854a75-mkl@pengutronix.de>
References: <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
 <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com>
 <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
 <CAP-5=fUKf7631fhmRLjVJXgKG1mm79vC5xSE3ZHm0XZMXo4=4g@mail.gmail.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ezspz7rpbzcunzbd"
Content-Disposition: inline
In-Reply-To: <CAP-5=fUKf7631fhmRLjVJXgKG1mm79vC5xSE3ZHm0XZMXo4=4g@mail.gmail.com>


--ezspz7rpbzcunzbd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
MIME-Version: 1.0

On 17.11.2026 14:15:06, Ian Rogers wrote:
> On Tue, Nov 17, 2026 at 12:27=E2=80=AFPM Marc Kleine-Budde <mkl@pengutron=
ix.de> wrote:
> >
> > On 17.11.2026 09:46:55, Ian Rogers wrote:
> > > > There was discussion and I learned a lot about the nitty gritty det=
ails
> > > > of compilers, optimization and UB. But the problem is still in the
> > > > mainline tree. What can we do about it? Is reverting an option?
> > >
> > > I see the config option was picked up here:
> > > https://lore.kernel.org/lkml/179423891136.2093942.1312967870962265529=
0.tip-bot2@tip-bot2/
> >
> > Doh! Thanks for the pointer.
>
> No worries, sorry for the regression. Have bugs been filed against GCC
> and LLVM regarding this?

Not from our side.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ezspz7rpbzcunzbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavzUoQAKCRDMOmT6rpmt
0hMOAQDfpkg1+zcIV1FijzuP8ZYH3oW+VKc0WORBedv2aYjY/QD2KiW7KmJ2oRsD
MJOxZoIZJRHV6awEtm/g5IfBWuKNAQ==
=39gN
-----END PGP SIGNATURE-----

--ezspz7rpbzcunzbd--
