Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A34A485C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 04:30:50 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lT0h-0005qD-00
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 12:30:48 +0200
Date: Mon, 24 Sep 2001 12:23:28 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurij Smakov <jurijus@theophys.kth.se>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924122328.B8276@dogbert.localdomain>
References: <20010922090549.A17199@dogbert.localdomain> <Pine.LNX.4.21.0109241132170.9567-100000@uranus.theophys.kth.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
In-Reply-To: <Pine.LNX.4.21.0109241132170.9567-100000@uranus.theophys.kth.se>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

News from the front... :-)

The updated printk outputs:

handle_interruption() pid=3D1 command=3D'init' code=3D18

I've also updated my init binary from the baseplus tarball to one I just
cross-compiled from sysvinit-2.82 (along with modifying init.h to
enable debugging output (#define DEBUG 1)), but it doesn't seem as if it
is getting much further than the initial interruption; init probably
isn't running very "far".

What next?=20

Regards,

Albert

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7rwmgDg+hOeRZtkMRAvczAJ9/zTGfibCvYPv8xJY0owBJSWoAUwCeKK5n
EhzLCE0W0pVwlA9098WAkSc=
=GMvq
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
