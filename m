Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 048584829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Jun 2003 09:42:07 -0600 (MDT)
Date: Sat, 7 Jun 2003 17:42:05 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030607154205.GG30457@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d5ZB48mKYG2jsBgL"
Subject: [parisc-linux] Compile error in 2.4.x and 2.5.x
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--d5ZB48mKYG2jsBgL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm currently experiencing the following compile error:

gcc -D__ASSEMBLY__ -traditional -D__KERNEL__ -I/usr/src/packages/full_cvs/l=
inux-build-2.4/include  -c -o hpmc.o hpmc.S
gcc -D__ASSEMBLY__ -traditional -D__KERNEL__ -I/usr/src/packages/full_cvs/l=
inux-build-2.4/include  -c -o real2.o real2.S
real2.S: Assembler messages:
real2.S:126: Error: too many positional arguments
make[1]: *** [real2.o] Error 1
make[1]: Leaving directory `/usr/src/packages/full_cvs/linux-build-2.4/arch=
/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

This is with:

jbglaw@b132l-1:/usr/src/packages/full_cvs/linux-build-2.4$ as -v
GNU assembler version 2.14.90.0.4 (hppa-linux) using BFD version 2.14.90.0.=
4 20030523 Debian GNU/Linux

jbglaw@b132l-1:/usr/src/packages/full_cvs/linux-build-2.4$ gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../src/configure -v --enable-languages=3Dc,c++,f77,pascal,=
objc,ada,treelang --prefix=3D/usr --mandir=3D/usr/share/man --infodir=3D/us=
r/share/info --with-gxx-include-dir=3D/usr/include/c++/3.3 --enable-shared =
--with-system-zlib --enable-nls --without-included-gettext --enable-__cxa_a=
texit --enable-sjlj-exceptions --enable-clocale=3Dgnu --enable-debug --enab=
le-objc-gc hppa-linux
Thread model: posix
gcc version 3.3 (Debian)

MfG, JBG
PS: Up to now, I still can't find CVS repos or checkouts which where
previously available via rsync. cvs.p-l.org only has .tar.gz and some
diffs, and rsync.p-l.org only has some README in place which promises
anything has been moved to cvs.p-l.org - but the checked-out archives
are still missing:(

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--d5ZB48mKYG2jsBgL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+4gfMHb1edYOZ4bsRAk14AJ4wKqBb0uwSpuw/wdNjGQWF1Vt/HQCfZZTD
V6x876cBd39TVr4U2TAK8P8=
=Y8lk
-----END PGP SIGNATURE-----

--d5ZB48mKYG2jsBgL--
