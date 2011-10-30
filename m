From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Sun, 30 Oct 2011 16:31:22 +0100
Message-ID: <2746859.nK5NlKbf2R@donald.sf-tec.de>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com> <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2180799.kDhop8QF1p"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2180799.kDhop8QF1p
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

John David Anglin wrote:

> This problem is fixed in the GCC trunk and 4.4, 4.5 and 4.6 branches.
> libmpfr4-3.1.0 now passes all tests.

Can we get a link to a bug or a commit so we could easily put this into the 
gentoo patchset for local usage until a new version is released?

Eike
--nextPart2180799.kDhop8QF1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk6tbdMACgkQXKSJPmm5/E4utQCeOftkNmSbs79JRFsY8wA5WwUJ
z94An2WWuaBAqk20pBkBpV1B7eXcBCy8
=F1Bm
-----END PGP SIGNATURE-----

--nextPart2180799.kDhop8QF1p--

