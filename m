From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 18:02:37 -0500
Message-ID: <201312191802.39169.vapier@gentoo.org>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <201312191619.05005.vapier@gentoo.org> <BLU0-SMTP458FC9FB0E8F5D98CB7B8897C50@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2381712.e94IgjGsNi";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>, carlos@redhat.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP458FC9FB0E8F5D98CB7B8897C50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2381712.e94IgjGsNi
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 19 December 2013 17:38:37 John David Anglin wrote:
> On 12/19/2013 4:19 PM, Mike Frysinger wrote:
> > On Thursday 19 December 2013 14:44:40 John David Anglin wrote:
> >> On 12/19/2013 2:17 PM, Aaro Koskinen wrote:
> >>> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
> >>> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> >>>=20
> >>> $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
> >>> cannot map archive header: Invalid argument
> >>>=20
> >>> strace looks like this:
> >>>=20
> >>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) =3D 0x42f34000
> >>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED,
> >>> 3, 0) =3D -1 EINVAL (Invalid argument)
> >>>=20
> >>> With the patch reverted, it works:
> >>>=20
> >>> mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) =3D 0x42d74000
> >>> mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED,
> >>> 3, 0) =3D 0x43000000
> >>>=20
> >>> BTW, note that for GLIBC 2.18 some changes were done regarding this:
> >>> https://sourceware.org/bugzilla/show_bug.cgi?id=3D10283
> >>=20
> >> Are you sure the glibc changes are correct?  PARISC addresses are not
> >> strictly aligned to SHMLBA.
> >> There's also a page offset and "random" offset derived from the kernel
> >> address of the mapping struct.
> >=20
> > the glibc changes were to use SHMLBA as the min alignment where as befo=
re
> > it was using PAGE_SIZE.  the kernel shouldn't reject us because we
> > manually increased our alignment ... the mappings should still be
> > overlapping, so it shouldn't be an "out of mapping space" issue.
> >=20
> > the first one gets a really large map (not fixed), and then the second
> > does a small mapping inside of that first one.
>=20
> The mmap check is here:
>=20
>          if (flags & MAP_FIXED) {
>                  if ((flags & MAP_SHARED) &&
>                      (addr - shared_align_offset(filp, pgoff)) & (SHMLBA
> - 1))
>                          return -EINVAL;
>                  return addr;
>          }
>=20
> In the case at hand, the addr value passed is not equivalent to the value
> returned on first mmap2 call.  So, the error is correct.  The
> application has to
> preserve the "SHMLBA - 1" part of the address when selecting a new map
> address.
>=20
> The error is EINVAL (i.e., bad address).
>=20
> The old code wouldn't have returned an error but the second mapping
> would not
> have been equivalent to the first.
>=20
> My head spins regarding mappings inside mappings as it seems they may
> conflict.

we designed the new locale code to work on all systems (including fixing th=
e=20
behavior on older parisc64 kernels).  the assumption is that, if we want to=
 do=20
overlapping mappings, we need to use SHMLBA as the min alignment (since tha=
t's=20
what the define represents -- shared mapping alignments that the hardware i=
s=20
restricted by).  and that is what the new locale code is doing.  glibc defi=
nes=20
SHMLBA to 0x00400000 for parisc which is why 0x42d74000 turned into=20
0x43000000.

so either SHMLBA on parisc is wrong, or the new kernel code is wrong
=2Dmike

--nextPart2381712.e94IgjGsNi
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSs3sPAAoJEEFjO5/oN/WB08oP/ix9y9dqej8GDmVoxZiy4LIt
mkUSEslHWqwQRKRvVt5p5t031KmM46LJqrvzBafV+5vZaf/9SLaRiLJaE1OCjwFf
U51QdwrULnzPj+bg7Z6z6ynJnuiziSNs5zHZ2LWF8Fxg0aM9PRvDi7Pwnh3K3QPi
3a1fk+T1EZOw5cEF7EhfsA+5sC3gogqOpgzsXRjKWv5AOKADgoKSUFt71XOaKrGm
KRlGDOaNdoNGQPUUbpfft/4GBBVSXZlv7K3XVQUmgi8QrIzy717aRyEZwRu3utxT
oQeHATxUGxoAW9NqIT9go9J4K1n/0HuPOX/Z+fvb45yc9DxTg9wGlciTc/QnLeGq
ZxGUL1rRmN+CuliMqOtimck7GVSzXRb69TiPrfsEiwsJeOkz7CIrOJbNR4FfCM+4
6NUG154o8umR77NQaUVpRDkEJG82M0ZkqspwWX0Ce/C2l6ghSiYUkfSw9OpVvszr
vj5i1ExP8nUythMco/9ZspgUgQvNqRnJq+0627iBO6xS/MvJQHxFkrrlCbkpKfA7
OVbjYzoI0n+Qq+uIiY8ZytETLqp3d9MrkZr8sMHhM2lob9Hh1Zi65FEjB93XHIOP
fiHy6m8dbcLDYs11/qep3YdNmEl6UINIXGG8/A2W12oWje6WK6xNzJhqp/UNXo7c
2MQ55pskeRrialvfToOk
=lJC6
-----END PGP SIGNATURE-----

--nextPart2381712.e94IgjGsNi--
