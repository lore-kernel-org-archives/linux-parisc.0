Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFB684829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 09:20:22 -0600 (MDT)
Date: Tue, 6 May 2003 17:20:21 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-2.4] DIVA serial build error (was: Oops on 2.4.20-pa33)
Message-ID: <20030506152021.GC27494@lug-owl.de>
References: <20030505200251.GS27494@lug-owl.de> <20030505200537.GF29544@tausq.org> <20030505210532.GU27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pqZtgxSH0iQu6R78"
In-Reply-To: <20030505210532.GU27494@lug-owl.de>
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

--pqZtgxSH0iQu6R78
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 23:05:32 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.de>
wrote in message <20030505210532.GU27494@lug-owl.de>:
> On Mon, 2003-05-05 13:05:37 -0700, Randolph Chung <randolph@tausq.org>
> wrote in message <20030505200537.GF29544@tausq.org>:
> > > IAOQ:   10224658        __canonicalize_funcptr_for_compare
> > > r02:    101229d4        do_sigaction
> >=20
> > i don't have a 32-bit machine handy, can you try this patch and let me
> > know if it fixes your problem? An earlier version of this was posted on
> > this list but didn't get commited. thx -randolph
>=20
> Oh, forgive me to be that read resistant:)

I've tried your patch - the box still crashed, but I haven't noted down
all the crash (out of time:( I'll redo it most probably this evening.

Has anybody looked at the other patch (I sent with the mail I'm now
replyin' to)? It was needed and seems to be correct. Is anybody to check
it into CVS?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--pqZtgxSH0iQu6R78
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+t9K1Hb1edYOZ4bsRAh5iAJ0QNCOA1qRLogh/2CvQeHM/B1uEcACeKkiX
Sh476D/D8rHoba+HKSri1qs=
=jM7X
-----END PGP SIGNATURE-----

--pqZtgxSH0iQu6R78--
