Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0E2E482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jul 2003 08:24:11 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19ZtNO-0005ob-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 08 Jul 2003 10:23:26 -0400
Date: Tue, 8 Jul 2003 10:23:25 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030708142325.GA21709@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] compat code for semtimedop in 2.4?
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

malcontents,

Checking the dirtiness of my 2.4 tree has reminded that we need some
sort of compat for semtimedop? Since we don't have an IPC multiplexor
this function call from the glibc side (already written wrapper) calls
this syscall. The number was given out by willy, and matches the 2.5
number. Do we need compat code? *Sigh*

Comments welcome!

Cheers,
Carlos.

---

Index: arch/parisc/kernel/sys_parisc.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/sys_parisc.c,v
retrieving revision 1.14
diff -u -p -r1.14 sys_parisc.c
--- arch/parisc/kernel/sys_parisc.c	23 Nov 2001 21:54:28 -0000	1.14
+++ arch/parisc/kernel/sys_parisc.c	8 Jul 2003 14:17:36 -0000
@@ -256,3 +256,11 @@ int sys_shmctl_broken(int shmid, int cmd
 	return sys_shmctl (shmid, cmd, (struct shmid_ds *)buf);
 }
 
+/* 2.4 compat code required for IPC calls */
+asmlinkage long sys_semtimedop(int semid, struct sembuf *tsops,
+                                unsigned nsops, const struct timespec *timeout)
+{
+	/* FIXME: Need to implement compat? */
+	return -ENOSYS;
+}
+
Index: arch/parisc/kernel/sys_parisc32.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/sys_parisc32.c,v
retrieving revision 1.27
diff -u -p -r1.27 sys_parisc32.c
--- arch/parisc/kernel/sys_parisc32.c	14 Sep 2002 05:14:03 -0000	1.27
+++ arch/parisc/kernel/sys_parisc32.c	8 Jul 2003 14:17:36 -0000
@@ -3104,3 +3104,11 @@ asmlinkage long sys32_semctl_broken(int 
 	return sys_semctl (semid, semnum, cmd, arg);
 }
 
+/* 2.4 compat code required for IPC calls */
+asmlinkage long sys32_semtimedop(int semid, struct sembuf *tsops,
+				unsigned nsops, const struct timespec *timeout)
+{
+	/* FIXME: Possible 32/64 conversions required */
+	/* FIXME: Need to implement compat? */
+	return -ENOSYS;
+}
Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/syscall.S,v
retrieving revision 1.78
diff -u -p -r1.78 syscall.S
--- arch/parisc/kernel/syscall.S	4 Aug 2002 22:57:47 -0000	1.78
+++ arch/parisc/kernel/syscall.S	8 Jul 2003 14:17:36 -0000
@@ -604,8 +604,31 @@ sys_call_table:
 #endif
 	ENTRY_SAME(gettid)             
 	ENTRY_SAME(readahead)          
-	ENTRY_SAME(tkill)
+	ENTRY_SAME(tkill)		/* 208 */
 
+	/* COMPAT semtimedop call requires the same syscall number
+	across kernel versions. */
+	
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)		/* 210 */
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)		/* 220 */
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_SAME(ni_syscall)
+	ENTRY_DIFF(semtimedop)		/* 228 */
 .end
 
 	/* Make sure nothing else is placed on this page */
Index: include/asm-parisc/unistd.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/unistd.h,v
retrieving revision 1.26
diff -u -p -r1.26 unistd.h
--- include/asm-parisc/unistd.h	4 Aug 2002 22:59:52 -0000	1.26
+++ include/asm-parisc/unistd.h	8 Jul 2003 14:17:39 -0000
@@ -702,6 +702,8 @@
 #define __NR_readahead          (__NR_Linux + 207)
 #define __NR_tkill              (__NR_Linux + 208)
 
+#define __NR_semtimedop         (__NR_Linux + 228)
+
 #define __NR_Linux_syscalls     208
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
