Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C4254A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Mar 2001 13:01:47 -0700 (MST)
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id f2EK2gD14695
	for parisc-linux@parisc-linux.org; Wed, 14 Mar 2001 15:02:42 -0500
Date: Wed, 14 Mar 2001 15:02:42 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@parisc-linux.org
Message-ID: <20010314150242.D13965@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Subject: [parisc-linux] boot-floppies package
List-ID: <linux-parisc.vger.kernel.org>

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Status update on boot-floppies

The boot-floppies package is pretty much fully functional except for a few
small gotchas.  I cannot build a base2_2.tar.gz file since perl-base and
base-config can't be built.  I've been testing dbootstrap and I can fake
all the installation steps.  They seem to work.  As soon as the popen/pclose
problem and perl-5.6 are fixed, I should be able to get a bootable install
CD working in no time.

						- Paul

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6r85i8ggPQthPCzcRAhVIAJ42SyrNkVVeilewnqg4zp7ppGHHlgCfQjXz
fBY4MMcfLBGcvm2lmMuZqJw=
=ltiX
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
