Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79B11482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 04:05:11 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15ndT8-0004Vh-00
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Sep 2001 12:05:06 +0200
Date: Sun, 30 Sep 2001 12:04:11 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Cumulative patch for 720
Message-ID: <20010930120411.A28209@dogbert.localdomain>
References: <200109291339.JAA28860@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
In-Reply-To: <200109291339.JAA28860@mail.lokmail.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Has anyone been able to apply this patch? I'm quite anxious to test it,
but patch doesn't like it. The first bit applies but then 5 HUNKs fail.

It might be that my MUA, or Jurij's MUA is mangling the patch. If you've
managed to get it working, could you perhaps reply to this message with
the patch attached? Thanks!

Regards,

Albert

On Sat, 29 Sep 2001, Jurij Smakov wrote:

> Hi!
>=20
> I've put together Jochen's patch of trap 18 and patch
> for trap 11, corrected according to Matthew's and Jochen's
> remarks, which will supposedly make all 720 people very=20
> happy :-). It compiles, at least.
>=20
> Jurij

<patch snipped>

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tu4bDg+hOeRZtkMRArtmAJ9RqvWlj9A21aHmpetH0TJmGWvo2ACdHaAr
Lb2Ohgd6N2eQC+/XO2jOSzA=
=Qeuv
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
