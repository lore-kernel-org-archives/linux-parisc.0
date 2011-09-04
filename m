From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap (code 7)
Date: Sun, 04 Sep 2011 18:35:24 +0200
Message-ID: <2800939.FiF5fAcbHF@donald.sf-tec.de>
References: <201108191958.35802.eike-kernel@sf-tec.de> <BLU0-SMTP59F0DC2CD7C525D1524BA7971A0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1721894.5vEjEeikWo"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP59F0DC2CD7C525D1524BA7971A0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1721894.5vEjEeikWo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

You wrote:
> On 19-Aug-11, at 1:58 PM, Rolf Eike Beer wrote:
> > unwind_init: start = 0x10503000, end = 0x1053a640, entries = 14180
> > WARNING: Out of order unwind entry! 105041f0 and 10504200
> > WARNING: Out of order unwind entry! 10504200 and 10504210
> > WARNING: Out of order unwind entry! 10504cf0 and 10504d00
> > WARNING: Out of order unwind entry! 10504d00 and 10504d10
> 
> This is fixed in current binutils.  Current binutils also fixes non
> equivalent aliasing
> bug that affects PA8800/PA8900 systems.

The kernel.org or the GNU version?

> > IASQ: 00000000 00000000 IAOQ: 1010047c 10100480
> 
> IAOQ head provides the location of interruption.  It was a instruction
> memory
> protection fault.  Since this is a kernel address, this likely
> indicates the page
> tables weren't setup correctly, or the instruction cache wasn't
> flushed correctly.
> 
> I'm thinking it would help to localize the change that introduced the
> interruption.

I'll try to bisect this in the next days.

Eike
--nextPart1721894.5vEjEeikWo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk5jqNIACgkQXKSJPmm5/E6lfACfbtOTl8FAKMR72VwDc92dSB5I
/eIAn2RxBGJ4cOvCfR3i0+4Ti+X69r1M
=YGEg
-----END PGP SIGNATURE-----

--nextPart1721894.5vEjEeikWo--

