Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id A282A485C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 04:13:26 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lSjn-0004k9-00
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 12:13:19 +0200
Date: Mon, 24 Sep 2001 12:05:01 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurij Smakov <jurijus@theophys.kth.se>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924120501.A8276@dogbert.localdomain>
References: <20010922090549.A17199@dogbert.localdomain> <Pine.LNX.4.21.0109241132170.9567-100000@uranus.theophys.kth.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
In-Reply-To: <Pine.LNX.4.21.0109241132170.9567-100000@uranus.theophys.kth.se>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Thanks for the reply. I was considering exactly this course of action.
Hopefully I can spot something then. I'll post my findings here. :-)

I was also thinking of adding some debug output to init itself.
Seemingly it gets run, and during that process the kernel loses it...?

Regards,

Albert

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7rwVMDg+hOeRZtkMRAisFAJ9ZTLJjUN5sTZLUf6dUgZi8eaCeEQCbBoTc
AjG4DfuUGxePxlwAlO83VZo=
=r5eu
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
