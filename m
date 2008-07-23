From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Requirements and process
Date: Wed, 23 Jul 2008 14:41:04 +1000
Message-ID: <20080723144104.ac3a74e4.sfr@canb.auug.org.au>
References: <20080503154542.18807e59.sfr@canb.auug.org.au>
	<20080502233519.a988b552.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_14_41_04_+1000_WinOkhk5k6GJ0abh"
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus <torvalds@linux-foundation.org>,
	Hirokazu Takata <takata@linux-m32r.org>,
	linux-m32r@ml.linux-m32r.org, Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Chris Zankel <chris@zankel.net>
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20080502233519.a988b552.akpm@linux-foundation.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Wed__23_Jul_2008_14_41_04_+1000_WinOkhk5k6GJ0abh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2008 23:35:19 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> On Sat, 3 May 2008 15:45:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>=20
> > The following architectures are not in linux-next (and should be):
> >=20
> > alpha		cris		frv
> > h8300		m32r		m68knommu
> > mips		mn10300		parisc
> > um		v850		xtensa
>=20
> mips, m32r, parisc and xtensa do have git trees.  The rest are mastered as
> discrete patches in -mm.
>=20
> Except for m68knommu, which pops unexpectedly out of the woodwork during
> the merge window.  I've asked that this be altered ;)

So (from the above list) cris, m68knommu and mips have joined the
linux-next fray ...

(cc's some maintainers)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_14_41_04_+1000_WinOkhk5k6GJ0abh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGtmAACgkQjjKRsyhoI8wyOACbBTwN5V0gylPybMMxU5tHHps7
3O4An0XbMoeQaeGJGIPgQjKZkqC5byEO
=8ZSr
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_14_41_04_+1000_WinOkhk5k6GJ0abh--
