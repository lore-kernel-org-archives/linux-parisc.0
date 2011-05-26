From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] Do not set CROSS_COMPILE but let CONFIG_CROSS_COMPILE handle it all.
Date: Thu, 26 May 2011 01:15:43 -0400
Message-ID: <201105260115.44279.vapier@gentoo.org>
References: <20110524194701.6a4c1bd4@epia.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3043800.9nHhrhYgv7";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110524194701.6a4c1bd4@epia.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3043800.9nHhrhYgv7
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday, May 24, 2011 13:47:01 Jeroen Roovers wrote:
> Do not set CROSS_COMPILE but let CONFIG_CROSS_COMPILE handle it all.
> The problem this fixes manifests itself when you try to build a 64-bit
> kernel on a distro which does not provide hppa$(WIDTH)-linux-gnu- but
> perhaps hppa$(WIDTH)-unknown-linux-gnu- instead, like Gentoo Linux.
>=20
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -31,16 +31,10 @@
>  UTS_MACHINE	:=3D parisc64
>  CHECKFLAGS	+=3D -D__LP64__=3D1 -m64
>  WIDTH		:=3D 64
> -CROSS_COMPILE	:=3D hppa64-linux-gnu-
>  else # 32-bit
>  WIDTH		:=3D
>  endif
>=20
> -# attempt to help out folks who are cross-compiling
> -ifeq ($(NATIVE),1)
> -CROSS_COMPILE	:=3D hppa$(WIDTH)-linux-
> -endif

i wonder if there isnt some middle ground.  like only setting CROSS_COMPILE=
=20
like so:
ifeq ($(CROSS_COMPILE),)
CROSS_COMPILE :=3D hppa$(WIDTH)-linux-
endif

i think that should still work if people set CONFIG_CROSS_COMPILE, but if t=
hey=20
havent, get the existing (semi-sane) defaults.
=2Dmike

--nextPart3043800.9nHhrhYgv7
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJN3eIAAAoJEEFjO5/oN/WBuqcQALvaWiLq6g21eC4uVsN3eArg
QZRXxbgWZv1iY8/3/fbVUY6/FvcsuOFoYBY0YMzrrLz0KMfFP04t1mIxTRVVRCaM
+m81CkzFbyrm8HwtZDoWPfbYH0+VYI4GM62dBrZFapk9Squlzr+fn/pG8u2ons06
LyZaFESePob4YYb/UpvdI6CGFVnbAEGdK6NE+K1er3DFwwc+dTaBnMAG7oA1ph3S
acBpYVzp3Zr1Rfkb6MedxVaJTtRdiAgoefSVnMVy/eQjXVqkQ4le2sqGES5zpq9Z
wn3KCw30uzF0qSnc+eaV4Br3dCayGlMRUqd5tSN4+NeeKoxI4ibmbZ76iUCRv/bN
URSQ8f9ZzC3DwOOnSeeUjpv1eK6KvlfTFpmjEUvMSQwAZ1oPuIPDIijCPE8TiNrM
LQgMxRFXl3KrJ0ReXGzMWiuiTQHl6A//X9P8Ngvx1EiKA6YDCCmRcNOh+fi/mw5y
69qH1sPfKrwY9S1LxCnUYScwojqlTjl+TUZaipRHDwiPiuvy8bhvSTQdqA8HCu6W
LYDLp0HYry+hslpnMHC/P9qjsU1ZuFTV+dlgrevCcjnCj0VS2vSm1C9yS0ZPi9PF
vziXeKSJ9gihyU/pA5OyZv0qo/ckx1OQwzyUUNmB5ro9sN0e7pNNFADHFIdMV3K3
VDQOBg7ymg6ohJ/s+k1L
=dKGe
-----END PGP SIGNATURE-----

--nextPart3043800.9nHhrhYgv7--
