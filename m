Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8OI1Hq29853;
	Wed, 24 Sep 2003 14:01:17 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030924175431.D51BC49408B@palinux.hppa>
References: <20030924175431.D51BC49408B@palinux.hppa>
Content-Type: text/plain
Date: 24 Sep 2003 13:01:16 -0500
Message-Id: <1064426477.1781.8.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
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

On Wed, 2003-09-24 at 12:54, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	03/09/24 11:54:31
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: signal.c 
> 	include/asm-parisc: rt_sigframe.h 
> 
> Log message:
> Make signals work with ELF64 binaries
> 
> For those who want to try this at home, there's a mini test suite at
> http://www.parisc-linux.org/~jejb/64bit.tar.gz
> 
> NOTE: The signal handler has become really ugly.  However, since it's
> completely broken for context returns with ELF32 binaries on ELF64 kernels
> there didn't seem to be a lot of point making it nicer until we tackle that
> problem as well

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.10
diff -u -r1.10 signal.c
--- arch/parisc/kernel/signal.c	19 Sep 2003 01:03:56 -0000	1.10
+++ arch/parisc/kernel/signal.c	24 Sep 2003 17:50:48 -0000
@@ -26,6 +26,7 @@
 #include <linux/stddef.h>
 #include <linux/compat.h>
 #include <linux/elf.h>
+#include <linux/personality.h>
 #include <asm/ucontext.h>
 #include <asm/rt_sigframe.h>
 #include <asm/uaccess.h>
@@ -170,11 +171,17 @@
 	struct rt_sigframe *frame;
 	struct siginfo si;
 	sigset_t set;
-	unsigned long usp = regs->gr[30];
+	unsigned long usp = (regs->gr[30] & ~(0x01UL));
+	unsigned long sigframe_size = PARISC_RT_SIGFRAME_SIZE;
+#ifdef __LP64__
+	if(personality(current->personality) == PER_LINUX32)
+		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
+#endif
+
 
 	/* Unwind the user stack to get the rt_sigframe structure. */
 	frame = (struct rt_sigframe *)
-		(usp - PARISC_RT_SIGFRAME_SIZE);
+		(usp - sigframe_size);
 	DBG(("in sys_rt_sigreturn, frame is %p\n", frame));
 
 	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
@@ -276,11 +283,11 @@
 {
 	struct rt_sigframe *frame;
 	unsigned long rp, usp;
-	Elf32_Addr haddr;
+	unsigned long haddr, sigframe_size;
 	struct siginfo si;
 	int err = 0;
 
-	usp = regs->gr[30];
+	usp = (regs->gr[30] & ~(0x01UL));
 	frame = get_sigframe(ka, usp, sizeof(*frame));
 
 	DBG(("setup_rt_frame 1: frame %p info %p\n", frame, info));
@@ -325,25 +332,59 @@
 
 	haddr = A(ka->sa.sa_handler);
 	/* The sa_handler may be a pointer to a function descriptor */
-	if (haddr & PA_PLABEL_FDESC) {
-		Elf32_Fdesc fdesc;
-		Elf32_Fdesc *ufdesc = (Elf32_Fdesc *)A(haddr & ~3);
+#ifdef __LP64__
+	if(personality(current->personality) == PER_LINUX32) {
+#endif
+		if (haddr & PA_PLABEL_FDESC) {
+			Elf32_Fdesc fdesc;
+			Elf32_Fdesc *ufdesc = (Elf32_Fdesc *)A(haddr & ~3);
 
-		err = __copy_from_user(&fdesc, ufdesc, sizeof(fdesc));
+			err = __copy_from_user(&fdesc, ufdesc, sizeof(fdesc));
+
+			if (err)
+				goto give_sigsegv;
 
+			haddr = fdesc.addr;
+			regs->gr[19] = fdesc.gp;
+		}
+#ifdef __LP64__
+	} else {
+		Elf64_Fdesc fdesc;
+		Elf64_Fdesc *ufdesc = (Elf64_Fdesc *)A(haddr & ~3);
+		
+		err = __copy_from_user(&fdesc, ufdesc, sizeof(fdesc));
+		
 		if (err)
 			goto give_sigsegv;
-
+		
 		haddr = fdesc.addr;
 		regs->gr[19] = fdesc.gp;
+		DBG(("64 bit signal, exe=%#lx, r19=%#lx, in_syscall=%d\n",
+		     haddr, regs->gr[19], in_syscall));
 	}
+#endif
 
 	/* The syscall return path will create IAOQ values from r31.
 	 */
-	if (in_syscall)
+	sigframe_size = PARISC_RT_SIGFRAME_SIZE;
+#ifdef __LP64__
+	if(personality(current->personality) == PER_LINUX32)
+		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
+#endif
+	if (in_syscall) {
 		regs->gr[31] = haddr;
-	else {
-		regs->gr[0] = USER_PSW;
+#ifdef __LP64__
+		if(personality(current->personality) == PER_LINUX)
+			sigframe_size |= 1;
+#endif
+	} else {
+		unsigned long psw = USER_PSW;
+#ifdef __LP64__
+		if(personality(current->personality) == PER_LINUX)
+			psw |= PSW_W;
+#endif
+
+		regs->gr[0] = psw;
 		regs->iaoq[0] = haddr | 3;
 		regs->iaoq[1] = regs->iaoq[0] + 4;
 	}
@@ -352,11 +393,13 @@
 	regs->gr[26] = sig;               /* signal number */
 	regs->gr[25] = A(&frame->info); /* siginfo pointer */
 	regs->gr[24] = A(&frame->uc);   /* ucontext pointer */
+	
 	DBG(("making sigreturn frame: %#lx + %#x = %#lx\n",
-	       regs->gr[30], PARISC_RT_SIGFRAME_SIZE,
-	       regs->gr[30] + PARISC_RT_SIGFRAME_SIZE));
+	       regs->gr[30], sigframe_size,
+	       regs->gr[30] + sigframe_size));
 	/* Raise the user stack pointer to make a proper call frame. */
-	regs->gr[30] = (A(frame) + PARISC_RT_SIGFRAME_SIZE);
+	regs->gr[30] = (A(frame) + sigframe_size);
+
 
 	DBG(("SIG deliver (%s:%d): frame=0x%p sp=%#lx iaoq=%#lx/%#lx rp=%#lx\n",
 	       current->comm, current->pid, frame, regs->gr[30],
Index: include/asm-parisc/rt_sigframe.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/rt_sigframe.h,v
retrieving revision 1.1
diff -u -r1.1 rt_sigframe.h
--- include/asm-parisc/rt_sigframe.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/rt_sigframe.h	24 Sep 2003 17:51:16 -0000
@@ -13,7 +13,20 @@
  * which Linux/parisc uses is sp-20 for the saved return pointer...)
  * Then, the stack pointer must be rounded to a cache line (64 bytes).
  */
+#define SIGFRAME32		64
+#define FUNCTIONCALLFRAME32	48
+#define PARISC_RT_SIGFRAME_SIZE32					\
+	(((sizeof(struct rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
+
+#ifdef __LP64__
+#define	SIGFRAME		128
+#define FUNCTIONCALLFRAME	96
 #define PARISC_RT_SIGFRAME_SIZE					\
-	(((sizeof(struct rt_sigframe) + 48) + 63) & -64)
+	(((sizeof(struct rt_sigframe) + FUNCTIONCALLFRAME) + SIGFRAME) & -SIGFRAME)
+#else
+#define	SIGFRAME		SIGFRAME32
+#define FUNCTIONCALLFRAME	FUNCTIONCALLFRAME32
+#define PARISC_RT_SIGFRAME_SIZE	PARISC_RT_SIGFRAME_SIZE32
+#endif
 
 #endif
