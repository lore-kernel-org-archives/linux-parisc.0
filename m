From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] NPTL Glibc on Ubuntu this week
Date: Tue, 31 Oct 2006 09:49:35 -0500
Message-ID: <1162306175.5738.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============2099052943=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============2099052943==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-DRvxaa7kPsukXGW21HEO"


--=-DRvxaa7kPsukXGW21HEO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey'all!

We're just getting ready to roll out the new glibc on Ubuntu.  Last I
checked, Carlos said that there was libthread ABI breakage.  We didn't
bump the SOVERSION, though.  Even if we did bump it, Debian/Ubuntu don't
track the thread package version separately right now, so we'd never see
it in package upgrades - things will just silently break.  So far the
plan is to ignore it, since updating from dapper to feisty is a by-hand
operation and the basic tools aren't threaded.  So upgrades will work,
they'll just suck.

So this is a final check before we roll - any other dragons hiding in
the waters that we might worry about?

--
Jeff Bailey - http://www.raspberryginger.com/jbailey/

--=-DRvxaa7kPsukXGW21HEO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFR2J/5M5hmdCYCpkRAp6LAKCkngcVfCGy1escsYVb/Dg9jWJTUgCg6XKa
S4DVwd4pEUJbbxXA7GkeKWM=
=Nns9
-----END PGP SIGNATURE-----

--=-DRvxaa7kPsukXGW21HEO--


--===============2099052943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============2099052943==--
