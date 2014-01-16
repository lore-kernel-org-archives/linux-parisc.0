From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Thu, 16 Jan 2014 17:43:23 -0500
Message-ID: <201401161743.25096.vapier@gentoo.org>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be> <CAE2sS1hO=do8VTwn-_mPwZge_AdunrOfoC0VW4RnezaDfZYxXQ@mail.gmail.com> <52D84BF5.3010001@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart10961948.Sq1CKDAdGm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	John David Anglin <dave.anglin@bell.net>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52D84BF5.3010001@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart10961948.Sq1CKDAdGm
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 16 January 2014 16:15:33 Helge Deller wrote:
> On 01/16/2014 10:05 PM, Carlos O'Donell wrote:
> > On Thu, Jan 16, 2014 at 3:49 PM, John David Anglin wrote:
> >>> This is an ABI break.
> >>>=20
> >>> You can't do this without rebuilding userspace.
> >>>=20
> >>> You need debian an gentoo onboard to do this ABI break.
> >>=20
> >> This would take about a month on Debian, so I'm against.  Various bits
> >> of kernel code traditionally return EWOULDBLOCK, so any application
> >> code that just checks EWOULDBLOCK would fail.
> >=20
> > That's not true if, like all other targets, EWOULDBLOCK =3D=3D AGAIN. I=
t's
> > only true on hppa, and that's the problem.
> >=20
> > The kernel is completely inconsistent about returning EWOULDBLOCK or
> > EAGAIN, and the standards do dictate one or the other so the kernel
> > and glibc are correct to use one or the other to match the standard.
> >=20
> > However, user applications are equally sloppy about checking the right
> > value.
>=20
> Guy, do you have actual programs which are currently broken and which don=
't
> check for both? My feeling is, that most programs were fixed, but I might
> be wrong...

my guess is memcached:
https://bugs.gentoo.org/show_bug.cgi?id=3D498262
=2Dmike

--nextPart10961948.Sq1CKDAdGm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJS2GCNAAoJEEFjO5/oN/WB0icQALCzNyS3HJY1oWTLY6dsFjuU
4lG63Ur8FyMTrHPQILMdjAoSfR0Xi+DNRUqqeQmJ2aR00OZkrfLJAOkIprq0EPnb
TntAslyKuluUuqsDrRRxG4MRtquAg63erc93V0Eoe4b1q8VoyN6Z/t1L3AYH2dz+
/4LyMpgSaWPSMdniv/DBNC1TNEq+7/PEHBHpH83VivjLWXv8DMw3Z3HQPj8uhRWO
+RoUk/P8DXRBDB4c4LUZwqKMC0evW/DHE1OKfp0b6i/qg7e+GWHSFtm+mzg23G6V
J22xCu3JCMYpBY6lkcEPxL88cJIwWdj2fR2mrqLqsAdlPnUWJHoTj4MrA8x9shOr
HkNxYHuYXQM7Ohn9J/0LpwjXdlB+SXb4CisrbJqk9mBMNH4diP4gif99Y4KwLLyi
EGUyVH5ODGtqqssh64TPIEk+Bj8QN8i5PltHtS7STtskhbBQJjf3DzwW1h71eweO
6ZKuhFPrMb9X/6UKwbcSFQyG6K5w35h/kAHmuHW4XLwCxrTfURjpk67wj4DurBZZ
zu7HYwRSCGr98N8OOQcNBZPmaAbuopi29vHKgIGBXc0lyd86F9P6QzB33am0JbJa
xbx5RS83LnIAnc7vYV7l0KRqKK9IeM50Yi2/TjHZdEM/F6CrYe8/fOCY0yfKH3CV
4HGN0BfVcNkTKq3G+TNn
=B4wo
-----END PGP SIGNATURE-----

--nextPart10961948.Sq1CKDAdGm--
