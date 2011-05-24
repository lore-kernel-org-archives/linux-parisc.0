From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [stable] PA-RISC: compile error in include/net/dst.h
Date: Tue, 24 May 2011 21:19:45 +0200
Message-ID: <1490722.55WlhWHEVK@donald.sf-tec.de>
References: <2612811.b2htuyZy9x@donald.sf-tec.de> <2522442.xP32cQyJEX@donald.sf-tec.de> <20110524190614.GA25820@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3860264.gMPmEFgJjW"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110524190614.GA25820@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3860264.gMPmEFgJjW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 24. Mai 2011, 15:06:14 schrieb John David Anglin:
> On Tue, 24 May 2011, Rolf Eike Beer wrote:
> > As 2.6.38.6 does if I use the correct .config. So it is an older issue
> > which is not related to recent changes but likely some general HPPA
> > breakage. We'll discuss the rest on linux-parisc.
> 
> If you believe this is a compiler error, I suggest using gcc 4.5.3 or
> 4.6.0.
> 
> All releases prior to 4.5.2 contain bugs in delay slot optimization
> resulting in incorrect register liveness. 

If you think of PR46915: I was the one that originally stumbled over this 
although GM took the hard work of bisecting and reporting that upstream. As I 
said before, the compiler is 4.5.2.

And: no, I don't suspect a compiler error. Only a .config screwup. I'm 
currently trying to find the culprit. Good luck it breaks rather early in the 
compile.

To reproduce try to compile for hppa64 with default .config, this seems what 
has happened to me.

Eike
--nextPart3860264.gMPmEFgJjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk3cBNEACgkQXKSJPmm5/E5/nwCeILhDxD04+WeWHuhVlP1kko6B
o2wAoITTurBboS5m/aSq4pJEOvuDvi+a
=Z1sz
-----END PGP SIGNATURE-----

--nextPart3860264.gMPmEFgJjW--

