From: Modestas Vainius <modestas@vainius.eu>
Subject: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Wed, 2 Jun 2010 18:33:12 +0300
Message-ID: <201006021833.23216.modestas@vainius.eu>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
Reply-To: Modestas Vainius <modestas@vainius.eu>, 561203@bugs.debian.org
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1902824.nPJ22nheZJ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: dave.anglin@nrc-cnrc.gc.ca,
 deller@gmx.de,
 gniibe@fsij.org,
 linux-parisc@vger.kernel.org,
 pkg-gauche-devel@lists.alioth.debian.org,
 561203@bugs.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <bounce-debian-bugs-rc=glddbr-debian-bugs-rc=gmane.org@lists.debian.org>
Resent-Message-ID: <handler.561203.B561203.127549291217153@bugs.debian.org>
In-Reply-To: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
List-Post: <mailto:debian-bugs-rc@lists.debian.org>
List-Help: <mailto:debian-bugs-rc-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-rc-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-rc-request@lists.debian.org?subject=unsubscribe>
List-ID: <linux-parisc.vger.kernel.org>

--nextPart1902824.nPJ22nheZJ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

this bug [1] is back to the "very common" department with eglibc 2.11 (libc=
6-
dev_2.11.1-1) builds. Majority of KDE applications are failing to build on=
=20
hppa again. Is there really nothing what could be done to fix it?

1. http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D561203
2.=20
https://buildd.debian.org/fetch.cgi?pkg=3Dkde4libs;ver=3D4%3A4.4.4-1;arch=
=3Dhppa;stamp=3D1275467025
3.=20
https://buildd.debian.org/fetch.cgi?pkg=3Dbasket;ver=3D1.80-1;arch=3Dhppa;s=
tamp=3D1275483241

=2D-=20
Modestas Vainius <modestas@vainius.eu>

--nextPart1902824.nPJ22nheZJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwGebkACgkQHO9JRnPq4hSKPQCghcD4x7NkMP1/81PQ+gV1pK8I
P00AoNfsgRUpWmegDJZ8w9nWuqmuHg+5
=zKJW
-----END PGP SIGNATURE-----

--nextPart1902824.nPJ22nheZJ--
