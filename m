From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Tue, 24 Dec 2013 10:32:49 +0100
Message-ID: <1529138.HDr1aRmBML@caliban.sf-tec.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <2859617.TAsvt0Sziu@caliban.sf-tec.de> <BLU0-SMTP924554170555959730283297C00@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart693942785.G1J35Xp1NE"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP924554170555959730283297C00@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart693942785.G1J35Xp1NE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 23. Dezember 2013, 21:39:54 schrieb John David Anglin:
> On 23-Dec-13, at 3:34 PM, Rolf Eike Beer wrote:
> > Am Donnerstag, 19. Dezember 2013, 21:17:51 schrieb Aaro Koskinen:
> >> Hi,
> >> 
> >> This commit (0576da2c08e3d332f1b0653030d28ab804585ab6) and the
> >> current
> > 
> >> mainline kernel (3.13-rc4) gives me the following with GLIBC 2.18:
> > I also suspect this patch of causing trouble. My C8000 regularly
> > submits to
> > the libarchive dashboard (http://my.cdash.org/index.php?project=libarchive
> > ).
> > Since I upgraded to 3.12.5 one test (libarchive_test_compat_mac) keeps
> > failing. The day after compile errors and other problems started
> > (just browse
> > through the last 2 weeks and you will see it). Then I reverted that
> > change and
> > rebootet. The compat_mac test still fails, but the other failures
> > are gone.
> 
> The libarchive_test_compat_mac test also appears to fail on x86.  It
> didn't fail
> in my 3.1.2 build with kernel change.
> 
> I believe the GLIBC 2.18 change was wrong but I don't see why it would
> cause compile errors.

I am on glibc 2.17, I only changed the kernel.

Eike
--nextPart693942785.G1J35Xp1NE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlK5VMcACgkQXKSJPmm5/E4vNACeIw+2YcDPimefd8bZ4rv+5G7W
g0sAn3JNemYPraEQ9fmVCKCDLsw2vOnl
=DHVT
-----END PGP SIGNATURE-----

--nextPart693942785.G1J35Xp1NE--

