Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B439482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 00:31:22 -0600 (MDT)
Date: Thu, 7 Aug 2003 08:31:20 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.x - impressions
Message-ID: <20030807063120.GK1873@lug-owl.de>
References: <20030806065647.GP1873@lug-owl.de> <20030807062818.GC4979@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3560iJfidtGRl43/"
In-Reply-To: <20030807062818.GC4979@tausq.org>
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

--3560iJfidtGRl43/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-08-06 23:28:19 -0700, Randolph Chung <randolph@tausq.org>
wrote in message <20030807062818.GC4979@tausq.org>:
> > - If I strace some program, the box will crash some time later (while
> >   strace is still running). I can still toggle the NumLock LED by
>=20
> what did you try to strace that caused the machine to crash?=20

cvsps. That's a small programm querying a CVS server to get patchsets
(not simple patches) out of it. It's for a BKCVS to Arch gateway I'm
working on.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--3560iJfidtGRl43/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/MfI4Hb1edYOZ4bsRAhoIAKCG76qdWymEgrW26OmADvi6sCYIPgCeOe/c
Jsi3QMAj72kvTqQVWn4b9LY=
=Rc+H
-----END PGP SIGNATURE-----

--3560iJfidtGRl43/--
