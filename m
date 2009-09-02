From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: hppa nptl switch
Date: Tue, 1 Sep 2009 20:03:47 -0400
Message-ID: <200909012003.49114.vapier@gentoo.org>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz> <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com> <4A9D42C3.70103@aurel32.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1727791.UFAkbaJvdF";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A9D42C3.70103@aurel32.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1727791.UFAkbaJvdF
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 01 September 2009 11:50:27 Aurelien Jarno wrote:
> Carlos O'Donell a =E9crit :
> > On Tue, Sep 1, 2009 at 2:08 AM, Aurelien Jarno<aurelien@aurel32.net>=20
wrote:
> >> Frans Pop a =E9crit :
> >>> Carlos O'Donell wrote:
> >>>>> In practice it shouldn't be problem at all.
> >>>>> Debian should make sure that binary/library compiled
> >>>>> against NPTL-hppa-glibc will require NPTL-hppa-glibc
> >>>>> by proper Depends: line like "libc6 (>=3D 2.10)".
> >>>>
> >>>> Does every package have to do this? I'm not very familiar with all t=
he
> >>>> packaging requirements.
> >>>
> >>> It is something that should automatically get done correctly as long =
as
> >>> the libc-dev package defines the minimum version that way.
> >>>
> >>> The mechanism that determines this is in
> >>> /var/lib/dpkg/info/libc6.shlibs. Currently this has lines like:
> >>>    libc 6 libc6 (>=3D 2.9)
> >>
> >> No, as glibc uses symbols files, this file is actually not used.
> >> Nevertheless it is still possible to resolve all symbols to libc6 (>=3D
> >> 2.10).
> >
> > Once an application is rebuilt against a new libc, what prevents the
> > user from downgrading libc and breaking the application?
>
> If we make sure that the new programs are using symbols from version
> GLIBC_2.10, the program should refuse to start with a lower version of
> the glibc.

i think the question was one about packaging rather than general use ?  if =
you=20
build a package against a newer glibc version but it only uses older symbol=
s,=20
then in theory it should work fine with older glibc versions.  if the symbo=
l=20
changes between versions, then it should have corresponding symbol version=
=20
changes as well (which will automatically be recorded in the binary).
=2Dmike

--nextPart1727791.UFAkbaJvdF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJKnbZlAAoJEEFjO5/oN/WBRiYP/RZSRtshdPXyzkxYWnr3mAMR
pkhoVsytwkOzwTJQt1dOE6jVVv20AcgxCFmjR1jQ6bHOUoGHqwjsn5hWBTqMpcRl
ncmc0WgLKQEsDpRm6pKgjvqLVtoDHekO3l50D51Sxc/McMAbPTVANmgfSJUfK+NL
RVlVyGqZ0Jl5BZlKPTZAE9XkrjF9Cdkm9eAOSJWBGSvKES7eeJ2K3FG/Ac8ohXO0
T70O5awQz/juNnnPnzvMf6lVkh4vgyhGuSpqgeBUNG6Kk5d9LPqI2SpUazTq8g3D
4r1n2eZtHICQI5JNX0pgS8jpebRB7iEj3B6RDr3g0qNg2sEVew0Ts/9b8CJLREMi
V8ZTqPDVaO2BPePDWSdinP17OdkcotI++DlnD7FhPZtqlMcty30eMgrvFdClwEEd
lSz4Chq0Fqe1+Vmo5EJHJWSvJem97ER56awzctOLrvM1fL99Af8Avo9qL3iYvRX3
VAZwj5D7Tdfy6F2z7M+/lxQScdcyy2vmQdAMRXgxyuBWivEXVUQ5XAhMTpVkO7PM
jUtPtWj0I0hoqUuV71BK8USb9EmHEwur7cktG05Mjff63KnwEVHEHC+HiQ/tlFyi
2mmvPXvVeOyorY/FkyVqGPJU7Cyy6xYrS/KnbWljmathXP+75GzAOtAOwihrYiPQ
isLksKe/KrE1twWgFR4n
=Y5f9
-----END PGP SIGNATURE-----

--nextPart1727791.UFAkbaJvdF--
