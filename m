From: Modestas Vainius <modestas@vainius.eu>
Subject: Re: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Sun, 6 Jun 2010 04:01:23 +0300
Message-ID: <201006060401.31700.modestas@vainius.eu>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <4C0850CB.20703@fsij.org> <20100604052106.GC15860@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1341859.vx6RKDSJfl";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: NIIBE Yutaka <gniibe@fsij.org>, 561203@bugs.debian.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	deller@gmx.de, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, carlos@systemhalted.org
To: dann frazier <dannf@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100604052106.GC15860@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1341859.vx6RKDSJfl
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On penktadienis 04 Bir=C5=BEelis 2010 08:21:06 dann frazier wrote:
> > My case and my analysis talked about UP kernel, and John David Anglin
> >=20
> > made a patch:
> > 	http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D561203#144
> >=20
> > After that, the discussion went to SMP cases.
> >=20
> > It would be better to evaluate the patch again, and make sure it works
> > for UP case and fix failures of buildd, then apply for Linux in Debian
> > (only) for HPPA.
> >=20
> > I know that the patch is not that ideal because it touches
> > architecture independent part of Linux, but it is worth for Linux in
> > Debian (or Linux for the HPPA machine of buildd, at least).
>=20
> I'm happy to test the patch if necessary to help push this change
> upstream. However, we do need the change to go upstream before we can
> include it in the Debian kernel.

I made a hackish patch for QProcess in Qt (usleep(1000) before fork()) whic=
h=20
seems to reduce likelihood of the failure to very rare again. Once a new=20
revision of qt4-x11 is uploaded to sid (soon I believe), KDE applications=20
should be able to build again (hopefully).

Obviously it would be better to get this bug fixed for real but at least no=
w=20
the whole KDE stack won't be held by it while we wait.

=2D-=20
Modestas Vainius <modestas@vainius.eu>

--nextPart1341859.vx6RKDSJfl
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwK82QACgkQHO9JRnPq4hTSrwCfdE8oBE0g7nZKkJX4mMgawSrg
W8wAn2SlnbRLATsYGkPdccDenUUASyOq
=Vyi+
-----END PGP SIGNATURE-----

--nextPart1341859.vx6RKDSJfl--
