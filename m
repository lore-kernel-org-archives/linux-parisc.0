From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH 0/2] Random PARISC patches
Date: Mon, 16 Jan 2012 20:12:32 +0100
Message-ID: <6637509.yTD8q5zPsI@eto>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart120616636.2XbphnSLlZ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart120616636.2XbphnSLlZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

This little series has 2 patches that have nothing to do with each other 
beyond the point that I stumbled over both of these things today.

The first one fixes a compile error if CONFIG_PCI is not set, e.g. for the 
Apollo 705 I have. This is also needed in 3.2, although it covers also 
pci_iomap() in this case which was moved to lib/ by a recent patch.

The other one is just a minor code cleanup in the HIL driver.

Eike
--nextPart120616636.2XbphnSLlZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk8UdqYACgkQXKSJPmm5/E697wCeJYHC6qTcstsonT1hWeAJYOHQ
kEEAnAtiM1YwaJQ9llu3WnoNXL4/KH3o
=w2OX
-----END PGP SIGNATURE-----

--nextPart120616636.2XbphnSLlZ--

