Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep02-mail.bloor.is.net.cable.rogers.com (fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 124DA4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 14:11:27 -0600 (MDT)
Received: from systemhalted ([24.112.227.174])
          by fep02-mail.bloor.is.net.cable.rogers.com
          (InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP
          id <20030519201112.HQIC4557.fep02-mail.bloor.is.net.cable.rogers.com@systemhalted>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 19 May 2003 16:11:12 -0400
Date: Mon, 19 May 2003 16:12:24 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030519201224.GB542@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4 and semtimedop - need kernel compat?
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

pa,

I think I'm leaving the "filling in" of this to Randolph :)
For now it provides enough functionality for glibc to build and be all
happy and merry. Wether we strictly need compat code for semtimedop is
uknown.

Comments appreciated before checkin.

Willy handed out the new syscall number 228 for semtimedop.

c.

Index: arch/parisc/kernel/sys_parisc.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/sys_parisc.c,v
retrieving revision 1.14
diff -u -p -r1.14 sys_parisc.c
--- arch/parisc/kernel/sys_parisc.c	23 Nov 2001 21:54:28 -0000	1.14
+++ arch/parisc/kernel/sys_parisc.c	19 May 2003 19:57:48 -0000
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
+++ arch/parisc/kernel/sys_parisc32.c	19 May 2003 19:57:48 -0000
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
+++ arch/parisc/kernel/syscall.S	19 May 2003 19:57:48 -0000
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
+++ include/asm-parisc/unistd.h	19 May 2003 19:57:50 -0000
@@ -702,6 +702,8 @@
 #define __NR_readahead          (__NR_Linux + 207)
 #define __NR_tkill              (__NR_Linux + 208)
 
+#define __NR_semtimedop         (__NR_Linux + 228)
+
 #define __NR_Linux_syscalls     208
 
 #define HPUX_GATEWAY_ADDR       0xC0000004
