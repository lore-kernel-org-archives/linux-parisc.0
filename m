From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [GIT PULL] parisc updates for v3.10
Date: Mon, 13 May 2013 23:53:29 +0200
Message-ID: <2654532.supg57YsM8@donald.sf-tec.de>
References: <20130513204843.GA1858@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3093006.pdgbnbJYAQ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130513204843.GA1858@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3093006.pdgbnbJYAQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> Helge Deller (2):
>       parisc: make default cross compiler search more robust (v3)

Needs CC:stable as without this building 3.9.x is not possible in some 
configurations.

> John David Anglin (1):
>       parisc: fix SMP races when updating PTE and TLB entries in entry.S

Possibly also this as it's a bugfix, but Dave is the one who may be judge how 
"clear" it is.

The same is probably true for these from the first round of updates:

John David Anglin (2):
      parisc: use long branch in fork_like macro
Mike Frysinger (1):
      parisc: fix NATIVE set up in build

While I _really_ appreciate the speedup that recently happened to the parisc 
development recently I would also appreciate if we can can finally get the 
bugfix parts of that into stable kernels so we have the non-development tree 
buildable and working without the need to backport all those stuff by hand.

Eike
--nextPart3093006.pdgbnbJYAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlGRYOAACgkQXKSJPmm5/E7fQQCePH17LwMNl2xP7CpUp8WOgjnh
63YAn1ESO0NhtvLZYKfKT8O7H/b+zxgl
=x2AD
-----END PGP SIGNATURE-----

--nextPart3093006.pdgbnbJYAQ--

