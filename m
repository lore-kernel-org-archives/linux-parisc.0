Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70C894829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 23:41:20 -0600 (MDT)
Date: Thu, 8 May 2003 07:41:18 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030508054118.GO27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LXESt2jNC8oCvz8w"
Subject: [parisc-linux] [PATCH-build-tools] Generate linux-2.5 tarball
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

--LXESt2jNC8oCvz8w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Playing with 2.5.x, I think we'd also push out a 2.5.x snapshot. Here's
the patch:


Index: mk.cvs.tarballs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/build-tools/mk.cvs.tarballs,v
retrieving revision 1.6
diff -u -r1.6 mk.cvs.tarballs
--- mk.cvs.tarballs	24 Oct 2001 20:27:19 -0000	1.6
+++ mk.cvs.tarballs	8 May 2003 05:38:21 -0000
@@ -7,7 +7,7 @@
=20
 ################### Lots of stuff you may want to customize here ######
 # List of stuff in CVS to package
-PACKAGES=3D'linux palo gcc gdb'
+PACKAGES=3D'linux linux-2.5 palo gcc gdb'
=20
 # Number of older tarballs to keep around
 KEEP=3D3


MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--LXESt2jNC8oCvz8w
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ue3+Hb1edYOZ4bsRAh8XAJ9RUIGCL4AawLFqDq93qjyRGxjvwQCfbTmG
amthogTl1Xe7EJr3cEF+GYA=
=Euse
-----END PGP SIGNATURE-----

--LXESt2jNC8oCvz8w--
