From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 19 Dec 2013 16:19:03 -0500
Message-ID: <201312191619.05005.vapier@gentoo.org>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8795544.5k3dsq6lmD";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart8795544.5k3dsq6lmD
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 19 December 2013 14:44:40 John David Anglin wrote:
> On 12/19/2013 2:17 PM, Aaro Koskinen wrote:
> > This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
> > mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> >=20
> > $ localedef -c -i en_US -f UTF-8 en_US.UTF-8
> > cannot map archive header: Invalid argument
> >=20
> > strace looks like this:
> >=20
> > mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) =3D 0x42f34000
> > mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, =
3,
> > 0) =3D -1 EINVAL (Invalid argument)
> >=20
> > With the patch reverted, it works:
> >=20
> > mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) =3D 0x42d74000
> > mmap2(0x43000000, 1607632, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, =
3,
> > 0) =3D 0x43000000
> >=20
> > BTW, note that for GLIBC 2.18 some changes were done regarding this:
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D10283
>=20
> Are you sure the glibc changes are correct?  PARISC addresses are not
> strictly aligned to SHMLBA.
> There's also a page offset and "random" offset derived from the kernel
> address of the mapping struct.

the glibc changes were to use SHMLBA as the min alignment where as before i=
t=20
was using PAGE_SIZE.  the kernel shouldn't reject us because we manually=20
increased our alignment ... the mappings should still be overlapping, so it=
=20
shouldn't be an "out of mapping space" issue.

the first one gets a really large map (not fixed), and then the second does=
 a=20
small mapping inside of that first one.
=2Dmike

--nextPart8795544.5k3dsq6lmD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSs2LIAAoJEEFjO5/oN/WBccIQAJW++byloSrRlXgaMQhVKgOI
ptzmtjI1YfCYIWV9JFf92KsaJ6m2ATYux2IJ5bib0xLJu03FFvJFUTgQnnra7vVn
AlRtL3nACUd2qUH8nSXrYWYH64e+G9QoBaX6ZU1+Bczn0mxneZaSYRFzN5qY4s9C
xrdIVS0jpFMo9N1xHI/9F5uEjKaSZWFgggS7ykP6FgqaOs4j33ZMs8y2Ne6sXlfy
RizCVoqNX6NzXvESSyPTlm0RhuCNc5chkAOOuT2rpmr+kYNF7LZz4zcj0T1M6ncn
UbwvUwPve6K0H/Br4lW56UyHfDCvWVhntB6mmd4vTP7WCje1Sf8eB0XXOIzpCS0W
x1Wv7zd+3tfDtRMteHSHK2FnRt8LlshGlyVaVr9duttf5cf6BsrNQKDYcXT2paWe
zq3nwre+6U+rzEkVf1JdOiuCiBaOGHI0l00sGD+2rvaOikIgeJW2YV7vd7GBfluG
1tzgsQQN023xxnKuF76jpYSYZEYFErdz84shiCdasBId11851zDT3MDiJeHMOxjf
3OnL4YMgqxSGbLWIdB3UdmhUI0OyvG42vKA20lOVLwNCjG4g1j09jncscoaw+cev
rWk0QAK5tuFxALhUXKofHOF+PyRpkbpvsTcjINoRD3/qfP+PwCN5ons8VAiWbtW/
MyZsTPvb307uaQPGNozx
=evsn
-----END PGP SIGNATURE-----

--nextPart8795544.5k3dsq6lmD--
