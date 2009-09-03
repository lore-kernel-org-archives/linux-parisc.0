From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree with the
 parisc tree
Date: Thu, 3 Sep 2009 15:46:36 +1000
Message-ID: <20090903154636.e70c50da.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Sep_2009_15_46_36_+1000_Ohoksu82jTWe4ByM"
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	<linux-parisc@vger.kernel.org>
To: James Morris <jmorris@namei.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Thu__3_Sep_2009_15_46_36_+1000_Ohoksu82jTWe4ByM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the security-testing tree got conflicts in
arch/parisc/include/asm/thread_info.h, arch/parisc/kernel/entry.S and
arch/parisc/kernel/signal.c between commit 9f4259771faf1ffd99888796d925adae=
4c93630b ("parisc: add TIF_NOTIFY_RESUME and use tracehook_notify_resume") =
from the parisc tree and
commits d0420c83f39f79afb82010c2d2cafd150eef651b ("KEYS: Extend
TIF_NOTIFY_RESUME to (almost) all architectures [try #6]") and
ee18d64c1f632043a02e6f5ba5e045bb26a5465f ("KEYS: Add a keyctl to install
a process's session keyring on its parent [try #6]") from the
security-testing tree.

Overlapping changes.  I fixed it up (using the parisc versions and adding
the extra change from the latter security-testing patch) and can carry
the fixes as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Sep_2009_15_46_36_+1000_Ohoksu82jTWe4ByM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqfWDwACgkQjjKRsyhoI8xO1wCguPqeZiR4YX5YW6vaTcxVS0fD
Lz0AoKP3cYPaaA+nRb9uo7KiUZ/pPJO7
=8v1y
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Sep_2009_15_46_36_+1000_Ohoksu82jTWe4ByM--
