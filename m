Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2E8B4879
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 18:10:07 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15n7hk-0003vb-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 02:10:04 +0200
Date: Sat, 29 Sep 2001 02:09:15 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-atomic __set_bit
Message-ID: <20010929020915.A24794@dogbert.localdomain>
References: <20010924021054.I3025@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
In-Reply-To: <20010924021054.I3025@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Is this going into CVS any time soon? It seems to work fine on my
720/50.

Regards,

Albert

On Mon, 24 Sep 2001, Carlos O'Donell Jr. wrote:

> parisc,
>=20
> Walking the source for devfs and thinking about Alberts problem.
>=20
> Would the non-working devfs be fixed by adding:
>=20
> Non-atomic versions of set_bit e.g. __set_bit=20
> and test_and_set_bit e.g. __test_and_set_bit
> to linux/include/asm-parisc/bitops.h?
>=20
> I have the latest CVS linux module.
> I've patched against that. It compiles now ;)
> (god bless make -j8)
>=20
> I'm currently sleepy, but I'll post the patch, and test
> it tommorow on a 712/60 and 715/50.
>=20
> c.

<patch snipped>

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tRErDg+hOeRZtkMRAh14AJoCYnOZg2hKzUNRWOOhCjpoXhRCVQCfUtNq
xg3/iMGnvbb+mJJeSHLuygQ=
=bEJt
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
