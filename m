Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947253;
	b=sVFZPDe8qHtd1tOeODUANLTm0AIJ+oXhG9IAsOj615Wl73PRIPZOKAUjULyWvrT/Ne+r
	 0EiRwo+FrtSgOdJ3bHSsSsZjk+SaLYCsCc8kUZeUcR+s/7aufeErBH0UM5YsxgkOwjPDO
	 KjIIU8gwaHR0HjsDwkUh8yZ45YjVsjoaJTZix5hWtun2UtXT3iifQ9T+1dxCDdLDA4Nux
	 knhCWarfhPbMfR9MAOsg/3b93BF/D2n+J5oiVgOebF/WGLY4Q/IKUZzk2GyAE6puHqTq+
	 U3EbM70EwKdDgUy+R3cMOPmcsYPDHLs9agqBKYo59j+oZ3fGIxjkiCzdrZ6z16WWYzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947253;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0K4LX8vHyeQb4elECgTw4WSG47DoSYK9jFouZNBcbZQ=;
	b=ujYqzwi5rUshAK1kd1rs5oDuoj428XRtPsdsIACzFrn61ymNNjjX/YvQ1VvYe8fZujS6
	 58wJyEFmMpz1gXd0MekvFqvrbNAzQ5v0P9TfOmWwVKDZIu6xhsNBaCPE7GicCnTjZ/aHk
	 CzPyIzWlLtrlU8ziwdzpiBaV/vyyub/UL3BJmySVanzOvq7dilx2vFh8plc1wYwBnfy5l
	 9/zZqBcomG/retoGuvHba6O6RO1+8Oe0prQ1bvYI6eDZXMyNNVT3m2e7GB3FrRZaGMQfS
	 vfynr0Wlibpz9FNSrsDz2RRdJ5aXS8yrvqxFa9r9qAK6OuGPP2kOAZ/+Gnk5fs+M/3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UghTkaEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B0606A31C;
	Tue, 17 Nov 2026 20:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UghTkaEc
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C7740201CD2;
	Tue, 17 Nov 2026 21:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794947245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0K4LX8vHyeQb4elECgTw4WSG47DoSYK9jFouZNBcbZQ=;
	b=UghTkaEclQnflPF0k+3jj1NTGUfFVNWEzOXAF9Zixj7Fz3cWNydaiwWzDgvag5scekfyce
	aIKuR/DZoOCQgwB0LEVSY+pkPJJO11g5vDFeB5CI2nDUbGq0fIvhlVB0lMO+0NJgEFGnKr
	HB3A3SUhUzcXSeBDviHa2hVsJBL2DDK3u6Gew02zTmLxsF6mc/wC7TdXF7VLvFI5Fgx5ML
	7aiaw2MWBHumv+Pb8hBBQ9C3VXnK7Hjl+fD52/7VwJiNuqNMAbm3uQBkztC0iOaZBXx2C3
	jYMhhL+lgoBTxS0CyNfYvXstjt1zQKWebZnFO+ybEdGqpMjy9R820MZsat+Geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794947245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0K4LX8vHyeQb4elECgTw4WSG47DoSYK9jFouZNBcbZQ=;
	b=KqabZHJQNEFw/Ff4Qd2Ai1uyr1VcSO2h1JCelfzZR7WKe8GkI1hS95/NT5f5N3niu5/99t
	hf0ky4YHBeHRLkOetL3NmjsJ91W6Ola1s6VEtEHKKyvgTqy8GxuMx/bepWXWhYc9c0GUMN
	wvfnfpvDstySoMcnJTlbhR6sGF8eUwAtKg5XYuItFPdr6fzlv62zzp1Bzoob4xUGPd5Tqg
	VTcEyVBBdUa3b04mOslqslZrTufgTWVbj0Bcm/z8BMSDHqk2LewjfcifH4WFiUvPDHGvEq
	Q8OzNcGY61edXo7VYH0d2SKMr3Xf4+2Xt3Pko6/Q5i//KwD3xI07xX+E/u9Fxw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794947245; a=rsa-sha256;
	cv=none;
	b=JJuLEELvFVKDZjoaUl8LlsEBQP2PcfRX/oVhHQeiu17KcGkKpx1ENsPRuCi5fDYzMbw/tr
	i2Hc691+86J2hlVYMcpBX/4kKZ/RxJ6BA0NTqkrdKlBzzgpRDZfvi66I+AE+qZZwso67N6
	gYZvNSjLgZsObwE3PtNPECaLTo3V4+5SrspUXwwb3j/BGFlAsbhF8i/TQXcUr4SakFgyvT
	O1S6aVMJR8hKLUM2SRLJfHgh+hCSgVRN9+Ia2wZNZMQgU/+Rl1SU0wTnQzohKTxGOIyHQ+
	ejoUKwhvgCalh9JjKBU+B8O9vLWbz7+sRO9wv2hIsAJ37Gdph7WEG0hsP0EuMQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Tue, 17 Nov 2026 21:27:23 +0100
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
Message-ID: <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
References: <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
 <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="4o2s6ei4jugbfyrx"
Content-Disposition: inline
In-Reply-To: <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com>


--4o2s6ei4jugbfyrx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
MIME-Version: 1.0

On 17.11.2026 09:46:55, Ian Rogers wrote:
> > There was discussion and I learned a lot about the nitty gritty details
> > of compilers, optimization and UB. But the problem is still in the
> > mainline tree. What can we do about it? Is reverting an option?
>
> I see the config option was picked up here:
> https://lore.kernel.org/lkml/179423891136.2093942.13129678709622655290.ti=
p-bot2@tip-bot2/

Doh! Thanks for the pointer.

Sorry for the noise,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--4o2s6ei4jugbfyrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavy4qQAKCRDMOmT6rpmt
0vg+APdvvM2Iskb9gv5qpr4WY6IRMeaAUst3fvfxjfLj/vP6AQCWUNLFwHbqkpMU
623t5UhDFbRLVwUm03fZWrszl8nABg==
=ANI3
-----END PGP SIGNATURE-----

--4o2s6ei4jugbfyrx--
