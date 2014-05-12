From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Improve LWS-CAS performance
Date: Mon, 12 May 2014 08:11:37 +0200
Message-ID: <5283741.MSteB7R1e7@caliban.sf-tec.de>
References: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2418099.r3XYjtJDLN"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2418099.r3XYjtJDLN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 11. Mai 2014, 18:40:50 schrieb John David Anglin:
> The attached change significantly improves the performance of the LWS-
> CAS code in syscall.S.
> This allows a number of packages to build (e.g., zeromq3, gtest and
> libxs) that previously failed because
> slow LWS-CAS performance under contention.  In particular, interrupts
> taken while the lock was taken
> degraded performance significantly.

Sounds cool ;)

The label cas_wouldblock would now only be defined in SMP case, which looks 
odd. Since I can't find any references to it I think it should just be dropped.

Eike
--nextPart2418099.r3XYjtJDLN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlNwZh4ACgkQXKSJPmm5/E5ZPACfcRAMYSbQDgMMRkoCgZE6JGQw
p4gAoIgX62S5pYHKVooOCQOb1is+lYlC
=RtOY
-----END PGP SIGNATURE-----

--nextPart2418099.r3XYjtJDLN--

