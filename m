Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA32060
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 22:55:27 -0700
Date: Wed, 24 Jan 2001 22:58:35 -0700
Message-ID: <20010124225835.Q4546@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Weird compile problems
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010124162813.G19066@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
In-Reply-To: <20010124162813.G19066@achilles.net>; from pjlahaie@linuxcare.com on Wed, Jan 24, 2001 at 04:28:13PM -0500
List-ID: <linux-parisc.vger.kernel.org>


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I'm in the process of trying to get a working apt (still) and I'm getting
> the following with the latest kernel (updated this morning) and the
> toolchain from nfsroot-20010118.  The system is a C360 with 256MB of RAM.

FWIW I didn't run into this problem when I tried to compile apt using
the same nfsroot and a kernel that is a few days old (Jan20). I get
almost all the way through the end of the build. one of the files take a
lot of memory to build and fails on my gecko, but i've gotten it to work
before so i'm pretty sure it'll work if i increase my swap. i'll try to
give this a try this weekend.

randolph
--=20
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6b8CLULspdC1Zp9IRAn7eAJ9IqeQ/OOI0PGJGGmgAMwgy5eAyFACffSZg
XrV5v+u1BFPzGXbMKYp0br0=
=1ste
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
