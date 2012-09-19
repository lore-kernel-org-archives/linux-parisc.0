From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: I have 12GB of RAM but I can only use 1GB?
Date: Wed, 19 Sep 2012 08:06:24 +0200
Message-ID: <2698994.p4ZeTnMdFO@donald.sf-tec.de>
References: <CAE2sS1i5E9FDB_5aw+mTySEysOjuLjOQn7S_pOL5-EMBOudqPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2720737.2tFQ6dA53e"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1i5E9FDB_5aw+mTySEysOjuLjOQn7S_pOL5-EMBOudqPg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2720737.2tFQ6dA53e
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

You wrote:
> Team,
> 
> I recently setup my rp3440 in order to get back into more active
> development for hppa.
> 
> I noticed that in 3.6.0-rc6 I get the following message:
> ~~~
> This Machine has more memory ranges than we support!
> Some memory will not be used!
> parisc_cache_init: Only equivalent aliasing supported!
> Total Memory: 1024 MB
> ~~~
> 
> Which sucks since I have 12GB of RAM in this box and I want to use all of
> it.
> 
> If nobody has run into this problem then I'll just go digging, but I
> thought I'd ask here first.

IIRC you need CONFIG_DISCONTIGMEM.

Eike
--nextPart2720737.2tFQ6dA53e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlBZYOkACgkQXKSJPmm5/E57BACeMyMCoJb5dRDbWG2AaGQPBhRw
trAAmwW+BfD/W33MM/HehNhil/yNtqrN
=4oX6
-----END PGP SIGNATURE-----

--nextPart2720737.2tFQ6dA53e--

