From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the parisc
 tree
Date: Mon, 2 Feb 2009 11:11:12 +1100
Message-ID: <20090202111112.731a6816.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_11_11_12_+1100_pcXEMcFbV884Psp3"
Cc: linux-next@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	<linux-parisc@vger.kernel.org>
To: Greg KH <greg@kroah.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Mon__2_Feb_2009_11_11_12_+1100_pcXEMcFbV884Psp3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got conflicts in
drivers/char/agp/parisc-agp.c, drivers/parisc/gsc.c and
drivers/parisc/sba_iommu.c between commit
a130bf34da4b64d7b289e2358530ef5d4ab27efd ("parisc: remove klist
iterators") from the parisc tree and commit
135bd8a5aeed90af407aeeede9587ee99c5606b2 ("parisc: don't touch driver
core internals") from the driver-core tree.

These two commits seem to be trying to do similar things.  I have used
the versions from the parisc tree.  Greg, I guess you need to check to
see if you agree and if so, then just remove the driver-core tree patch.

James, Kyle, the one thing I took from Greg's patch was the removal of
the include of linux/klist.h from drivers/char/agp/parisc-agp.c.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_11_11_12_+1100_pcXEMcFbV884Psp3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGOiAACgkQjjKRsyhoI8y+ZQCgmGPHKUWwqOS4PTvxlBZ2lQas
mIIAoKYG7R55xEjY0whVYY57v6UddUCu
=NxWT
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_11_11_12_+1100_pcXEMcFbV884Psp3--
