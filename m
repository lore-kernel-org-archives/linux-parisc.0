Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCA864A2F
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 04:02:38 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nGx8-0003IR-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 12:02:34 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15nGwI-0006dp-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 12:01:42 +0200
Date: Sat, 29 Sep 2001 12:01:42 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010929120142.A25512@dogbert.localdomain>
References: <200109271442.KAA14125@mail.lokmail.net> <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk> <20010929080006.A25136@dogbert.localdomain> <20010929103037.D25136@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
In-Reply-To: <20010929103037.D25136@dogbert.localdomain>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, 29 Sep 2001, Albert Strasheim wrote:

> Hello,
>=20
> Some minor progress. I'm now netbooting a lifimage and then running my
> programs from disk. The only problem is that I can't dpkg-reconfigure
> the chroot I copied over to the disk after partially bootstrapping it
> and nfsroot booting it because I can't install libterm-readline-gnu-perl
> and related packages (currently the system seems to hang when I do a
> dpkg -i libreadline4_4.2-5_hppa.deb. libc6 and a few others dpkg -i'd
> fine though (running -pa22 with only the case 18: and without Jurij's
> patches). I'm currently running -pa27+jurij (I had to manually apply his
> 2nd patch... it didn't like the traps.c I had).

Not much luck with this one either. dpkg has just been sitting there
for more than an hour now.

Could I persuade someone with a working HP to bootstrap a new nfsroot,
please?

You probably also need to add the following packages:

busybox-static_0.60.1-1_hppa.deb
libc6_2.2.3-9_hppa.deb
libdb2_2.7.7.0-1_hppa.deb
libgdbmg1_1.7.3-27_hppa.deb
libncurses5_5.2.20010318-3_hppa.deb
libperl5.6_5.6.1-5_hppa.deb
libreadline4_4.2-5_hppa.deb
libterm-readline-gnu-perl_1.10-1_hppa.deb
perl_5.6.1-5_hppa.deb
perl-base_5.6.1-5_hppa.deb
perl-modules_5.6.1-5_all.deb

I think that should leave you with a system the 720/50 people can work
from. :-)

Regards,

Albert

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tZwFDg+hOeRZtkMRAmQFAKCHzxxaxn+qq7f/FzFSd6X+OpFYGQCeL06d
gd2aTZLlZCnMt01xOvdP2+8=
=frnO
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
