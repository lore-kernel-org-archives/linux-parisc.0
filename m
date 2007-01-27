From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 14:38:51 -0500
Message-ID: <200701271438.52157.vapier__15319.9034547017$1416624270$gmane$org@gentoo.org>
References: <200701271919.l0RJJDeq011264@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1167316613=="
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701271919.l0RJJDeq011264@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1167316613==
Content-Type: multipart/signed; boundary="nextPart1695403.t7L4tOXuut";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1695403.t7L4tOXuut
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 27 January 2007 14:19, John David Anglin wrote:
> The problem appears to have been introduced by gentoo by the addition
> of several ELF_OSABI defines to the file ;)  I don't think they should
> be there.

huh ?  that patch was against vanilla binutils release ... in other words, =
i=20
did `tar jxf binutils-2.17.50.0.11.tar.bz2` ... so unless Gentoo has patche=
d=20
tar to screw up elf32-hppa.c, i dont think it's a Gentoo issue
=2Dmike

--nextPart1695403.t7L4tOXuut
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.1 (GNU/Linux)

iQIVAwUARbuqS0FjO5/oN/WBAQI9hw//c6emD5wwVKWP2l2PhH3rcgNVaJ/rmDV6
MnuyhnvJNRUxS2OJ2ENBnvTlHWD9458Yh37NTy6QdBAzzjMgbiyda3WLJ1kujOST
UnyhuV/F48zjTVfFrNP+vh69ekEJNf39zuonDmkHQ9aRXiPj+C4fkopY+P8Lvcrc
AieZirlJSDSpLPyWx1ZEcgxc1wdrAgL2w/pVQgMyyTZL5JsBd00Z2Z0BVSBXcR7B
YzbLjPQ+e9smq4d5/AGSj5NJmCw/MrEysXAGCQag0BTpwv5vWF6g0oDnLN0jFjvm
nxpcTqb1OPIBrA65x/j7J+pqgKYjbodpSuzknvamjZephNp8KWAKpei1NMYsi85X
7bdTQSsPeHYPWI1U3iJRAAohHsVxcexhN7b+RPeD/C+7U8Ps96UhZWkNvJZ95/eB
hBM6q14i2W1ehBetqMtZWNDIJT2nV+fVvzQXGClTzMJ2xdScSu8l9ld1cyQvOIpZ
Tobt9IqOOHApFgxqCnpv/nCiJ8JEh+UhIO9w4RDlODjqZA71uk9AF3IsCCjoS0FI
ID5qOm3OM3VabIS5q4hnd1VqvNnRSQXnekKHT1PPnp9vKzOBsmZmNOSodcpfQIsF
tu0D1E4MebMgDq3GnNAowhZLV4Om86w8wrvwokFxl/da0yTWTLXGsm4Jabva2wB9
arXkkWF+vBs=
=iUvL
-----END PGP SIGNATURE-----

--nextPart1695403.t7L4tOXuut--

--===============1167316613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1167316613==--
