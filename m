Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id A01954829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 10:35:00 -0600 (MDT)
Date: Tue, 6 May 2003 18:34:55 +0200
Message-ID: <3EB7766A00000392@ocpmta7.freegates.net>
In-Reply-To: <3EB7766A00000308@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "Randolph Chung" <randolph@tausq.org>
Cc: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>That said, I will try to prepare a new patch asap.
>
Ok here we are:

=====
diff -NaurX dontdiff linux-2.4.20-pa33/arch/parisc/kernel/signal.c linux-2.4.20-pa33-gcc33/arch/parisc/kernel/signal.c
--- linux-2.4.20-pa33/arch/parisc/kernel/signal.c	2003-05-06 17:47:32.000000000
+0200
+++ linux-2.4.20-pa33-gcc33/arch/parisc/kernel/signal.c	2003-05-06 18:09:35.000000000
+0200
@@ -489,7 +489,7 @@
 		ka = &current->sig->action[signr-1];
 		DBG(("sa_handler is %x\n", 
 			(unsigned int) ka->sa.sa_handler));
-		if (ka->sa.sa_handler == SIG_IGN) {
+		if (ka->sa.sa_handler == (void *)SIG_IGN) {
 			if (signr != SIGCHLD)
 				continue;
 			while (sys_wait4(-1, NULL, WNOHANG, NULL) > 0)
@@ -497,7 +497,7 @@
 			continue;
 		}
 
-		if (ka->sa.sa_handler == SIG_DFL) {
+		if (ka->sa.sa_handler == (void *)SIG_DFL) {
 			int exit_code = signr;
 
 			/* Init gets no signals it doesn't want.  */
diff -NaurX dontdiff linux-2.4.20-pa33/drivers/char/n_tty.c linux-2.4.20-pa33-gcc33/drivers/char/n_tty.c
--- linux-2.4.20-pa33/drivers/char/n_tty.c	2003-05-06 17:49:36.000000000
+0200
+++ linux-2.4.20-pa33-gcc33/drivers/char/n_tty.c	2003-05-06 18:10:25.000000000
+0200
@@ -810,7 +810,11 @@
 int is_ignored(int sig)
 {
 	return (sigismember(&current->blocked, sig) ||
+#if defined (__hppa__)
+	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
+#else
 	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
+#endif
 }
 
 static void n_tty_set_termios(struct tty_struct *tty, struct termios * old)
diff -NaurX dontdiff linux-2.4.20-pa33/fs/ncpfs/sock.c linux-2.4.20-pa33-gcc33/fs/ncpfs/sock.c
--- linux-2.4.20-pa33/fs/ncpfs/sock.c	2003-05-06 17:50:52.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/fs/ncpfs/sock.c	2003-05-06 18:11:12.000000000
+0200
@@ -466,9 +466,17 @@
 			   What if we've blocked it ourselves?  What about
 			   alarms?  Why, in fact, are we mucking with the
 			   sigmask at all? -- r~ */
+#if defined (__hppa__)
+			if (current->sig->action[SIGINT - 1].sa.sa_handler == (void *)SIG_DFL)
+#else
 			if (current->sig->action[SIGINT - 1].sa.sa_handler == SIG_DFL)
+#endif
 				mask |= sigmask(SIGINT);
+#if defined (__hppa__)
+			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == (void *)SIG_DFL)
+#else
 			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == SIG_DFL)
+#endif
 				mask |= sigmask(SIGQUIT);
 		}
 		siginitsetinv(&current->blocked, mask);
diff -NaurX dontdiff linux-2.4.20-pa33/fs/proc/array.c linux-2.4.20-pa33-gcc33/fs/proc/array.c
--- linux-2.4.20-pa33/fs/proc/array.c	2002-08-07 07:56:58.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/fs/proc/array.c	2003-05-06 18:12:07.000000000
+0200
@@ -231,9 +231,17 @@
 	if (p->sig) {
 		k = p->sig->action;
 		for (i = 1; i <= _NSIG; ++i, ++k) {
+#if defined (__hppa__)
+			if (k->sa.sa_handler == (void *)SIG_IGN)
+#else
 			if (k->sa.sa_handler == SIG_IGN)
+#endif
 				sigaddset(ign, i);
+#if defined (__hppa__)
+			else if (k->sa.sa_handler != (void *)SIG_DFL)
+#else
 			else if (k->sa.sa_handler != SIG_DFL)
+#endif
 				sigaddset(catch, i);
 		}
 	}
diff -NaurX dontdiff linux-2.4.20-pa33/kernel/signal.c linux-2.4.20-pa33-gcc33/kernel/signal.c
--- linux-2.4.20-pa33/kernel/signal.c	2002-11-29 07:49:17.000000000 +0100
+++ linux-2.4.20-pa33-gcc33/kernel/signal.c	2003-05-06 18:13:50.000000000
+0200
@@ -126,7 +126,11 @@
 	int i;
 	struct k_sigaction *ka = &t->sig->action[0];
 	for (i = _NSIG ; i != 0 ; i--) {
+#if defined (__hppa__)
+		if (ka->sa.sa_handler != (void *)SIG_IGN)
+#else
 		if (ka->sa.sa_handler != SIG_IGN)
+#endif
 			ka->sa.sa_handler = SIG_DFL;
 		ka->sa.sa_flags = 0;
 		sigemptyset(&ka->sa.sa_mask);
@@ -572,7 +576,11 @@
 		return -ESRCH;
 	}
 
+#if defined (__hppa__)
+	if (t->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN)
+#else
 	if (t->sig->action[sig-1].sa.sa_handler == SIG_IGN)
+#endif
 		t->sig->action[sig-1].sa.sa_handler = SIG_DFL;
 	sigdelset(&t->blocked, sig);
 	recalc_sigpending(t);
@@ -1094,8 +1102,13 @@
 		 * the signal to be ignored.
 		 */
 
+#if defined (__hppa__)
+		if (k->sa.sa_handler == (void *)SIG_IGN
+		    || (k->sa.sa_handler == (void *)SIG_DFL
+#else
 		if (k->sa.sa_handler == SIG_IGN
 		    || (k->sa.sa_handler == SIG_DFL
+#endif
 			&& (sig == SIGCONT ||
 			    sig == SIGCHLD ||
 			    sig == SIGURG ||
diff -NaurX dontdiff linux-2.4.20-pa33/net/sunrpc/clnt.c linux-2.4.20-pa33-gcc33/net/sunrpc/clnt.c
--- linux-2.4.20-pa33/net/sunrpc/clnt.c	2003-05-06 18:03:20.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/net/sunrpc/clnt.c	2003-05-06 18:14:43.000000000
+0200
@@ -209,9 +209,17 @@
 	/* Turn off various signals */
 	if (clnt->cl_intr) {
 		struct k_sigaction *action = current->sig->action;
+#if defined (__hppa__)
+		if (action[SIGINT-1].sa.sa_handler == (void *)SIG_DFL)
+#else
 		if (action[SIGINT-1].sa.sa_handler == SIG_DFL)
+#endif
 			sigallow |= sigmask(SIGINT);
+#if defined (__hppa__)
+		if (action[SIGQUIT-1].sa.sa_handler == (void *)SIG_DFL)
+#else
 		if (action[SIGQUIT-1].sa.sa_handler == SIG_DFL)
+#endif
 			sigallow |= sigmask(SIGQUIT);
 	}
 	spin_lock_irqsave(&current->sigmask_lock, irqflags);
diff -NaurX dontdiff linux-2.4.20-pa33/include/linux/compiler.h linux-2.4.20-pa33-gcc33/include/linux/compiler.h
--- linux-2.4.20-pa33/include/linux/compiler.h	2003-05-06 18:01:11.000000000
+0200
+++ linux-2.4.20-pa33-gcc33/include/linux/compiler.h	2003-05-06 18:08:56.000000000
+0200
@@ -1,6 +1,12 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
+#if (__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__ >= 1)
+#define inline		__inline__ __attribute__((always_inline))
+#define __inline__	__inline__ __attribute__((always_inline))
+#define __inline	__inline__ __attribute__((always_inline))
+#endif
+
 /* Somewhere in the middle of the GCC 2.96 development cycle, we implemented
    a mechanism by which the user can annotate likely branch directions and
    expect the blocks to be reordered appropriately.  Define __builtin_expect

PS1: compiler patch is not of me; a backport suggested in the pa-ml (Willy
iirc)

PS2: for files in main tree I save (if _hppa_ because seems to be specific
to hppa according very early Dave mail :)

hth,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
