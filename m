From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the parisc tree
Date: Fri, 12 Sep 2008 06:07:49 +1000
Message-ID: <20080912060749.9abe535b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Sep_2008_06_07_49_+1000_3RrOVX4RS7D8e07p"
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
To: Kyle McMartin <kyle@mcmartin.ca>, <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Fri__12_Sep_2008_06_07_49_+1000_3RrOVX4RS7D8e07p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Today's linux-next merge of the parisc tree got a conflict in
include/asm-parisc/a.out.h between commit
9d5a9e74655b9d04d0ec9c8e47801163b7b74211 ("Remove asm/a.out.h files for
all architectures without a.out support") from the dwmw2 tree and commit
aa12a68bd7340733a06a2ceddb0e2a9d3d9e1a5a ("parisc: move
include/asm-parisc to arch/parisc/include/asm") from the parisc tree.

I just removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Sep_2008_06_07_49_+1000_3RrOVX4RS7D8e07p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjJepUACgkQjjKRsyhoI8xG0wCbBWzc1j3PurgxCr3zv6/TByqA
hjkAoLMpG6vz04NkUEjlbs1FEuJkUWhk
=+WvT
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Sep_2008_06_07_49_+1000_3RrOVX4RS7D8e07p--
