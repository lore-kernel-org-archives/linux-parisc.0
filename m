Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties1.sun.ac.za (maties1.sun.ac.za [146.232.128.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87006482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 04:39:03 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties1.sun.ac.za with smtp (Exim 3.31 #1)
	id 15jIHL-0003aI-00
	for parisc-linux@lists.parisc-linux.org; Tue, 18 Sep 2001 12:38:59 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15jIGs-0000oX-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 12:38:30 +0200
Date: Tue, 18 Sep 2001 12:38:29 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010918123829.A3082@dogbert.localdomain>
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere> <20010918002427.C17483@gollum.intranet.nimag.net> <20010918073855.A11627@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
In-Reply-To: <20010918073855.A11627@middle.of.nowhere>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm pretty new to the whole PA-RISC Linux effort, so I would appreciate
it if someone could explain to me (and perhaps to other newbies), what
these unaligned access traps are, and what needs to be added to traps.c
(or possibly elsewhere) to get things working properly?

Regards,

Albert

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7pyQlDg+hOeRZtkMRAsSAAJ0Z9J0LB3qfNTORXV5scmRkBN/L3gCgkxbS
gfB6D84yWMUaB4OnnwYFYLc=
=MBUr
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
