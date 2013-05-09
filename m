From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: make default cross compiler search more robust
Date: Thu, 9 May 2013 15:24:20 -0400
Message-ID: <201305091524.22938.vapier@gentoo.org>
References: <1368076115-22262-1-git-send-email-vapier@gentoo.org> <20130509142823.444ac244@marga.jer-c2.orkz.net> <518BA14B.4060808@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1864624.gYLyY4Q3bx";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <518BA14B.4060808@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1864624.gYLyY4Q3bx
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 09 May 2013 09:14:51 Helge Deller wrote:
> On 05/09/2013 02:28 PM, Jeroen Roovers wrote:
> > On Thu,  9 May 2013 01:08:35 -0400 Mike Frysinger wrote:
> >> People/distros vary how they prefix the toolchain name for 64bit
> >> builds. Rather than enforce one convention over another, add a for
> >> loop which does a search for all the general prefixes.  This code
> >> will run for both native and cross builds when CROSS_COMPILE isn't
> >> explicitly set.
> >=20
> > Several architectures appear to use a scriptlet called
> > cc-cross-prefix for this. See scripts/Kbuild.include.
>=20
> That's cool :-)
>=20
> Basically this
>=20
> +ifneq ($(SUBARCH),$(ARCH))
> +       ifeq ($(CROSS_COMPILE),)
> +               CROSS_COMPILE :=3D $(call cc-cross-prefix,
> hppa$(WIDTH)-linux- hppa$(WIDTH)-linux-gnu-)
> +       endif
>  endif
>=20
> should then be enough.
>=20
> Do we really need to search for:
> 	hppa1.1-unknown-linux-gnu
> 	hppa1.1-linux-gnu
> 	hppa1.1-linux
> 	hppa2.0-unknown-linux-gnu
> 	hppa2.0-linux-gnu
> 	hppa2.0-linux
> on 32bit?

Gentoo actively uses hppa1.1 and hppa2.0 (i'm not sure we have any systems=
=20
that don't use those).  we've seen some projects key off of those tuples (l=
ike=20
gmp) to change code selection.

similarly, the reason i included -unknown- is that is the tuple we use in=20
Gentoo for our native toolchain.  for 64bit ones, we've been using ${ARCH}6=
4-
linux as it was only good for building the kernel ... it didn't include a C=
=20
lib itself.

along that last line, hppa is the only target anymore where we have a=20
dedicated 64bit compiler for the kernel.  all the other ports have biarch=20
support in gcc/binutils :/.

CC_ARCHES =3D hppa$(WIDTH) hppa1.1 hppa2.0
CC_SUFFIXES =3D linux linux-gnu unknown-linux-gnu
CROSS_COMPILE :=3D $(call cc-cross-prefix, \
	$(foreach a,$(CC_ARCHES),$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
=2Dmike

--nextPart1864624.gYLyY4Q3bx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRi/fmAAoJEEFjO5/oN/WBW90P/3+pZAjJvPvNPC/pZ56idmI2
yd/3AX8qQpu7LMnLcGRn922UwbIiMhsjssLSgWK7/I8lQcb9jl5o2YzeKW7UkHwS
61lGSP7taYnl3zW5mjAYflD+3u+HF6QsNuWJx5bE0XpVgs+z6E5p0ouiFM52OcgS
TmiTX9SF/vFYQ15F0gHepH8exT32HpyBw04a/BFy3C6nPteV2i80QODcOQUQ9XaW
r/ruR2cKcW4q5VF7SFWz2hn/HXoxw9ssLuCqYcaMGemB+y7JJrc3+/E6BeXHW+Y/
qWPMbh8sDMJsAtD92RtJq1f1iY7i9QY+MWIGN59P3OfXwtjDmiZJgMmz+iPO1bQ2
YhQz8YpqafChOoY2KQdNdu6nRgYzo6/T+6zcRh954oHEfTQHztzoawM2h+HdSuXr
R5JpzrKWY3pBHL8ne638VxLZCZ885sPBgkD0j2gkV+TbuGOJ5nfgVYzVr8+eCeVw
7esMXe5sOZ5pYbXKbF2Caq3Nv5WMl1pUYpKDecXNsSRSE8yCFlPua1a2m9WBnsJy
dEm205p7WqNLL3+dTidI/NuWN0G5TFqERHSN+e7f4dSegKSVeOpuZOXJLutcGZYs
qVnGX0jx6k8YuapyRex5jH5pu/jjJ9Mz6KYPZir2Ps+iKT+fMGIQPnl3tkLekXRE
Pq73QLKFMW9jRbBDvx+S
=vt7N
-----END PGP SIGNATURE-----

--nextPart1864624.gYLyY4Q3bx--
