Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AB334829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 10:36:32 -0700 (MST)
Message-Id: <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 12:36:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021111171255.GI8848@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 12:12:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Looks like we need some __asm format fixes?

These are the changes that I had for glibc-2.2.5-14 to build with gcc-3.3.
The string literal change makes the asms ugly but I think we have to live
with it.  I don't know the ins and outs of why the change was necessary
but I know the cpp people will not change back.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

--- ./sysdeps/hppa/elf/initfini.c.orig	2001-07-09 17:56:22.000000000 -0700
+++ ./sysdeps/hppa/elf/initfini.c	2002-09-11 12:58:18.000000000 -0700
@@ -39,84 +39,84 @@
    making the comparison and indirect call is quite expensive (see the
    comment in sysdeps/generic/initfini.c). */
 
-__asm__ ("
-
-#include \"defs.h\"
-
-/*@HEADER_ENDS*/
-
-/*@_init_PROLOG_BEGINS*/
-	.section .init
-	.align 4
-	.globl _init
-	.type _init,@function
-_init:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	bl	__gmon_start__,%rp
-	copy	%r19,%r4	/* delay slot */
-	copy	%r4,%r19
-/*@_init_PROLOG_ENDS*/
-
-/*@_init_EPILOG_BEGINS*/
-        .text
-        .align 4
-        .weak   __gmon_start__
-        .type    __gmon_start__,@function
-__gmon_start__:
-	.proc
-	.callinfo
-	.entry
-        bv,n %r0(%r2)
-	.exit
-	.procend
-
-/* Here is the tail end of _init.  We put __gmon_start before this so
-   that the assembler creates the .PARISC.unwind section for us, ie.
-   with the right attributes.  */
-	.section .init
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_init:
-	ldwm	-64(%sp),%r4
-
-/* Our very own unwind info, because the assembler can't handle
-   functions split into two or more pieces.  */
-	.section .PARISC.unwind
-	.extern _init
-	.word	_init, _end_init
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_init_EPILOG_ENDS*/
-
-/*@_fini_PROLOG_BEGINS*/
-	.section .fini
-	.align 4
-	.globl _fini
-	.type _fini,@function
-_fini:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	copy	%r19,%r4
-/*@_fini_PROLOG_ENDS*/
-
-/*@_fini_EPILOG_BEGINS*/
-	.section .fini
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_fini:
-	ldwm	-64(%sp),%r4
-
-	.section .PARISC.unwind
-	.extern _fini
-	.word	_fini, _end_fini
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_fini_EPILOG_ENDS*/
-
-/*@TRAILER_BEGINS*/
+__asm__ ("\n\
+\n\
+#include \"defs.h\"\n\
+\n\
+/*@HEADER_ENDS*/\n\
+\n\
+/*@_init_PROLOG_BEGINS*/\n\
+	.section .init\n\
+	.align 4\n\
+	.globl _init\n\
+	.type _init,@function\n\
+_init:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	bl	__gmon_start__,%rp\n\
+	copy	%r19,%r4	/* delay slot */\n\
+	copy	%r4,%r19\n\
+/*@_init_PROLOG_ENDS*/\n\
+\n\
+/*@_init_EPILOG_BEGINS*/\n\
+        .text\n\
+        .align 4\n\
+        .weak   __gmon_start__\n\
+        .type    __gmon_start__,@function\n\
+__gmon_start__:\n\
+	.proc\n\
+	.callinfo\n\
+	.entry\n\
+        bv,n %r0(%r2)\n\
+	.exit\n\
+	.procend\n\
+\n\
+/* Here is the tail end of _init.  We put __gmon_start before this so\n\
+   that the assembler creates the .PARISC.unwind section for us, ie.\n\
+   with the right attributes.  */\n\
+	.section .init\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_init:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+/* Our very own unwind info, because the assembler can't handle\n\
+   functions split into two or more pieces.  */\n\
+	.section .PARISC.unwind\n\
+	.extern _init\n\
+	.word	_init, _end_init\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_init_EPILOG_ENDS*/\n\
+\n\
+/*@_fini_PROLOG_BEGINS*/\n\
+	.section .fini\n\
+	.align 4\n\
+	.globl _fini\n\
+	.type _fini,@function\n\
+_fini:\n\
+	stw	%rp,-20(%sp)\n\
+	stwm	%r4,64(%sp)\n\
+	stw	%r19,-32(%sp)\n\
+	copy	%r19,%r4\n\
+/*@_fini_PROLOG_ENDS*/\n\
+\n\
+/*@_fini_EPILOG_BEGINS*/\n\
+	.section .fini\n\
+	ldw	-84(%sp),%rp\n\
+	copy	%r4,%r19\n\
+	bv	%r0(%rp)\n\
+_end_fini:\n\
+	ldwm	-64(%sp),%r4\n\
+\n\
+	.section .PARISC.unwind\n\
+	.extern _fini\n\
+	.word	_fini, _end_fini\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08\n\
+\n\
+/*@_fini_EPILOG_ENDS*/\n\
+\n\
+/*@TRAILER_BEGINS*/\n\
 ");
--- ./linuxthreads/internals.h.orig	2002-09-11 12:16:03.000000000 -0700
+++ ./linuxthreads/internals.h	2002-09-13 11:09:35.000000000 -0700
@@ -555,11 +555,11 @@
 /* Prototypes for compatibility functions.  */
 extern int __pthread_attr_init_2_1 (pthread_attr_t *__attr);
 extern int __pthread_attr_init_2_0 (pthread_attr_t *__attr);
-extern int __pthread_create_2_1 (pthread_t *__restrict __thread,
+extern int __pthread_create_2_1 (pthread_t *__restrict __thr,
 				 const pthread_attr_t *__attr,
 				 void *(*__start_routine) (void *),
 				 void *__restrict __arg);
-extern int __pthread_create_2_0 (pthread_t *__restrict thread,
+extern int __pthread_create_2_0 (pthread_t *__restrict __thr,
 				 const pthread_attr_t *__attr,
 				 void *(*__start_routine) (void *),
 				 void *__restrict arg);
--- ./linuxthreads/sysdeps/pthread/pthread.h.orig	2001-03-20 08:44:41.000000000 -0800
+++ ./linuxthreads/sysdeps/pthread/pthread.h	2002-09-11 12:38:24.000000000 -0700
@@ -160,7 +160,7 @@
 /* Create a thread with given attributes ATTR (or default attributes
    if ATTR is NULL), and call function START_ROUTINE with given
    arguments ARG.  */
-extern int pthread_create (pthread_t *__restrict __thread,
+extern int pthread_create (pthread_t *__restrict __thr,
 			   __const pthread_attr_t *__restrict __attr,
 			   void *(*__start_routine) (void *),
 			   void *__restrict __arg) __THROW;
@@ -588,7 +588,7 @@
 extern int pthread_setcanceltype (int __type, int *__oldtype) __THROW;
 
 /* Cancel THREAD immediately or at the next possibility.  */
-extern int pthread_cancel (pthread_t __thread) __THROW;
+extern int pthread_cancel (pthread_t __thr) __THROW;
 
 /* Test for pending cancellation for the current thread and terminate
    the thread as per pthread_exit(PTHREAD_CANCELED) if it has been
--- ./linuxthreads/sysdeps/unix/sysv/linux/bits/sigthread.h.orig	2000-09-11 10:32:02.000000000 -0700
+++ ./linuxthreads/sysdeps/unix/sysv/linux/bits/sigthread.h	2002-09-11 12:43:37.000000000 -0700
@@ -33,6 +33,6 @@
 			    __sigset_t *__restrict __oldmask)__THROW;
 
 /* Send signal SIGNO to the given thread. */
-extern int pthread_kill (pthread_t __thread, int __signo) __THROW;
+extern int pthread_kill (pthread_t __thr, int __signo) __THROW;
 
 #endif	/* bits/sigthread.h */
