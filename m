Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8734482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 08:39:19 -0600 (MDT)
Date: Fri, 1 Aug 2003 16:39:18 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] testing HP-PA risc hardware
Message-ID: <20030801143918.GI1873@lug-owl.de>
References: <03Aug1.164945cest.119089@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LmUak3kE33t3Bnfm"
In-Reply-To: <03Aug1.164945cest.119089@ns.hiscom.nl>
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

--LmUak3kE33t3Bnfm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-08-01 16:29:35 +0200, Beerse, Corne <c.beerse@torex-hiscom.nl>
wrote in message <03Aug1.164945cest.119089@ns.hiscom.nl>:
> At first, we suspected the boot disk since its led keeps buring. However,
> booting HP-UX from CDRom for a new fresh install, the boot of the kernel
> crashes at roughly the same point, even with all disks removed. Hence we
> suspected the core memory. However, changing or replacing the memory does
> not change anything in the behavoure.

HP machines do quite some checks on their own on power-up (if you don't
configure them to omit these) and you can get all that from the
INformation (IIRC) command.

I have upgraded one of my boxes these days and a RAM module wasn't
mounted properly. That was reported, as well as it's position:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--LmUak3kE33t3Bnfm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/KnuWHb1edYOZ4bsRAu2wAJ98C/qW16SN2WRgKR5HPbgBD5QPXwCdGvIe
y7tQjljCcskfU0ESSUDDYDU=
=Bu7j
-----END PGP SIGNATURE-----

--LmUak3kE33t3Bnfm--
