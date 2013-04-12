From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Thu, 11 Apr 2013 21:55:43 -0400
Message-ID: <201304112155.46349.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304071439.15297.vapier@gentoo.org> <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3463933.kiKxh8oLbK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	"linux-man" <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3463933.kiKxh8oLbK
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 07 April 2013 14:48:42 John David Anglin wrote:
> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
> > just to be clear, the only insn you need is:
> > 	ble 0x100(%sr2, %r0);
> >=20
> > the kernel docs say sr2 holds the kernel gateway page (so i guess
> > 0x100 is a
> > known offset into that).  the docs don't mention r0 that i can see,
> > so i'm
> > guessing it's one of those "always 0" registers ?
>=20
> Yes.  There is also an entry at offset 0xb0 for light-weight-
> syscalls.  Currently,
> this implements an atomic CAS operation used for pthread support.

interesting.  sounds like a poor man's vDSO.  i'll document this the new=20
vdso(7) man page.
=2Dmike

--nextPart3463933.kiKxh8oLbK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZ2miAAoJEEFjO5/oN/WBqCYP/jUXIPu+yVqoSenYutuvGiW7
eHyiE8eXxjgiLSmy6IgLYxIHQuUNoWpuku+4mLmEEAjU+dLIR2J2cHwSPuKm0I00
QObDtRDPAekHM3hv1wlNyfE33Kc32LyRtMHhsQZJnfDp5+n+LN7RtxnjTRiq807L
5+qMxUPIjwrPnHkbR3lPr4BW8F8RO/Tdpi6YWiXn+FyjFAYs7fCFHh/lbciifNBw
1BBz7L+8wuE06DBsmd2i2xfsHeDuchegcXY0VWyQ8X4sUQY9LQMjQ6nzqCqVrnfv
ctHj1H8pWIjDRRD1BbDyLuiG06DSXOYUx2JOCwqUjXVdt6hnxqJmyB06hXC0QB3f
xkooKeLNotlt5PqXwJKd3vZ74HAWT67FdeE9rI9GvvtKYVoyXDJ2e9LH0O3M6ujI
ZrQCl1TXLAt5FCCGdVke1TEWFLa9W5aZZ9nyBRbHDLwairkvYXT2y3hnu62VHeft
YHnLxP67qCd/nwd53gH9m5SOYF8otFzK9pNU+f7SDt6pENLTLRriLMn7+E798OhG
Zomt46Cdsi6mbYY0lIxa+x0tFQj9DoUKFqhe4e582svjWR6VueEg3/5uafxvueNr
QbcPeOUss5Njq5sELZVUN1Xqfrm3gNeG++u9s3vlGOKAO6/4yk/Cefa48WNrkcV7
kkneFt/OMHaVEUML46GM
=MVHR
-----END PGP SIGNATURE-----

--nextPart3463933.kiKxh8oLbK--
