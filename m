From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 09:20:45 +0100
Message-ID: <57945170.qhAyWSFmja@caliban.sf-tec.de>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1771178.jz0YabOdfk"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1771178.jz0YabOdfk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 25. Januar 2014, 05:41:44 schrieben Sie:
> In recent kernels, with the new serial console code for the C8000,
> performance is terrible. Typing quickly results in characters getting
> dropped (I have no idea where I lose them), pasting results in 9 out of
> 10 characters being dropped, and I don't see anything on the client
> side that could cause this, and I never had this problem with the old
> ttyB0 code. While entering a password, some characters never turn up on
> the other side and some get echoed back to the client.
> 
> Is anyone else seeing this?

What I see is that the C3600 now finally sees the kernel/console output of the 
C8000, I also see the login prompt, but typing anything on the C3600 doesn't 
seem to make it to the C8k. So things have improved, I now can actually see 
what's going on on the C8k, but I can't interact with it.

Eike
--nextPart1771178.jz0YabOdfk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLjc+MACgkQXKSJPmm5/E7RXACfbsvKOdCN1JVqXD97ZyoD7Sd3
FMsAn0da0cI9xUsK9dEm+3/z9X5Ogig9
=SbPH
-----END PGP SIGNATURE-----

--nextPart1771178.jz0YabOdfk--

