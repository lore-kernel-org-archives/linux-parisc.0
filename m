From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Thu, 16 Nov 2006 23:16:25 -0500
Message-ID: <200611162316.26872.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<119aab440611161948w5005d083ma170b013409c93c6@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1483173861=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611162310.03845.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1483173861==
Content-Type: multipart/signed; boundary="nextPart5735798.DmiPFVka1d";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart5735798.DmiPFVka1d
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 16 November 2006 23:10, Mike Frysinger wrote:
> On Thursday 16 November 2006 22:48, Carlos O'Donell wrote:
> > Not only that but I have to help bootstrap distros using NPTL.
> > *waves to ubuntu and gentoo guys*
>
> i tried gcc-4.1.1/glibc-2.5 for hppa already and i thought it was broken

ok, just tried glibc-2.5 + hppa + linuxthreads and that is for sure broken=
=20
(the defines for handling locking is all broken in the release)

what is the minimal binutils/gcc versions for TLS support ?  binutils-2.17 =
+=20
gcc-4.1.1 =3D=3D no hppa TLS
=2Dmike

--nextPart5735798.DmiPFVka1d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV03mkFjO5/oN/WBAQICbw//bPVmQVVa6JsO3mZr3heDv8Rd0iyGbqFS
kzWu3cHiDeknuilNAuHSQYHabFe6pCYKos244NbGimalZYkqKmtmaJqLWXKfl5Jz
INxlajjaQ5uhVcU4WzO9+yGX897QidmfgSVI1//llpaL7XbE/fWlEEnj5BcO3HX4
pD8tCyFzFS3L7Ei1KHdhU+52LsGtlT6/wLB6x5j1OwtBDtD1rWO+OO47KEXdfvrc
ggwmIWIFFckSodep7ev3mtUyWHw1LuRBgeUv66/MGHz0ABiA1qzUa7CFB0vUdYya
AIchhcv7vkYV2mLjo2gwo09SNBi5DYTOo4sH2ftJ/GZU+LZn+uY/zynQcbm8pB7Q
ZtIdow3c/G0Ss/HyhTZrNXww/qY4v7F4kWgkUdka1VZaLoqHsB8g4ENbM6rhGLNN
6Vq64hABhBqPWpWR7ibjIfPPLYfQGrbuWjhJyyM+NWtwzfFOM3dt2Qs/GSGWMWfz
QKp8TYYVVBGA4am5jvSg+uygbM1op7Ookl9U9pNh35WTkvyUqUU/W8LkRfSqrpDK
JEYhTM6Q5eppiZPmWDO6n4LQ+h1wEg/D4stalFVtNupgeVk632BCMyv0fRmFneNH
PnT+bZcb1L30X6EMwgJVwhsWPBSajmhs2sKRYx39KpPo6CmOvUWfyAEprmsCsjiM
29s3IcF5aEE=
=PA+B
-----END PGP SIGNATURE-----

--nextPart5735798.DmiPFVka1d--

--===============1483173861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1483173861==--
