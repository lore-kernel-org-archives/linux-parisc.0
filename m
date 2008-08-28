From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: parisc tree build failure
Date: Thu, 28 Aug 2008 11:58:20 +1000
Message-ID: <20080828115820.d2e4f55b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_11_58_20_+1000_SVqVYf0IRTHmToor"
Cc: linux-next@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Thu__28_Aug_2008_11_58_20_+1000_SVqVYf0IRTHmToor
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

A parisc defconfig build of linux-next (next-20080827) fails like this:

sound/parisc/harmony.c:872: error: 'reutrn' undeclared (first use in this f=
unction)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_11_58_20_+1000_SVqVYf0IRTHmToor
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki2BjwACgkQjjKRsyhoI8z+5QCgqLd5poZVufkcv4e5r6Fwigx8
7eIAmwcKp9BDwKYxvX+8ym2Q7gVnPalM
=H3BS
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_11_58_20_+1000_SVqVYf0IRTHmToor--
