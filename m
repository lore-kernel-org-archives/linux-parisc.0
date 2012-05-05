From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 05 May 2012 08:55:37 +0200
Message-ID: <1798237.g4OIBKAx4s@donald.sf-tec.de>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22272283.5pjb6P5pYs"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart22272283.5pjb6P5pYs
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

Mikulas Patocka wrote:
> Hi
> 
> This patch fixes compile failure on PA-RISC.
> 
> BTW. if the PA-RISC port is uncompilable for all 3.4-rc versions (and
> contains two other bugs that prevent it from booting) ... does it mean
> that I'm the only one who is using PA-RISC with recent kernel?
> 
> Mikulas
> 
> ---
> 
> Fix compile failure on PA-RISC
> 
> This patch fixes compile error on PA-RISC.
> 
> The problem is this:
> linux/bitops.h includes asm/bitops.h. Through a chain of dependencies
> asm/bitops.h includes asm/page.h and asm/page.h needs function fls and
> others defined in asm/bitops.h and linux/bitops.h --- and these
> functions are not yet defined because the files linux/bitops.h and
> asm/bitops.h hasn't been fully processed.

I've posted a set of patches on 2012-04-21 both on linux-kernel and linux-
parisc, but apart from one ACK I got no reaction.

I did only move the definition of PAGE0 from asm/pdc.h to asm/page.h and fixed 
another bunch of breakage that was detected while fixing this.

Eike
--nextPart22272283.5pjb6P5pYs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+kzvAACgkQXKSJPmm5/E5FBwCgn95gK4TJKMnOv6+0W/xsY5g9
AJkAoJVfpI39SqRJ+1TMZnNBFIqfRC2t
=6/Ee
-----END PGP SIGNATURE-----

--nextPart22272283.5pjb6P5pYs--

