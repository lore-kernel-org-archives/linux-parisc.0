From: James Hogan <james.hogan@imgtec.com>
Subject: [GIT PULL] Metag architecture and related fixes for v3.15
Date: Fri, 16 May 2014 15:41:46 +0100
Message-ID: <537623AA.5040906@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="skgagQvT0IPFiF7DF6rKCIW4RESSuBj3B"
Cc: Helge Deller <deller@gmx.de>,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-metag <linux-metag@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--skgagQvT0IPFiF7DF6rKCIW4RESSuBj3B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull the following metag / parisc fixes, mostly relating to upgrow=
ing
stacks. These changes only affect metag and parisc, and although the
asm-generic one isn't strictly a fix it's simple and follows naturally fr=
om
the other _STK_LIM_MAX override removals (here for metag and in rc4 for
parisc).

Thanks
James

The following changes since commit d6d211db37e75de2ddc3a4f979038c40df7cc7=
9c:

  Linux 3.15-rc5 (2014-05-09 13:10:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/metag.git tags/met=
ag-for-v3.15-2

for you to fetch changes up to ffe6902b66aaa4ca6694bc19639259c16d84ddb1:

  asm-generic: remove _STK_LIM_MAX (2014-05-15 00:32:09 +0100)

----------------------------------------------------------------
Metag architecture and related fixes for v3.15

Mostly fixes for metag and parisc relating to upgrowing stacks.

* Fix missing compiler barriers in metag memory barriers.
* Fix BUG_ON on metag when RLIMIT_STACK hard limit is increased beyond
  safe value.
* Make maximum stack size configurable. This reduces the default user
  stack size back to 80MB (especially on parisc after their removal of
  _STK_LIM_MAX override). This only affects metag and parisc.
* Remove metag _STK_LIM_MAX override to match other arches and follow
  parisc, now that it is safe to do so (due to the BUG_ON fix mentioned
  above).
* Finally now that both metag and parisc _STK_LIM_MAX overrides have
  been removed, it makes sense to remove _STK_LIM_MAX altogether.

----------------------------------------------------------------
Helge Deller (1):
      parisc,metag: Do not hardcode maximum userspace stack size

James Hogan (3):
      metag: Reduce maximum stack size to 256MB
      metag: Remove _STK_LIM_MAX override
      asm-generic: remove _STK_LIM_MAX

Mikulas Patocka (1):
      metag: fix memory barriers

 arch/metag/include/asm/barrier.h       |  3 +++
 arch/metag/include/asm/processor.h     |  2 ++
 arch/metag/include/uapi/asm/Kbuild     |  2 +-
 arch/metag/include/uapi/asm/resource.h |  7 -------
 arch/parisc/include/asm/processor.h    |  5 +++++
 arch/parisc/kernel/sys_parisc.c        |  6 +++---
 fs/exec.c                              |  6 +++---
 include/asm-generic/resource.h         |  2 +-
 include/uapi/asm-generic/resource.h    |  7 -------
 mm/Kconfig                             | 15 +++++++++++++++
 10 files changed, 33 insertions(+), 22 deletions(-)
 delete mode 100644 arch/metag/include/uapi/asm/resource.h


--skgagQvT0IPFiF7DF6rKCIW4RESSuBj3B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdiOzAAoJEGwLaZPeOHZ6GIAP/0XC/23dihVESRnxhUta3WXp
pA00rqBdvoAvLpQl7F7ZCK4qUdEszAoMNXHFOWURBEWLoC64hzGQzsslJ4WugOut
BHzaT+YEhYvpMU1lC1nSu/zIDGBEvPljC6ia2NqcCr/J9Z3q+Dfp31cE/Rd4P+o3
NGtyLN5vuNff+A3E4WSAeKIDRqxC6r5uBefFAHdx2ixFDEk+tc82bIvEbK9VELig
Wj7VVgAtyYPyKzHoHVgGf/4OPPdLs0i4lSuICCOsbNQQaT76U3sRjB6fvmIeCV6J
6XgnqCZBFqjRzbl/AOpoJXkjO/8UrFZmX97mguR2eEMOS90IRFiNTzZBk6iTvfjl
Mzwxo482/azMI67NYxHFN0K2zgf3lLUD5ShkpiEPy7RGbcIL2OQ9V5keT1M1n7Y6
ZgXEF/MK1Elcs/xbJbBDcf7NQRlJAZbXwTHTQkO9BsixNTrB+eSvRm1xtwJ9GJrL
4b8Lmb1Q5cWVLh6AS3VPBsWiXMIz7+6SSbrB3p15pJR7CZkGmwh7jdJ9qen8udg0
L+ce/IOv6K7ZaLXuYQhawq/b/6YJCpnivle8GLRNbl183NZmLV48Jk8+LjzS8leb
mpE5Qo6xIFLSQ8E4ILPJ4eZgQyctXuhA+WKvJCyecDcJ5KsxNSDjA2qTjyBc9t6t
g9MyIEyt+GJnTHEMewPv
=Zrht
-----END PGP SIGNATURE-----

--skgagQvT0IPFiF7DF6rKCIW4RESSuBj3B--
