Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DA4A4A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Mar 2001 12:59:05 -0700 (MST)
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id f2EJxvi14676
	for parisc-linux@parisc-linux.org; Wed, 14 Mar 2001 14:59:57 -0500
Date: Wed, 14 Mar 2001 14:59:57 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@parisc-linux.org
Message-ID: <20010314145957.C13965@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Subject: [parisc-linux] perl-5.6.0 build problems
List-ID: <linux-parisc.vger.kernel.org>

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

I've been trying to get perl-5.6.0 building since its required for
the boot-floppies package (base tar ball needs base-config which requires
debconf-utils, which requires perl-5.6).  Unfortunately, perl-5.6 does
not work correctly once compiled.

If I use the debian build (with the patch), perl.static and perl.debug
complete building, but a dynamic version crashes immediately on startup
from loading libperl.so.5.6.0 with the following fault:

do_page_fault() pid=21621 command='miniperl' type=6 address=0x00000797

If I only build the static and debug versions, the ./perl installperl
program crashes with the following error:

do_page_fault() pid=1781 command='perl' type=6 address=0x09280003

I've also tried building perl-5.6 w/o any changes (from the .orig.tar.gz)
and the same thing happens.  If it would help, I can install gdb/strace
to find out at which point the faults happens.  If anyone has managed to
get a work perl5.6, please let me know, so I can get it ready for the
install package.

						- Paul

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6r8298ggPQthPCzcRAlnaAJ0dbFpla/IXYiuKl9qGI/4chgQhjgCgoekn
kwM8Urwqg1ovI95ONPd6u8o=
=Dlpp
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
