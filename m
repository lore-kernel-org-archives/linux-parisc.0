Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31B594840
	for <parisc-linux@parisc-linux.org>; Mon, 24 Nov 2003 10:09:33 -0700 (MST)
Date: Mon, 24 Nov 2003 18:09:32 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20031124170931.GB1037@lug-owl.de>
References: <20031123213657.GT1037@lug-owl.de> <200311232145.hANLjo4i028914@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Xzo4JcPtd4sZwMc"
In-Reply-To: <200311232145.hANLjo4i028914@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] [OT] VAX toolchain (was: Tool chain pb)
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

--6Xzo4JcPtd4sZwMc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-11-23 16:45:50 -0500, John David Anglin <dave@hiauly1.hia.nrc.=
ca>
wrote in message <200311232145.hANLjo4i028914@hiauly1.hia.nrc.ca>:

> > I thrust you - bad for me; I'm currently looking at vax-linux, where we
> > use an quite dated compiler...
>=20
> There is one outstanding PR for the vax which causes labels to be deleted
> after a case insn.  If this gets fixed, you probably should be able to
> switch to GCC 3.4.  I know C builds at -O1.

Not even HEAD binutils will work unpatched for vax-linux (it's missing
Linux glue code as well as configure need to recognize vax-linux (or
vax-dec-linux-gnu)... It's just that there are really little people
interested in Linux on a VAX and thus, even all the work needed to keep
catching up with HEAD is a hard time...

However, *BSD does already support VAX somewhat and I hope that we maybe
can profit from that fact, esp for GCC.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--6Xzo4JcPtd4sZwMc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/wjtLHb1edYOZ4bsRAocnAJ43bBkdmvWfjT7fAJYkIly/ZJyW0wCeNSw5
K9+MuVMfNt7ueeKujNB5zKs=
=8QP5
-----END PGP SIGNATURE-----

--6Xzo4JcPtd4sZwMc--
