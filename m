Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85C32482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 21:08:47 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15ledz-0007rN-00
	for parisc-linux@lists.parisc-linux.org; Tue, 25 Sep 2001 00:56:07 +0200
Date: Tue, 25 Sep 2001 00:47:00 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Don't Use base tarballs (was Re: [parisc-linux] nfsroot login problems on 720/50)
Message-ID: <20010925004700.A9663@dogbert.localdomain>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net> <20010922015609.A14166@dogbert.localdomain> <20010924203757.BCCE337DDD@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
In-Reply-To: <20010924203757.BCCE337DDD@carmen.fc.hp.com>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, 24 Sep 2001, Matt Taggart wrote:

> Albert Strasheim writes...
>=20
> > Should I try the base tarball (same date... :-( ) or is that known to be
> > bad too?
>=20
> Neither are "bad" just out of date. As soon as we had a real installer=20
> everyone switched over to using that. They were left there for historical=
=20
> reasons.
>=20
> I have moved them to an old directory to prevent confusion. No one should=
 be=20
> using these any more. If, for some good reason, you can't use the normal=
=20
> installer process then I think the proper way to generate base tarballs n=
ow is=20
> to use the debootstrap tool. If there's enough demand then we could gener=
ate=20
> them and put them on the ftp site again.

I'd gotten as far as debootstrapping woody up to the point where all the
packages were installed. As you might imagine, running binaries in the
chroot on my i386 didn't work too well :-)

If it is at all possible, could you please generate new tarballs? I'm
not sure if it is possible to complete the installation on my 720/50, so
the tarball will really go a long way to getting some userland apps
running so that I can perhaps provide better information for the real
hackers who are figuring out the unaligned trap stuff.

Regards,

Albert

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7r7fjDg+hOeRZtkMRAhVnAJ9QD0vevsMwBEBKAIUR3GCcAsvv1wCfYDGa
gfdEYqYLKlU6Ea93SblIxT8=
=Zi5D
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
