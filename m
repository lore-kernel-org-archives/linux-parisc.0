Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03DAF4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 23:55:46 -0600 (MDT)
Date: Thu, 8 May 2003 07:55:45 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030508055545.GQ27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IIU4lL9vGQnN7Mxl"
Subject: [parisc-linux] [Q] "-p" level for submitting patches?
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

--IIU4lL9vGQnN7Mxl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've co'ed the full CVS repository (ie all modules are within one
direcory). To ease applying patches for you, from which directory should
I 'cvs diff' changed files?

[ ]	$ ls
	CVS         CVSROOT    build-tools  gcc      gdb        glibc linux
	linux-2.5   obsolete   palo         pmccabe  userspace  web
	$ cvs diff linux-2.5/arch/parisc/...

[ ]     $ ls
	COPYING        Makefile        crypto   ipc     scripts
	CREDITS        README          drivers  kernel  security
	CVS            REPORTING-BUGS  fs       lib     sound
	Documentation  System.map      include  mm      usr
	MAINTAINERS    arch            init     net     vmlinux
	$ cvs diff arch/parisc/linux/....

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--IIU4lL9vGQnN7Mxl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ufFhHb1edYOZ4bsRAs7nAJoCI9JUI/tdjpmKrj0i44jS4755LgCdG+5d
oJmqiJYuYwQH8v3g5Y4pqns=
=VBzq
-----END PGP SIGNATURE-----

--IIU4lL9vGQnN7Mxl--
