Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8EA2482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Apr 2001 13:54:53 -0600 (MDT)
Date: Thu, 5 Apr 2001 15:56:05 -0400
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: debian-boot@lists.debian.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20010405155605.D8907@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Subject: [parisc-linux] Woody installer for PARISC
List-ID: <linux-parisc.vger.kernel.org>

--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

Here are the changes I've made to the boot-floppies package to support
the PARISC architecture.

Makefile:
Added an entry for hppa support, make root.tar.gz

common.sh:
Small fixes to the functions that came up during debugging

rescue.sh:
- Define the hppa "floppy" type (ext2)
- Use the "write_m68kinfo" for install.sh generation
- Compress the kernel like powerpc/pmac arch

rootdisk.sh:
- Define the C library information for hppa
- Don't do library reduction (this was failing with our binutils)

utilities/dbootstrap/Makefile:
- Change the -DKVER="${KVER}" to -DKVER="${kver}" to reflect the proper
  variable name.

utilities/dbootstrap/bootconfig.c:
- Support for PALO (our bootloader)

utilities/dbootstrap/extract_base.c:
- Change debootstrap cmd line to use file:%s instead of just %s.

utilities/dbootstrap/main_menu.c:
- Remove options that aren't applicable to PARISC.
  (Make boot floppy, PCMCIA, etc..)

utilities/dbootstrap/partition_config.c:
- Add PALO message for partition creation.


There are a few more changes I needed to make to get a working installer
for PARISC, unfortunately some of them are because of limitations in
the current PARISC distribution (kernel.sh was modified to not require
a kernel .deb since we currently don't have one and the constantly
changing kernel makes it unwieldy to build kernel .debs).  As well the
root.bin needs to be larger than 3700K on parisc though I am working
on reducing this number to hopefully fit in that limit.

I will post a diff to boot-floppies shortly.

						- Paul


--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6zM3V8ggPQthPCzcRAiIuAKCpoZ4xnRNY3XUvKz4V//EEYfbAMwCdGWlU
dmIKolt//EiGHDGM6WuW9PI=
=qbNz
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
