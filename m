Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06BE64924
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 09:55:37 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15o5Pc-0000lW-00
	for parisc-linux@lists.parisc-linux.org; Mon, 01 Oct 2001 17:55:20 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15o5Oj-000892-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 01 Oct 2001 17:54:25 +0200
Date: Mon, 1 Oct 2001 17:54:25 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011001175425.A31305@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] woody install on 720/50
List-ID: <linux-parisc.vger.kernel.org>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello all,

After applying Jurij's latest patch, and creating a new Debian bootdisk
lifimage with it, I booted it up and tried the Debian install again.

I tried a CD-ROM install first, but the installer refused to mount my
CD-ROM for some reason, even though it was detected as a possible device
to boot from.

Next I tried a network install using my i386 box (with co-ax network
card to connect to the 720) as a web server. According to the
access.log, the drivers.tgz and rescue.bin very retrieved without
problems. When it tried to extract the rescue.bin, it croaked with a=20
message saying "Bad address." When I tried to retrieve the images a
second time, the installer croaked.

The box still responds to pings, but not much else.

Any ideas on the "Bad address" problem?

Regards,

Albert

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7uJGxDg+hOeRZtkMRAmULAJ9ld6pU/TBSSHU/3K3rAmYUYSEzpQCdF1Pw
29mrauEgHl/MZiMlV8bKbDk=
=nZ+G
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
