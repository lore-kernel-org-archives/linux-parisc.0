Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B998482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 May 2003 07:30:39 -0600 (MDT)
Date: Sun, 11 May 2003 15:30:37 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030511133037.GN27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j/dCmPD2xgTAf6cP"
Subject: [parisc-linux] [PATCH-2.5] Various cleanups
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

--j/dCmPD2xgTAf6cP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This patch does:

 - Add various void * casts to pointer compares (to solve the
   __canonicalize_funcptr_for_compare missing symbol when built as
   module because libgcc.a isn't linked into these modules)

 - Ressurect CONFIG_BINFM_SOM when built as module: the hpux/ directory
   was completely missing (this part needs cleanup from a Makefile
   specialist), EXPORT_SYMBOL() the hpux_gateway_page if neccessary.

 - Export some more symbols (memchr, pdc_tod_read, pdc_tod_set,
   __flush_dcache_page, dcache_stride) to make various modules happy.


Please look at the first chunk - I don't know how to code this...

MfG, JBG


Index: arch/parisc/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/arch/parisc/Makefile,v
retrieving revision 1.25
diff -u -r1.25 Makefile
--- arch/parisc/Makefile	28 Mar 2003 16:52:18 -0000	1.25
+++ arch/parisc/Makefile	11 May 2003 13:09:16 -0000
@@ -58,7 +58,12 @@
 CFLAGS	+=3D $(cflags-y)
=20
 kernel-y			:=3D mm/ kernel/ math-emu/ kernel/init_task.o
-kernel-$(CONFIG_BINFMT_SOM)	+=3D hpux/
+ifdef CONFIG_BINFMT_SOM
+kernel-y	+=3D hpux/
+endif
+ifdef CONFIG_BINFMT_SOM_MODULE
+kernel-y	+=3D hpux/
+endif
=20
 core-y	+=3D $(addprefix arch/parisc/, $(kernel-y))
 libs-y	+=3D arch/parisc/lib/ `$(CC) -print-libgcc-file-name`
Index: arch/parisc/kernel/parisc_ksyms.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.16
diff -u -r1.16 parisc_ksyms.c
--- arch/parisc/kernel/parisc_ksyms.c	10 Apr 2003 04:45:31 -0000	1.16
+++ arch/parisc/kernel/parisc_ksyms.c	11 May 2003 13:09:16 -0000
@@ -11,6 +11,7 @@
 EXPORT_SYMBOL_NOVERS(memset);
 EXPORT_SYMBOL(memcmp);
 EXPORT_SYMBOL_NOVERS(memcpy);
+EXPORT_SYMBOL(memchr);
 EXPORT_SYMBOL(memmove);
 EXPORT_SYMBOL(strcat);
 EXPORT_SYMBOL(strchr);
@@ -39,7 +40,7 @@
 #include <asm/processor.h>
 EXPORT_SYMBOL(kernel_thread);
 EXPORT_SYMBOL(boot_cpu_data);
-#ifdef CONFIG_BINFMT_SOM
+#ifdef CONFIG_BINFMT_SOM_MODULE
 EXPORT_SYMBOL(map_hpux_gateway_page);
 #endif
 #ifdef CONFIG_EISA
@@ -80,6 +81,8 @@
 EXPORT_SYMBOL(register_parisc_driver);
 EXPORT_SYMBOL(unregister_parisc_driver);
 EXPORT_SYMBOL(pdc_iodc_read);
+EXPORT_SYMBOL(pdc_tod_read);
+EXPORT_SYMBOL(pdc_tod_set);
=20
 #include <asm/io.h>
 EXPORT_SYMBOL(__ioremap);
@@ -107,7 +110,9 @@
 #include <asm/cache.h>
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
 EXPORT_SYMBOL(flush_kernel_dcache_page);
+EXPORT_SYMBOL(__flush_dcache_page);
 EXPORT_SYMBOL(flush_all_caches);
+EXPORT_SYMBOL(dcache_stride);
=20
 #include <asm/unistd.h>
 extern long sys_open(const char *, int, int);
Index: arch/parisc/mm/init.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/arch/parisc/mm/init.c,v
retrieving revision 1.14
diff -u -r1.14 init.c
--- arch/parisc/mm/init.c	5 May 2003 17:05:49 -0000	1.14
+++ arch/parisc/mm/init.c	11 May 2003 13:09:18 -0000
@@ -666,7 +666,7 @@
 		PAGE_SIZE, PAGE_GATEWAY);
 }
=20
-#ifdef CONFIG_BINFMT_SOM
+#if defined(CONFIG_BINFMT_SOM) || defined(CONFIG_BINFMT_SOM_MODULE)
 void
 map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm)
 {
@@ -735,7 +735,7 @@
 	pg_table =3D (pte_t *) __va(pg_table) + start_pte;
 	set_pte(pg_table, __mk_pte(address, PAGE_GATEWAY));
 }
-#endif
+#endif /* CONFIG_BINFMT_SOM{,_MODULE} */
=20
 extern void flush_tlb_all_local(void);
=20
Index: arch/parisc/oprofile/init.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/arch/parisc/oprofile/init.c,v
retrieving revision 1.5
diff -u -r1.5 init.c
--- arch/parisc/oprofile/init.c	8 May 2003 13:31:44 -0000	1.5
+++ arch/parisc/oprofile/init.c	11 May 2003 13:09:18 -0000
@@ -11,6 +11,8 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/oprofile.h>
+#include <linux/init.h>
+#include <linux/errno.h>
=20
 extern void timer_init(struct oprofile_operations ** ops);
=20
Index: drivers/block/loop.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/drivers/block/loop.c,v
retrieving revision 1.17
diff -u -r1.17 loop.c
--- drivers/block/loop.c	5 May 2003 17:06:23 -0000	1.17
+++ drivers/block/loop.c	11 May 2003 13:09:24 -0000
@@ -368,7 +368,7 @@
 	/*
 	 * check bi_end_io, may just be a remapped bio
 	 */
-	if (bio && bio->bi_end_io =3D=3D loop_end_io_transfer) {
+	if (bio && bio->bi_end_io =3D=3D (void *)loop_end_io_transfer) {
 		int i;
=20
 		for (i =3D 0; i < bio->bi_vcnt; i++)
Index: drivers/char/n_tty.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/drivers/char/n_tty.c,v
retrieving revision 1.8
diff -u -r1.8 n_tty.c
--- drivers/char/n_tty.c	5 May 2003 17:06:33 -0000	1.8
+++ drivers/char/n_tty.c	11 May 2003 13:09:26 -0000
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
Index: drivers/input/serio/hp_sdc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/drivers/input/serio/hp_sdc.c,v
retrieving revision 1.2
diff -u -r1.2 hp_sdc.c
--- drivers/input/serio/hp_sdc.c	25 Dec 2002 00:39:09 -0000	1.2
+++ drivers/input/serio/hp_sdc.c	11 May 2003 13:09:29 -0000
@@ -669,7 +669,7 @@
=20
=20
 	write_lock_irq(&hp_sdc.hook_lock);
-	if ((callback !=3D hp_sdc.timer) ||
+	if (((void *)callback !=3D hp_sdc.timer) ||
 	    (hp_sdc.timer =3D=3D NULL)) {
 		write_unlock_irq(&hp_sdc.hook_lock);
 		return -EINVAL;
@@ -691,7 +691,7 @@
 int hp_sdc_release_hil_irq(hp_sdc_irqhook *callback) {
=20
 	write_lock_irq(&hp_sdc.hook_lock);
-	if ((callback !=3D hp_sdc.hil) ||
+	if (((void *)callback !=3D hp_sdc.hil) ||
 	    (hp_sdc.hil =3D=3D NULL)) {
 		write_unlock_irq(&hp_sdc.hook_lock);
 		return -EINVAL;
@@ -713,7 +713,7 @@
 int hp_sdc_release_cooked_irq(hp_sdc_irqhook *callback) {
=20
 	write_lock_irq(&hp_sdc.hook_lock);
-	if ((callback !=3D hp_sdc.cooked) ||
+	if (((void *)callback !=3D hp_sdc.cooked) ||
 	    (hp_sdc.cooked =3D=3D NULL)) {
 		write_unlock_irq(&hp_sdc.hook_lock);
 		return -EINVAL;
Index: drivers/net/tun.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/drivers/net/tun.c,v
retrieving revision 1.6
diff -u -r1.6 tun.c
--- drivers/net/tun.c	24 Apr 2003 01:36:14 -0000	1.6
+++ drivers/net/tun.c	11 May 2003 13:09:32 -0000
@@ -358,7 +358,7 @@
 		/* Device exist */
 		tun =3D dev->priv;
=20
-		if (dev->init !=3D tun_net_init || tun->attached)
+		if (dev->init !=3D (void *)tun_net_init || tun->attached)
 			return -EBUSY;
=20
 		/* Check permissions */
Index: fs/ncpfs/sock.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/fs/ncpfs/sock.c,v
retrieving revision 1.6
diff -u -r1.6 sock.c
--- fs/ncpfs/sock.c	15 Feb 2003 03:48:26 -0000	1.6
+++ fs/ncpfs/sock.c	11 May 2003 13:09:39 -0000
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
+++ fs/proc/array.c	11 May 2003 13:09:41 -0000
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
+++ kernel/signal.c	11 May 2003 13:09:55 -0000
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
Index: net/bridge/br_if.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/net/bridge/br_if.c,v
retrieving revision 1.8
diff -u -r1.8 br_if.c
--- net/bridge/br_if.c	5 May 2003 17:09:51 -0000	1.8
+++ net/bridge/br_if.c	11 May 2003 13:09:56 -0000
@@ -208,7 +208,7 @@
 	if (dev->flags & IFF_LOOPBACK || dev->type !=3D ARPHRD_ETHER)
 		return -EINVAL;
=20
-	if (dev->hard_start_xmit =3D=3D br_dev_xmit)
+	if (dev->hard_start_xmit =3D=3D (void *)br_dev_xmit)
 		return -ELOOP;
=20
 	dev_hold(dev);
Index: net/bridge/br_netfilter.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/net/bridge/br_netfilter.c,v
retrieving revision 1.6
diff -u -r1.6 br_netfilter.c
--- net/bridge/br_netfilter.c	5 May 2003 17:09:51 -0000	1.6
+++ net/bridge/br_netfilter.c	11 May 2003 13:09:56 -0000
@@ -521,8 +521,8 @@
    const struct net_device *in, const struct net_device *out,
    int (*okfn)(struct sk_buff *))
 {
-	if (in->hard_start_xmit =3D=3D br_dev_xmit &&
-	    okfn !=3D br_nf_pre_routing_finish) {
+	if (in->hard_start_xmit =3D=3D (void *)br_dev_xmit &&
+	    okfn !=3D (void *)br_nf_pre_routing_finish) {
 		okfn(*pskb);
 		return NF_STOLEN;
 	}
@@ -538,10 +538,10 @@
    const struct net_device *in, const struct net_device *out,
    int (*okfn)(struct sk_buff *))
 {
-	if (out->hard_start_xmit =3D=3D br_dev_xmit &&
-	    okfn !=3D br_nf_forward_finish &&
-	    okfn !=3D br_nf_local_out_finish &&
-	    okfn !=3D br_dev_queue_push_xmit) {
+	if (out->hard_start_xmit =3D=3D (void *)br_dev_xmit &&
+	    okfn !=3D (void *)br_nf_forward_finish &&
+	    okfn !=3D (void *)br_nf_local_out_finish &&
+	    okfn !=3D (void *)br_dev_queue_push_xmit) {
 		struct sk_buff *skb =3D *pskb;
 		struct nf_bridge_info *nf_bridge;
=20
Index: net/sunrpc/clnt.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /var/cvs/linux-2.5/net/sunrpc/clnt.c,v
retrieving revision 1.12
diff -u -r1.12 clnt.c
--- net/sunrpc/clnt.c	8 Apr 2003 15:21:04 -0000	1.12
+++ net/sunrpc/clnt.c	11 May 2003 13:10:00 -0000
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




--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--j/dCmPD2xgTAf6cP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+vlB9Hb1edYOZ4bsRAq0/AJ4y2ZDvv5O2wRSSBenKsdQ/2kO4DgCeP0L+
lv8QlrzemAdkI/G+9Af6gsY=
=99ja
-----END PGP SIGNATURE-----

--j/dCmPD2xgTAf6cP--
