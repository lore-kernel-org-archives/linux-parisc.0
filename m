Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id B414B4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 14:25:31 -0600 (MDT)
Date: Sat, 10 May 2003 22:25:30 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Yet another '__canonicalize_funcptr_for_compare' pb
Message-ID: <20030510202529.GI27494@lug-owl.de>
References: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca> <3EBD61A5.8030205@tiscali.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MG8i8fjnGZSaPbFl"
In-Reply-To: <3EBD61A5.8030205@tiscali.be>
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

--MG8i8fjnGZSaPbFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-05-10 20:31:33 +0000, Joel Soete <joel.soete@tiscali.be>
wrote in message <3EBD61A5.8030205@tiscali.be>:
>=20
> The kernel seems to compiles well without err but it failled to build=20
> some module again because of '__canonicalize_funcptr_for_compare' needed=
=20
> in tun.o under drivers/net.

This leads me to ask: How do I localize wrong pointer compares?
Compiling 2.5.x with mostly everything compiled as module unhides quite
some modules with suffer from this problem. So is there any simple way
finding out at which address a call to
__canonicalize_funcptr_for_compare happens so that I can localize the
code line?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--MG8i8fjnGZSaPbFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+vWA5Hb1edYOZ4bsRApmNAJ9J5NS72a+uwRnGbGRscdEg8s9I/gCeJHlj
C5ugOxydGLULtPshSECNUUU=
=/4p6
-----END PGP SIGNATURE-----

--MG8i8fjnGZSaPbFl--
