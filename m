From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: mmap problem in localedef
Date: Sat, 01 Apr 2017 20:41:05 +0200
Message-ID: <2241815.7QkIsKQeSs@daneel.sf-tec.de>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net> <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1701228.aTp4a23PSd"; micalg="pgp-"; protocol="application/pgp-signature"
Cc: John David Anglin <dave.anglin@bell.net>,
        Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart1701228.aTp4a23PSd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Aaro Koskinen wrote:
> Hi,
> 
> On Mon, Dec 05, 2016 at 06:50:57PM -0500, John David Anglin wrote:
> > On 2016-12-05, at 4:17 PM, John David Anglin wrote:
> > > I'll post the current Debian patch set for hppa tonight and maybe we can
> > > consolidate.
> 
> [...]
> 
> > We still have a change to SHMLBA which affects non standard page sizes.
> 
> FWIW, this is the one (local-shmlba.diff) that is needed to get localedef
> working on PA-RISC. I just tested with glibc 2.25 and Linux 4.10 with 4 KB
> page size.

Missing attachment?
--nextPart1701228.aTp4a23PSd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAljf9EYACgkQXKSJPmm5/E78mACeMvoGT4njfAzyH6f+4J/d2sqe
vZwAoIu4kpUOZPKOg9aK7KwEIv9weiP2
=evJr
-----END PGP SIGNATURE-----

--nextPart1701228.aTp4a23PSd--

