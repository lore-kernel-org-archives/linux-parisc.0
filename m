Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81F104A2B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 02:31:33 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nFWw-0001fp-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 10:31:26 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15nFW9-0006cQ-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 10:30:37 +0200
Date: Sat, 29 Sep 2001 10:30:37 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010929103037.D25136@dogbert.localdomain>
References: <200109271442.KAA14125@mail.lokmail.net> <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk> <20010929080006.A25136@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
In-Reply-To: <20010929080006.A25136@dogbert.localdomain>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Some minor progress. I'm now netbooting a lifimage and then running my
programs from disk. The only problem is that I can't dpkg-reconfigure
the chroot I copied over to the disk after partially bootstrapping it
and nfsroot booting it because I can't install libterm-readline-gnu-perl
and related packages (currently the system seems to hang when I do a
dpkg -i libreadline4_4.2-5_hppa.deb. libc6 and a few others dpkg -i'd
fine though (running -pa22 with only the case 18: and without Jurij's
patches). I'm currently running -pa27+jurij (I had to manually apply his
2nd patch... it didn't like the traps.c I had).

Another question: shutdown doesn't seem to work? Is it because I am
running with init=/bin/sh (thus no init, and no runlevels to change), or
is something more sinister at work here? Is there some other way I can
"neatly" bring down my HP?

That's about it for now. I'm going to try booting a -pa27 without
jurij's fixes and with just the case fall-through.

Regards,

Albert

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tYatDg+hOeRZtkMRAgBlAJ9lS0A3NozdKsrp7HkeiUkNALDQeQCcCCFC
8ivxHbU+G6VuvKBRLOPa6JU=
=xCSU
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
