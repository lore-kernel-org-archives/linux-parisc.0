Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48625484E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Sep 2003 11:31:34 -0600 (MDT)
Date: Thu, 18 Sep 2003 19:31:33 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] update of libc?
Message-ID: <20030918173133.GG12661@lug-owl.de>
References: <20030918113157.000037fb.t.riemer@visoel.de> <20030918160249.GC30890@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K4TeRK2lnUi9hBXL"
In-Reply-To: <20030918160249.GC30890@systemhalted>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--K4TeRK2lnUi9hBXL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-18 12:02:49 -0400, Carlos O'Donell <carlos@baldric.uwo.ca>
wrote in message <20030918160249.GC30890@systemhalted>:
> On Thu, Sep 18, 2003 at 11:31:57AM +0200, Tilo Riemer wrote:
> > is it dangerous to make an update of libc from 2.2.5 to 2.3.x?
> > At the moment I have only remote access to the affected host.
>=20
> There is no 2.3.x glibc available for debian, it's currently being
> fixed. I apologize for the delay, it's more difficult than usual.

No?

b132l-1:~# dpkg -l libc6
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: upperc=
ase=3Dbad)
||/ Name           Version        Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ii  libc6          2.3.1-17.0.3   GNU C Library: Shared libraries and Timez=
one

For me, that one works and seems to be 2.3.x... However, what are
current libc's problems?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--K4TeRK2lnUi9hBXL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/aev0Hb1edYOZ4bsRAtT/AJ9jWSvyTBUH4e35BZ9j4w8LHgmuMACggsqi
julCxZtF6NMSmL5pzouRzjA=
=gBiK
-----END PGP SIGNATURE-----

--K4TeRK2lnUi9hBXL--
