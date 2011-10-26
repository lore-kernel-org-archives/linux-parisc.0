From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: HPMC on network load (was: HPMC running CMake Nightly tests)
Date: Wed, 26 Oct 2011 19:54:26 +0200
Message-ID: <6703531.MgfjS9MWsx@eto>
References: <d21336a9332d91f209ba666bd94f3acd.squirrel@webmail.sf-mail.de> <1c7b6eb5f6657272fe96ad90b79f215f.squirrel@webmail.sf-mail.de> <20111026161641.GA32419@parisc-linux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1507812.pheoENBnE0"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111026161641.GA32419@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1507812.pheoENBnE0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Grant Grundler write

> > HPMC PIM Analysis Information:
> > 
> > Timestamp =
> > 
> >   Thu Oct  20 09:05:52 GMT 2011    (20:11:10:20:09:05:52)
> > 
> > '9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304
> > bytes:
> > 
> > A Data I/O Fetch Timeout occurred while CPU 0 was
> > requesting information from a device at the path 10/0/12/0 (built-in PCI
> > device).
> 
> Doing "in io" at the BCH prompt should list all devices including 10/0/12/0
> Google search is failing to find a posting with that content. :/

IIRC it is the network card.

The last time I saw this was during "emerge --sync", which was hours away from 
the nightly CMake run. Since all traces point at the network card I think this 
really has nothing to do with CMake or CPU load at all.

Eike
--nextPart1507812.pheoENBnE0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk6oSVIACgkQXKSJPmm5/E4yPwCeO/4P/dxlK8nDxGd53kSK53SF
VVUAoIXltHfZANPzSWY1wpr9apdKdRIo
=xnXw
-----END PGP SIGNATURE-----

--nextPart1507812.pheoENBnE0--

