From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH 0/6] PA-RISC: fix compile
Date: Tue, 01 May 2012 15:28:01 +0200
Message-ID: <2980093.pP6IpthNCP@donald.sf-tec.de>
References: <3154414.psmJh6J2U2@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3929007.imp2FqxQY5"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3154414.psmJh6J2U2@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3929007.imp2FqxQY5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Rolf Eike Beer wrote:
> Since d66acc39c7cee323733c8503b9de1821a56dff7e (bitops: Optimise
> get_order()) getorder.h includes log2.h which leads to an include loop on
> PA-RISC, bringing a bunch of other breakage to light. This patchset fixes
> the compilation of the current state of 3.4 on HPPA.
> 
> Rolf Eike Beer (6):
>   use linux/bitops.h instead of linux/log2.h to get fls()
>   parisc: add missing includes in asm/spinlock.h
>   parisc: add missing forward declarations in asm/hardware.h
>   parisc: drop include of asm/pdc.h from asm/hardware.h
>   parisc: add missing include of asm/page.h to asm/pgtable.h
>   parisc: move definition of PAGE0 to asm/page.h

Ping? #4 meanwhile got an ACK from Grant, I have not received any other 
comments. James, could you please take the latter 5 if you don't feel 
comfortable with the first one? That one is just a cleanup and makes no 
difference (yet) if things work or not.

Eike
--nextPart3929007.imp2FqxQY5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk+f5OwACgkQXKSJPmm5/E71gQCcCW2UrJYz50VnSYiMKXRclbkU
/9wAoJLZwd15UxvUOn62rq572Q1DSYNh
=ne+6
-----END PGP SIGNATURE-----

--nextPart3929007.imp2FqxQY5--

