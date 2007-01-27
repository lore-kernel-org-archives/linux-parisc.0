From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 12:56:05 -0500
Message-ID: <200701271256.06424.vapier__41431.2125220478$1416624269$gmane$org@gentoo.org>
References: <200701271613.l0RGDmXX008512@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_2I5uFMS6CTTIhqV"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701271613.l0RGDmXX008512@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_2I5uFMS6CTTIhqV
Content-Type: multipart/signed; boundary="nextPart1769344.XnKTeEbv0S";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1769344.XnKTeEbv0S
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 27 January 2007 11:13, John David Anglin wrote:
> > after upgrading from 2.17.50.0.9 to 2.17.50.0.10 (.11 too), ld seems
> > unable=3D to=3D20
> > do anything remotely basic ... is there something basic i'm missing here
> > ? =3D i=3D20
> > verified that it isnt caused by the Gentoo patchsets as a vanilla
> > build=3D20 exhibits the issue as well
>
> There's been very few hppa changes to binutils in the past several
> months.  I can't duplicate the problem, so maybe there's something
> wrong with your libc setup.

no, one of the very few changes to the hppa bfd broke things ... it's writi=
ng=20
the ELF OS ABI field as HPUX instead of Linux and well, that doesnt go over=
=20
very well :)

here's the weird thing ... looking at bfd/elf32-hppa.c in binutils 2.17.50.=
0.
{10,11} doesnt seem to match the version actually in cvs ??

at any rate, attached patch applies against 2.17.50.0.10 and 2.17.50.0.11 a=
nd=20
fixes the issue for me
=2Dmike

--nextPart1769344.XnKTeEbv0S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARbuSNkFjO5/oN/WBAQK28hAArb3NzCSaXw/QW7+DhxXE4OrLKDs2Ojx0
99Pb4iCOPplnTRs3Slw2MDBoelrMWjCe6S/d8k5A6bPuej66h2jjzRSgAZjPEW3l
IjWhNuvQSDm4YA+9mdTsjd5iv730l3Y37nOr9AwqMOZHBiPF/Bdwu9BekOxrLysT
WeFbyywXq3dwehZZ0/boaV8M+2bLIMor4x5q/aT50chdrem0mdXM1IluXDiVaiuD
s3+oTowmyQq0fURww7Y6mNHdud/lJCW8HCbuCY4zlIYuPJppPSV//maX9Hsd4kEJ
W25FVFDOd9tAzmHd0a2+S5P5ZwLDthOMyLH9kMIJ4Ryr+s2Q+LpOdUPXDF08otKA
qhK5DsbGZxKJmGM2JLAL/y3JrOz5XZrBQWvQMGsaBRXCNbttabePeiGkYgfVhLIh
6q5oAW38bjyeq03S3iCzjeBwp0p8adb9Q3xFerBeI0otQKp9E9nv2FCEEnDbr1rY
CRmkoUPL4mKfx7bfBvNiqyK7JhYbn/wh4BMKuzMY1thHLimTY2OkHPjBbs4qCt9n
2G+4gfveMr6jajBUdd/+6er82FfaP0fakhMiov2GLOSv0vpfBLOOdpNnNYc/gK3o
vdCDDmMj4A/kXIBSItLTaZ70Pg3Wo1hFPgbFYbV9V2VflLz+sha4Nhlq606Hd5Il
dwZNSEY302Y=
=El7V
-----END PGP SIGNATURE-----

--nextPart1769344.XnKTeEbv0S--

--Boundary-00=_2I5uFMS6CTTIhqV
Content-Type: text/x-diff; charset="iso-8859-1";
	name="binutils-hppa32-bfd-bed.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="binutils-hppa32-bfd-bed.patch"

2007-01-27  Mike Frysinger  <vapier@gentoo.org>

	* elf32-hppa.c [elf32_bed]: Define for hpux, linux, and netbsd.
	[INCLUDED_TARGET_FILE]: Remove.

=2D-- binutils-2.17.50.0.10/bfd/elf32-hppa.c
+++ binutils-2.17.50.0.10/bfd/elf32-hppa.c
@@ -4656,6 +4656,7 @@
 #define ELF_MACHINE_CODE	EM_PARISC
 #define ELF_MAXPAGESIZE		0x1000
 #define ELF_OSABI		ELFOSABI_HPUX
+#define elf32_bed		elf32_hppa_hpux_bed
=20
 #include "elf32-target.h"
=20
@@ -4665,8 +4666,9 @@
 #define TARGET_BIG_NAME			"elf32-hppa-linux"
 #undef ELF_OSABI
 #define ELF_OSABI			ELFOSABI_LINUX
+#undef elf32_bed
+#define elf32_bed		elf32_hppa_linux_bed
=20
=2D#define INCLUDED_TARGET_FILE 1
 #include "elf32-target.h"
=20
 #undef TARGET_BIG_SYM
@@ -4675,5 +4677,7 @@
 #define TARGET_BIG_NAME			"elf32-hppa-netbsd"
 #undef ELF_OSABI
 #define ELF_OSABI			ELFOSABI_NETBSD
+#undef elf32_bed
+#define elf32_bed		elf32_hppa_netbsd_bed
=20
 #include "elf32-target.h"

--Boundary-00=_2I5uFMS6CTTIhqV
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_2I5uFMS6CTTIhqV--
