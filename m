Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 240D74829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 09:48:19 -0600 (MDT)
Date: Wed, 7 May 2003 17:48:17 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030507154817.GH27494@lug-owl.de>
References: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca> <3EB7766A000003EE@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cKDw3XFoqocuprIa"
In-Reply-To: <3EB7766A000003EE@ocpmta7.freegates.net>
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

--cKDw3XFoqocuprIa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-06 19:56:48 +0200, Joel Soete <jsoe0708@tiscali.be>
wrote in message <3EB7766A000003EE@ocpmta7.freegates.net>:
> >> +#if defined (__hppa__)
> >> +	        current->sig->action[sig-1].sa.sa_handler =3D=3D (void *)SIG=
_IGN);
> >> +#else
> >>  	        current->sig->action[sig-1].sa.sa_handler =3D=3D SIG_IGN);
> >> +#endif
> >
> >You don't need to conditionalize the statement with the cast.  It should
> >work on all ports.
> >
> I trust you.
>=20
> So it will finaly become:
[...]

With this patch applied (plus the diva patch I've sent to the list these
days) I can compile'n'boot:

jbglaw@b132l-1:~$ uname -a
Linux b132l-1 2.4.20-pa33 #15 Wed May 7 08:29:13 CEST 2003 parisc unknown u=
nknown GNU/Linux

So I think it would be nice to put this patch into CVS.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--cKDw3XFoqocuprIa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+uSrBHb1edYOZ4bsRAid5AJ9sgEqCD2RZYbU96yVs7BLnVMYErQCeLetb
RYmogzR3XBvm01oxbgQzvkM=
=wfug
-----END PGP SIGNATURE-----

--cKDw3XFoqocuprIa--
