From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Random crashes when calling git
Date: Mon, 31 Dec 2012 12:03:39 +0100
Message-ID: <3563905.2dklDXemHT@donald.sf-tec.de>
References: <4882058.deuBGYmI4J@donald.sf-tec.de> <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8430624.8yQiEDCF4J"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart8430624.8yQiEDCF4J
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

John David Anglin wrote:
> On 27-Dec-12, at 4:42 AM, Rolf Eike Beer wrote:
> > Any ideas?
> 
> Try running the test under gdb.  Git has branched to location 0 causing
> a page fault.  We need a backtrace(s) to learn something useful.  There
> may be multiple backtraces (info thread).

This did not lead anywhere. I tried running the test only with strace, but 
even that did not lead to any crash.

> Enable core dumps if not enabled.  Might find something useful by
> examining it (gdb -c core /usr/bin/git).
> 
> Git uses threads.  I expect the problem is thread related since it
> doesn't
> happen all the time, and for that reason it might not be reproducible
> running under gdb..

I've put together the used git executable as well as 4 core dumps at 
http://opensource.sf-tec.de/git-crash.tar.bz2

It would be nice if you could take a look and tell me if this gives you 
anything.

Greetings,

Eike
--nextPart8430624.8yQiEDCF4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlDhcRIACgkQXKSJPmm5/E58zwCeLOHa641b/E55aSraF9O7oyxs
rqQAnj6yZUr1sxzB9KPKUwsckMRjBkMf
=XtD0
-----END PGP SIGNATURE-----

--nextPart8430624.8yQiEDCF4J--

