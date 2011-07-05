From: Rolf Eike Beer <eike@sf-mail.de>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Tue, 5 Jul 2011 19:51:16 +0200
Message-ID: <201107051951.16931.eike@sf-mail.de>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com> <CADZpyiwkPxzakrm+8rwOOjRnfXWPowsxZfQhDU1cr_ZSBNNhWQ@mail.gmail.com> <CADZpyiyZjaW3HnXJdvVCS+5SSbLmYtXXne6gkWu0KzcmASFUQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3553247.g7zCH0MDeq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiyZjaW3HnXJdvVCS+5SSbLmYtXXne6gkWu0KzcmASFUQg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3553247.g7zCH0MDeq
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Dienstag 05 Juli 2011, 19:28:35 schrieben Sie:
> On Mon, Jul 4, 2011 at 2:59 PM, Carlos O'Donell <carlos@systemhalted.org>=
=20
wrote:
> > On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin <dave.anglin@bell.net=
>=20
wrote:
> >> The Linux man page says the mprotect addr must be a valid pointer or a
> >> multiple of PAGESIZE.
> >> It's not clear what the mprotect call is trying to protect but it is
> >> definitely not page aligned.
> >=20
> > It's trying to protect the new stack for the thread, which is
> > obviously in the wrong spot.
>=20
> Good news.
>=20
> I have fixed tst-cputimer1.

You also wrote "OK, fixed the kernel." So where an when will these fixes sh=
ow=20
up?

Eike

--nextPart3553247.g7zCH0MDeq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk4TTxQACgkQXKSJPmm5/E4d5ACgl1nCixSlemDKYAZqhpkDtk9H
6tUAn3cW/M2MVnGZY+FoUsCOKdF4kDaI
=W3r4
-----END PGP SIGNATURE-----

--nextPart3553247.g7zCH0MDeq--
