From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [stable] PA-RISC: compile error in include/net/dst.h
Date: Tue, 24 May 2011 22:59:40 +0200
Message-ID: <1548495.ClksDDlWeA@donald.sf-tec.de>
References: <20110524204938.856044DF4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6401628.dF8RX6N54V"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110524204938.856044DF4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart6401628.dF8RX6N54V
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

Am Dienstag, 24. Mai 2011, 16:49:37 schrieben Sie:
> > If you think of PR46915: I was the one that originally stumbled over
> > this
> > although GM took the hard work of bisecting and reporting that upstream.
> > As I said before, the compiler is 4.5.2.
> 
> Yes, finding the cause of bugs is often a lot harder than fixing them.
> I spent about a week debugging PR49007 and then it turned out the problem
> was the same as PR40086 (one line fix to reorg.c).  Hopefully most reorg
> bugs are now fixed as they are nasty.
> 
> Nominally, PR46915 was fixed in 4.5.3.

Gentoo has backported it to 4.5.2. I know that because otherwise my C3600 
wouldn't have any usable swap ;)

Eike
--nextPart6401628.dF8RX6N54V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk3cHEIACgkQXKSJPmm5/E6eSACfRB9JQfoW70820KLvz5guPbRy
J+QAn3gkGcX313avB/3Mp1MtfIOWiLm2
=63R+
-----END PGP SIGNATURE-----

--nextPart6401628.dF8RX6N54V--

