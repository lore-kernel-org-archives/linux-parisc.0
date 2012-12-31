From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Random crashes when calling git
Date: Mon, 31 Dec 2012 20:34:39 +0100
Message-ID: <2694777.CZhKI00lTi@donald.sf-tec.de>
References: <4882058.deuBGYmI4J@donald.sf-tec.de> <3563905.2dklDXemHT@donald.sf-tec.de> <BLU0-SMTP22C3BF8F11ED2FBDDA8BE6973C0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1816499.8kZ2lWlpiZ"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP22C3BF8F11ED2FBDDA8BE6973C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1816499.8kZ2lWlpiZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

You wrote:
> On 31-Dec-12, at 6:03 AM, Rolf Eike Beer wrote:
> > I've put together the used git executable as well as 4 core dumps at
> > http://opensource.sf-tec.de/git-crash.tar.bz2
> > 
> > It would be nice if you could take a look and tell me if this gives
> > you
> > anything.
> 
> I looked at the first one:

> I think this is the infamous thread stack corruption bug.  There are
> numerous discussions about it on the list.
> 
> It's just a guess but I believe my kernel patch may help.  Attaching
> latest
> version for 3.7.1.

Thx, I'll have a look when I'm back in the office next week.

Until next year,

Eike
--nextPart1816499.8kZ2lWlpiZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlDh6NgACgkQXKSJPmm5/E4brgCbBcU5ju/QcN++SjdV1B3GT+gI
7lMAoISbyqWsjYddfKB96vp2Hcu10N/l
=umMU
-----END PGP SIGNATURE-----

--nextPart1816499.8kZ2lWlpiZ--

