Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDC654842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 09:48:53 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15maye-0004RC-00
	for parisc-linux@lists.parisc-linux.org; Thu, 27 Sep 2001 15:13:20 +0200
Date: Thu, 27 Sep 2001 15:04:55 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010927150455.A21456@dogbert.localdomain>
References: <200109271223.IAA32108@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
In-Reply-To: <200109271223.IAA32108@mail.lokmail.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

A quick glance at arch/parisc/hardware/inventory.c reveiled the
following:

long status;
unsigned int bus_id;
=2E..
status =3D pdc_model_info(&model);
bus_id =3D (model.hversion >> (4 + 7)) & 0x1f;

switch (bus_id) {
case 0x4:               /* 720, 730, 750, 735, 755 */

I don't know if all these models have the same CPU. I'm guessing not.

I also see a parisc_get_cpu_type(...) in arch/parisc/kernnel/hardware.c.
This is probably what you want.

Regards,

Albert

On Thu, 27 Sep 2001, Jurij Smakov wrote:

> > The CPU in the 720 will treat this as a priviledged instruction. The
> > changes "signal 18 -> signal 26, signal 27, signal 28" and "allow read
> > access to CR26 and CR27 for non-priviledged access" are documented as n=
ew
> > for the PA7100LC processor, so they are not available in the 720.
> >=20
> > Another thing to emulate on the old 720/50 platform...
> >=20
> > Cheers,
> > Jochen
>=20
> It does not seem so complicated... Even with my rudimentary C programming
> skills :-). I'll try to put something together. Is there a way to check
> if we are running on a 720?
>=20
> Jurij.
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7syP3Dg+hOeRZtkMRAkN8AJ9fS8loUr9uSC1YTcwc/KLY/4s8gQCgh/+g
laDcckL/ozdZu2x6+ach9Eo=
=+717
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
