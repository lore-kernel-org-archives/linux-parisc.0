Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E1BF482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 03:41:16 -0600 (MDT)
Date: Sat, 19 Jul 2003 11:41:15 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.6.0-test1-pa1 64bits failled to compile
Message-ID: <20030719094114.GC7452@lug-owl.de>
References: <3F0C24F800000FBF@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
In-Reply-To: <3F0C24F800000FBF@ocpmta8.freegates.net>
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

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-07-16 18:35:44 +0200, Joel Soete <jsoe0708@tiscali.be>
wrote in message <3F0C24F800000FBF@ocpmta8.freegates.net>:
> Hi all,
>=20
> This today cvs update failled to compile on my N4000-55 with this very sh=
ort
> message:
>=20
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> make: *** [.tmp_vmlinux1] Error 139
> palx4000:/usr/src/linux-2.6.0-test1-pa1#=20
>=20
> Is there some tips to get more verbose make output?

$ make V=3D1 vmlinux modules

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/GRI6Hb1edYOZ4bsRAmtjAJ9hQ8PI9ME14LKdasTaefLFhgMa6QCgg91D
o+JywbyhRM3bmudNunWRArA=
=mw9G
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
