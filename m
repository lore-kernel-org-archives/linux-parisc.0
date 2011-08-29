From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Mon, 29 Aug 2011 20:31:15 +0200
Message-ID: <7292253.L43gRO36Hq@donald.sf-tec.de>
References: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de> <da1221fe3aa512ba4b0a139a89dd2e69.squirrel@webmail.sf-mail.de> <4E5BA449.5050606@bell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3382714.Hso3OUhbyo"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E5BA449.5050606@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart3382714.Hso3OUhbyo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

You wrote:
> On 8/29/2011 4:12 AM, Rolf Eike Beer wrote:

> > Confirmed, it is a regression in gcc 4.5. If I build using 4.4.6
> > everything works fine. I'll file a bug report tonight.
> 
> Interesting, there's not much difference in the PA backend for these two
> versions.
> 
> Add me (danglin at gcc.gnu.org) to the CC list on the GCC bug report and
> I'll try to
> duplicate the problem.

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50230

Eike
--nextPart3382714.Hso3OUhbyo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk5b2vgACgkQXKSJPmm5/E5KHACfQMpa4PThBiyVjTgABDB33xy5
MZcAn3hdx6YWial8LLoeH6a+G9FhpX32
=w6Dz
-----END PGP SIGNATURE-----

--nextPart3382714.Hso3OUhbyo--

