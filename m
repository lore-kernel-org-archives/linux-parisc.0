Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27470482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 14:10:49 -0600 (MDT)
Date: Mon, 5 May 2003 13:05:37 -0700
From: Randolph Chung <randolph@tausq.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030505200537.GF29544@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030505200251.GS27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
In-Reply-To: <20030505200251.GS27494@lug-owl.de>
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

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> IAOQ:   10224658        __canonicalize_funcptr_for_compare
> r02:    101229d4        do_sigaction

i don't have a 32-bit machine handy, can you try this patch and let me
know if it fixes your problem? An earlier version of this was posted on
this list but didn't get commited. thx -randolph

Index: arch/parisc/kernel/signal.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux/arch/parisc/kernel/signal.c,v
retrieving revision 1.43
diff -u -p -r1.43 signal.c
--- arch/parisc/kernel/signal.c	4 Aug 2002 22:57:47 -0000	1.43
+++ arch/parisc/kernel/signal.c	5 May 2003 20:08:55 -0000
@@ -489,7 +489,7 @@ do_signal(sigset_t *oldset, struct pt_re
 		ka =3D &current->sig->action[signr-1];
 		DBG(("sa_handler is %x\n",=20
 			(unsigned int) ka->sa.sa_handler));
-		if (ka->sa.sa_handler =3D=3D SIG_IGN) {
+		if (ka->sa.sa_handler =3D=3D (void *)SIG_IGN) {
 			if (signr !=3D SIGCHLD)
 				continue;
 			while (sys_wait4(-1, NULL, WNOHANG, NULL) > 0)
@@ -497,7 +497,7 @@ do_signal(sigset_t *oldset, struct pt_re
 			continue;
 		}
=20
-		if (ka->sa.sa_handler =3D=3D SIG_DFL) {
+		if (ka->sa.sa_handler =3D=3D (void *)SIG_DFL) {
 			int exit_code =3D signr;
=20
 			/* Init gets no signals it doesn't want.  */

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+tsQRULspdC1Zp9IRAsDrAKCv30wrB19M3YwIm7tXWk6IFq7DOACfVAYS
MvFEjrUBE3USA3K9tUhg/o8=
=F6E3
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
