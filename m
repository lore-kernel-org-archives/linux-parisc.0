From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 parisc tree
Date: Mon, 2 Feb 2009 16:04:20 +1100
Message-ID: <20090202160420.30aa4f2c.sfr@canb.auug.org.au>
References: <20090202111112.731a6816.sfr@canb.auug.org.au>
	<20090202044144.GA12243@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_16_04_20_+1100_lzHQUrKvGq3nqvLF"
Cc: linux-next@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Greg KH <greg@kroah.com>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20090202044144.GA12243@kroah.com>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Mon__2_Feb_2009_16_04_20_+1100_lzHQUrKvGq3nqvLF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sun, 1 Feb 2009 20:41:44 -0800 Greg KH <greg@kroah.com> wrote:
>
> > These two commits seem to be trying to do similar things.  I have used
> > the versions from the parisc tree.  Greg, I guess you need to check to
> > see if you agree and if so, then just remove the driver-core tree patch.
>=20
> Yes, the parisc version is fine.
>=20
> > James, Kyle, the one thing I took from Greg's patch was the removal of
> > the include of linux/klist.h from drivers/char/agp/parisc-agp.c.
>=20
> That would be good as well.
>=20
> I'll fix up my tree tomorrow.

Thanks for checking.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_16_04_20_+1100_lzHQUrKvGq3nqvLF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGftQACgkQjjKRsyhoI8wljQCfYTBDcyNv9YpzP8F8fKowrT7P
wFAAoKPOPYEmsL8jRu8Mq7R7M26tPHf4
=zCXY
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_16_04_20_+1100_lzHQUrKvGq3nqvLF--
