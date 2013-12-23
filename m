From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Mon, 23 Dec 2013 21:34:05 +0100
Message-ID: <2859617.TAsvt0Sziu@caliban.sf-tec.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3254187.qijNTdrcKR"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3254187.qijNTdrcKR
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 19. Dezember 2013, 21:17:51 schrieb Aaro Koskinen:
> Hi,
> 
> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the current
> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:

I also suspect this patch of causing trouble. My C8000 regularly submits to 
the libarchive dashboard (http://my.cdash.org/index.php?project=libarchive). 
Since I upgraded to 3.12.5 one test (libarchive_test_compat_mac) keeps 
failing. The day after compile errors and other problems started (just browse 
through the last 2 weeks and you will see it). Then I reverted that change and 
rebootet. The compat_mac test still fails, but the other failures are gone.

Greetings,

Eike
--nextPart3254187.qijNTdrcKR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlK4nkMACgkQXKSJPmm5/E6bEwCgmgJetiJQA0hZuhrLOcH5xDxu
PzUAn0k5reXFjzlDEG5Hgnt8LZxMCMLz
=khYS
-----END PGP SIGNATURE-----

--nextPart3254187.qijNTdrcKR--

