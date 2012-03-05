From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: HPPA64: Cannot write to ext4 filesystems with files > 28672 byte
Date: Mon, 05 Mar 2012 20:02:47 +0100
Message-ID: <2644534.tZXB7rEiue@eto>
References: <51659a45a16b0a5b0ede44e3f3e830dc.squirrel@webmail.sf-mail.de> <BLU0-SMTP92018283116845C259EC9F97530@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1424176.3vNPqjLjSF"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP92018283116845C259EC9F97530@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1424176.3vNPqjLjSF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Sonntag 04 M=E4rz 2012, 17:14:14 schrieb John David Anglin:
> On 27-Feb-12, at 9:55 AM, Rolf Eike Beer wrote:
> > Recent kernels (>3.x) fail when writing to ext4 filesystems with th=
e
> > message "file too large". The critical size is 28672 byte (7*2^12).=

> > This
> > has been traced down to ext4_max_size() by Tobias Ulmer, which look=
s
> > like
>=20
> > this:
> Fixed in GCC source trees (> 4.4).  Problem was incorrect shift cause=
d
> by truncation to int.
>=20
> The following instruction was incorrect:
>=20
>   50:   d7 9f 12 1d     depdi,z,* -1,sar,3,ret0
>=20
> The length operand was incorrectly calculated.

As I said ;)

Linux pioneer 3.2.9 #1 SMP Mon Mar 5 13:17:55 CET 2012 parisc64 PA8800 =
(Mako)=20
9000/785/C8000 GNU/Linux

And I can now properly use the ext4 filesystems again, yay!

Thanks, excellent work!

Eike
--nextPart1424176.3vNPqjLjSF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk9VDdcACgkQXKSJPmm5/E7HEgCffEcgRDqABrhNCuCzewAb2zDx
wFEAn0R+FDn1J9Nx5FMysorU7kr5szD3
=ZRXe
-----END PGP SIGNATURE-----

--nextPart1424176.3vNPqjLjSF--

