From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Mon, 30 Mar 2015 20:09:28 +1100
Message-ID: <20150330200928.6dc4773d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aQB/A+Akt8Xc0F699Zs4DFo"; protocol="application/pgp-signature"
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@linux.intel.com>,
	Dave Anglin <dave.anglin@bell.net>,
	Kees Cook <keescook@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Sig_/aQB/A+Akt8Xc0F699Zs4DFo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/parisc/include/asm/Kbuild between commit 476840458128 ("parisc:
Eliminate sg_virt_addr() and private scatterlist.h") from the parisc-hd
tree and commit e494f4a463cd ("parisc: switch to using asm-generic for
seccomp.h") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/parisc/include/asm/Kbuild
index a5f037535aab,12b341d04f88..000000000000
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@@ -20,7 -20,7 +20,8 @@@ generic-y +=3D param.
  generic-y +=3D percpu.h
  generic-y +=3D poll.h
  generic-y +=3D preempt.h
 +generic-y +=3D scatterlist.h
+ generic-y +=3D seccomp.h
  generic-y +=3D segment.h
  generic-y +=3D topology.h
  generic-y +=3D trace_clock.h

--Sig_/aQB/A+Akt8Xc0F699Zs4DFo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGRLPAAoJEMDTa8Ir7ZwVn08QAJUm8I/wCmWJf2CikIgJHjMU
GH+qPMwZ6iZOZih8gEEd6DyJ080Guip5ftsPWsGS6+RcBbGTgelDBpE8zUWSPtQ+
NimdAVwqZawLfwHoyoawaa/zrf7+cgIgm9ZM5Lhg+vLm0061oHXiNBbciVb96oMi
3m8474qX+qS1ckgqajq6PKKQ9EjOXOQ22NHXL1GIocI9e5OuL8+bPo8p8+OXU21L
mJ51Q64sHKXwcmig8mVDeHXvGOBkd3662fGLcnjFBz83OmlYh5M48y8CZAHEGda8
6i/Ym0qLuA86uhhKlNRwz8BCmH2mpfUbkUiEb08U/AfIIMNfmr7n/Gan4dAjQ7A8
TecwAadm1/XuLBf1/gG1PPVhJImGz+r7TlbBDAD094UXlwclTkBcD7NUkONc9+4H
d6ULuJ5VZ1jT4a234LOfzF+vNhGe4LpOe0CCTwDH232X4lcZF7Y3COV8RRBcUF6Y
xjau78pUKUiwbBKCdlcutrxIcgWu9/wb2vGFX1ZdAXUizpJZP6qG+UD1Op2iorhY
yyebBK6FnzvHjiufeWr9NNrg6gY4CXyLRnBH3RErokBJxvvc7ubr11cSI+HDVubH
+v11TGa6tb94kpJKuH31CW4JMg3TqkBoGlRmsgT5sJhndQpDbiBe8SrqNokXJxjK
0pUsEtoLW6GuRdlvSPzQ
=Pnfm
-----END PGP SIGNATURE-----

--Sig_/aQB/A+Akt8Xc0F699Zs4DFo--
