Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 689264829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 11:56:58 -0600 (MDT)
Date: Tue, 6 May 2003 19:56:48 +0200
Message-ID: <3EB7766A000003EE@ocpmta7.freegates.net>
In-Reply-To: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, jbglaw@lug-owl.de,
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

>> +#if defined (__hppa__)
>> +	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
>> +#else
>>  	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
>> +#endif
>
>You don't need to conditionalize the statement with the cast.  It should
>work on all ports.
>
I trust you.

So it will finaly become:
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
+++ linux-2.4.20-pa33-gcc33/drivers/char/n_tty.c	2003-05-06 19:59:33.000000000
+0200
@@ -810,7 +810,7 @@
 int is_ignored(int sig)
 {
 	return (sigismember(&current->blocked, sig) ||
-	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
+	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
 }
 
 static void n_tty_set_termios(struct tty_struct *tty, struct termios * old)
diff -NaurX dontdiff linux-2.4.20-pa33/fs/ncpfs/sock.c linux-2.4.20-pa33-gcc33/fs/ncpfs/sock.c
--- linux-2.4.20-pa33/fs/ncpfs/sock.c	2003-05-06 17:50:52.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/fs/ncpfs/sock.c	2003-05-06 19:59:53.000000000
+0200
@@ -466,9 +466,9 @@
 			   What if we've blocked it ourselves?  What about
 			   alarms?  Why, in fact, are we mucking with the
 			   sigmask at all? -- r~ */
-			if (current->sig->action[SIGINT - 1].sa.sa_handler == SIG_DFL)
+			if (current->sig->action[SIGINT - 1].sa.sa_handler == (void *)SIG_DFL)
 				mask |= sigmask(SIGINT);
-			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == SIG_DFL)
+			if (current->sig->action[SIGQUIT - 1].sa.sa_handler == (void *)SIG_DFL)
 				mask |= sigmask(SIGQUIT);
 		}
 		siginitsetinv(&current->blocked, mask);
diff -NaurX dontdiff linux-2.4.20-pa33/fs/proc/array.c linux-2.4.20-pa33-gcc33/fs/proc/array.c
--- linux-2.4.20-pa33/fs/proc/array.c	2002-08-07 07:56:58.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/fs/proc/array.c	2003-05-06 20:00:10.000000000
+0200
@@ -231,9 +231,9 @@
 	if (p->sig) {
 		k = p->sig->action;
 		for (i = 1; i <= _NSIG; ++i, ++k) {
-			if (k->sa.sa_handler == SIG_IGN)
+			if (k->sa.sa_handler == (void *)SIG_IGN)
 				sigaddset(ign, i);
-			else if (k->sa.sa_handler != SIG_DFL)
+			else if (k->sa.sa_handler != (void *)SIG_DFL)
 				sigaddset(catch, i);
 		}
 	}
diff -NaurX dontdiff linux-2.4.20-pa33/kernel/signal.c linux-2.4.20-pa33-gcc33/kernel/signal.c
--- linux-2.4.20-pa33/kernel/signal.c	2002-11-29 07:49:17.000000000 +0100
+++ linux-2.4.20-pa33-gcc33/kernel/signal.c	2003-05-06 20:01:00.000000000
+0200
@@ -126,7 +126,7 @@
 	int i;
 	struct k_sigaction *ka = &t->sig->action[0];
 	for (i = _NSIG ; i != 0 ; i--) {
-		if (ka->sa.sa_handler != SIG_IGN)
+		if (ka->sa.sa_handler != (void *)SIG_IGN)
 			ka->sa.sa_handler = SIG_DFL;
 		ka->sa.sa_flags = 0;
 		sigemptyset(&ka->sa.sa_mask);
@@ -572,7 +572,7 @@
 		return -ESRCH;
 	}
 
-	if (t->sig->action[sig-1].sa.sa_handler == SIG_IGN)
+	if (t->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN)
 		t->sig->action[sig-1].sa.sa_handler = SIG_DFL;
 	sigdelset(&t->blocked, sig);
 	recalc_sigpending(t);
@@ -1094,8 +1094,8 @@
 		 * the signal to be ignored.
 		 */
 
-		if (k->sa.sa_handler == SIG_IGN
-		    || (k->sa.sa_handler == SIG_DFL
+		if (k->sa.sa_handler == (void *)SIG_IGN
+		    || (k->sa.sa_handler == (void *)SIG_DFL
 			&& (sig == SIGCONT ||
 			    sig == SIGCHLD ||
 			    sig == SIGURG ||
diff -NaurX dontdiff linux-2.4.20-pa33/net/sunrpc/clnt.c linux-2.4.20-pa33-gcc33/net/sunrpc/clnt.c
--- linux-2.4.20-pa33/net/sunrpc/clnt.c	2003-05-06 18:03:20.000000000 +0200
+++ linux-2.4.20-pa33-gcc33/net/sunrpc/clnt.c	2003-05-06 20:01:16.000000000
+0200
@@ -209,9 +209,9 @@
 	/* Turn off various signals */
 	if (clnt->cl_intr) {
 		struct k_sigaction *action = current->sig->action;
-		if (action[SIGINT-1].sa.sa_handler == SIG_DFL)
+		if (action[SIGINT-1].sa.sa_handler == (void *)SIG_DFL)
 			sigallow |= sigmask(SIGINT);
-		if (action[SIGQUIT-1].sa.sa_handler == SIG_DFL)
+		if (action[SIGQUIT-1].sa.sa_handler == (void *)SIG_DFL)
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

If everybody agree is somebody could comit it (I haven't any ci cvs access
and it is better like this :)

Joel

PS: for gcc-3.2 there are still pending patch to be comitted iirc:
diff -NaurX dontdiff linux-2.4.20-pa33/include/asm-parisc/spinlock.h linux-2.4.20-pa33-gcc33/include/asm-parisc/spinlock.h
--- linux-2.4.20-pa33/include/asm-parisc/spinlock.h	2003-05-06 20:19:36.000000000
+0200
+++ linux-2.4.20-pa33-gcc33/include/asm-parisc/spinlock.h	2003-05-06 20:23:14.000000000
+0200
@@ -14,7 +14,7 @@
 	volatile int counter;
 } rwlock_t;
 
-#define RW_LOCK_UNLOCKED (rwlock_t) { SPIN_LOCK_UNLOCKED, 0 }
+#define RW_LOCK_UNLOCKED (rwlock_t) { SPIN_LOCK_UNLOCKED_INIT, 0 }
 
 #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)
 
diff -NaurX dontdiff linux-2.4.20-pa33/include/asm-parisc/spinlock_t.h linux-2.4.20-pa33-gcc33/include/asm-parisc/spinlock_t.h
--- linux-2.4.20-pa33/include/asm-parisc/spinlock_t.h	2003-05-06 20:19:36.000000000
+0200
+++ linux-2.4.20-pa33-gcc33/include/asm-parisc/spinlock_t.h	2003-05-06 20:24:07.000000000
+0200
@@ -47,7 +47,9 @@
 } spinlock_t;
 
 #ifndef CONFIG_DEBUG_SPINLOCK
-#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }
+/* This following change because of gcc-3.2 limits for C99 compilience */
+#define SPIN_LOCK_UNLOCKED_INIT { 1 }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
 
 /* Define 6 spinlock primitives that don't depend on anything else. */
 
@@ -79,7 +81,9 @@
 
 #else
 
-#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1, 0, 0 }
+/* This following change because of gcc-3.2 limits for C99 compilience */
+#define SPIN_LOCK_UNLOCKED_INIT { 1, 0L, 0L }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
 
 /* Define 6 spinlock primitives that don't depend on anything else. */
 
 	spin_lock_irqsave(&current->sigmask_lock, irqflags);



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
