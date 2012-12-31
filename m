From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Random crashes when calling git
Date: Mon, 31 Dec 2012 09:40:13 +0100
Message-ID: <6855600.9cJrOJmniu@donald.sf-tec.de>
References: <4882058.deuBGYmI4J@donald.sf-tec.de> <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1362014.U42pYrcvE3"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1362014.U42pYrcvE3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

John David Anglin wrote:
> On 27-Dec-12, at 4:42 AM, Rolf Eike Beer wrote:
> > Any ideas?
> 
> Try running the test under gdb.  Git has branched to location 0 causing
> a page fault.  We need a backtrace(s) to learn something useful.  There
> may be multiple backtraces (info thread).

I have not managed to reproduce this this way.

> Enable core dumps if not enabled.  Might find something useful by
> examining it (gdb -c core /usr/bin/git).
> 
> Git uses threads.  I expect the problem is thread related since it
> doesn't
> happen all the time, and for that reason it might not be reproducible
> running under gdb..
> 
> You might try building git and running its testsuite.  I remember that
> some thread related tests used to fail for me.  I think it may be
> possible to build git without pthread support.

I got 2 failures in 5400, 1 in 5406 and one in 5500 so far (in 4 runs).

Eike
--nextPart1362014.U42pYrcvE3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlDhT3IACgkQXKSJPmm5/E6q4wCfTopcd4E4r1ytSnmOpcRULCWu
wDcAni0rL7/oJMKEd7TPoOBpYDXBnyk+
=Otz4
-----END PGP SIGNATURE-----

--nextPart1362014.U42pYrcvE3--

