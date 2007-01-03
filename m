From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] fix error condition in glibc's clone() call
Date: Wed, 3 Jan 2007 00:37:11 -0500
Message-ID: <200701030037.12854.vapier__13487.2693139643$1416624248$gmane$org@gentoo.org>
References: <200612291709.34592.deller@gmx.de> <119aab440701022107u1e5cbbb5qeaf6537b95f362aa@mail.gmail.com> <119aab440701022108t12bfe6cbv592f62d3d0605a85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1433152.tq59yWizOM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "Helge Deller" <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 "Joel Soete" <soete.joel@tiscali.be>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <vapier@gentoo.org>
In-Reply-To: <119aab440701022108t12bfe6cbv592f62d3d0605a85@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>

--nextPart1433152.tq59yWizOM
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 03 January 2007 00:08, Carlos O'Donell wrote:
> On 1/3/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> > On 1/2/07, Mike Frysinger <vapier@gentoo.org> wrote:
> > > when it comes to parisc sources, are we supposed to be looking at the
> > > FSF glibc cvs or the parisc glibc cvs ?  they often seem way out of
> > > sync ...
> >
> > glibc cvs.
>
> Though... your distro may not be completely up to date.
> We are in the middle of brining NPTL + TLS out ot "alpha" status for hppa.

i've been following the nptl stuff and yes Gentoo is out of date ... we're =
on=20
glibc-2.3.6 + linuxthreads

i was asking for personal preference when investigating things ... want to=
=20
make sure i'm looking at the latest code when i send fixes ;)
=2Dmike

--nextPart1433152.tq59yWizOM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARZtBCEFjO5/oN/WBAQImOxAAtIeHUQwWXQkj2SH0GMZGrqiXfVPPtc/P
K4jZqRxOl0BGizczVDC1BmL6dI79RWCFsPekLIMZUobyuSAt/gYbDCrlhQTPkgya
dCHWTqYXk9lbfh9KRNrIf2O9Y0Hsv0sOSfFWR6XO2OMbqwyZu+O0Yrn7w1ABER0T
vBCqylhyNynqirdcYRkZ0NFscw6cF8jOFG594ZR6+ttt2zlkubtgNOHMI8eMZLmy
M2v1q408FqYboOrD3IAEkca3NVu01CYZrpRnAkuShBKVkC5dNm6WIPEIfV4uOGlI
eqUKOtiHJhgT70dMcwg59/77JLObZ2NhPFgAgYzxyWVE2TL2TDsIJ5d9hdVhn1Pn
MQOnXVOIF6INuqKNB3lQQZqnFPf7wJAqSo+0d6VBxXshRHaxSgpeFP/rwnVa8W0R
pwJ0eePnfK3nndEsN3WvjfWg9hdYJsRkBZICXlFpf9BMw9fqX/ZsnbJZndU8DC+G
qBMRQ8ZlW3DD8UiuC3+lEHfs6ysAeleFAjciZknuz4uwVklguFOF4Tyc3fkIjfsi
kjbW/RgUtbZtwnLbymzx1kquhK4AaRM48NmU8tpHVETzPNqQar/QxGJfIlVRFtOK
uCaG7qBATr14lEomkVl2rAGK34HgOntgBzNhIdcHmXOUkfWGSK+RpacU2Mnv6xNl
Uq5kkB16wiI=
=xi7b
-----END PGP SIGNATURE-----

--nextPart1433152.tq59yWizOM--
