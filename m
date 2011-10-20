From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: Removing HPPA Linuxthreads support in glibc-ports.
Date: Thu, 20 Oct 2011 16:31:50 -0400
Message-ID: <201110201631.52046.vapier@gentoo.org>
References: <CADZpyiwAqDmsb4TLCwo0KGBm9c_Y1P9iLir8gXJBOJPOTiRr4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1607603.J82LT7Zjv1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	Gentoo HPPA <gentoo-hppa@lists.gentoo.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiwAqDmsb4TLCwo0KGBm9c_Y1P9iLir8gXJBOJPOTiRr4g@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1607603.J82LT7Zjv1
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 20 October 2011 14:55:46 Carlos O'Donell wrote:
> I plan to remove all HPPA Linuxthreads support from glibc-ports.
>=20
> The support is well past bit-rotten.
>=20
> Is anyone opposed to this?

guess we don't have much choice since it's been purged from the core.  but=
=20
nptl support isn't mainlined yet right ? :/
=2Dmike

--nextPart1607603.J82LT7Zjv1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOoIU3AAoJEEFjO5/oN/WBLZAP/3VyF+++DFyUu2dU7PVCFxKP
ibDUf409YUFh5AEegKHkF34EKdqyBKF2YRPWK4AvCECXSJoFqLmVLh0DvnVbZCZT
WF8REPz8Fa3AkjtF2PUsjHRGCxgc3wdm9koqjj9N6cyeJ2av8C3cTMDNhQWYEZTq
3xbKynMI4m4RYj9ZRceI5Id/T4SQ/naQloBLrbfbsqtlEEgShxRnA8ymKC4BXrHC
KoF3ULXyWCqXMd0lCPah0etu7My4EqqpQ7laLC33klmT7Jm/RPiKhTlsM8b7qoxl
aYXQjKqJY9V3xU8fpkWeWMImmlGLtnzoV7xgtiyDYLRqNDyTtN4E6XvBcDiWjTa7
gAQSOLAL9yBhEZSDkWs/n6FWugsMOnZFg7edA+jeOKSx6M2HCFbB/8gfnklcW8Jb
oNC+WqLhWSQtNXcGJNTIDnG+bFzpoIuHGarXZXqd9nxDu/QmW7hrGASrpThd5F0J
XLr364RrzH150k4aCqtdcD6MWfZHOxxHnsAJf9JnVu3J+2OBeU7fBXyshd4LrDaB
3cTcs2vP7AGbwhhEiZhr/diuuZlIB0duc2W5ZHpO34uAFEXbIypJnjaFp8YQ99mQ
c4yxtFk3feI5KIKO9TAYcYgIeKYP2qBGoK2Gjy6+swmwdnzEXigkMdTtXWZc6RIx
xxRc9pHYVjByhoeDQAin
=WqPk
-----END PGP SIGNATURE-----

--nextPart1607603.J82LT7Zjv1--
