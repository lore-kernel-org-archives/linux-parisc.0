Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EEE04829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 May 2003 00:12:35 -0600 (MDT)
Date: Thu, 8 May 2003 08:12:34 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030508061234.GR27494@lug-owl.de>
References: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca> <3EB7766A000003EE@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FC8SlEHQ+Zonp6pC"
In-Reply-To: <3EB7766A000003EE@ocpmta7.freegates.net>
Subject: [parisc-linux] [PATCH-linux-2.5] sa_handler compare with cast
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

--FC8SlEHQ+Zonp6pC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-06 19:56:48 +0200, Joel Soete <jsoe0708@tiscali.be>
wrote in message <3EB7766A000003EE@ocpmta7.freegates.net>:
> So it will finaly become:
> diff -NaurX dontdiff linux-2.4.20-pa33/arch/parisc/kernel/signal.c linux-=
2.4.20-pa33-gcc33/arch/parisc/kernel/signal.c
> --- linux-2.4.20-pa33/arch/parisc/kernel/signal.c	2003-05-06 17:47:32.000=
000000
> +0200
> +++ linux-2.4.20-pa33-gcc33/arch/parisc/kernel/signal.c	2003-05-06 18:09:=
35.000000000
> +0200
[...]

This is the 2.5.x version. It's _only_ the sa_handler caste, not
including the additional compiler fixes you suggested.


Index: drivers/char/n_tty.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/drivers/char/n_tty.c,v
retrieving revision 1.8
diff -u -r1.8 n_tty.c
--- drivers/char/n_tty.c	5 May 2003 17:06:33 -0000	1.8
+++ drivers/char/n_tty.c	8 May 2003 06:08:38 -0000
@@ -808,7 +808,8 @@
 int is_ignored(int sig)
 {
 	return (sigismember(&current->blocked, sig) ||
-	        current->sighand->action[sig-1].sa.sa_handler =3D=3D SIG_IGN);
+	        current->sighand->action[sig-1].sa.sa_handler
+				=3D=3D (void *)SIG_IGN);
 }
=20
 static void n_tty_set_termios(struct tty_struct *tty, struct termios * old)
Index: fs/ncpfs/sock.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/fs/ncpfs/sock.c,v
retrieving revision 1.6
diff -u -r1.6 sock.c
--- fs/ncpfs/sock.c	15 Feb 2003 03:48:26 -0000	1.6
+++ fs/ncpfs/sock.c	8 May 2003 06:08:39 -0000
@@ -757,9 +757,9 @@
 			   What if we've blocked it ourselves?  What about
 			   alarms?  Why, in fact, are we mucking with the
 			   sigmask at all? -- r~ */
-			if (current->sighand->action[SIGINT - 1].sa.sa_handler =3D=3D SIG_DFL)
+			if (current->sighand->action[SIGINT - 1].sa.sa_handler =3D=3D (void *)S=
IG_DFL)
 				mask |=3D sigmask(SIGINT);
-			if (current->sighand->action[SIGQUIT - 1].sa.sa_handler =3D=3D SIG_DFL)
+			if (current->sighand->action[SIGQUIT - 1].sa.sa_handler =3D=3D (void *)=
SIG_DFL)
 				mask |=3D sigmask(SIGQUIT);
 		}
 		siginitsetinv(&current->blocked, mask);
Index: fs/proc/array.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/fs/proc/array.c,v
retrieving revision 1.15
diff -u -r1.15 array.c
--- fs/proc/array.c	5 May 2003 17:08:54 -0000	1.15
+++ fs/proc/array.c	8 May 2003 06:08:40 -0000
@@ -213,9 +213,9 @@
=20
 	k =3D p->sighand->action;
 	for (i =3D 1; i <=3D _NSIG; ++i, ++k) {
-		if (k->sa.sa_handler =3D=3D SIG_IGN)
+		if (k->sa.sa_handler =3D=3D (void *)SIG_IGN)
 			sigaddset(ign, i);
-		else if (k->sa.sa_handler !=3D SIG_DFL)
+		else if (k->sa.sa_handler !=3D (void *)SIG_DFL)
 			sigaddset(catch, i);
 	}
 }
Index: kernel/signal.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/kernel/signal.c,v
retrieving revision 1.19
diff -u -r1.19 signal.c
--- kernel/signal.c	24 Apr 2003 01:38:05 -0000	1.19
+++ kernel/signal.c	8 May 2003 06:08:42 -0000
@@ -144,12 +144,12 @@
 		(((sig) < SIGRTMIN)  && T(sig, SIG_KERNEL_STOP_MASK))
=20
 #define sig_user_defined(t, signr) \
-	(((t)->sighand->action[(signr)-1].sa.sa_handler !=3D SIG_DFL) &&	\
-	 ((t)->sighand->action[(signr)-1].sa.sa_handler !=3D SIG_IGN))
+	(((t)->sighand->action[(signr)-1].sa.sa_handler !=3D (void *)SIG_DFL) &&	\
+	 ((t)->sighand->action[(signr)-1].sa.sa_handler !=3D (void *)SIG_IGN))
=20
 #define sig_fatal(t, signr) \
 	(!T(signr, SIG_KERNEL_IGNORE_MASK|SIG_KERNEL_STOP_MASK) && \
-	 (t)->sighand->action[(signr)-1].sa.sa_handler =3D=3D SIG_DFL)
+	 (t)->sighand->action[(signr)-1].sa.sa_handler =3D=3D (void *)SIG_DFL)
=20
 static inline int sig_ignored(struct task_struct *t, int sig)
 {
@@ -171,8 +171,8 @@
=20
 	/* Is it explicitly or implicitly ignored? */
 	handler =3D t->sighand->action[sig-1].sa.sa_handler;
-	return   handler =3D=3D SIG_IGN ||
-		(handler =3D=3D SIG_DFL && sig_kernel_ignore(sig));
+	return   handler =3D=3D (void *)SIG_IGN ||
+		(handler =3D=3D (void *)SIG_DFL && sig_kernel_ignore(sig));
 }
=20
 /*
@@ -366,7 +366,7 @@
 	int i;
 	struct k_sigaction *ka =3D &t->sighand->action[0];
 	for (i =3D _NSIG ; i !=3D 0 ; i--) {
-		if (force_default || ka->sa.sa_handler !=3D SIG_IGN)
+		if (force_default || ka->sa.sa_handler !=3D (void *)SIG_IGN)
 			ka->sa.sa_handler =3D SIG_DFL;
 		ka->sa.sa_flags =3D 0;
 		sigemptyset(&ka->sa.sa_mask);
@@ -801,7 +801,7 @@
 	int ret;
=20
 	spin_lock_irqsave(&t->sighand->siglock, flags);
-	if (t->sighand->action[sig-1].sa.sa_handler =3D=3D SIG_IGN)
+	if (t->sighand->action[sig-1].sa.sa_handler =3D=3D (void *)SIG_IGN)
 		t->sighand->action[sig-1].sa.sa_handler =3D SIG_DFL;
 	sigdelset(&t->blocked, sig);
 	recalc_sigpending_tsk(t);
@@ -817,7 +817,7 @@
 	unsigned long int flags;
=20
 	spin_lock_irqsave(&t->sighand->siglock, flags);
-	if (t->sighand->action[sig-1].sa.sa_handler =3D=3D SIG_IGN)
+	if (t->sighand->action[sig-1].sa.sa_handler =3D=3D (void *)SIG_IGN)
 		t->sighand->action[sig-1].sa.sa_handler =3D SIG_DFL;
 	sigdelset(&t->blocked, sig);
 	recalc_sigpending_tsk(t);
@@ -1281,7 +1281,7 @@
 	psig =3D tsk->parent->sighand;
 	spin_lock_irqsave(&psig->siglock, flags);
 	if (sig =3D=3D SIGCHLD && tsk->state !=3D TASK_STOPPED &&
-	    (psig->action[SIGCHLD-1].sa.sa_handler =3D=3D SIG_IGN ||
+	    (psig->action[SIGCHLD-1].sa.sa_handler =3D=3D (void *)SIG_IGN ||
 	     (psig->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDWAIT))) {
 		/*
 		 * We are exiting and our parent doesn't care.  POSIX.1
@@ -1299,7 +1299,7 @@
 		 * it, just use SIG_IGN instead).
 		 */
 		tsk->exit_signal =3D -1;
-		if (psig->action[SIGCHLD-1].sa.sa_handler =3D=3D SIG_IGN)
+		if (psig->action[SIGCHLD-1].sa.sa_handler =3D=3D (void *)SIG_IGN)
 			sig =3D 0;
 	}
 	if (sig > 0 && sig <=3D _NSIG)
@@ -1347,7 +1347,7 @@
=20
 	sighand =3D parent->sighand;
 	spin_lock_irqsave(&sighand->siglock, flags);
-	if (sighand->action[SIGCHLD-1].sa.sa_handler !=3D SIG_IGN &&
+	if (sighand->action[SIGCHLD-1].sa.sa_handler !=3D (void *)SIG_IGN &&
 	    !(sighand->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDSTOP))
 		__group_send_sig_info(SIGCHLD, &info, parent);
 	/*
@@ -1581,9 +1581,9 @@
 		}
=20
 		ka =3D &current->sighand->action[signr-1];
-		if (ka->sa.sa_handler =3D=3D SIG_IGN) /* Do nothing.  */
+		if (ka->sa.sa_handler =3D=3D (void *)SIG_IGN) /* Do nothing.  */
 			continue;
-		if (ka->sa.sa_handler !=3D SIG_DFL) /* Run the handler.  */
+		if (ka->sa.sa_handler !=3D (void *)SIG_DFL) /* Run the handler.  */
 			return signr;
=20
 		/*
@@ -2034,8 +2034,8 @@
 		 *   (for example, SIGCHLD), shall cause the pending signal to
 		 *   be discarded, whether or not it is blocked"
 		 */
-		if (act->sa.sa_handler =3D=3D SIG_IGN ||
-		    (act->sa.sa_handler =3D=3D SIG_DFL &&
+		if (act->sa.sa_handler =3D=3D (void *)SIG_IGN ||
+		    (act->sa.sa_handler =3D=3D (void *)SIG_DFL &&
 		     sig_kernel_ignore(sig))) {
 			/*
 			 * This is a fairly rare case, so we only take the
Index: net/sunrpc/clnt.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/net/sunrpc/clnt.c,v
retrieving revision 1.12
diff -u -r1.12 clnt.c
--- net/sunrpc/clnt.c	8 Apr 2003 15:21:04 -0000	1.12
+++ net/sunrpc/clnt.c	8 May 2003 06:08:44 -0000
@@ -255,9 +255,9 @@
 	/* Turn off various signals */
 	if (clnt->cl_intr) {
 		struct k_sigaction *action =3D current->sighand->action;
-		if (action[SIGINT-1].sa.sa_handler =3D=3D SIG_DFL)
+		if (action[SIGINT-1].sa.sa_handler =3D=3D (void *)SIG_DFL)
 			sigallow |=3D sigmask(SIGINT);
-		if (action[SIGQUIT-1].sa.sa_handler =3D=3D SIG_DFL)
+		if (action[SIGQUIT-1].sa.sa_handler =3D=3D (void *)SIG_DFL)
 			sigallow |=3D sigmask(SIGQUIT);
 	}
 	spin_lock_irqsave(&current->sighand->siglock, irqflags);



MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--FC8SlEHQ+Zonp6pC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ufVRHb1edYOZ4bsRAsK9AJ9hlCR0tc/O9jQ+vzqg6g/AabQ+zgCbBoZc
K5vd0SBYUK6l0l9oGj950QI=
=4dOE
-----END PGP SIGNATURE-----

--FC8SlEHQ+Zonp6pC--
