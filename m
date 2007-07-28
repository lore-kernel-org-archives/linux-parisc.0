From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] glibc-2.6 status
Date: Sat, 28 Jul 2007 16:08:33 -0400
Message-ID: <200707281608.33638.vapier__12727.068065624$1416624420$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0960127365=="
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

--===============0960127365==
Content-Type: multipart/signed; boundary="nextPart2447624.mT7jrqJ9mU";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2447624.mT7jrqJ9mU
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

is it worth trying to make vanilla glibc-2.6 work ?  once i fixed elf/elf.h=
 to=20
have all of the new PARISC defines, it cross-compiled fine for me ... or is=
=20
there more patches needed for runtime ?
=2Dmike

--nextPart2447624.mT7jrqJ9mU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iQIVAwUARquiQUFjO5/oN/WBAQLe8A//fVNT+ZYqZTw3Pc9k8Q8inXwRnjRSZ6wN
99nbQQO6hLnC77SXVdDf01g8Ohklo3AVJt/NYr1EpjPDKChl9AY+I0FZWiwpFq37
K15Q5jA+JlgftutaaPUVKjMP+kNfTyrPFKn6zIT8xLx+Qimr13S4M9OGD8prLXz8
rfQ4U/P5joF8XQeoeSQxKU/rVzLc7POi6tWlrAFdxjBIBRV7aDp9OEFDiTVzoyMX
K/x7/ToNJb29VMBOapWHR85y66E66KlZYlf2GHpMoRDjcKrQ0OWaSePXZa9qQhKC
rh32wrzWuEI4HzLrVQcmqvvBjXabzFK4VbXQwn7E4dFvEdhltp4eGjjCG9Gfs5ZN
pCTe+GX1ows3a+DoFAfAcqrizRpuFGyGXKwyOGRlnpZyeFt1Gs5I+7DFI6xgZHxj
LeJSVzaPsS2qX1D79RRjmaFK6bOg5wuMfJbhQ9Mlh6DyReqXdEWQQrsnkehTmfrS
Nwh95W1EhtgbxVU81Kge2vr9H7SNl2v3uzZmp4GjVpTR/jYayyl+a9zcg7YdLZBD
O4PsJzCnPgLsYSWO4wuIOGiDEG4JpEwEtSjL9JALd2UWfpKEnMYwm9C4zwZQutHH
KlwmSr+wHG8kmaROZBjeAMkP8XxmCcHjsMglb3o37+MMVpATcYdU3jvSoP+yj7DN
VKB/u6JiBYI=
=/fak
-----END PGP SIGNATURE-----

--nextPart2447624.mT7jrqJ9mU--

--===============0960127365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0960127365==--
