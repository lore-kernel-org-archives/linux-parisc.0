Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15D594A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 21:46:37 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id E4CED308
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 23:46:14 -0500 (EST)
Received: from chrysl (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 09E635A967
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 21:46:13 -0700 (MST)
Received: from willy by chrysl with local (Exim 3.12 #1 (Debian))
	id 14WA7R-0004qy-00
	for <parisc-linux@parisc-linux.org>; Thu, 22 Feb 2001 21:46:13 -0700
To: parisc-linux@parisc-linux.org
Message-Id: <E14WA7R-0004qy-00@chrysl>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Thu, 22 Feb 2001 21:46:13 -0700
Subject: [parisc-linux] [PATCH] Fix HPUX fork
List-ID: <linux-parisc.vger.kernel.org>

jsm pointed out I'd broken HPUX fork recently.  This fix is untested
(except that it builds), but if it's wrong it does at least point the
way.  I don't know if we want to enable STICKY_TIMEOUTS or some other
bugs for PER_HPUX, but they weren't enabled for SOM processes before,
so I haven't enabled them now.

Index: arch/parisc/hpux/entry_hpux.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hpux/entry_hpux.S,v
retrieving revision 1.14
diff -u -p -r1.14 entry_hpux.S
--- entry_hpux.S	2000/07/18 03:14:26	1.14
+++ entry_hpux.S	2001/02/23 04:35:17
@@ -1,17 +1,13 @@
-/* -----------------------------------------------------------------------------
+/*
  *
- * Native PARISC/Linux Project (http://www.puffingroup.com/parisc)
+ * PARISC/Linux Project (http://www.parisc-linux.org/)
  *
  * modified by Matthew Wilcox <willy@bofh.ai> 1999-07-26
  */
 
-
-#define ASSEMBLY
-
 #include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/unistd.h>
-
 
 	.text
 
Index: arch/parisc/hpux/wrappers.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hpux/wrappers.S,v
retrieving revision 1.12
diff -u -p -r1.12 wrappers.S
--- wrappers.S	2001/01/28 13:39:13	1.12
+++ wrappers.S	2001/02/23 04:35:17
@@ -1,5 +1,5 @@
-/*------------------------------------------------------------------------------
- * Native PARISC/Linux Project (http://www.puffingroup.com/parisc)
+/*
+ * PARISC/Linux Project (http://www.parisc-linux.org/)
  *
  * HP-UX System Call Wrapper routines and System Call Return Path
  *
@@ -80,6 +80,7 @@
 
 
 	.export hpux_fork_wrapper
+	.export hpux_child_return
 	.import sys_fork
 
 hpux_fork_wrapper:
@@ -90,10 +91,7 @@ hpux_fork_wrapper:
 	stw	%r2,-20(%r30)
 	ldo	64(%r30),%r30
 	stw	%r2,PT_GR19(%r1)	;! save for child
-	stw	%r30,PT_GR20(%r1)	;! save for child
-	ldil	L%child_return,%r3
-	ldo	R%child_return(%r3),%r3
-	stw	%r3,PT_GR21(%r1)	;! save for child
+	stw	%r30,PT_GR21(%r1)	;! save for child
 
 	ldw	TASK_PT_GR30(%r1),%r25
 	copy	%r1,%r24
@@ -129,7 +127,7 @@ fork_exit:
 
 	/* Set the return value for the child */
 
-child_return:
+hpux_child_return:
 	ldw TASK_PT_GR19-TASK_SZ_ALGN-128(%r30),%r2
 	b fork_return
 	copy %r0,%r28
Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.32
diff -u -p -r1.32 process.c
--- process.c	2001/02/23 01:08:42	1.32
+++ process.c	2001/02/23 04:35:17
@@ -223,6 +223,7 @@ copy_thread(int nr, unsigned long clone_
 	 * function pointers aren't a pointer to the function on 64-bit */
 	extern void *ret_from_kernel_thread;
 	extern void *child_return;
+	extern void *hpux_child_return;
 
 	*cregs = *pregs;
 
@@ -262,8 +263,12 @@ copy_thread(int nr, unsigned long clone_
 		/* Use same stack depth as parent */
 		cregs->ksp = ((unsigned long)(p))
 			+ (pregs->gr[21] & (INIT_TASK_SIZE - 1));
-		cregs->kpc = &child_return;
 		cregs->gr[30] = usp;
+		if (p->personality == PER_HPUX) {
+			cregs->kpc = &hpux_child_return;
+		} else {
+			cregs->kpc = &child_return;
+		}
 	}
 
 	return 0;
Index: fs/binfmt_som.c
===================================================================
RCS file: /home/cvs/parisc/linux/fs/binfmt_som.c,v
retrieving revision 1.14
diff -u -p -r1.14 binfmt_som.c
--- binfmt_som.c	2000/12/19 23:56:51	1.14
+++ binfmt_som.c	2001/02/23 04:35:17
@@ -228,7 +228,7 @@ do_load_som_binary(struct linux_binprm *
 
 	/* OK, This is the point of no return */
 	current->flags &= ~PF_FORKNOEXEC;
-	current->personality = PER_LINUX; /* I suspect we want a PER_HPUX */
+	current->personality = PER_HPUX;
 
 	retval = map_som_binary(bprm->file, hpuxhdr);
 	if (retval < 0)
Index: include/linux/personality.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/linux/personality.h,v
retrieving revision 1.3
diff -u -p -r1.3 personality.h
--- personality.h	2000/05/26 16:03:05	1.3
+++ personality.h	2001/02/23 04:35:18
@@ -25,11 +25,12 @@
 #define PER_SUNOS		(PER_BSD | STICKY_TIMEOUTS)
 #define PER_XENIX		(0x0007 | STICKY_TIMEOUTS)
 #define PER_LINUX32		(0x0008)
-#define PER_IRIX32              (0x0009 | STICKY_TIMEOUTS) /* IRIX5 32-bit     */
-#define PER_IRIXN32             (0x000a | STICKY_TIMEOUTS) /* IRIX6 new 32-bit */
-#define PER_IRIX64              (0x000b | STICKY_TIMEOUTS) /* IRIX6 64-bit     */
+#define PER_IRIX32		(0x0009 | STICKY_TIMEOUTS) /* IRIX5 32-bit     */
+#define PER_IRIXN32		(0x000a | STICKY_TIMEOUTS) /* IRIX6 new 32-bit */
+#define PER_IRIX64		(0x000b | STICKY_TIMEOUTS) /* IRIX6 64-bit     */
 #define PER_RISCOS		(0x000c)
 #define PER_SOLARIS		(0x000d | STICKY_TIMEOUTS)
+#define PER_HPUX		(0x000e)
 
 /* Prototype for an lcall7 syscall handler. */
 typedef void (*lcall7_func)(int, struct pt_regs *);
