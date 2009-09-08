From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: Transition hppa from linuxthreads to nptl is ready to proceed.
Date: Tue, 8 Sep 2009 13:57:35 -0400
Message-ID: <200909081357.37995.vapier@gentoo.org>
References: <119aab440909071454s7923b95atce6f5f5a7e5b469d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2278468.tGZeLkmCNM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Petr Salinger <Petr.Salinger@seznam.cz>,
	Grant Grundler <grundler@parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909071454s7923b95atce6f5f5a7e5b469d@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart2278468.tGZeLkmCNM
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 07 September 2009 17:54:01 Carlos O'Donell wrote:
> The following patches implement version 2 of the NPTL upgrade for
> hppa. This second version is a rewrite of internal pthread structures
> and is 100% ABI backwards compatible. All old applications will run
> with the new glibc, including during partial upgrades.
>=20
> I have tested the following patches with eglibc_2.10.1-0exp1, the
> testing has included the standard glibc regression testing, simulation
> of partial upgrades, and heavy chroot testing with Xnest, and several
> large multithreaded UI applications (evince, xchat, nautilus,
> gnome-session etc). All tests succeeded.
>=20
> * Please add the following patch to the hppa set of patches:
> http://www.parisc-linux.org/~carlos/debian-final_glibc-ports-hppa-nptl.di=
ff

any reason for not pushing this (and all the other hppa patches) to the gli=
bc=20
ports tree ?  it isnt like you'll be breaking anything that isnt already=20
broken, and it'll make it easier for people to play with mainline glibc.
=2Dmike

--nextPart2278468.tGZeLkmCNM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJKppsRAAoJEEFjO5/oN/WBOScP/2zaPk/1G6PeU8OQk4TaLBuz
IZ0kEkNbWLidRIayVBgaABaJFpFu8mU7wj0AK/dRUL7uZllcl8J5U+R7fVKs07Ax
m1gaxsWM1XyyOrZBDFa0FS1huMGJtr1t/KVwJ7ldbJYtpIc31d5ipZ11QnquoS/w
S+5Ljtzf8nB4AMazKno3iezYVT53OwyCup3hadNs7NIBq8dX/+1EGXZuha9HYjwF
06VFlvADu1mllz0wP6bHMIFnSwbLg2mWiSYQaLaUD4MjoH67u4chAjUzWEYWXHoj
NDaFgKzySZt8SlwbwpGTAE1E6gLrq3vq2ns6WWQr/IXxLwplNdwiY88tVM7RLUhb
VzGqm0izBbhVxzWeQmsteGY/iM5CB20CDiDbkJgCtFhpBIdrw64MaEVMy2HyzzSj
QxAwbHaI1rDu/tiklyuYJwPF6X5Gte+o1WZUSyz5HNp5TP8bVh570vN1wr9OEoXb
f17uayDbhBEG2Ppv7/2HDxRVKh5pD4eyvDDGlr0PXdRha0xssV54LXtW9ZrHT89Y
mSc1jo4O+MqbzsuNBD3VnY+MEQD4RWlZZ9XLmeD3P0OF6why876qqQ5AkCnY2wXb
7sdA9MVIL1K5TAUhnni4/1K+2o7E99lvnmW+m4KEMeREKxLY4VkwqkyxuEnvM5Xx
Mb5NyehJtacAFUZi4sdj
=u9Tc
-----END PGP SIGNATURE-----

--nextPart2278468.tGZeLkmCNM--
