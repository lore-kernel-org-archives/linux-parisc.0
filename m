From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Re: update mman.h in latest glibc cvs
Date: Sat, 26 Aug 2006 00:59:00 -0400
Message-ID: <200608260059.00980.vapier@gentoo.org>
References: <200608250050.34940.vapier@gentoo.org>
	<119aab440608251301i8096348u60a567f795dc2ded@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1181580365=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608251301i8096348u60a567f795dc2ded@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1181580365==
Content-Type: multipart/signed; boundary="nextPart1993912.nTLlEV5XPA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1993912.nTLlEV5XPA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 25 August 2006 16:01, Carlos O'Donell wrote:
> 1. You need a ChangeLog.

indeed ... i wanted to see if the patch was correct first as writing Change=
Log=20
entries is boring ;)

> 2. You will need FSF assignments if you don't already have them for GLIBC.

i dont have in place specifically for glibc, ive just contributed my previo=
us=20
things as "small" and/or "obvious" ... i can simply release into the public=
=20
domain; all that matters to me is that things get fixed

> The following is a bug.
> +# define MAP_ANON	MAP_ANONYMOUS
> +# define MAP_ANONYMOUS	0x10		/* don't use a file */

yes, that should be reversed

> Please avoid superflous style changes.

it isnt superfluous, it is the "GNU standard" and the way all other arch=20
mman.h headers are done ... so while i personally consider the GNU coding=20
standard complete garbage, glibc is a GNU project and adheres pretty rigidl=
y=20
to the GNU coding standard

> Are you sure nothing uses these?
> -#define MAP_VARIABLE	0
> -# define MADV_VPS_PURGE	  6	/* Purge pages from VM page cache */
> -# define MADV_VPS_INHERIT 7	/* Inherit parents page size */

i was syncing to other architectures ... but since parisc is the only one (=
in=20
the kernel headers) that defines these three, i guess it's appropriate to=20
keep them for parisc
=2Dmike

--nextPart1993912.nTLlEV5XPA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARO/VFEFjO5/oN/WBAQJtpxAAzH2pPz8DLS61WA1JxutCB5m0FeER6F2s
fRE3bgiETFFsAQlBg++xg4+3pQgphgsBD8XLO83AMJmMLZIDXAb6amzUuFFRk1U3
3daGTMGzdB9ob1chDCVhao3rHyckH8WY7+LweqsBToLH/gY/n2p+chlbDwV5ZYnJ
AKuHPd/PUKGXNcNp9yiAdClM/UvvkuvgyjL5JNhk/OUdM/6rI8/fVT3gnpZ+DSEc
3oSvP7en8QOXBO0fbmtLqwQnusLLiWjCcuOb9BssH9OvEuDvQY5cmV+jUIGkefyy
oEVgr3Qpv40XAlcyqXu7oYZiuzYDkADeB8h4P/u3Fuhb3ePOJpel/9E+z1/lPKPj
GR2V13CHQXQOJZHLK2S45PeLYMZDN3Yxh+ahIGIdT6wy4vfErRbxp6G7Tmo53+oX
thJ0L6lmZMXfOFTX5HNOISvJnX39wIKNMBK3mc09qEskcSRopFEx82I6UbGZXzCi
T+IyKwRBaYL52/muj/AVnN0hLD37f97QS4fxvZgrLYkC5NDXlKqNkPQzlI2fn8Bc
boRQ7x8J5sn9hhBoB27J8GDZXaUZE5lR+mXIUQAWALlWMtHD+XYXVhjmnzY3WkjV
Je4kqd46DyGt/uVjqvEBCFZOjPMxr8601L2IQVWxNilxpW7FFnpSVqmI8CuepUSb
xP2Ly8fww3c=
=j2q/
-----END PGP SIGNATURE-----

--nextPart1993912.nTLlEV5XPA--

--===============1181580365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1181580365==--
