Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB13D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Sep 2001 01:07:24 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15kgsj-0007wx-00
	for parisc-linux@lists.parisc-linux.org; Sat, 22 Sep 2001 09:07:21 +0200
Date: Sat, 22 Sep 2001 09:05:49 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
Message-ID: <20010922090549.A17199@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
List-ID: <linux-parisc.vger.kernel.org>

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I followed Richard Hirst's instructions:

 palo -f /dev/null -k vmlinux -r root.bin -s lifimage \
        -c "0/linux HOME=/ root=/dev/ram initrd=0/ramdisk"

to modify the current Debian binary-hppa root.bin to boot 2.4.9-pa22 on
my 720/50 (via rbootd lifimage). However, the problems from the 0.9.2
CD-ROM install returned:

Linux version 2.4.9-pa22 (fullung@dogbert) (gcc version 3.0.2 20010829 (prerelease)) #8 Sat Sep 22 02:57:21 SAST 2001
...
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
handle_interruption() pid=1 command='init'
handle_interruption() pid=1 command='init'
handle_interruption() pid=1 command='init'
...

I'd be happy to test ANY (ANY! :-)) patches the great hackers of the
PA-RISC domain might have to offer. My HP is depending on you to get the
sweetest distro in the world installed! :-)

Regards,

Albert

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7rDhNDg+hOeRZtkMRAsmPAJ98PIWn7SfaOQttrJE7a+QLC1G9PACfWMyF
AWs9Kc43o7VFt530OwzJ+cA=
=vLDn
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
