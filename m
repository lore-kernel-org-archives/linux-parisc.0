Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE8C148BA
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 06:49:56 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lVBJ-0001LJ-00
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 14:49:53 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15lVAg-0002In-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 14:49:14 +0200
Date: Mon, 24 Sep 2001 14:49:14 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924144914.D8726@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

And it worked for me! :-) Whooo, I netbooted my new kernel, and am now
attempting an install from the 0.9.2 CD-ROM (I have also set up a local
mirrorlet of the latest hppa packages, so I might try those too).

Regards,

Albert

On Mon, 24 Sep 2001, Jochen Friedrich wrote:

> Hi Albert,
>=20
> > After your changes (making case 18 fall through to case 28), I get the
> > following happy-and-warm-and-fuzzy message:
>=20
> As i said, the second patch didn't work for me, as well. The first one
> (fall through to case 26) did.
>=20
> Cheers,
> Jochen
>=20

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ryvKDg+hOeRZtkMRAsXwAJsHlM1EVcOF/PVpsW6KC+1/d19vLwCdGT22
21QNQYxFUB2efiZcmObtsVU=
=XN+L
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
