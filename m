Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD90542DB.dip.t-dialin.net [217.5.66.219])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9618482C
	for <parisc-linux@parisc-linux.org>; Fri, 30 Nov 2001 15:14:42 -0700 (MST)
Date: Fri, 30 Nov 2001 23:12:43 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20011130231243.A3033@solo.franken.de>
References: <20011130051757.B10729@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011130051757.B10729@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Nov 30, 2001 at 05:17:57AM +0000
Subject: [parisc-linux] Re: fakeroot broken (by shm changes?)
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

On Fri, Nov 30, 2001 at 05:17:57AM +0000, Matthew Wilcox wrote:
> fakeroot's stopped working since upgrading to the new kernel, so i think
> the emulation of the old sysvipc mechanism may be broken.  this is
> on paer, running a 64-bit SMP kernel.  i suspect sysvipc rather than
> signals because fakeroot is a heavy user of sysvipc and exposed some
> kernel bugs before.

semctl (,,SETVAL,) is broken. Below is an untested fix, which is taken
from the old sys32_semctl. So this should fix the problem. Since I don't 
have enough time right now to test it, I'd appriciate if someone with a 
64bit machine (the bug doesn't affect 32bit) could test it. Sorry for 
missing that strange feature of our syscall path and the already existing
workaround for it.

Thomas.


Index: sys_parisc32.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/sys_parisc32.c,v
retrieving revision 1.24
diff -u -r1.24 sys_parisc32.c
--- sys_parisc32.c	2001/11/23 21:54:28	1.24
+++ sys_parisc32.c	2001/11/30 22:06:19
@@ -3040,3 +3040,20 @@
 	return sys_lseek(fd, offset, origin);
 }
 
+asmlinkage long sys32_semctl_broken(int semid, int semnum, int cmd, union semun arg)
+{
+        union semun u;
+	
+	cmd ~= IPC64; /* should be removed together with the _broken suffix */
+
+        if (cmd == SETVAL) {
+                /* Ugh.  arg is a union of int,ptr,ptr,ptr, so is 8 bytes.
+                 * The int should be in the first 4, but our argument
+                 * frobbing has left it in the last 4.
+                 */
+                u.val = *((int *)&arg + 1);
+                return sys_semctl (semid, semnum, cmd, u);
+	}
+	return sys_semctl (semid, semnum, cmd, arg);
+}
+
Index: syscall.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/syscall.S,v
retrieving revision 1.72
diff -u -r1.72 syscall.S
--- syscall.S	2001/11/23 21:54:28	1.72
+++ syscall.S	2001/11/30 22:00:53
@@ -577,7 +577,7 @@
 	ENTRY_DIFF(recvmsg)
 	ENTRY_SAME(semop)		/* 185 */
 	ENTRY_SAME(semget)
-	ENTRY_SAME(semctl_broken)
+	ENTRY_DIFF(semctl_broken)
 	ENTRY_DIFF(msgsnd)
 	ENTRY_DIFF(msgrcv)
 	ENTRY_SAME(msgget)		/* 190 */




-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
