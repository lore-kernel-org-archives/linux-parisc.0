Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA02498
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 13:40:21 -0700
Received: from ottawa.linuxcare.com (HELO localhost.localdomain) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Nov 2000 20:42:21 -0000
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id eAEKh1Q31175
	for parisc-linux@thepuffingroup.com; Tue, 14 Nov 2000 15:43:01 -0500
Date: Tue, 14 Nov 2000 15:43:00 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001114154259.B30937@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Subject: [parisc-linux] Beta CD
List-ID: <linux-parisc.vger.kernel.org>


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


This is to answer all the questions about sti console.  Currently, in the
CVS tree, serial console and STI console cannot be turned on at the same time.

This means that a choice between serial/sti needs to be done at compile
time.  At the time we cut the beta, it was decided that serial console was
more important than sti console.  I am also working on resolving the problem
with STI/serial console and once I have a fix ready, I will make a kernel
image available.  The current beta CD is also expecting a console on
ttyS0 and does not currently open a ttyx getty.  When I have a kernel
that can decide the console at runtime, I will look into the beta CD
issues.

If you have any more questions or suggestions, feel free to email me or
post on this list.  Thank you.

						- Paul

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6EaPR8ggPQthPCzcRAhT8AKC8EU8yusyoEvPHxKAQsaM0vMGthwCgnbbC
Yz6ZWjq3q9B80bI+YRxc8xo=
=HhRZ
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
