Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 501CB482D
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Aug 2003 02:11:36 -0600 (MDT)
Date: Sat, 2 Aug 2003 10:11:35 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k-2.6.0-test2-pa0: __canonicalize_f_f_c patch
Message-ID: <20030802081135.GJ1873@lug-owl.de>
References: <3F056E95000057BB@ocpmta4.freegates.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cgXXEQ20Gie/H8Jj"
In-Reply-To: <3F056E95000057BB@ocpmta4.freegates.net>
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

--cgXXEQ20Gie/H8Jj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-07-28 16:30:14 +0200, Joel Soete <jsoe0708@tiscali.be>
wrote in message <3F056E95000057BB@ocpmta4.freegates.net>:
Hi!

> +
> +	.export __canonicalize_funcptr_for_compare
> +	.text
> +	/* http://lists.parisc-linux.org/hypermail/parisc-linux/10916.html
> +	**	GCC 3.3 and later has a new function in libgcc.a for
> +	**	comparing function pointers.
> +	*/
> +__canonicalize_funcptr_for_compare:
> +#ifdef __LP64__
> +	bve (%r2)
> +#else
> +	bv %r0(%r2)
> +#endif
> +	copy %r26,%r28

Is this now checked in? At my last cvs update
(:pserver:anonymous@cvs.parisc-linux.org/var/cvs, linux-2.5), this
hasn't shown up...

By the way, is anybody here going to go to Oldenburg(.de) to join the
developer's meeting[1]?

MfG, JBG
[1] http://oldenburger.linuxtage.de/devel.html

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--cgXXEQ20Gie/H8Jj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/K3I2Hb1edYOZ4bsRAhiLAKCJnfCQKhokGN/1yd3y4YIjfZq77QCgjNBS
Ruqsl4rewW5QyfcKfhU2YK0=
=aCpO
-----END PGP SIGNATURE-----

--cgXXEQ20Gie/H8Jj--
