Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF47E4841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 05:02:14 -0700 (MST)
Date: Fri, 7 Nov 2003 13:02:13 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Unresolved symbols in 2.4.22-pa13
Message-ID: <20031107120213.GM17497@lug-owl.de>
References: <3FA956FD.4080901@hrzpub.tu-darmstadt.de> <20031106162055.GA26869@parcelfarce.linux.theplanet.co.uk> <20031106205706.GG17497@lug-owl.de> <20031106222416.GI26869@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
In-Reply-To: <20031106222416.GI26869@parcelfarce.linux.theplanet.co.uk>
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

--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-11-06 22:24:16 +0000, Matthew Wilcox <willy@debian.org>
wrote in message <20031106222416.GI26869@parcelfarce.linux.theplanet.co.uk>:
> On Thu, Nov 06, 2003 at 09:57:06PM +0100, Jan-Benedict Glaw wrote:
> > On Thu, 2003-11-06 16:20:55 +0000, Matthew Wilcox <willy@debian.org>
> > wrote in message <20031106162055.GA26869@parcelfarce.linux.theplanet.co=
=2Euk>:
> > > On Wed, Nov 05, 2003 at 09:01:01PM +0100, Ruediger Scholz wrote:
> @@ -34,7 +34,7 @@ config PARPORT
> =20
>  config PARPORT_PC
>         tristate "PC-style hardware"
> -       depends on PARPORT && (!SPARC64 || PCI)
> +       depends on PARPORT && (!(SPARC64 || PARISC) || PCI)

This excludes certain possibilities. I'd go the other way...

>         ---help---
>           You should say Y here if you have a PC-style parallel port. All
>           IBM PC compatible computers and some Alphas have PC-style
>=20
> But perhaps that should be:
>=20
> 	depends on PARPORT && (!SPARC64 || PCI) && (!PARISC || SUPERIO)

parport_pc uses inb/outb so I'd let it depend on busses that are capable
of allowing inb/outb:

	depends on PARPORT && (ISA || PCI || SUPERIO)

- ISA parport adaptors exist, either as build-in or as real ISA cards.
- There are PCI parport controllers
- SUPERIO seeme to be capable of doing parport_pc (I haven't used
  that...)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/q4nFHb1edYOZ4bsRArJrAKCImlof9sTbTtJLrJJJTMf5xfKhcQCfaUV5
UEJCbNOgcCCqEy1kHlzBAtI=
=Qw28
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
