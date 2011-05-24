From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [stable] PA-RISC: compile error in include/net/dst.h
Date: Tue, 24 May 2011 21:47:33 +0200
Message-ID: <5635869.iT8i3v8vp8@donald.sf-tec.de>
References: <2612811.b2htuyZy9x@donald.sf-tec.de> <20110524190614.GA25820@hiauly1.hia.nrc.ca> <1490722.55WlhWHEVK@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2210321.MBAOYiGsuh"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1490722.55WlhWHEVK@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2210321.MBAOYiGsuh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

I wrote:

> To reproduce try to compile for hppa64 with default .config, this seems what
> has happened to me.

Ok, the issue is rather stupid. I passed a 64 bit compiler on the command line 
but CONFIG_64BIT was not set.

Eike
--nextPart2210321.MBAOYiGsuh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk3cC1UACgkQXKSJPmm5/E4f9wCfW5P5a0rvji8xb/Mqg+KdHzXd
0kUAoJAFOFEMf+JKPzVwkvhMpi04tfai
=iqDK
-----END PGP SIGNATURE-----

--nextPart2210321.MBAOYiGsuh--

