From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 09 May 2012 08:53:23 +0200
Message-ID: <41786065.U2qKzXR3uX@donald.sf-tec.de>
References: <4FA9975C.5060708@bergerie>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2319414.k4sKqThIxP"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org
To: Vincent <vincent.stehle@laposte.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FA9975C.5060708@bergerie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2319414.k4sKqThIxP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Vincent wrote:
> Hi parisc folks,
> 
> I have noticed that the mainline kernel won't boot any more on my
> hp712/100, starting with v2.6.39. It panics in
> flush_instruction_cache_local.

See the mail thread "Boot error using 3.2.1: swapper (pid 1): Illegal 
instruction (code 8)" I started when I first hit this on my 705. But James 
doesn't care.

Eike
--nextPart2319414.k4sKqThIxP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+qFGsACgkQXKSJPmm5/E6BiwCfcXYVrmZoJQQel0fDJ8FEos7r
bcoAn34m63DmZckNtBtlmfG6WdQb9tVx
=fo0a
-----END PGP SIGNATURE-----

--nextPart2319414.k4sKqThIxP--

