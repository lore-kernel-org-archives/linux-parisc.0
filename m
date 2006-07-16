From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Warning about bad kernel headers.
Date: Sun, 16 Jul 2006 17:39:49 -0400
Message-ID: <200607161739.50494.vapier@gentoo.org>
References: <119aab440607151526n1318ba80l2523528ac607eaae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1014574969=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607151526n1318ba80l2523528ac607eaae@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1014574969==
Content-Type: multipart/signed; boundary="nextPart8813805.KYJ1GKlpJI";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart8813805.KYJ1GKlpJI
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 15 July 2006 18:26, Carlos O'Donell wrote:
> A quick warning, if your kernel headers file unistd.h contain "#define
> PIC" then remove this line. It will cause all sorts of havoc when
> building glibc. It won't be immediately visible when building, and
> infact ld.so can compile quite happily and run with mixed pic non-pic
> code.

i dont use debian, but i assume your headers were trying to work with the f=
act=20
that it does 'extern int errno' which can break in nasty ways when errno.h=
=20
hasnt also been included ?

in Gentoo, we patch our kernel headers like so:
=2Dextern int errno;
+#include <errno.h>
=2Dmike

--nextPart8813805.KYJ1GKlpJI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUARLqyJkFjO5/oN/WBAQKrWxAAhfVhCwPTlWZDpNHibkclVaiAGZ+JsMhk
FcUCJMO2T0P/IgddeJzDKHcsrN8ycXdIp1fZfJ6EDS8dC7N1D/emjqfFbxUpXXg2
PHoQ+YIGt8Tv9LY6BfPBcfDEjI15tVumfWCTWnD0fkQQCHtrVeV88sUlppHtkhah
WNovs5S/lKxTIqDTz3KvvpsNuFddCikQm1R5gWp7hzDoNaKATTAPrfwJC+WMl8l6
uTRz1VfgLNNtPFEQpcHjSegsyK8WOoKTv8+WlZv/xOOuO0o7rfqeL+8dgFoLr+hg
mtFuTAcDxhIglsmXVnSA6CqYPr1HniW91+kVcOGdoD5p7XBGd03rRFsFNlzi4j9u
fsHmzdDCpwhZh/GdMjyxp4UVjhNz3eEz2tr6xyb5oK3Twwg9zRmj4WHWMCcNXmvC
3XRKJKdoZ5TLdUqM0gqo9InheXfK+LOC6flKs/h00A7u1TdCAgk0xAEvyVed7xSB
VvfovYZn1ZMAzZijh/t5xiwqvFPUEIT/BoOTYN0befSzzuzJEVSBW8dRJ5uS0Ul8
2BwoLV44IwTPpua6bfBpQaEcWngetR2SSY99pu7AghytD6IDJ76tWmP0OujfHHbU
ivRpMW75Q2FNbMh0U4hmgU/OdZmUkjfXhgUPlJrhKAcdpeegzphDiXzIRYfswwxm
O1tAeDY2lqQ=
=SKo0
-----END PGP SIGNATURE-----

--nextPart8813805.KYJ1GKlpJI--

--===============1014574969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1014574969==--
