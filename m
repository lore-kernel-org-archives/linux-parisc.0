From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [parisc-linux] Framebuffer and 720/50
Date: Sun, 27 Jun 2004 18:25:48 +0200
Message-ID: <20040627162548.GN20632@lug-owl.de>
References: <20040627140634.9D4E3246C2A@mail.customers.edis.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1463962602=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040627140634.9D4E3246C2A@mail.customers.edis.at>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============1463962602==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wjmr0On0zl4P36pE"
Content-Disposition: inline


--wjmr0On0zl4P36pE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-06-27 16:06:33 +0200, Wolf-Dieter Kattnig <kattnig@cnd-online.=
com>
wrote in message <20040627140634.9D4E3246C2A@mail.customers.edis.at>:
> I've had no problems whatsoever setting up Woody on my 720 - except for o=
ne
> glitch - I can't get X to work.
>=20
> My graphics adaptor is an HPA2269A. Everything looks good, but I cant get
> /dev/fb0 to work. My kernel is 2.4.18-32.
>=20
> Is X supported on this configuration at all? Help would be appreciated.

STI framebuffer support is compiled in? Could you please provide kernel
log output? What XFree error messages do you get? What XFree driver did
you configure?

Missing /dev/fb0 indicates a problem (or a missing) framebuffer driver.
You'd probably update to something more recent than 2.4.18 ...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--wjmr0On0zl4P36pE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA3vULHb1edYOZ4bsRAq1rAJ4/uHSFnDdT5xp5XmHf48chvSdGqgCeJdTH
IZM0AfMb++lnAJ/HiXVYFO0=
=cc7Z
-----END PGP SIGNATURE-----

--wjmr0On0zl4P36pE--

--===============1463962602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1463962602==--
