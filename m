Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABCC34879
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 15:44:36 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nRuR-0008Mf-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 23:44:31 +0200
Date: Sat, 29 Sep 2001 23:43:36 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-atomic __set_bit
Message-ID: <20010929234336.A26195@dogbert.localdomain>
References: <20010924021054.I3025@megatonmonkey.net> <20010929020915.A24794@dogbert.localdomain> <20010929132719.A15266@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
In-Reply-To: <20010929132719.A15266@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

There's a CONFIG_DEVFS_MOUNT option that mounts it at boot. I know I
used fdisk on /dev/scsi/somedamnthing/part3/block10/orifice99 or
somesuch :-)

If init is croaking, you need devfsd perhaps?

But here it works fine.

Regards,

Albert

On Sat, 29 Sep 2001, Carlos O'Donell Jr. wrote:

> > Hello,
> >=20
> > Is this going into CVS any time soon? It seems to work fine on my
> > 720/50.
> >=20
> > Regards,
> >=20
> > Albert
> >=20
>=20
> Albert,
>=20
> Have you booted a devfs kernel on you box?
> Does it seem to function properly?
>=20
> Adding devfs to my kernel causes some odd stuff to go on after
> trying to enter INIT. Though I haven't had time to sort it out.
> The kernel boots fine, but probably one of the startup scripts
> is doing something decidedly wrong.
>=20
> Since you are using init=3D/bin/sh, and unless you tell devfs
> to explicitly mount at boot, you won't _really_ be using=20
> devfs :)
>=20
> Sure, it compiles... and it looks like it should work.
> But theory and practice are so different it's not funny.
>=20
> <Carlos looks back at the RF Amplifier design he has on the
> whiteboard and chuckles>
>=20
> c.
>=20
> >=20
> > > parisc,
> > >=20
> > > Walking the source for devfs and thinking about Alberts problem.
> > >=20
> > > Would the non-working devfs be fixed by adding:
> > >=20
> > > Non-atomic versions of set_bit e.g. __set_bit=20
> > > and test_and_set_bit e.g. __test_and_set_bit
> > > to linux/include/asm-parisc/bitops.h?
> > >=20
> > > I have the latest CVS linux module.
> > > I've patched against that. It compiles now ;)
> > > (god bless make -j8)
> > >=20
> > > I'm currently sleepy, but I'll post the patch, and test
> > > it tommorow on a 712/60 and 715/50.
> > >=20
> > > c.
> >=20
> > <patch snipped>
>=20
>=20

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tkCIDg+hOeRZtkMRAmhdAJwKFtaQwICypTHjLWwSataaN7/KJACfb1W4
U4RACxd7UeK/nWduZ/Np0GE=
=DSEe
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
