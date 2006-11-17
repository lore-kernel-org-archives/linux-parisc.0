From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Thu, 16 Nov 2006 23:10:01 -0500
Message-ID: <200611162310.03845.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611170148.kAH1moG4028180@hiauly1.hia.nrc.ca>
	<119aab440611161948w5005d083ma170b013409c93c6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1570527225=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440611161948w5005d083ma170b013409c93c6@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1570527225==
Content-Type: multipart/signed; boundary="nextPart2455656.yIMGLyUmHG";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2455656.yIMGLyUmHG
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 16 November 2006 22:48, Carlos O'Donell wrote:
> Not only that but I have to help bootstrap distros using NPTL.
> *waves to ubuntu and gentoo guys*

i tried gcc-4.1.1/glibc-2.5 for hppa already and i thought it was broken ..=
=2E=20
plus, it makes it hard doing cross-compiles when my 64bit hosts (which i=20
wh0re a lot because they're the fast ones) induce ICEs when building=20
glibc/uclibc
http://gcc.gnu.org/PR29114
=2Dmike

--nextPart2455656.yIMGLyUmHG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV02G0FjO5/oN/WBAQKJaA//f4sg9dkGC0EbDUxZL6Gfu3ArCvxNeoQm
TgV5X2pgSIro2mHqZThYigTfFgpBFhSrDXx6W8e5IWzCNO+jaZgjxk8ex2ArrQZy
LqyNW6kEemOjZGl3EgZ79LrQJPu6Wj8eMOqulHiBq2BXh6Znxpz93/K8DKCgpJIU
m0n9Wi4EykMLzaeOyTrZcJfA7w5bbXCsMU0IIGn/wSFAYeCTCMKBC5qJG6EykJSQ
PNvgFry5gLhCCKY5zfloHyD1fEYexLT/B9LxFpEr3o2uOGo7PPit6CHS4Dgl6ig8
7D3YU0/RubwEZcsY+KEioi4gU60SnkFz19PSS8iq9ML1fVIYzKEMrx+vhCbwGESk
FmBw02A3HEFsRhPMOxU+JZ53moVGUSu+gsG6k5B8t1ltc5I3pRqZO1Vl24W7aYsT
oapL1dxtGyquZDWbk1t4oByEncQl+zIurjOFTuwpwzvtVRHk7MZXg1L+alHlDknN
GOfb2YXdjiuHFbWQXkSLNPJJjhlgvtj6aCVPvzooUBTmm+GloN91dzjAuaUXWge1
EiuJtgHHJi49nJdvqT+5i96dbqTWjrj3BZMMpLmQu9N9EwJKbRABM0Qm6stu76Rk
z5zPBnrQNSRBZVDWfFldIdTitVPlBwWFKvTiIvAc6xzCSv/Q3S4lna0yGOPCgAUh
3C0Ibe3kVwA=
=0k7e
-----END PGP SIGNATURE-----

--nextPart2455656.yIMGLyUmHG--

--===============1570527225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1570527225==--
