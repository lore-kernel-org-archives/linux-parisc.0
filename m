Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1564482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 06:29:28 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15mDoV-0005Tl-00
	for parisc-linux@lists.parisc-linux.org; Wed, 26 Sep 2001 14:29:19 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15mDms-0005O0-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 14:27:38 +0200
Date: Wed, 26 Sep 2001 14:27:38 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010926142738.B20697@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] The 720/50 saga continues...
List-ID: <linux-parisc.vger.kernel.org>

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A long time ago, in a galaxy far, far away...

I booted my 720/50 from a lifimage with a nfsroot... and it worked, or
something. :-)

I modified the woody debootstrap script a bit to create a new nfsroot
(basically I ripped out the running of any binaries in the chroot), and
ran in on my i386. That worked pretty well.

Next up, I added an init=/bin/sh to the palo kernel command line
parameters, and rbootd'd the make palo lifimage. Whooo, prompt! So
first, mount proc, next remount the nfsroot rw, and then run
/sbin/ldconfig. Looking good...

Next rather annoying problem: ls reports "Invalid instruction" whenever
you try to run it. cat works, mount works... I haven't had much time to
test anything else.

I also attempted a dpkg-reconfigure --all, but it seems to be missing
Term::ReadLine. I'll be able to work some more on Friday. Hopefully dpkg
will do the trick, but if not, dpkg-cross might...?

Any ideas on the ls problem?

Regards,

Albert

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7scm5Dg+hOeRZtkMRAqkZAJ95d5j9Q5unNeIdcHbZkn/gEbR/5QCfdYlD
JZAlwjIvmGmbmUqk64OfbIc=
=AJsZ
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
