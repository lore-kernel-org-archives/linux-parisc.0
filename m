Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE5DE4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 08:29:38 -0700 (MST)
Date: Thu, 3 Apr 2003 17:29:37 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.20 build error
Message-ID: <20030403152936.GN23095@lug-owl.de>
References: <5849494679bc7010.79bc701058494946@unitec.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ie5iOtK4e9kgqh2F"
In-Reply-To: <5849494679bc7010.79bc701058494946@unitec.edu>
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

--Ie5iOtK4e9kgqh2F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-04-03 08:55:11 -0600, Ricardo Jose Guevara Ochoa <jguevara@uni=
tec.edu>
wrote in message <5849494679bc7010.79bc701058494946@unitec.edu>:
> >=20
> > turn on CONFIG_PROC_FS
>=20
> Where do i turn it on? in a file /arch/parisc/defconfig it's already=20
> turn on.

"make menuconfig" or "make config" of "make xconfig" or ...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--Ie5iOtK4e9kgqh2F
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+jFNgHb1edYOZ4bsRAu7wAKCRLQ0FlW+PXlVcghjTcxGFzkFsiQCfQ6Qk
3Shs8RyXyYDAdhOHvwx0a58=
=ogf1
-----END PGP SIGNATURE-----

--Ie5iOtK4e9kgqh2F--
