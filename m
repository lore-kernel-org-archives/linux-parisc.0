Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA20142
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 14:23:51 -0700
Received: from ottawa.linuxcare.com (HELO localhost.localdomain) (@216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 21:27:45 -0000
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id f0OLSDn21132
	for parisc-linux@thepuffingroup.com; Wed, 24 Jan 2001 16:28:13 -0500
Date: Wed, 24 Jan 2001 16:28:13 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010124162813.G19066@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Subject: [parisc-linux] Weird compile problems
List-ID: <linux-parisc.vger.kernel.org>


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm in the process of trying to get a working apt (still) and I'm getting
the following with the latest kernel (updated this morning) and the
toolchain from nfsroot-20010118.  The system is a C360 with 256MB of RAM.

Compiling deb/debindexfile.cc to /home/pjlahaie/src/apt/build/obj/apt-pkg/d=
ebindexfile.opic
deb/debindexfile.cc: In member function `string debSourcesIndex::SourceInfo=
=20
   (const pkgSrcRecords::Parser &, const pkgSrcRecords::File &) const':
deb/debindexfile.cc:62: Basic block 57 pred edge is corrupted
Predecessor:  14
Successor:  1075043236
deb/debindexfile.cc:62: Basic block 57 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 55 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 53 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 47 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 44 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 41 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 39 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 31 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 28 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 26 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 21 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 19 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 14 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 10 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 7 edge lists are corrupted
deb/debindexfile.cc:62: Basic block 1 edge lists are corrupted
deb/debindexfile.cc:62: Internal compiler error in , at flow.c:6834
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.


Now if I do another make, it will compile fine.  The file is compiled with
the following options:  -g -O -fno-rtti

Is this a kernel problem or a compiler problem?  I can move the build
environment over to an A180 instead.

						- Paul


--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6b0js8ggPQthPCzcRAgx4AJ4/DeCkn/ufHY4wVwRdm+yzO9JIpwCeLZSC
fYMXoFgp5eWAGFW7R2xKFmg=
=GDqN
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
