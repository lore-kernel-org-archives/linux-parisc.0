From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: fix re-mmap() of shared file to same fixed address
Date: Sun, 24 Nov 2013 23:41:22 -0500
Message-ID: <201311242341.23301.vapier@gentoo.org>
References: <20131120220742.GA23304@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1542009.HO7scgiSGA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	dave.anglin@bell.net
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131120220742.GA23304@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1542009.HO7scgiSGA
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 20 November 2013 17:07:42 Helge Deller wrote:
> locale-gen from glibc showed a strange problem on parisc:

pedantic: locale-gen is from distros while glibc itself provides localedef.

> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) =3D 0x42a54000
> mmap2(0x42a54000, 103860, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, =
0)
> =3D -1 EINVAL (Invalid argument)
>=20
> Basically it was just trying to re-mmap() a file at the same address
> which it was given by a previous mmap() call. But this remapping failed
> with EINVAL.
>=20
> The problem is, that when MAP_FIXED and MAP_SHARED flags were used, we
> didn't included the mapping-based offset when we verified the alignment of
> the given fixed address against the offset which we calculated it in the
> previous call.

hmm, which version of glibc were you trying ?  we landed this change recent=
ly:
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_plain;h=3D17db6e8d=
6b12f55e312fcab46faf5d332c806fb6

it's part of glibc-2.18.  we know earlier versions of localedef failed on=20
systems like parisc, although it seemed to really only creep up on 64bit=20
kernels reliably.

based on your description, it sounds like independent bugs, but it also see=
ms=20
a little coincidental ...
=2Dmike

--nextPart1542009.HO7scgiSGA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSktTzAAoJEEFjO5/oN/WB2g0P/jmaGTwrdZ2Me4pz0UeAREdN
3XS2c3Cj2LqjazfIlDbqBsiTiAlWUH4oTMbHcFs9m9wGpIjPhY+6y9DuMAFUGmts
sxMDBY+KcP2LR07hYqfqM7yT8372ctKCLioKoq0kuepJCixhx9uKVF96X7XPO8l3
/YJ7yqkp+sZfOPhCLE+1XjqQnIEk8EIKmkx5ZXI8mH68VNiQmSXpd80wLscKk67Y
mIgbtWfH+OC2UWMqdMyCo5cHTa0X1WFCTpzRXD00QCJ+rTxEJbRpwVDmsH3wE+hi
4N1UbVYyzPO8QgOSVgXv2hGeftpAxvclJ7I/Ut2DT3lWvrRBF+H2lXtboWFNbxiV
+WC1WKnU5zp2PXx5o/TdCzNzZudzyJbj08JQVjwqdNT05o2Hmofp0AOnmSgDpoHN
ViyqQJOHbafangTeEEt3CSGEeku65ZwFv55oWJ+wZz6NADWE0RW3YO7vsHFCwGet
IV0Rm3PN3kalhs0JGrMntmAKabD5441scSGujqJ2jzN1LgvJLshxdakjFDeBPuCV
M86NmY3YjRPA/N2Op0Q9ZeVPmEx8BbrmNYgNmDJC8CBB73tU/E1sbQMRUwkvD/8L
QXzCgVknQQ3W2qQ8i3TvzmaWZJISeGjTiUWcoP/3w55oyCUatT6NFV747JRtxWt1
qSH18T4v3rRv9RaRmbvl
=3M15
-----END PGP SIGNATURE-----

--nextPart1542009.HO7scgiSGA--
