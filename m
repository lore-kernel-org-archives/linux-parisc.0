From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: parisc tree build failure
Date: Tue, 2 Sep 2008 03:32:42 +1000
Message-ID: <20080902033242.bce78fa0.sfr@canb.auug.org.au>
References: <20080828115820.d2e4f55b.sfr@canb.auug.org.au>
	<20080828143319.GD6298@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Sep_2008_03_32_42_+1000_=bB4y9NGpOU/m=hb"
Cc: linux-parisc@vger.kernel.org, linux-next@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Takashi Iwai <tiwai@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080828143319.GD6298@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Tue__2_Sep_2008_03_32_42_+1000_=bB4y9NGpOU/m=hb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Thu, 28 Aug 2008 10:33:19 -0400 Kyle McMartin <kyle@mcmartin.ca> wrote:
>
> On Thu, Aug 28, 2008 at 11:58:20AM +1000, Stephen Rothwell wrote:
> > Hi Kyle,
> >=20
> > A parisc defconfig build of linux-next (next-20080827) fails like this:
> >=20
> > sound/parisc/harmony.c:872: error: 'reutrn' undeclared (first use in th=
is function)
>=20
> You're looking the wrong way... we didn't touch this code...

Indeed.

Hi Takashi,

The above was introduced by commit
59112f679b3ace91b5b74b965c4f918c5aa095fe ("ALSA: Kill snd_assert() in
other places") in the sound tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Sep_2008_03_32_42_+1000_=bB4y9NGpOU/m=hb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki8JzoACgkQjjKRsyhoI8w7egCeKoDiMEZKtp3AcsYqGJYjieHd
BMUAoI7dXnPiZOkI/7rco6qgg1U2otKR
=QqLw
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Sep_2008_03_32_42_+1000_=bB4y9NGpOU/m=hb--
