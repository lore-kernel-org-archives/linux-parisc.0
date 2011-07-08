From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Fri, 8 Jul 2011 17:42:48 -0400
Message-ID: <201107081742.48874.vapier@gentoo.org>
References: <4E177624.1030500@systemhalted.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2610934.feHPynU4ZZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E177624.1030500@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2610934.feHPynU4ZZ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, July 08, 2011 17:27:00 Carlos O'Donell wrote:
> Implements futex op support and makes futex cmpxchg atomic.
> Tested on 64-bit SMP kernel running on 2 x PA8700s.

seems like all the changes to this func are arch-independent and could be=20
placed into asm-generic/futex.h.  the current parisc futex.h looks like a c=
opy=20
of the asm-generic one ...
=2Dmike

--nextPart2610934.feHPynU4ZZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOF3nYAAoJEEFjO5/oN/WB+DsP/AqxW+Vh+SnjXU5Qq9/Hnz7t
IXGNA5NSvqexXFsb5tyV2urxel9TidyaJS4zaAdZ5zj3uooT5ES6LDJQer7E5KGa
BcslBiOMQnT1R0RvftIQ+OFm0L+Fusw459H9RgoM3m0dehX3a7pxSemS5G+ypN7U
/cZpv6Haxb1Sb3aI6Q53Kdx8LoJsfjtBkQHii0b4q9ceT9N6VtR8S63B4GqbtFIp
Nd3DPIAUQURITLCyzvuxok4z8wHu8E3xVGSE0TE5iabRj/OoepNHAS+NSWM3o061
IDwIGddRtsIZgh5AJZJ8sI7zapIfcP56TO+ZRXrlyNkAoyK3sWXVmdWCQS+ovnoG
RqM33ZAf16fbZXSOPjLsEpb47WtPaoRgEgK96/yUlxRFXFbrA594I79bCdhMlhdc
X3ydQliQIhD+y1zRvbXodQ49NEb1avhhVQMbKjKz6ylo+P6JCPWCbhdAz4VgedO7
zfLGT8QROwia3SYLcslPEyXtAyuaB4nMq5sqUJxICTD4MrJhxjFlPSGnKqBuugVg
oChI/IbZI2Ic7dLAHC+hPi3yccj5RbaPqoxdli9XCik8PPygn2eUdnF7lyxlXf+z
b/Jd7YTxoCD5Mcj48l4RJfc7/0+8sJHODkm2xCyW+mQN0drdwqxrZSNCOWlH7qKK
niEjO/XXeOJo2qSU8cKz
=OM53
-----END PGP SIGNATURE-----

--nextPart2610934.feHPynU4ZZ--
