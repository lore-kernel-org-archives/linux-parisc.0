Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21A6A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 23:46:25 -0600 (MDT)
Date: Thu, 8 May 2003 07:46:09 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030508054607.GP27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3m6VNgM56Nljn+Yv"
Subject: [parisc-linux] [PATCH-linux-2.5] Add missing include to OProfile
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

--3m6VNgM56Nljn+Yv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

With OProfile <m>odularized, this patch is needed to build it:


Index: arch/parisc/oprofile/init.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/arch/parisc/oprofile/init.c,v
retrieving revision 1.4
diff -u -r1.4 init.c
--- arch/parisc/oprofile/init.c	5 May 2003 17:05:49 -0000	1.4
+++ arch/parisc/oprofile/init.c	8 May 2003 05:43:41 -0000
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/oprofile.h>
 #include <linux/init.h>
+#include <linux/errno.h>
 =20
 extern void timer_init(struct oprofile_operations ** ops);
=20


MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--3m6VNgM56Nljn+Yv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ue8eHb1edYOZ4bsRAmDaAJ0RmfwXekvokDQ5QIniwrBjrr6pswCgkCr6
iS46iQgBZzkFlbNLEUqBBxQ=
=k/Ua
-----END PGP SIGNATURE-----

--3m6VNgM56Nljn+Yv--
