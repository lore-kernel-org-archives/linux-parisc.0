From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the parisc-hd tree with Linus' tree
Date: Tue, 4 Feb 2014 11:27:18 +1100
Message-ID: <20140204112718.160f82c52d5219ef8dd3a924@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__4_Feb_2014_11_27_18_+1100_XE09MJpGW_2=fNSM"
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Tue__4_Feb_2014_11_27_18_+1100_XE09MJpGW_2=fNSM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the parisc-hd tree got a conflict in
arch/parisc/include/asm/elf.h between commit 9dabf60dc4ab ("parisc: add
flexible mmap memory layout support") from Linus' tree and commit
13de8ec38997 ("parisc: add flexible mmap memory layout support") from the
parisc-hd tree.

It seems that this tree was rebased before being sent to Linus (I
understand why) so I will just drop the whole parisc tree for today.
Please just tidy up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__4_Feb_2014_11_27_18_+1100_XE09MJpGW_2=fNSM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS8DPqAAoJEMDTa8Ir7ZwVA0sP/0WeKpX6WvOCngdYLFudOrAV
Pv1Qf+W39Dh6UBsmsE1DK4abYUlL+C5iZmS51bmPLeOZy/57ijBnHueATfhrcpQ0
sWcZmGzJ5TRmXNTB2ORg264KWreyGe7YN/VwXnPxhcan2L0cMwQ2zQqk6skA+zuM
FChqDxaVQKpEgig/SudvY1GBfzlDcUfwnXiknX7fm0vkUWnIeFrFCo5p8YDM1jtW
F3CEhwfGGqNey6xX2a/yPherxpNNB0ymm4vAYNVGGLa/uqm+n+YaPHn010imgUeU
Ny9jDi1uftDKsyvWV13pfcq272v7UeyO9fKxIYDnIZ65HWoZddg6miioWimGpntO
JCLzbXS157xORvREn3fPeBLJ4TrDwMb/w6Arb9OE3jysDzldf4NhrLZXjX3Btny1
uraTHSrzhcCMwAIey6c4nCm/8awHHE4nppbqto5uZ6FMWh3v1/r0TyGZUh/fQEpn
gwek9IH7efdnJh8rWjyuKrRYClzKSQwbNeKe8P0AanUYugJKqoO5hm8II2XQRp8w
+BahgLW5/cdb5rgt0sceHBJQhg0DbaFxeK44+VOZqsCWDe0DadDTYulq6R+27pgS
EVMEikIz7tcImiOV9TD2nGDoCaZnGYYPKRNw4MMxjQSu5fEtaDwVFymDZT9bZBDj
nKk9+V1aQuTYzN8IHrTF
=nDKS
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Feb_2014_11_27_18_+1100_XE09MJpGW_2=fNSM--
