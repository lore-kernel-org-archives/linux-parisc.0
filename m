From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Fri, 21 Mar 2003 13:44:28 +0100
Message-ID: <3E689FC400004CD8__38775.0504109592$1416622315$gmane$org@ocpmta1.freegates.net>
References: <200303201823.h2KINN1w007420@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3E689FC400004CD8/mail.tiscali.be"
Cc: tausq@debian.org, b.gunreben@web.de, willy@debian.org,
	doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	dave@hiauly1.hia.nrc.ca
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200303201823.h2KINN1w007420@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--========/3E689FC400004CD8/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi Dave,
>
>Sorry, that part is wrong.  Anyway, just leave the macro defines as
>is and cast them where used to void *.  This causes the conversion
>of the other operand to void * and function pointer conicalization
>won't be done (6.5.9, paragraph 5).
>
you have definitely right.

I test following work-around against 2.4.20-pa32 with latest dpkg gcc-3.3
(3.3-0pre2) and it boot well know:
=====
diff -Naur linux-2.4.20-pa32/Makefile linux-2.4.20-pa32-gcc33/Makefile
--- linux-2.4.20-pa32/Makefile	2003-03-21 12:17:41.000000000 +0100
+++ linux-2.4.20-pa32-gcc33/Makefile	2003-03-21 12:19:06.000000000 +0100
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 20
-EXTRAVERSION = -pa32
+EXTRAVERSION = -pa33
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
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
=====

I could not be sure about __LP64__ condition because gcc-hppa62_3.3 do not
yet exist :(

Can some body else could test it more?

Joel

PS1: I hoppe it will stay just a temporary work-around; that is typical what
I hate: code depending of platform and more over compiler release :(

PS2: If I well understand the pa32 patch include the Alan patch concerning
ptrace vulnerability. Is there some simple mean to stress the solution on
hppa platform?

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be



--========/3E689FC400004CD8/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="linux-2.4.20-pa32_gcc33.patch"

ZGlmZiAtTmF1ciBsaW51eC0yLjQuMjAtcGEzMi9NYWtlZmlsZSBsaW51eC0yLjQuMjAtcGEzMi1n
Y2MzMy9NYWtlZmlsZQotLS0gbGludXgtMi40LjIwLXBhMzIvTWFrZWZpbGUJMjAwMy0wMy0yMSAx
MjoxNzo0MS4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNC4yMC1wYTMyLWdjYzMzL01ha2Vm
aWxlCTIwMDMtMDMtMjEgMTI6MTk6MDYuMDAwMDAwMDAwICswMTAwCkBAIC0xLDcgKzEsNyBAQAog
VkVSU0lPTiA9IDIKIFBBVENITEVWRUwgPSA0CiBTVUJMRVZFTCA9IDIwCi1FWFRSQVZFUlNJT04g
PSAtcGEzMgorRVhUUkFWRVJTSU9OID0gLXBhMzMKIAogS0VSTkVMUkVMRUFTRT0kKFZFUlNJT04p
LiQoUEFUQ0hMRVZFTCkuJChTVUJMRVZFTCkkKEVYVFJBVkVSU0lPTikKIApkaWZmIC1OYXVyIGxp
bnV4LTIuNC4yMC1wYTMyL2FyY2gvcGFyaXNjL2tlcm5lbC9zaWduYWwuYyBsaW51eC0yLjQuMjAt
cGEzMi1nY2MzMy9hcmNoL3BhcmlzYy9rZXJuZWwvc2lnbmFsLmMKLS0tIGxpbnV4LTIuNC4yMC1w
YTMyL2FyY2gvcGFyaXNjL2tlcm5lbC9zaWduYWwuYwkyMDAzLTAzLTIxIDEwOjU0OjIzLjAwMDAw
MDAwMCArMDEwMAorKysgbGludXgtMi40LjIwLXBhMzItZ2NjMzMvYXJjaC9wYXJpc2Mva2VybmVs
L3NpZ25hbC5jCTIwMDMtMDMtMjEgMTI6Mzk6MjAuMDAwMDAwMDAwICswMTAwCkBAIC00ODksNyAr
NDg5LDExIEBACiAJCWthID0gJmN1cnJlbnQtPnNpZy0+YWN0aW9uW3NpZ25yLTFdOwogCQlEQkco
KCJzYV9oYW5kbGVyIGlzICV4XG4iLCAKIAkJCSh1bnNpZ25lZCBpbnQpIGthLT5zYS5zYV9oYW5k
bGVyKSk7CisjaWYgIWRlZmluZWQgKF9fTFA2NF9fKSAmJiAoKF9fR05VQ19fID4gMykgfHwgKF9f
R05VQ19fID09IDMgJiYgX19HTlVDX01JTk9SX18gPj0gMSkpCisJCWlmIChrYS0+c2Euc2FfaGFu
ZGxlciA9PSAodm9pZCAqKVNJR19JR04pIHsKKyNlbHNlCiAJCWlmIChrYS0+c2Euc2FfaGFuZGxl
ciA9PSBTSUdfSUdOKSB7CisjZW5kaWYKIAkJCWlmIChzaWduciAhPSBTSUdDSExEKQogCQkJCWNv
bnRpbnVlOwogCQkJd2hpbGUgKHN5c193YWl0NCgtMSwgTlVMTCwgV05PSEFORywgTlVMTCkgPiAw
KQpAQCAtNDk3LDcgKzUwMSwxMSBAQAogCQkJY29udGludWU7CiAJCX0KIAorI2lmICFkZWZpbmVk
IChfX0xQNjRfXykgJiYgKChfX0dOVUNfXyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05V
Q19NSU5PUl9fID49IDEpKQorCQlpZiAoa2EtPnNhLnNhX2hhbmRsZXIgPT0gKHZvaWQgKilTSUdf
REZMKSB7CisjZWxzZQogCQlpZiAoa2EtPnNhLnNhX2hhbmRsZXIgPT0gU0lHX0RGTCkgeworI2Vu
ZGlmCiAJCQlpbnQgZXhpdF9jb2RlID0gc2lnbnI7CiAKIAkJCS8qIEluaXQgZ2V0cyBubyBzaWdu
YWxzIGl0IGRvZXNuJ3Qgd2FudC4gICovCmRpZmYgLU5hdXIgbGludXgtMi40LjIwLXBhMzIvZHJp
dmVycy9jaGFyL25fdHR5LmMgbGludXgtMi40LjIwLXBhMzItZ2NjMzMvZHJpdmVycy9jaGFyL25f
dHR5LmMKLS0tIGxpbnV4LTIuNC4yMC1wYTMyL2RyaXZlcnMvY2hhci9uX3R0eS5jCTIwMDMtMDMt
MjEgMTA6NTE6MzAuMDAwMDAwMDAwICswMTAwCisrKyBsaW51eC0yLjQuMjAtcGEzMi1nY2MzMy9k
cml2ZXJzL2NoYXIvbl90dHkuYwkyMDAzLTAzLTIxIDEyOjM0OjM1LjAwMDAwMDAwMCArMDEwMApA
QCAtODEwLDcgKzgxMCwxMSBAQAogaW50IGlzX2lnbm9yZWQoaW50IHNpZykKIHsKIAlyZXR1cm4g
KHNpZ2lzbWVtYmVyKCZjdXJyZW50LT5ibG9ja2VkLCBzaWcpIHx8CisjaWYgZGVmaW5lZCAoX19o
cHBhX18pICYmICFkZWZpbmVkIChfX0xQNjRfXykgJiYgKChfX0dOVUNfXyA+IDMpIHx8IChfX0dO
VUNfXyA9PSAzICYmIF9fR05VQ19NSU5PUl9fID49IDEpKQorCSAgICAgICAgY3VycmVudC0+c2ln
LT5hY3Rpb25bc2lnLTFdLnNhLnNhX2hhbmRsZXIgPT0gKHZvaWQgKilTSUdfSUdOKTsKKyNlbHNl
CiAJICAgICAgICBjdXJyZW50LT5zaWctPmFjdGlvbltzaWctMV0uc2Euc2FfaGFuZGxlciA9PSBT
SUdfSUdOKTsKKyNlbmRpZgogfQogCiBzdGF0aWMgdm9pZCBuX3R0eV9zZXRfdGVybWlvcyhzdHJ1
Y3QgdHR5X3N0cnVjdCAqdHR5LCBzdHJ1Y3QgdGVybWlvcyAqIG9sZCkKZGlmZiAtTmF1ciBsaW51
eC0yLjQuMjAtcGEzMi9mcy9uY3Bmcy9zb2NrLmMgbGludXgtMi40LjIwLXBhMzItZ2NjMzMvZnMv
bmNwZnMvc29jay5jCi0tLSBsaW51eC0yLjQuMjAtcGEzMi9mcy9uY3Bmcy9zb2NrLmMJMjAwMy0w
My0yMSAxMDozNjowNS4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNC4yMC1wYTMyLWdjYzMz
L2ZzL25jcGZzL3NvY2suYwkyMDAzLTAzLTIxIDEyOjM1OjM3LjAwMDAwMDAwMCArMDEwMApAQCAt
NDY2LDkgKzQ2NiwxNyBAQAogCQkJICAgV2hhdCBpZiB3ZSd2ZSBibG9ja2VkIGl0IG91cnNlbHZl
cz8gIFdoYXQgYWJvdXQKIAkJCSAgIGFsYXJtcz8gIFdoeSwgaW4gZmFjdCwgYXJlIHdlIG11Y2tp
bmcgd2l0aCB0aGUKIAkJCSAgIHNpZ21hc2sgYXQgYWxsPyAtLSByfiAqLworI2lmIGRlZmluZWQg
KF9faHBwYV9fKSAmJiAhZGVmaW5lZCAoX19MUDY0X18pICYmICgoX19HTlVDX18gPiAzKSB8fCAo
X19HTlVDX18gPT0gMyAmJiBfX0dOVUNfTUlOT1JfXyA+PSAxKSkKKwkJCWlmIChjdXJyZW50LT5z
aWctPmFjdGlvbltTSUdJTlQgLSAxXS5zYS5zYV9oYW5kbGVyID09ICh2b2lkICopU0lHX0RGTCkK
KyNlbHNlCiAJCQlpZiAoY3VycmVudC0+c2lnLT5hY3Rpb25bU0lHSU5UIC0gMV0uc2Euc2FfaGFu
ZGxlciA9PSBTSUdfREZMKQorI2VuZGlmCiAJCQkJbWFzayB8PSBzaWdtYXNrKFNJR0lOVCk7Cisj
aWYgZGVmaW5lZCAoX19ocHBhX18pICYmICFkZWZpbmVkIChfX0xQNjRfXykgJiYgKChfX0dOVUNf
XyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05VQ19NSU5PUl9fID49IDEpKQorCQkJaWYg
KGN1cnJlbnQtPnNpZy0+YWN0aW9uW1NJR1FVSVQgLSAxXS5zYS5zYV9oYW5kbGVyID09ICh2b2lk
ICopU0lHX0RGTCkKKyNlbHNlCiAJCQlpZiAoY3VycmVudC0+c2lnLT5hY3Rpb25bU0lHUVVJVCAt
IDFdLnNhLnNhX2hhbmRsZXIgPT0gU0lHX0RGTCkKKyNlbmRpZgogCQkJCW1hc2sgfD0g
c2lnbWFzayhTSUdRVUlUKTsKIAkJfQogCQlzaWdpbml0c2V0aW52KCZjdXJyZW50LT5ibG9ja2Vk
LCBtYXNrKTsKZGlmZiAtTmF1ciBsaW51eC0yLjQuMjAtcGEzMi9mcy9wcm9jL2FycmF5LmMgbGlu
dXgtMi40LjIwLXBhMzItZ2NjMzMvZnMvcHJvYy9hcnJheS5jCi0tLSBsaW51eC0yLjQuMjAtcGEz
Mi9mcy9wcm9jL2FycmF5LmMJMjAwMy0wMy0yMSAxMDowMToxOC4wMDAwMDAwMDAgKzAxMDAKKysr
IGxpbnV4LTIuNC4yMC1wYTMyLWdjYzMzL2ZzL3Byb2MvYXJyYXkuYwkyMDAzLTAzLTIxIDEyOjM2
OjQ0LjAwMDAwMDAwMCArMDEwMApAQCAtMjMxLDkgKzIzMSwxNyBAQAogCWlmIChwLT5zaWcpIHsK
IAkJayA9IHAtPnNpZy0+YWN0aW9uOwogCQlmb3IgKGkgPSAxOyBpIDw9IF9OU0lHOyArK2ksICsr
aykgeworI2lmIGRlZmluZWQgKF9faHBwYV9fKSAmJiAhZGVmaW5lZCAoX19MUDY0X18pICYmICgo
X19HTlVDX18gPiAzKSB8fCAoX19HTlVDX18gPT0gMyAmJiBfX0dOVUNfTUlOT1JfXyA+PSAxKSkK
KwkJCWlmIChrLT5zYS5zYV9oYW5kbGVyID09ICh2b2lkICopU0lHX0lHTikKKyNlbHNlCiAJCQlp
ZiAoay0+c2Euc2FfaGFuZGxlciA9PSBTSUdfSUdOKQorI2VuZGlmCiAJCQkJc2lnYWRkc2V0KGln
biwgaSk7CisjaWYgZGVmaW5lZCAoX19ocHBhX18pICYmICFkZWZpbmVkIChfX0xQNjRfXykgJiYg
KChfX0dOVUNfXyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05VQ19NSU5PUl9fID49IDEp
KQorCQkJZWxzZSBpZiAoay0+c2Euc2FfaGFuZGxlciAhPSAodm9pZCAqKVNJR19ERkwpCisjZWxz
ZQogCQkJZWxzZSBpZiAoay0+c2Euc2FfaGFuZGxlciAhPSBTSUdfREZMKQorI2VuZGlmCiAJCQkJ
c2lnYWRkc2V0KGNhdGNoLCBpKTsKIAkJfQogCX0KZGlmZiAtTmF1ciBsaW51eC0yLjQuMjAtcGEz
Mi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmggbGludXgtMi40LjIwLXBhMzItZ2NjMzMvaW5jbHVk
ZS9saW51eC9jb21waWxlci5oCi0tLSBsaW51eC0yLjQuMjAtcGEzMi9pbmNsdWRlL2xpbnV4L2Nv
bXBpbGVyLmgJMjAwMy0wMy0yMSAxMjozMTozOS4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIu
NC4yMC1wYTMyLWdjYzMzL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaAkyMDAzLTAzLTIxIDEyOjMy
OjA3LjAwMDAwMDAwMCArMDEwMApAQCAtMSw2ICsxLDEyIEBACiAjaWZuZGVmIF9fTElOVVhfQ09N
UElMRVJfSAogI2RlZmluZSBfX0xJTlVYX0NPTVBJTEVSX0gKIAorI2lmIChfX0dOVUNfXyA+IDMp
IHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05VQ19NSU5PUl9fID49IDEpCisjZGVmaW5lIGlubGlu
ZQkJX19pbmxpbmVfXyBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkKKyNkZWZpbmUgX19p
bmxpbmVfXwlfX2lubGluZV9fIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQorI2RlZmlu
ZSBfX2lubGluZQlfX2lubGluZV9fIF9fYXR0cmlidXRlX18oKGFsd2F5c19pbmxpbmUpKQorI2Vu
ZGlmCisKIC8qIFNvbWV3aGVyZSBpbiB0aGUgbWlkZGxlIG9mIHRoZSBHQ0MgMi45NiBkZXZlbG9w
bWVudCBjeWNsZSwgd2UgaW1wbGVtZW50ZWQKICAgIGEgbWVjaGFuaXNtIGJ5IHdoaWNoIHRoZSB1
c2VyIGNhbiBhbm5vdGF0ZSBsaWtlbHkgYnJhbmNoIGRpcmVjdGlvbnMgYW5kCiAgICBleHBlY3Qg
dGhlIGJsb2NrcyB0byBiZSByZW9yZGVyZWQgYXBwcm9wcmlhdGVseS4gIERlZmluZSBfX2J1aWx0
aW5fZXhwZWN0CmRpZmYgLU5hdXIgbGludXgtMi40LjIwLXBhMzIva2VybmVsL3NpZ25hbC5jIGxp
bnV4LTIuNC4yMC1wYTMyLWdjYzMzL2tlcm5lbC9zaWduYWwuYwotLS0gbGludXgtMi40LjIwLXBh
MzIva2VybmVsL3NpZ25hbC5jCTIwMDMtMDMtMjEgMTA6Mzk6MzIuMDAwMDAwMDAwICswMTAwCisr
KyBsaW51eC0yLjQuMjAtcGEzMi1nY2MzMy9rZXJuZWwvc2lnbmFsLmMJMjAwMy0wMy0yMSAxMjoz
Nzo0MC4wMDAwMDAwMDAgKzAxMDAKQEAgLTEyNiw3ICsxMjYsMTEgQEAKIAlpbnQgaTsKIAlzdHJ1
Y3Qga19zaWdhY3Rpb24gKmthID0gJnQtPnNpZy0+YWN0aW9uWzBdOwogCWZvciAoaSA9IF9OU0lH
IDsgaSAhPSAwIDsgaS0tKSB7CisjaWYgZGVmaW5lZCAoX19ocHBhX18pICYmICFkZWZpbmVkIChf
X0xQNjRfXykgJiYgKChfX0dOVUNfXyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05VQ19N
SU5PUl9fID49IDEpKQorCQlpZiAoa2EtPnNhLnNhX2hhbmRsZXIgIT0gKHZvaWQgKilTSUdfSUdO
KQorI2Vsc2UKIAkJaWYgKGthLT5zYS5zYV9oYW5kbGVyICE9IFNJR19JR04pCisjZW5kaWYKIAkJ
CWthLT5zYS5zYV9oYW5kbGVyID0gU0lHX0RGTDsKIAkJa2EtPnNhLnNhX2ZsYWdzID0gMDsKIAkJ
c2lnZW1wdHlzZXQoJmthLT5zYS5zYV9tYXNrKTsKQEAgLTU3Miw3ICs1NzYsMTEgQEAKIAkJcmV0
dXJuIC1FU1JDSDsKIAl9CiAKKyNpZiBkZWZpbmVkIChfX2hwcGFfXykgJiYgIWRlZmluZWQgKF9f
TFA2NF9fKSAmJiAoKF9fR05VQ19fID4gMykgfHwgKF9fR05VQ19fID09IDMgJiYgX19HTlVDX01J
Tk9SX18gPj0gMSkpCisJaWYgKHQtPnNpZy0+YWN0aW9uW3NpZy0xXS5zYS5zYV9oYW5kbGVyID09
ICh2b2lkICopU0lHX0lHTikKKyNlbHNlCiAJaWYgKHQtPnNpZy0+YWN0aW9uW3NpZy0xXS5zYS5z
YV9oYW5kbGVyID09IFNJR19JR04pCisjZW5kaWYKIAkJdC0+c2lnLT5hY3Rpb25bc2lnLTFdLnNh
LnNhX2hhbmRsZXIgPSBTSUdfREZMOwogCXNpZ2RlbHNldCgmdC0+YmxvY2tlZCwgc2lnKTsKIAly
ZWNhbGNfc2lncGVuZGluZyh0KTsKQEAgLTEwOTQsOCArMTEwMiwxMyBAQAogCQkgKiB0aGUgc2ln
bmFsIHRvIGJlIGlnbm9yZWQuCiAJCSAqLwogCisjaWYgZGVmaW5lZCAoX19ocHBhX18pICYmICFk
ZWZpbmVkIChfX0xQNjRfXykgJiYgKChfX0dOVUNfXyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYm
IF9fR05VQ19NSU5PUl9fID49IDEpKQorCQlpZiAoay0+c2Euc2FfaGFuZGxlciA9PSAodm9pZCAq
KVNJR19JR04KKwkJICAgIHx8IChrLT5zYS5zYV9oYW5kbGVyID09ICh2b2lkICopU0lHX0RGTAor
I2Vsc2UKIAkJaWYgKGstPnNhLnNhX2hhbmRsZXIgPT0gU0lHX0lHTgogCQkgICAgfHwg
KGstPnNhLnNhX2hhbmRsZXIgPT0gU0lHX0RGTAorI2VuZGlmCiAJCQkmJiAoc2lnID09IFNJR0NP
TlQgfHwKIAkJCSAgICBzaWcgPT0gU0lHQ0hMRCB8fAogCQkJICAgIHNpZyA9PSBTSUdVUkcgfHwK
ZGlmZiAtTmF1ciBsaW51eC0yLjQuMjAtcGEzMi9uZXQvc3VucnBjL2NsbnQuYyBsaW51eC0yLjQu
MjAtcGEzMi1nY2MzMy9uZXQvc3VucnBjL2NsbnQuYwotLS0gbGludXgtMi40LjIwLXBhMzIvbmV0
L3N1bnJwYy9jbG50LmMJMjAwMy0wMy0yMSAxMDo0NjoyOC4wMDAwMDAwMDAgKzAxMDAKKysrIGxp
bnV4LTIuNC4yMC1wYTMyLWdjYzMzL25ldC9zdW5ycGMvY2xudC5jCTIwMDMtMDMtMjEgMTI6Mzg6
MDcuMDAwMDAwMDAwICswMTAwCkBAIC0yMDksOSArMjA5LDE3IEBACiAJLyogVHVybiBvZmYgdmFy
aW91cyBzaWduYWxzICovCiAJaWYgKGNsbnQtPmNsX2ludHIpIHsKIAkJc3RydWN0IGtfc2lnYWN0
aW9uICphY3Rpb24gPSBjdXJyZW50LT5zaWctPmFjdGlvbjsKKyNpZiBkZWZpbmVkIChfX2hwcGFf
XykgJiYgIWRlZmluZWQgKF9fTFA2NF9fKSAmJiAoKF9fR05VQ19fID4gMykgfHwgKF9fR05VQ19f
ID09IDMgJiYgX19HTlVDX01JTk9SX18gPj0gMSkpCisJCWlmIChhY3Rpb25bU0lHSU5ULTFdLnNh
LnNhX2hhbmRsZXIgPT0gKHZvaWQgKilTSUdfREZMKQorI2Vsc2UKIAkJaWYgKGFjdGlvbltTSUdJ
TlQtMV0uc2Euc2FfaGFuZGxlciA9PSBTSUdfREZMKQorI2VuZGlmCiAJCQlzaWdhbGxvdyB8PSBz
aWdtYXNrKFNJR0lOVCk7CisjaWYgZGVmaW5lZCAoX19ocHBhX18pICYmICFkZWZpbmVkIChfX0xQ
NjRfXykgJiYgKChfX0dOVUNfXyA+IDMpIHx8IChfX0dOVUNfXyA9PSAzICYmIF9fR05VQ19NSU5P
Ul9fID49IDEpKQorCQlpZiAoYWN0aW9uW1NJR1FVSVQtMV0uc2Euc2FfaGFuZGxlciA9PSAodm9p
ZCAqKVNJR19ERkwpCisjZWxzZQogCQlpZiAoYWN0aW9uW1NJR1FVSVQtMV0uc2Euc2FfaGFuZGxl
ciA9PSBTSUdfREZMKQorI2VuZGlmCiAJCQlzaWdhbGxvdyB8PSBzaWdtYXNrKFNJR1FVSVQpOwog
CX0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmY3VycmVudC0+c2lnbWFza19sb2NrLCBpcnFmbGFncyk7
Cg==

--========/3E689FC400004CD8/mail.tiscali.be--
