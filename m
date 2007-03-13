From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] [PARISC] parisc-patch for Linux Test Project
Date: Tue, 13 Mar 2007 16:26:47 -0400
Message-ID: <200703131626.47622.vapier__3686.61742327294$1416624326$gmane$org@gentoo.org>
References: <enp0um$dek$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7679364.bG73rtrKA9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Helge Deller <deller@gmx.de>,
 ltp-list@lists.sourceforge.net
To: parisc-linux@lists.parisc-linux.org
Return-Path: <vapier@gentoo.org>
In-Reply-To: <enp0um$dek$1@sea.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>

--nextPart7679364.bG73rtrKA9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 06 January 2007, Helge Deller wrote:
> the trivial patch below is against the current CVS version of LTP and adds
> missing pieces and changes which are necessary for LTP on the PARISC/HPPA
> architecture.

looks like your mailer mangled the whitespace in the patch ...

> The read04.c patch part is a real architecture-independend bugfix. The
> read04 tests writes TST_SIZE bytes to a file, reads the same amount of
> bytes back again and compares the contents. Naturally, it only should
> verify if TST_SIZE bytes (the amount of bytes which where written!)
> matches. sizeof() returns the number of bytes including the leading
> zero-byte which hasn't been read back.

indeed, thanks for that

> Index: testcases/kernel/mem/shmt/shmt02.c
> Index: testcases/kernel/mem/shmt/shmt04.c
> Index: testcases/kernel/mem/shmt/shmt05.c
> Index: testcases/kernel/mem/shmt/shmt06.c
> Index: testcases/kernel/mem/shmt/shmt07.c
> Index: testcases/kernel/mem/shmt/shmt09.c

merged, no comment obviously :)

> Index: testcases/kernel/io/direct_io/diotest4.c

i rewrote this test case so all GNU C based people use=20
__builtin_return_address(0) by default so we shouldnt need the arch cruft=20
anymore ... leave it to gcc to figure that out

> Index: testcases/kernel/include/linux_syscall_numbers.h

this is a generated file, so you dont want to change it ... ive fixed up th=
e=20
input files instead
=2Dmike

--nextPart7679364.bG73rtrKA9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.3 (GNU/Linux)

iQIVAwUARfcJB0FjO5/oN/WBAQKzkxAAk548eWMYKs7hT9Ll0aLQ7dD+5MWiBF6Q
vUTMYJPj6Y5ygkWulwhvd7JYTrZbPfWdeRN6/tCHKoUklROJL8f4XHE08GFYhT/H
v2INvZVyFw05vdhUAliyncTjWqMLsAnoHetkqysYn/TzZYVioGzFOVnZRCxM/fWf
+Uy3TlkdKnQNcccNxl2PVGdNgFqLERuY1cXGL8R62NxERcvSVuA6KzLWQ4kdHWPh
wt8jGhtAsEwE4eo0Z3KX+c+VXAPmMFAdWIPCouEdPQpokof71GJ9XaNceh+5IWMJ
k/RwW8N+Y06T+OVYwf5hXBh8oub4i8vEKB/p0ukcwH01QLauv60wDrvXrOZiGTjs
8eqa/el42XvZvBb3QpZFR7C9ACZLLn96o3LhkoPRVmG12F1JNwxbbTwJM3wWsFyL
lh3GpLdcpVZOMXhmh2oFmhVoYfU6vnTp3JaQnd6XpH4SkHHtkjid6EkFLwJEfk5U
xmOPrIwuXDoFUKoCcVnNcBfBBMUwFFGH1xTH6fJAlVXmUmRdfykzSdlJqGteE3rK
n+n8pG3iK1UoDcFXMtVJ4yVuOBP45tvyZygCK0SKZreexh43CLCjERdQ3FDLJQUo
hZ23sZlfUsLYQysFo5eRartsZ0uXMYECdamIQP0n1RiT/pfZTTqXoDFii4Wv/1iw
2F9aatMRT/o=
=87ZC
-----END PGP SIGNATURE-----

--nextPart7679364.bG73rtrKA9--
