Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD6A1482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 14:02:52 -0600 (MDT)
Date: Mon, 5 May 2003 22:02:51 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030505200251.GS27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GFHULmA0mO3kKGOo"
Subject: [parisc-linux] Oops on 2.4.20-pa33
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

--GFHULmA0mO3kKGOo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've tried to compile/boot current 2.4.x CVS, but it Oopsed. I noted
down what looked really important (this is, IAOQ, r02 and kernel
addresses from stack). This is what I resolved out of System.map:

IAOQ:   10224658        __canonicalize_funcptr_for_compare
r02:    101229d4        do_sigaction

Kernel addresses on stack:
        1013a278        dentry_open
        10131a38        __kmem_cache_alloc
        101229d4        do_sigaction
        10102a9c        handle_interruption
        10122dc8        sys_rt_sigaction
        10107f90        syscall_exit
        10107084        intr_check_sig
        10106cf4        _switch_to_ret
        1013be10        chrdev_open
        1013a278        dentry_open
        1014aba8        locate_fd
        1011b530        it_real_fn

Seems I cannot really find it:)

b132l-1:~# gcc -v
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.2.3/specs
Configured with: ../src/configure -v --enable-languages=3Dc,c++,f77,objc,ad=
a --prefix=3D/usr --mandir=3D/usr/share/man --infodir=3D/usr/share/info --w=
ith-gxx-include-dir=3D/usr/include/c++/3.2 --enable-shared --with-system-zl=
ib --enable-nls --without-included-gettext --enable-__cxa_atexit --enable-c=
locale=3Dgnu --enable-objc-gc hppa-linux
Thread model: posix
gcc version 3.2.3

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--GFHULmA0mO3kKGOo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+tsNrHb1edYOZ4bsRAiNHAKCHWuD74ISfWCcK0oGVJqP1Vdfw7wCePNFu
MMsphhbTmuZKURinL8jIt3M=
=fJVe
-----END PGP SIGNATURE-----

--GFHULmA0mO3kKGOo--
