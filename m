From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: c3700 boot failure (protection ID trap)
Date: Sat, 28 Jan 2012 17:56:25 +0100
Message-ID: <3542913.WWkx2jpWZr@donald.sf-tec.de>
References: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7677163.56nYFJlx8z"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAErSpo7ko3Tdkf9Y4jiKCQTgCpcooWnHKJtqXDVpJje3nEXgdw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart7677163.56nYFJlx8z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Bjorn Helgaas wrote:
> I'm trying to test some PCI changes on a c3700, but recent kernels
> don't seem to work at all.  74ea15d909b311 (current upstream) and v3.2
> both fail as shown below.  I'm using c3000_defconfig (attached for
> 74ea15d909b311).  Should I expect this to work?

I don't know about 3.3x, but my C3600 runs using 3.2.1. Which binutils did you 
use for building? IIRC there is a bunch of bugs in different versions.

Eike
--nextPart7677163.56nYFJlx8z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAk8kKL8ACgkQXKSJPmm5/E4tqwCfXyLgFWPdntw3IdZblZNwdyoX
1mcAn2CevTYKf3TQ/NZExCDA4DHBdi0D
=nLc3
-----END PGP SIGNATURE-----

--nextPart7677163.56nYFJlx8z--

