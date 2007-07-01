From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Mon, 2 Jul 2007 00:44:17 +0200
Message-ID: <18056.11841.395484.508171__10312.3899935328$1416624405$gmane$org@gargle.gargle.HOWL>
References: <20070613082133.GA19999@frankengul.org>
	<200706131332.l5DDWObn025750@hiauly1.hia.nrc.ca>
	<20070613142304.GA21970@frankengul.org>
	<46705613.8020708@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46705613.8020708@frankengul.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The proposed fix seems to be wrong, as it disables the backport on all
architectures.  Please could you recheck with current trunk? As jda
suggested, another backport is missing for hppa.

  Matthias

S=E9bastien Bernard writes:
> Ok, I nailed it.
> I removed PR20218 patch and generated a 4.1.2-12+b1 then build glibc.=

>=20
> Glibc build is ok now.
> I think the hppa toolchain can move on and build the glibc-2.5-11 and=
=20
> then rebuild the portmap and all pie executable (pfeww... what a bug =
chain).
>=20
> =09Seb
>=20
> diff -r -u -b -B -w gcc-4.1-4.1.2-12/debian/changelog gcc-4.1-4.1.2-1=
2+b1/debian/changelog
> --- gcc-4.1-4.1.2-12/debian/changelog=092007-06-13 22:34:38.000000000=
 +0200
> +++ gcc-4.1-4.1.2-12+b1/debian/changelog=092007-06-13 12:44:48.000000=
000 +0200
> @@ -1,3 +1,9 @@
> +gcc-4.1 (4.1.2-12+b1) unstable; urgency=3Dlow
> +
> +  * Revert 20218 patch that breaks gcc
> +
> + -- Sebastien Bernard <seb@frankengul.org>  Wed, 13 Jun 2007 12:44:0=
7 +0200
> +
>  gcc-4.1 (4.1.2-12) unstable; urgency=3Dhigh
> =20
>    * i386-biarch.dpatch: Update for the backport for PR target/31868.=

> diff -r -u -b -B -w gcc-4.1-4.1.2-12/debian/rules.patch gcc-4.1-4.1.2=
-12+b1/debian/rules.patch
> --- gcc-4.1-4.1.2-12/debian/rules.patch=092007-06-13 22:34:38.0000000=
00 +0200
> +++ gcc-4.1-4.1.2-12+b1/debian/rules.patch=092007-06-13 12:45:06.0000=
00000 +0200
> @@ -41,8 +41,6 @@
>  =09fastjar-version \
>  =09fastjar-doc \
>  =09libstdc++-doxygen \
> -=09pr20218 \
> -=09pr20218-mips \
>  =09pr31868 \
>  =09arm-libffi \
>  =09libffi-backport \
> @@ -112,10 +110,6 @@
>    debian_patches +=3D pr25524-doc pr26885-doc gcc-4.1-x86-blended-do=
c libjava-backport-updates2
>  endif
> =20
> -ifneq (,$(filter $(DEB_TARGET_ARCH), amd64 i386 powerpc ppc64 sparc =
s390))
> -  debian_patches +=3D pr20218
> -endif
> -
>  ifeq ($(with_libffi),yes)
>    debian_patches +=3D \
>  =09libffi-configure
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
