Received: from localhost.localdomain (ottawa.linuxcare.com [216.208.98.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA08133
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 14:38:24 -0700
Received: (from pjlahaie@localhost)
	by localhost.localdomain (8.11.0/8.11.0) id eALLfml03034
	for parisc-linux@puffin.external.hp.com; Tue, 21 Nov 2000 16:41:48 -0500
Date: Tue, 21 Nov 2000 16:41:48 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001121164148.H912@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Subject: [parisc-linux] Fun build problems
List-ID: <linux-parisc.vger.kernel.org>


--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

    Over the last couple of days, I've been trying to get the debian
boot-floppies building (I know some changes will be necessary) and as
it stands now, several packages are missing.  In the process of trying
to compile/install these packages, I've run into some difficulties.
Here are some of them:

apt   -- Package on pehc and .iso do not work.  Missing lots of helper apps.

Seeing as apt was broken, I decided to download the woody version of apt so
I can get a newer version and hopefully skip some steps in building the
above packages.  gcc 2.96 and apt-0.3.19 don't get along, so I tried picking
it up from cvs (supposed to have been fixed).  Follow the directions on
cvs.debian.org

$ cvs -d :pserver:anonymous@cvs.debian.org:/cvs/APT login
(Logging in to anonymous@cvs.debian.org)
CVS password:=20
cvs login: authorization failed: server cvs.debian.org rejected access

Anyone know if there are other instructions other than what cvs.debian.org
says?  If so, feel free to email me


rsync -- ldd crashes on dpkg-shlibdepends stage

Can I just manually put the required dependancies in?


autoconf -- installinfo spins

When installing the autoconf package (to compile dpkg) installinfo spins.
And after several minutes still doesn't return.  It's taking up 100% cpu
at the time.

If I abort this, autoconf seems to be installed but cannot generate the
dpkg configure properly, some macros are missing

AM_CONDITIONAL(HAVE_CPLUSPLUS, test "$CXX" !=3D "")

Is in the ./configure script.


info -- Reinstall spins

If I try to reinstall info, it spins on the uninstall.  100% cpu.


If anyone has any solutions for any of the above problems, I am all
ears (eyes?).

							- Paul

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6Guwc8ggPQthPCzcRAgkGAJ9TzClXOg009RWO/v09ONBNnxJcbgCfcWcX
gj26osR06BqyJ0O+/Q83csk=
=YHRW
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
