From: Christoph Hellwig <hch@lst.de>
Subject: [parisc-linux] [RFC] parisc sys_ptrace prototype
Date: Mon, 19 Sep 2005 22:39:52 +0200
Message-ID: <20050919203952.GA19511@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: matthew@wil.cx
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

parisc has a different prototype for ptrace in that it passes the
pid as pid_t, not as long.  This doesn't matter on 32bit architectures
because both are 32bit, but it's different for 64bit kernel.

OTOH I've heard 64bit parisc userland is mostly non-existant so maybe
we could still fix this, greatly simplifying a later ptrace
consolidation.


Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: linux-2.6/arch/parisc/kernel/ptrace.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/ptrace.c	2005-09-18 13:46:52.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/ptrace.c	2005-09-19 22:37:07.000000000 +0200
@@ -78,7 +78,7 @@
 	pa_psw(child)->l = 0;
 }
 
-long sys_ptrace(long request, pid_t pid, long addr, long data)
+long sys_ptrace(long request, long pid, long addr, long data)
 {
 	struct task_struct *child;
 	long ret;
Index: linux-2.6/include/asm-parisc/unistd.h
===================================================================
--- linux-2.6.orig/include/asm-parisc/unistd.h	2005-09-18 13:47:39.000000000 +0200
+++ linux-2.6/include/asm-parisc/unistd.h	2005-09-19 22:37:22.000000000 +0200
@@ -1005,7 +1005,7 @@
 		struct pt_regs *regs);
 int sys_vfork(struct pt_regs *regs);
 int sys_pipe(int *fildes);
-long sys_ptrace(long request, pid_t pid, long addr, long data);
+long sys_ptrace(long request, long pid, long addr, long data);
 struct sigaction;
 asmlinkage long sys_rt_sigaction(int sig,
 				const struct sigaction __user *act,
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
