Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98958482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 00:44:24 -0600 (MDT)
Date: Tue, 6 May 2003 08:04:03 +0200
Message-ID: <3EB6425400000488@ocpmta7.freegates.net>
In-Reply-To: <20030505200537.GF29544@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "Randolph Chung" <randolph@tausq.org>,
	"Jan-Benedict Glaw" <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi all,

>
>> IAOQ:   10224658        __canonicalize_funcptr_for_compare
>> r02:    101229d4        do_sigaction
>
>i don't have a 32-bit machine handy, can you try this patch and let me
>know if it fixes your problem? An earlier version of this was posted on
>this list but didn't get commited. thx -randolph
>
>Index: arch/parisc/kernel/signal.c
>===================================================================
>RCS file: /var/cvs/linux/arch/parisc/kernel/signal.c,v
>retrieving revision 1.43
>diff -u -p -r1.43 signal.c
>--- arch/parisc/kernel/signal.c	4 Aug 2002 22:57:47 -0000	1.43
>+++ arch/parisc/kernel/signal.c	5 May 2003 20:08:55 -0000

AFAIK here is the full patch I suggested after some mail exchanges with Dave:

diff -Naur linux-2.4.20-pa32/arch/parisc/kernel/signal.c linux-2.4.20-pa32-gcc33/arch/parisc/kernel/signal.c
--- linux-2.4.20-pa32/arch/parisc/kernel/signal.c	2003-03-21 10:54:23.000000000
+0100
+++ linux-2.4.20-pa32-gcc33/arch/parisc/kernel/signal.c	2003-03-21 12:39:20.000000000
+0100
@@ -489,7 +489,11 @@
 		ka = &current->sig->action[signr-1];
 		DBG(("sa_handler is %x\n", 
 			(unsigned int) ka->sa.sa_handler));
+#if !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__
>= 1))
+		if (ka->sa.sa_handler == (void *)SIG_IGN) {
+#else
 		if (ka->sa.sa_handler == SIG_IGN) {
+#endif
 			if (signr != SIGCHLD)
 				continue;
 			while (sys_wait4(-1, NULL, WNOHANG, NULL) > 0)
@@ -497,7 +501,11 @@
 			continue;
 		}
 
+#if !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__
>= 1))
+		if (ka->sa.sa_handler == (void *)SIG_DFL) {
+#else
 		if (ka->sa.sa_handler == SIG_DFL) {
+#endif
 			int exit_code = signr;
 
 			/* Init gets no signals it doesn't want.  */
diff -Naur linux-2.4.20-pa32/drivers/char/n_tty.c linux-2.4.20-pa32-gcc33/drivers/char/n_tty.c
--- linux-2.4.20-pa32/drivers/char/n_tty.c	2003-03-21 10:51:30.000000000
+0100
+++ linux-2.4.20-pa32-gcc33/drivers/char/n_tty.c	2003-03-21 12:34:35.000000000
+0100
@@ -810,7 +810,11 @@
 int is_ignored(int sig)
 {
 	return (sigismember(&current->blocked, sig) ||
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
+#else
 	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
+#endif
 }
 
 static void n_tty_set_termios(struct tty_struct *tty, struct termios * old)
diff -Naur linux-2.4.20-pa32/fs/ncpfs/sock.c linux-2.4.20-pa32-gcc33/fs/ncpfs/sock.c
--- linux-2.4.20-pa32/fs/ncpfs/sock.c	2003-03-21 10:36:05.000000000 +0100
+++ linux-2.4.20-pa32-gcc33/fs/ncpfs/sock.c	2003-03-21 12:35:37.000000000
+0100
@@ -466,9 +466,17 @@
 			   What if we've blocked it ourselves?  What about
 			   alarms?  Why, in fact, are we mucking with the
 			   sigmask at all? -- r~ */
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+			if (current->sig->action[SIGINT - 1].sa.sa_handler == (void *)SIG_DFL)
+#else
 			if (current->sig->action[SIGINT - 1].sa.sa_handler == SIG_DFL)
+#endif
 				mask |= sigmask(SIGINT);
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == (void *)SIG_DFL)
+#else
 			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == SIG_DFL)
+#endif
 				mask |= sigmask(SIGQUIT);
 		}
 		siginitsetinv(&current->blocked, mask);
diff -Naur linux-2.4.20-pa32/fs/proc/array.c linux-2.4.20-pa32-gcc33/fs/proc/array.c
--- linux-2.4.20-pa32/fs/proc/array.c	2003-03-21 10:01:18.000000000 +0100
+++ linux-2.4.20-pa32-gcc33/fs/proc/array.c	2003-03-21 12:36:44.000000000
+0100
@@ -231,9 +231,17 @@
 	if (p->sig) {
 		k = p->sig->action;
 		for (i = 1; i <= _NSIG; ++i, ++k) {
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+			if (k->sa.sa_handler == (void *)SIG_IGN)
+#else
 			if (k->sa.sa_handler == SIG_IGN)
+#endif
 				sigaddset(ign, i);
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+			else if (k->sa.sa_handler != (void *)SIG_DFL)
+#else
 			else if (k->sa.sa_handler != SIG_DFL)
+#endif
 				sigaddset(catch, i);
 		}
 	}
diff -Naur linux-2.4.20-pa32/include/linux/compiler.h linux-2.4.20-pa32-gcc33/include/linux/compiler.h
--- linux-2.4.20-pa32/include/linux/compiler.h	2003-03-21 12:31:39.000000000
+0100
+++ linux-2.4.20-pa32-gcc33/include/linux/compiler.h	2003-03-21 12:32:07.000000000
+0100
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
diff -Naur linux-2.4.20-pa32/kernel/signal.c linux-2.4.20-pa32-gcc33/kernel/signal.c
--- linux-2.4.20-pa32/kernel/signal.c	2003-03-21 10:39:32.000000000 +0100
+++ linux-2.4.20-pa32-gcc33/kernel/signal.c	2003-03-21 12:37:40.000000000
+0100
@@ -126,7 +126,11 @@
 	int i;
 	struct k_sigaction *ka = &t->sig->action[0];
 	for (i = _NSIG ; i != 0 ; i--) {
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
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
 
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
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
 
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+		if (k->sa.sa_handler == (void *)SIG_IGN
+		    || (k->sa.sa_handler == (void *)SIG_DFL
+#else
 		if (k->sa.sa_handler == SIG_IGN
 		    || (k->sa.sa_handler == SIG_DFL
+#endif
 			&& (sig == SIGCONT ||
 			    sig == SIGCHLD ||
 			    sig == SIGURG ||
diff -Naur linux-2.4.20-pa32/net/sunrpc/clnt.c linux-2.4.20-pa32-gcc33/net/sunrpc/clnt.c
--- linux-2.4.20-pa32/net/sunrpc/clnt.c	2003-03-21 10:46:28.000000000 +0100
+++ linux-2.4.20-pa32-gcc33/net/sunrpc/clnt.c	2003-03-21 12:38:07.000000000
+0100
@@ -209,9 +209,17 @@
 	/* Turn off various signals */
 	if (clnt->cl_intr) {
 		struct k_sigaction *action = current->sig->action;
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+		if (action[SIGINT-1].sa.sa_handler == (void *)SIG_DFL)
+#else
 		if (action[SIGINT-1].sa.sa_handler == SIG_DFL)
+#endif
 			sigallow |= sigmask(SIGINT);
+#if defined (__hppa__) && !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__
== 3 && __GNUC_MINOR__ >= 1))
+		if (action[SIGQUIT-1].sa.sa_handler == (void *)SIG_DFL)
+#else
 		if (action[SIGQUIT-1].sa.sa_handler == SIG_DFL)
+#endif
 			sigallow |= sigmask(SIGQUIT);
 	}
 	spin_lock_irqsave(&current->sigmask_lock, irqflags);

hth,
    Joel

PS: It was writen for gcc > 3.1 and I was just working on a simplification
(remove _GNUC_ [sub]version test as suggested by Willy) but during test with
so gcc-3.0 I encounter HW pb with my b2k of test. I finaly compile but runs
seems to present pb (but I quiet convience it is the HW pb). Can somebody
else would test more?


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
