Return-Path: <carlos@baldric.uwo.ca>
Received: from fep02-mail.bloor.is.net.cable.rogers.com
	(fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 016214843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 22:23:21 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep02-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040128052107.FPC100608.fep02-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 00:21:07 -0500
Date: Wed, 28 Jan 2004 00:23:42 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040128052341.GH12191@baldric.uwo.ca>
References: <20040128051247.D6C6C4941AA@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040128051247.D6C6C4941AA@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 10:12:47PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/01/27 22:12:47
> 
> Modified files:
> 	kernel         : signal.c compat_signal.c 
> 	include/linux  : compat_siginfo.h compat.h 
> 	include/asm-parisc: compat_ucontext.h compat_rt_sigframe.h 
> 	include/asm-generic: compat_signal.h 
> 
> Log message:
> Update the compat_siginfo_t framework.
> 

This patch is an update based on feedback from the linux-arch community.
Notably we add is_compat_task() and let the compiler optimize out the
code when CONFIG_COMPAT is not set. It also completes the changeover to
using include/linux/compat_siginfo.h instead of the asm-generic version,
which required that all arches add a compat_siginfo.h to their asm
directory.


Index: kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/signal.c,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -p -r1.10 -r1.11
--- kernel/signal.c	11 Dec 2003 00:48:55 -0000	1.10
+++ kernel/signal.c	28 Jan 2004 05:12:46 -0000	1.11
@@ -24,15 +24,11 @@
 #include <linux/binfmts.h>
 #include <linux/security.h>
 #include <linux/ptrace.h>
+#include <linux/compat_siginfo.h>
 #include <asm/param.h>
 #include <asm/uaccess.h>
 #include <asm/siginfo.h>
 
-#ifdef CONFIG_COMPAT
-#include <linux/personality.h>
-#include <asm/compat_siginfo.h>
-#endif
-
 /*
  * SLAB caches for signal bits.
  */
@@ -2011,12 +2007,11 @@ int copy_siginfo_to_user(siginfo_t __use
 	if (from->si_code < 0)
 		return __copy_to_user(to, from, sizeof(siginfo_t))
 			? -EFAULT : 0;
-# ifdef CONFIG_COMPAT
+	
 	/* Use compat_siginfo_t with 32-bit signals */
-	if(personality(current->personality) == PER_LINUX32){
+	if(is_compat_task(current)){
 		return compat_copy_siginfo_to_user((compat_siginfo_t __user *)to,from);
 	}
-# endif
 	
 	/*
 	 * If you change siginfo_t structure, please be sure
Index: kernel/compat_signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/compat_signal.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -p -r1.1 -r1.2
--- kernel/compat_signal.c	10 Dec 2003 22:37:50 -0000	1.1
+++ kernel/compat_signal.c	28 Jan 2004 05:12:46 -0000	1.2
@@ -4,7 +4,7 @@
  *  2003-12-20  Carlos O'Donell
  *              Copied linux/kernel/compat_signal.c (copy_siginfo_to_user)
  *              and modified to use compat_siginfo_t for thunking down to
- *              32-bit userspace with an ELF64 kernel.
+ *              32-bit userspace from a 64-bit kernel.
  *              
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -19,14 +19,12 @@
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
  *
  */
 
-/*#define __KERNEL_SYSCALLS__*/
-
+#include <linux/compat_siginfo.h>
 #include <asm/errno.h>
-#include <asm/compat_siginfo.h>
 #include <asm/uaccess.h>
 #include <asm/siginfo.h>
 
@@ -41,8 +39,8 @@ int compat_copy_siginfo_to_user(compat_s
 		return -EFAULT;
 	
 	/*
-	 * If you change siginfo_t structure, please be sure
-	 * this code is fixed accordingly.
+	 * If you change compat_siginfo_t structure *or* siginfo_t, 
+	 * please be sure this code is fixed accordingly.
 	 * It should never copy any pad contained in the structure
 	 * to avoid security leaks, but must copy the generic
 	 * 3 ints plus the relevant union member.
@@ -86,7 +84,7 @@ int compat_copy_siginfo_to_user(compat_s
 	case __SI_FAULT:
 		compat_from.si_addr = (compat_uptr_t)((u64)(from->si_addr) & 0xffffffffUL);
 		err |= __put_user(compat_from.si_addr, &to->si_addr);
-#ifdef __ARCH_SI_TRAPNO
+#ifdef __ARCH_SI_COMPAT_TRAPNO
 		compat_from.si_trapno = (compat_int_t)(from->si_addr);
 		err |= __put_user(compat_from.si_trapno, &to->si_trapno);
 #endif
Index: include/linux/compat_siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat_siginfo.h,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -p -r1.1 -r1.2
--- include/linux/compat_siginfo.h	26 Jan 2004 21:09:14 -0000	1.1
+++ include/linux/compat_siginfo.h	28 Jan 2004 05:12:46 -0000	1.2
@@ -6,18 +6,18 @@
 
 #ifndef CONFIG_COMPAT
 
-/* No compatibility layer required, add empty definitions
-   for the compiler */
+/* No compatibility layer required, add empty definitions for the compiler */
 
 typedef struct compat_siginfo{
 } compat_siginfo_t;
 
 static inline int compat_copy_siginfo_to_user(void *x, unsigned long y)
 {
-	return 0;
+	return -1;
 }
 
 #else
+
 #include <linux/compiler.h>
 #include <asm/siginfo.h>
 
@@ -166,3 +166,4 @@ extern int compat_copy_siginfo_to_user(c
 
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_GENERIC_COMPAT_SIGINFO_H */
+
Index: include/linux/compat.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat.h,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -p -r1.6 -r1.7
--- include/linux/compat.h	27 Jan 2004 22:02:36 -0000	1.6
+++ include/linux/compat.h	28 Jan 2004 05:12:46 -0000	1.7
@@ -6,15 +6,26 @@
  */
 #include <linux/config.h>
 
-#ifdef CONFIG_COMPAT
+#ifndef CONFIG_COMPAT
+
+/* Non-native task requiring compat... doesn't exist */
+#define is_compat_task(x) 0
+
+#else
 
 #include <linux/stat.h>
 #include <linux/param.h>	/* for HZ */
+#include <linux/personality.h>  /* Conditional process compat */
 #include <asm/compat.h>
 
 #define compat_jiffies_to_clock_t(x)	\
 		(((unsigned long)(x) * COMPAT_USER_HZ) / HZ)
 
+/* Non-native task requiring compat */
+#ifndef HAVE_ARCH_IS_COMPAT_TASK
+#define is_compat_task(x) (x->personality == PER_LINUX32)
+#endif
+	
 struct compat_itimerspec { 
 	struct compat_timespec it_interval;
 	struct compat_timespec it_value;
Index: include/asm-parisc/compat_ucontext.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/compat_ucontext.h,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -p -r1.1 -r1.2
--- include/asm-parisc/compat_ucontext.h	10 Dec 2003 22:37:10 -0000	1.1
+++ include/asm-parisc/compat_ucontext.h	28 Jan 2004 05:12:47 -0000	1.2
@@ -4,7 +4,7 @@
 #include<linux/compat.h>
 #include<asm/compat_signal.h>
 
-/* ELF32 ucontext as seen from an ELF64 kernel */
+/* 32-bit ucontext as seen from an 64-bit kernel */
 struct compat_ucontext {
 	compat_uint_t uc_flags;
 	compat_uptr_t uc_link;
Index: include/asm-parisc/compat_rt_sigframe.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/compat_rt_sigframe.h,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -p -r1.1 -r1.2
--- include/asm-parisc/compat_rt_sigframe.h	10 Dec 2003 22:36:09 -0000	1.1
+++ include/asm-parisc/compat_rt_sigframe.h	28 Jan 2004 05:12:47 -0000	1.2
@@ -1,5 +1,5 @@
 #include<linux/compat.h>
-#include<asm/compat_siginfo.h>
+#include<linux/compat_siginfo.h>
 #include<asm/compat_ucontext.h>
 
 #ifndef _ASM_PARISC_COMPAT_RT_SIGFRAME_H
Index: include/asm-generic/compat_signal.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-generic/compat_signal.h,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -p -r1.1 -r1.2
--- include/asm-generic/compat_signal.h	10 Dec 2003 22:35:48 -0000	1.1
+++ include/asm-generic/compat_signal.h	28 Jan 2004 05:12:47 -0000	1.2
@@ -1,8 +1,8 @@
 #ifndef _ASM_GENERIC_COMPAT_SIGNAL_H
 #define _ASM_GENERIC_COMPAT_SIGNAL_H
 
-# ifndef __ASSEMBLY__
-#  include <linux/types.h>
+#ifndef __ASSEMBLY__
+#include <linux/compat.h>
 
 typedef compat_uptr_t compat_sighandler_t;
 
@@ -12,8 +12,6 @@ typedef struct compat_sigaltstack {
 	compat_size_t ss_size;
 } compat_stack_t;
 
-#  ifdef __KERNEL__
-
 /* Most things should be clean enough to redefine this at will, if care
    is taken to make libc match.  */
 
@@ -23,6 +21,5 @@ struct compat_sigaction {
 	compat_sigset_t sa_mask;		/* mask last for extensibility */
 };
 
-#  endif /* __KERNEL__ */
-# endif /* !__ASSEMBLY */
-#endif /* _ASM_GENERIC_COMPAT_SIGNAL_H */
+#endif /* !__ASSEMBLY__ */
+#endif /* !_ASM_GENERIC_COMPAT_SIGNAL_H */
