Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59409482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 05:56:22 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15wj7R-0005EC-00
	for parisc-linux@lists.parisc-linux.org; Thu, 25 Oct 2001 13:56:17 +0200
Date: Thu, 25 Oct 2001 13:55:48 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Kenneth Westelinck <kennywest1@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] very odd problem
Message-ID: <20011025135548.C17203@dogbert.localdomain>
References: <F128WXpA1DHstgNogS400011dde@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
In-Reply-To: <F128WXpA1DHstgNogS400011dde@hotmail.com>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I had this same problem on i386 -- I think it's a dependancy bug that
gets exposed during installation (ppp depending on libpcap, I think),
which causes some setup scripts to fail during installation.

Look for a start-stop-daemon.REAL file and copy it over your
start-stop-daemon. I think that should solve the problem. Or I'm utterly
confused... which is probably more likely. :-)

Regards,

Albert

On Thu, 25 Oct 2001, Kenneth Westelinck wrote:

> Hi all,
>=20
>=20
> I've recently installed the test-release of woody on my 712/60. I've also=
=20
> compiled a recent kernel available from the parisc-linux site. All works=
=20
> well, except from a very strange problem. The start-stop-daemon call, whi=
ch=20
> is used throughout the init scripts, doesn't seem to work. So, executing =
the=20
>=20
> inetd script results in nothing, not even an error. Starting inetd on the=
=20
> command line (/usr/sbin/inetd) works great. Is there a known bug in the=
=20
> start-stop-daemon program? Can this be solved, or will I have to rewrite =
my=20
> init scripts?
>=20
> Many thanks in advance.
>=20
>=20
> regards,
>=20
> Kenneth

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE71/3EDg+hOeRZtkMRArmNAJ0e7I9xSEinnOMa8oTvnPgEEEaZ+ACcD6gd
x4eYqs1y6BRFugn0oD//H10=
=7YGE
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
