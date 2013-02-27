From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: parisc: fix compile warnings triggered by atomic_sub(sizeof(),v)
Date: Thu, 28 Feb 2013 00:09:05 +0100
Message-ID: <5949791.xCBY7uv0Ms@donald.sf-tec.de>
References: <20130227221137.GA2806@p100.box> <20130227221552.GA2817@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3775036.HZBe2hny2s"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130227221552.GA2817@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3775036.HZBe2hny2s
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Helge Deller wrote:

> atomic_sub() is defined as
> and if VAL is of type unsigned int (as returned by sizeof()), negating
> this value will overflow. Fix this by type-casting VAL to int type:

Something in the first line of the message seems missing.

Eike
--nextPart3775036.HZBe2hny2s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlEukhcACgkQXKSJPmm5/E48uACfTp7yYg2s1WydQFuYZjN41UJT
wxQAoJ0gZPludkFQGK+yjQFdrB4L03gf
=01GF
-----END PGP SIGNATURE-----

--nextPart3775036.HZBe2hny2s--

