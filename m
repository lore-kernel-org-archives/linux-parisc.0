Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADF5A488B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Sep 2003 03:38:51 -0600 (MDT)
Date: Thu, 18 Sep 2003 11:38:50 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] update of libc?
Message-ID: <20030918093850.GB12661@lug-owl.de>
References: <20030918113157.000037fb.t.riemer@visoel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wcqk1U9YY/kgSQtH"
In-Reply-To: <20030918113157.000037fb.t.riemer@visoel.de>
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

--Wcqk1U9YY/kgSQtH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-18 11:31:57 +0200, Tilo Riemer <t.riemer@visoel.de>
wrote in message <20030918113157.000037fb.t.riemer@visoel.de>:
> is it dangerous to make an update of libc from 2.2.5 to 2.3.x?
> At the moment I have only remote access to the affected host.

I've just dist-upgrade'd all my machines. Libc still works (including a
B132L+ and a 712), but you should be aware of module-init-tools if
you're already using 2.6.x.

# touch /etc/modprobe.d/arch/generic=20

=2E..helps you over a bug in the .deb ...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--Wcqk1U9YY/kgSQtH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/aX0pHb1edYOZ4bsRAgGuAJ9nXWuut0ycIDo0yUlLAonENj4dxwCfWAyn
MAd+O0ylRvHjvnGkg4ReNrU=
=7T0X
-----END PGP SIGNATURE-----

--Wcqk1U9YY/kgSQtH--
