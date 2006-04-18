From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] ELF ABI Documents
Date: Mon, 17 Apr 2006 21:46:54 -0400
Message-ID: <1145324814.24150.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1768188592=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============1768188592==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-3wVWQ1HVH6KzbojI0Wfw"


--=-3wVWQ1HVH6KzbojI0Wfw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm on a bit of a quest for accurate documentation.

This started when I was starting to hack klibc and had to go digging for
a bunch of information in a pile of different documents.  What I'd like
to do is write the LSB document for parisc so that there's a single
accurate place to refer to for calling conventions / syscall
information, etc.

It's most common in the LSB specs to refer to the ELF psabi document
where possible.  http://refspecs.freestandards.org/elf/elf-pa.pdf seems
to be a copy of the psabi document, but when checking with some folks,
it looks like the document isn't a reflection on reality for
parisc-linux.  The question is, should the document be updated to
reflect reality, should we slowly change to match the document, or
should I just not refer to the psabi document much when writing the LSB
document?

Tks,
Jeff Bailey

--=20
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

--=-3wVWQ1HVH6KzbojI0Wfw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEREUO5M5hmdCYCpkRAr/dAKCpb2wLxKPF1W8SC9VElqsJ9IBqDQCfSb5N
ZcVhMYsaFd+EccRo9xvu6hQ=
=NleH
-----END PGP SIGNATURE-----

--=-3wVWQ1HVH6KzbojI0Wfw--


--===============1768188592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1768188592==--
