Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B39E54840
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 00:27:46 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1ARRKB-0001pp-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 03 Dec 2003 02:21:27 -0500
Date: Wed, 3 Dec 2003 02:21:26 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031203072126.GB5828@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] ELF32 userspace, ELF64 kernel, and 32-bit signals on hppa. (help needed)
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

parisc,

*** Help needed, code broken ...  ***

Currently our siginfo_t and ucontext_t structures delivered to an ELF32
userspace from an ELF64 kernel are not correct. The kernel thinking
userspace is the same bitwidth, writes it's registers and values as
64-bits. Architectures like sparc64 and ppc64 have rolled their own
solutions. I wanted to make it a little more generic.

jejb,

Thanks for the initial cleanup and poking me in the right direction!
I promised this out a little while back, but as a good hacker I'm up too
late to be thinking straight and get the patch out the door.

What does the patch do?
- Add siginfo_t generic compat structure and code to write it to
  userspace.
- Add generic compat signal structures.
- Add generic kernel code to handle this structure.
- Add lots more PARISC compat structures.
- Add code in our signal path to distinguish the process personality and
  learn to setup/restore a 32-bit/64-bit rt frame structure.

There is a bug hiding in the code... I can't find it yet.
Userspace sorta works, but sometimes processes go splat, and I think it
has to do with the following:

- In restore_context32 I have to ship the 32-bit value into a 64-bit
  registers. Should it be sign extended?
= I think yes.
- Is stack address 0xfffffffffaf00410 the same as 0x00000000faf00410?
= No?

What to do?

- Enable debugging in singal.c and signal32.c and keep looking for the
  bug :)

Cheers,
Carlos.

====
 arch/parisc/kernel/signal.c             |  277 +++++++++++++++------------
 arch/parisc/kernel/signal32.c           |  156 +++++++++++++--
 arch/parisc/kernel/signal32.h           |   22 ++
 include/asm-generic/compat_siginfo.h    |  154 +++++++++++++++
 include/asm-generic/compat_signal.h     |   28 ++
 include/asm-parisc/compat.h             |   10
 include/asm-parisc/compat_rt_sigframe.h |   25 ++
 include/asm-parisc/compat_siginfo.h     |    2
 include/asm-parisc/compat_signal.h      |    2
 include/asm-parisc/compat_ucontext.h    |   19 +
 include/asm-parisc/rt_sigframe.h        |   13 -
 include/asm-parisc/siginfo.h            |    2
 include/asm-parisc/ucontext.h           |    8
 kernel/Makefile                         |    2
 kernel/compat_signal.c                  |  126 ++++++++++++
 kernel/signal.c                         |    8
 16 files changed, 709 insertions(+), 145 deletions(-)
====
--- arch/parisc/kernel/signal.c	9 Nov 2003 18:57:46 -0000	1.14
+++ arch/parisc/kernel/signal.c	3 Dec 2003 06:49:32 -0000
@@ -27,19 +27,25 @@
 #include <linux/compat.h>
 #include <linux/elf.h>
 #include <linux/personality.h>
+#include <linux/compat.h>
 #include <asm/ucontext.h>
 #include <asm/rt_sigframe.h>
 #include <asm/uaccess.h>
 #include <asm/pgalloc.h>
 #include <asm/cacheflush.h>
+#include "signal32.h"
 
-#define DEBUG_SIG 0
+#define DEBUG_SIG 0 
+#define DEBUG_SIG_LEVEL 2
 
 #if DEBUG_SIG
-#define DBG(x)	printk x
+#define DBG(LEVEL, ...) \
+        ((DEBUG_SIG_LEVEL >= LEVEL) \
+	? printk(__VA_ARGS__) : (void) 0)
 #else
-#define DBG(x)
+#define DBG(LEVEL, ...)
 #endif
+	
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
@@ -52,43 +58,6 @@
 
 int do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall);
 
-int copy_siginfo_to_user(siginfo_t *to, siginfo_t *from)
-{
-	if (from->si_code < 0)
-		return __copy_to_user(to, from, sizeof(siginfo_t));
-	else {
-		int err;
-
-		/*
-		 * If you change siginfo_t structure, please be sure
-		 * this code is fixed accordingly.  It should never
-		 * copy any pad contained in the structure to avoid
-		 * security leaks, but must copy the generic 3 ints
-		 * plus the relevant union member.
-		 */
-		err = __put_user(from->si_signo, &to->si_signo);
-		err |= __put_user(from->si_errno, &to->si_errno);
-		err |= __put_user((short)from->si_code, &to->si_code);
-		switch (from->si_code >> 16) {
-		      case __SI_FAULT >> 16:
-			/* FIXME: should we put the interruption code here? */
-		      case __SI_POLL >> 16:
-			err |= __put_user((unsigned long)from->si_addr, &to->si_addr);
-			break;
-		      case __SI_CHLD >> 16:
-			err |= __put_user(from->si_utime, &to->si_utime);
-			err |= __put_user(from->si_stime, &to->si_stime);
-			err |= __put_user(from->si_status, &to->si_status);
-		      default:
-			err |= __put_user(from->si_uid, &to->si_uid);
-			err |= __put_user(from->si_pid, &to->si_pid);
-			break;
-		      /* case __SI_RT: This is not generated by the kernel as of now.  */
-		}
-		return err;
-	}
-}
-
 /*
  * Atomically swap in the new signal mask, and wait for a signal.
  */
@@ -101,26 +70,27 @@ sys_rt_sigsuspend(sigset_t *unewset, siz
 {
 	sigset_t saveset, newset;
 #ifdef __LP64__
-	/* XXX FIXME -- assumes 32-bit user app! */
 	compat_sigset_t newset32;
 
-	/* XXX: Don't preclude handling different sized sigset_t's.  */
-	if (sigsetsize != sizeof(compat_sigset_t))
-		return -EINVAL;
-
-	if (copy_from_user(&newset32, (compat_sigset_t *)unewset, sizeof(newset32)))
-		return -EFAULT;
-
-	newset.sig[0] = newset32.sig[0] | ((unsigned long)newset32.sig[1] << 32);
-#else
-
-	/* XXX: Don't preclude handling different sized sigset_t's.  */
-	if (sigsetsize != sizeof(sigset_t))
-		return -EINVAL;
-
-	if (copy_from_user(&newset, unewset, sizeof(newset)))
-		return -EFAULT;
+	if(personality(current->personality) == PER_LINUX32){
+		/* XXX: Don't preclude handling different sized sigset_t's.  */
+		if (sigsetsize != sizeof(compat_sigset_t))
+			return -EINVAL;
+		if (copy_from_user(&newset32, (compat_sigset_t *)unewset, sizeof(newset32)))
+			return -EFAULT;
+		sigset_32to64(&newset,&newset32);
+		
+	} else 
 #endif
+	{
+		/* XXX: Don't preclude handling different sized sigset_t's.  */
+		if (sigsetsize != sizeof(sigset_t))
+			return -EINVAL;
+	
+		if (copy_from_user(&newset, unewset, sizeof(newset)))
+			return -EFAULT;
+	}
+
 	sigdelsetmask(&newset, ~_BLOCKABLE);
 
 	spin_lock_irq(&current->sighand->siglock);
@@ -161,7 +131,9 @@ restore_sigcontext(struct sigcontext *sc
 	err |= __copy_from_user(regs->iaoq, sc->sc_iaoq, sizeof(regs->iaoq));
 	err |= __copy_from_user(regs->iasq, sc->sc_iasq, sizeof(regs->iasq));
 	err |= __get_user(regs->sar, &sc->sc_sar);
-	DBG(("restore_sigcontext: r28 is %ld\n", regs->gr[28]));
+	DBG(2,"restore_sigcontext: iaoq is 0x%#lx / 0x%#lx\n", 
+			regs->iaoq[0],regs->iaoq[1]);
+	DBG(2,"restore_sigcontext: r28 is %ld\n", regs->gr[28]);
 	return err;
 }
 
@@ -174,6 +146,9 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	unsigned long usp = (regs->gr[30] & ~(0x01UL));
 	unsigned long sigframe_size = PARISC_RT_SIGFRAME_SIZE;
 #ifdef __LP64__
+	compat_sigset_t compat_set;
+	struct compat_rt_sigframe * compat_frame;
+	
 	if(personality(current->personality) == PER_LINUX32)
 		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
 #endif
@@ -182,11 +157,23 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	/* Unwind the user stack to get the rt_sigframe structure. */
 	frame = (struct rt_sigframe *)
 		(usp - sigframe_size);
-	DBG(("in sys_rt_sigreturn, frame is %p\n", frame));
-
-	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
-		goto give_sigsegv;
+	DBG(2,"sys_rt_sigreturn: frame is %p\n", frame);
 
+#ifdef __LP64__
+	compat_frame = (struct compat_rt_sigframe *)frame;
+	
+	if(personality(current->personality) == PER_LINUX32){
+		DBG(2,"sys_rt_sigreturn: ELF32 process.\n");
+		if (__copy_from_user(&compat_set, &compat_frame->uc.uc_sigmask, sizeof(compat_set)))
+			goto give_sigsegv;
+		sigset_32to64(&set,&compat_set);
+	} else
+#endif
+	{
+		if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
+			goto give_sigsegv;
+	}
+		
 	sigdelsetmask(&set, ~_BLOCKABLE);
 	spin_lock_irq(&current->sighand->siglock);
 	current->blocked = set;
@@ -194,17 +181,30 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	spin_unlock_irq(&current->sighand->siglock);
 
 	/* Good thing we saved the old gr[30], eh? */
-	if (restore_sigcontext(&frame->uc.uc_mcontext, regs))
-		goto give_sigsegv;
-
-	DBG(("usp: %#08lx stack %p", usp, &frame->uc.uc_stack));
+#ifdef __LP64__
+	if(personality(current->personality) == PER_LINUX32){
+		DBG(1,"sys_rt_sigreturn: compat_frame->uc.uc_mcontext 0x%p\n",
+				&compat_frame->uc.uc_mcontext);
+		if (restore_sigcontext32(&compat_frame->uc.uc_mcontext, regs))
+			goto give_sigsegv;
+		DBG(1,"sys_rt_sigreturn: usp %#08lx stack 0x%p\n", 
+				usp, &compat_frame->uc.uc_stack);
+		if (do_sigaltstack32(&compat_frame->uc.uc_stack, NULL, usp) == -EFAULT)
+			goto give_sigsegv;
+	} else
+#endif
+	{
+		DBG(1,"sys_rt_sigreturn: frame->uc.uc_mcontext 0x%p\n",
+				&frame->uc.uc_mcontext);
+		if (restore_sigcontext(&frame->uc.uc_mcontext, regs))
+			goto give_sigsegv;
+		DBG(1,"sys_rt_sigreturn: usp %#08lx stack 0x%p\n", 
+				usp, &frame->uc.uc_stack);
+		if (do_sigaltstack(&frame->uc.uc_stack, NULL, usp) == -EFAULT)
+			goto give_sigsegv;
+	}
+		
 
-	/* I don't know why everyone else assumes they can call this
-           with a pointer to a stack_t on the kernel stack.  That
-           makes no sense.  Anyway we'll do it like m68k, since we
-           also are using segmentation in the same way as them. */
-	if (do_sigaltstack(&frame->uc.uc_stack, NULL, usp) == -EFAULT)
-		goto give_sigsegv;
 
 	/* If we are on the syscall path IAOQ will not be restored, and
 	 * if we are on the interrupt path we must not corrupt gr31.
@@ -212,14 +212,13 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	if (in_syscall)
 		regs->gr[31] = regs->iaoq[0];
 #if DEBUG_SIG
-	DBG(("returning to %#lx\n", regs->iaoq[0]));
-	DBG(("in sys_rt_sigreturn:\n"));
+	DBG(1,"sys_rt_sigreturn: returning to %#lx, DUMPING REGS:\n", regs->iaoq[0]);
 	show_regs(regs);
 #endif
 	return;
 
 give_sigsegv:
-	DBG(("sys_rt_sigreturn sending SIGSEGV\n"));
+	DBG(1,"sys_rt_sigreturn: Sending SIGSEGV\n");
 	si.si_signo = SIGSEGV;
 	si.si_errno = 0;
 	si.si_code = SI_KERNEL;
@@ -237,9 +236,16 @@ give_sigsegv:
 static inline void *
 get_sigframe(struct k_sigaction *ka, unsigned long sp, size_t frame_size)
 {
+	/*FIXME: ELF32 vs. ELF64 has different frame_size, but since we
+	  don't use the parameter it doesn't matter */
+
+	DBG(1,"get_sigframe: ka = %#lx, sp = %#lx, frame_size = %#lx\n",
+			(unsigned long)ka, sp, frame_size);
+	
 	if ((ka->sa.sa_flags & SA_ONSTACK) != 0 && ! on_sig_stack(sp))
 		sp = current->sas_ss_sp; /* Stacks grow up! */
 
+	DBG(1,"get_sigframe: Returning sp = %#lx\n", (unsigned long)sp);
 	return (void *) sp; /* Stacks grow up.  Fun. */
 }
 
@@ -259,20 +265,20 @@ setup_sigcontext(struct sigcontext *sc, 
 		err |= __put_user(regs->gr[31]+4, &sc->sc_iaoq[1]);
 		err |= __put_user(regs->sr[3], &sc->sc_iasq[0]);
 		err |= __put_user(regs->sr[3], &sc->sc_iasq[1]);
-		DBG(("setup_sigcontext: iaoq %#lx/%#lx\n",
-			regs->gr[31], regs->gr[31]));
+		DBG(1,"setup_sigcontext: iaoq %#lx / %#lx (in syscall)\n",
+			regs->gr[31], regs->gr[31]+4);
 	} else {
 		err |= __copy_to_user(sc->sc_iaoq, regs->iaoq, sizeof(regs->iaoq));
 		err |= __copy_to_user(sc->sc_iasq, regs->iasq, sizeof(regs->iasq));
-		DBG(("setup_sigcontext: iaoq %#lx/%#lx\n", 
-			regs->iaoq[0], regs->iaoq[1]));
+		DBG(1,"setup_sigcontext: iaoq %#lx / %#lx (not in syscall)\n", 
+			regs->iaoq[0], regs->iaoq[1]);
 	}
 
 	err |= __put_user(flags, &sc->sc_flags);
 	err |= __copy_to_user(sc->sc_gr, regs->gr, sizeof(regs->gr));
 	err |= __copy_to_user(sc->sc_fr, regs->fr, sizeof(regs->fr));
 	err |= __put_user(regs->sar, &sc->sc_sar);
-	DBG(("setup_sigcontext: r28 is %ld\n", regs->gr[28]));
+	DBG(1,"setup_sigcontext: r28 is %ld\n", regs->gr[28]);
 
 	return err;
 }
@@ -286,19 +292,53 @@ setup_rt_frame(int sig, struct k_sigacti
 	unsigned long haddr, sigframe_size;
 	struct siginfo si;
 	int err = 0;
-
+#ifdef __LP64__
+	compat_int_t compat_val;
+	struct compat_rt_sigframe * compat_frame;
+	compat_sigset_t compat_set;
+#endif
+	
 	usp = (regs->gr[30] & ~(0x01UL));
+	/*FIXME: frame_size parameter is unused, remove it. */
 	frame = get_sigframe(ka, usp, sizeof(*frame));
 
-	DBG(("setup_rt_frame 1: frame %p info %p\n", frame, info));
+	DBG(1,"setup_rt_frame: frame %p info %p\n", frame, info);
 
-	err |= __copy_to_user(&frame->info, info, sizeof(siginfo_t));
-	err |= __put_user(current->sas_ss_sp, &frame->uc.uc_stack.ss_sp);
-	err |= __put_user(current->sas_ss_size, &frame->uc.uc_stack.ss_size);
-	err |= __put_user(sas_ss_flags(regs->gr[30]),
-			  &frame->uc.uc_stack.ss_flags);
-	err |= setup_sigcontext(&frame->uc.uc_mcontext, regs, in_syscall);
-	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
+	
+#ifdef __LP64__
+
+	compat_frame = (struct compat_rt_sigframe *)frame;
+	
+	if(personality(current->personality) == PER_LINUX32) {
+		DBG(1,"setup_rt_frame: frame->info = 0x%p\n", &compat_frame->info);
+		err |= compat_copy_siginfo_to_user(&compat_frame->info, info);
+		compat_val = (compat_int_t)current->sas_ss_sp;
+		err |= __put_user(compat_val, &compat_frame->uc.uc_stack.ss_sp);
+		compat_val = (compat_int_t)current->sas_ss_size;
+		err |= __put_user(compat_val, &compat_frame->uc.uc_stack.ss_size);
+		compat_val = sas_ss_flags(regs->gr[30]);		
+		err |= __put_user(compat_val, &compat_frame->uc.uc_stack.ss_flags);		
+		DBG(1,"setup_rt_frame: frame->uc = 0x%p\n", &compat_frame->uc);
+		DBG(1,"setup_rt_frame: frame->uc.uc_mcontext = 0x%p\n", &compat_frame->uc.uc_mcontext);
+		err |= setup_sigcontext32(&compat_frame->uc.uc_mcontext, regs, in_syscall);
+		sigset_64to32(&compat_set,set);
+		err |= __copy_to_user(&compat_frame->uc.uc_sigmask, &compat_set, sizeof(compat_set));
+	} else
+#endif
+	{	
+		DBG(1,"setup_rt_frame: frame->info = 0x%p\n", &frame->info);
+		err |= copy_siginfo_to_user(&frame->info, info);
+		err |= __put_user(current->sas_ss_sp, &frame->uc.uc_stack.ss_sp);
+		err |= __put_user(current->sas_ss_size, &frame->uc.uc_stack.ss_size);
+		err |= __put_user(sas_ss_flags(regs->gr[30]),
+				  &frame->uc.uc_stack.ss_flags);
+		DBG(1,"setup_rt_frame: frame->uc = 0x%p\n", &frame->uc);
+		DBG(1,"setup_rt_frame: frame->uc.uc_mcontext = 0x%p\n", &frame->uc.uc_mcontext);
+		err |= setup_sigcontext(&frame->uc.uc_mcontext, regs, in_syscall);
+		/* FIXME: Should probably be converted aswell for the compat case */
+		err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
+	}
+	
 	if (err)
 		goto give_sigsegv;
 
@@ -315,8 +355,8 @@ setup_rt_frame(int sig, struct k_sigacti
 	{
 		int sid;
 		asm ("mfsp %%sr3,%0" : "=r" (sid));
-		DBG(("flushing 64 bytes at space %#x offset %p\n",
-		       sid, frame->tramp));
+		DBG(1,"setup_rt_frame: Flushing 64 bytes at space %#x offset %p\n",
+		       sid, frame->tramp);
 	}
 #endif
 
@@ -359,8 +399,8 @@ setup_rt_frame(int sig, struct k_sigacti
 		
 		haddr = fdesc.addr;
 		regs->gr[19] = fdesc.gp;
-		DBG(("64 bit signal, exe=%#lx, r19=%#lx, in_syscall=%d\n",
-		     haddr, regs->gr[19], in_syscall));
+		DBG(1,"setup_rt_frame: 64 bit signal, exe=%#lx, r19=%#lx, in_syscall=%d\n",
+		     haddr, regs->gr[19], in_syscall);
 	}
 #endif
 
@@ -391,24 +431,33 @@ setup_rt_frame(int sig, struct k_sigacti
 
 	regs->gr[2]  = rp;                /* userland return pointer */
 	regs->gr[26] = sig;               /* signal number */
-	regs->gr[25] = A(&frame->info); /* siginfo pointer */
-	regs->gr[24] = A(&frame->uc);   /* ucontext pointer */
 	
-	DBG(("making sigreturn frame: %#lx + %#x = %#lx\n",
+#ifdef __LP64__
+	if(personality(current->personality) == PER_LINUX32){
+		regs->gr[25] = A(&compat_frame->info); /* siginfo pointer */
+		regs->gr[24] = A(&compat_frame->uc);   /* ucontext pointer */
+	} else
+#endif
+	{		
+		regs->gr[25] = A(&frame->info); /* siginfo pointer */
+		regs->gr[24] = A(&frame->uc);   /* ucontext pointer */
+	}
+	
+	DBG(1,"setup_rt_frame: making sigreturn frame: %#lx + %#lx = %#lx\n",
 	       regs->gr[30], sigframe_size,
-	       regs->gr[30] + sigframe_size));
+	       regs->gr[30] + sigframe_size);
 	/* Raise the user stack pointer to make a proper call frame. */
 	regs->gr[30] = (A(frame) + sigframe_size);
 
 
-	DBG(("SIG deliver (%s:%d): frame=0x%p sp=%#lx iaoq=%#lx/%#lx rp=%#lx\n",
+	DBG(1,"setup_rt_frame: sig deliver (%s,%d) frame=0x%p sp=%#lx iaoq=%#lx/%#lx rp=%#lx\n",
 	       current->comm, current->pid, frame, regs->gr[30],
-	       regs->iaoq[0], regs->iaoq[1], rp));
+	       regs->iaoq[0], regs->iaoq[1], rp);
 
 	return 1;
 
 give_sigsegv:
-	DBG(("setup_rt_frame sending SIGSEGV\n"));
+	DBG(1,"setup_rt_frame: sending SIGSEGV\n");
 	if (sig == SIGSEGV)
 		ka->sa.sa_handler = SIG_DFL;
 	si.si_signo = SIGSEGV;
@@ -431,8 +480,8 @@ handle_signal(unsigned long sig, siginfo
 {
 	struct k_sigaction *ka = &current->sighand->action[sig-1];
 
-	DBG(("handle_signal(sig=%ld, ka=%p, info=%p, oldset=%p, regs=%p)\n",
-	       sig, ka, info, oldset, regs));
+	DBG(1,"handle_signal: sig=%ld, ka=%p, info=%p, oldset=%p, regs=%p\n",
+	       sig, ka, info, oldset, regs);
 	
 	/* Set up the stack frame */
 	if (!setup_rt_frame(sig, ka, info, oldset, regs, in_syscall))
@@ -470,8 +519,8 @@ do_signal(sigset_t *oldset, struct pt_re
 	struct k_sigaction *ka;
 	int signr;
 
-	DBG(("do_signal(oldset=0x%p, regs=0x%p, sr7 %#lx, pending %d, in_syscall=%d\n",
-	       oldset, regs, regs->sr[7], current->sigpending, in_syscall));
+	DBG(1,"\ndo_signal: oldset=0x%p, regs=0x%p, sr7 %#lx, in_syscall=%d\n",
+	       oldset, regs, regs->sr[7], in_syscall);
 
 	/* Everyone else checks to see if they are in kernel mode at
 	   this point and exits if that's the case.  I'm not sure why
@@ -481,12 +530,13 @@ do_signal(sigset_t *oldset, struct pt_re
 	if (!oldset)
 		oldset = &current->blocked;
 
-	DBG(("do_signal: oldset %08lx:%08lx\n", 
-		oldset->sig[0], oldset->sig[1]));
+	DBG(1,"do_signal: oldset %08lx / %08lx\n", 
+		oldset->sig[0], oldset->sig[1]);
 
 
 	signr = get_signal_to_deliver(&info, regs, NULL);
-	/* printk("do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); */
+	DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
+	
 	if (signr > 0) {
 		/* Restart a system call if necessary. */
 		if (in_syscall) {
@@ -495,14 +545,14 @@ do_signal(sigset_t *oldset, struct pt_re
 		        case -ERESTART_RESTARTBLOCK:
 				current_thread_info()->restart_block.fn = do_no_restart_syscall;
 			case -ERESTARTNOHAND:
-				DBG(("ERESTARTNOHAND: returning -EINTR\n"));
+				DBG(1,"ERESTARTNOHAND: returning -EINTR\n");
 				regs->gr[28] = -EINTR;
 				break;
 
 			case -ERESTARTSYS:
 				ka = &current->sighand->action[signr-1];
 				if (!(ka->sa.sa_flags & SA_RESTART)) {
-					DBG(("ERESTARTSYS: putting -EINTR\n"));
+					DBG(1,"ERESTARTSYS: putting -EINTR\n");
 					regs->gr[28] = -EINTR;
 					break;
 				}
@@ -521,9 +571,8 @@ do_signal(sigset_t *oldset, struct pt_re
 		   delivery failed, we need to continue to iterate in
 		   this loop so we can deliver the SIGSEGV... */
 		if (handle_signal(signr, &info, oldset, regs, in_syscall)) {
-			DBG((KERN_DEBUG
-				"Exiting do_signal (success), regs->gr[28] = %ld\n",
-				regs->gr[28]));
+			DBG(1,KERN_DEBUG "do_signal: Exit (success), regs->gr[28] = %ld\n",
+				regs->gr[28]);
 			return 1;
 		}
 	}
@@ -577,8 +626,8 @@ do_signal(sigset_t *oldset, struct pt_re
 		}
 	}
 	
-	DBG(("Exiting do_signal (not delivered), regs->gr[28] = %ld\n", 
-		regs->gr[28]));
+	DBG(1,"do_signal: Exit (not delivered), regs->gr[28] = %ld\n", 
+		regs->gr[28]);
 
 	return 0;
 }
--- arch/parisc/kernel/signal32.c	29 Jul 2003 17:00:41 -0000	1.1
+++ arch/parisc/kernel/signal32.c	3 Dec 2003 06:49:32 -0000
@@ -10,20 +10,32 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 
+#include <asm/compat_signal.h>
 #include <asm/uaccess.h>
+
+#include "signal32.h"
 #include "sys32.h"
 
-struct k_sigaction32 {
-	struct sigaction32 sa;
-};
+#define DEBUG_COMPAT_SIG 0 
+#define DEBUG_COMPAT_SIG_LEVEL 2
+
+#if DEBUG_COMPAT_SIG
+#define DBG(LEVEL, ...) \
+	((DEBUG_COMPAT_SIG_LEVEL >= LEVEL) \
+	? printk(__VA_ARGS__) : (void) 0)
+#else
+#define DBG(LEVEL, ...)
+#endif
 
-static inline void
+#define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
+
+inline void
 sigset_32to64(sigset_t *s64, compat_sigset_t *s32)
 {
 	s64->sig[0] = s32->sig[0] | ((unsigned long)s32->sig[1] << 32);
 }
 
-static inline void
+inline void
 sigset_64to32(compat_sigset_t *s32, sigset_t *s64)
 {
 	s32->sig[0] = s64->sig[0] & 0xffffffffUL;
@@ -120,16 +132,10 @@ sys32_rt_sigaction(int sig, const struct
 	return ret;
 }
 
-typedef struct {
-	unsigned int ss_sp;
-	int ss_flags;
-	compat_size_t ss_size;
-} stack_t32;
-
 int 
-do_sigaltstack32 (const stack_t32 *uss32, stack_t32 *uoss32, unsigned long sp)
+do_sigaltstack32 (const compat_stack_t *uss32, compat_stack_t *uoss32, unsigned long sp)
 {
-	stack_t32 ss32, oss32;
+	compat_stack_t ss32, oss32;
 	stack_t ss, oss;
 	stack_t *ssp = NULL, *ossp = NULL;
 	int ret;
@@ -159,4 +165,128 @@ do_sigaltstack32 (const stack_t32 *uss32
 	}
 
 	return ret;
+}
+
+long
+restore_sigcontext32(struct compat_sigcontext *sc, struct pt_regs *regs)
+{
+	long err = 0;
+	compat_int_t compat_reg;
+	int regn;
+	
+	/* When loading 32-bit values into 64-bit registers make
+	   sure to clear the upper 32-bits */
+	DBG(2,"restore_sigcontext32: PER_LINUX32 process\n");
+	DBG(2,"restore_sigcontext32: sc = 0x%p, regs = 0x%p\n",sc,regs);
+	DBG(2,"restore_sigcontext32: compat_sigcontext is %#lx bytes\n", sizeof(*sc));
+	for(regn=0; regn < 32; regn++){
+		err |= __get_user(compat_reg,&sc->sc_gr[regn]);
+		regs->gr[regn] = compat_reg;
+	}
+	DBG(2,"restore_sigcontext32: sc->sc_fr = 0x%p\n",sc->sc_fr);
+	/* XXX: BE WARNED FR's are 64-BIT! */
+	err |= __copy_from_user(regs->fr, sc->sc_fr, sizeof(regs->fr));
+		
+	/* Better safe than sorry, pass __get_user two things of
+	   the same size and let gcc do the upward conversion to 
+	   64-bits */		
+	err |= __get_user(compat_reg, &sc->sc_iaoq[0]);
+	DBG(2,"restore_sigcontext32: sc->sc_iaoq[0] = %p => %#x\n",
+				&sc->sc_iaoq[0],compat_reg);
+	regs->iaoq[0] = compat_reg;
+	err |= __get_user(compat_reg, &sc->sc_iaoq[1]);
+	DBG(2,"restore_sigcontext32: sc->sc_iaoq[1] = %p => %#x\n",
+				&sc->sc_iaoq[1],compat_reg);
+	regs->iaoq[1] = compat_reg;
+	DBG(2,"restore_sigcontext32: iaoq is %#lx / %#lx\n", 
+		regs->iaoq[0],regs->iaoq[1]);		
+	
+	err |= __get_user(compat_reg, &sc->sc_iasq[0]);
+	regs->iasq[0] = compat_reg;
+	err |= __get_user(compat_reg, &sc->sc_iasq[1]);
+	regs->iasq[1] = compat_reg;
+	DBG(2,"restore_sigcontext32: iasq is %#lx / %#lx\n", 
+		regs->iasq[0],regs->iasq[1]);		
+
+	err |= __get_user(compat_reg, &sc->sc_sar);
+	regs->sar = compat_reg;
+	
+	DBG(2,"restore_sigcontext32: r28 is %ld\n", regs->gr[28]);
+	return err;
+}
+
+/*
+ * Set up the sigcontext structure for this process.
+ * This is not an easy task if the kernel is 64-bit, it will require
+ * that we examine the process personality to determine if we need to
+ * truncate for a 32-bit userspace.
+ */
+long
+setup_sigcontext32(struct compat_sigcontext *sc, struct pt_regs *regs, int in_syscall)
+		 
+{
+	compat_int_t flags = 0;
+	long err = 0;
+	compat_int_t compat_reg;
+	int regn;
+	
+	if (on_sig_stack((unsigned long) sc))
+		flags |= PARISC_SC_FLAG_ONSTACK;
+	
+	if (in_syscall) {
+		DBG(1,"setup_sigcontext32: in_syscall\n");
+		flags |= PARISC_SC_FLAG_IN_SYSCALL;
+		/* Truncate gr31 */
+		compat_reg = (compat_int_t)(regs->gr[31]);
+		DBG(2,"setup_sigcontext32: sc->sc_iaoq[0] = %p <= %#x\n",
+				&sc->sc_iaoq[0],compat_reg);
+		/* regs->iaoq is undefined in the syscall return path */
+		err |= __put_user(compat_reg, &sc->sc_iaoq[0]);
+		compat_reg = (compat_int_t)(regs->gr[31]+4);
+		DBG(2,"setup_sigcontext32: sc->sc_iaoq[1] = %p <= %#x\n",
+				&sc->sc_iaoq[1],compat_reg);
+		err |= __put_user(compat_reg, &sc->sc_iaoq[1]);
+		/* Truncate sr3 */
+		compat_reg = (compat_int_t)(regs->sr[3]);
+		err |= __put_user(compat_reg, &sc->sc_iasq[0]);
+		err |= __put_user(compat_reg, &sc->sc_iasq[1]);		
+		
+		DBG(1,"setup_sigcontext32: iaoq %#lx / %#lx\n",
+			regs->gr[31], regs->gr[31]+4);
+	} else {
+		compat_reg = (compat_int_t)(regs->iaoq[0]);
+		DBG(2,"setup_sigcontext32: sc->sc_iaoq[0] = %p <= %#x\n",
+				&sc->sc_iaoq[0],compat_reg);
+		err |= __put_user(compat_reg, &sc->sc_iaoq[0]);
+		compat_reg = (compat_int_t)(regs->iaoq[1]);
+		DBG(2,"setup_sigcontext32: sc->sc_iaoq[1] = %p <= %#x\n",
+				&sc->sc_iaoq[1],compat_reg);
+		err |= __put_user(compat_reg, &sc->sc_iaoq[1]);
+		
+		compat_reg = (compat_int_t)(regs->iasq[0]);
+		err |= __put_user(compat_reg, &sc->sc_iasq[0]);
+		compat_reg = (compat_int_t)(regs->iasq[1]);
+		err |= __put_user(compat_reg, &sc->sc_iasq[1]);
+		
+		DBG(1,"setup_sigcontext32: iaoq %#lx / %#lx\n", 
+			regs->iaoq[0], regs->iaoq[1]);
+	}
+
+	err |= __put_user(flags, &sc->sc_flags);
+	
+	DBG(1,"setup_sigcontext32: Truncating.\n");
+	for(regn=0; regn < 32; regn++){
+		/* Truncate a general register */
+		compat_reg = (compat_int_t)(regs->gr[regn]);
+		err |= __put_user(compat_reg, &sc->sc_gr[regn]);
+	}
+	/* Copy the floating point registers (same size)  */
+	/* XXX: BE WARNED FR's are 64-BIT! */
+	err |= __copy_to_user(sc->sc_fr, regs->fr, sizeof(regs->fr));
+	compat_reg = (compat_int_t)(regs->sar);
+	err |= __put_user(compat_reg, &sc->sc_sar);
+
+	DBG(1,"setup_sigcontext32: r28 is %ld\n", regs->gr[28]);
+
+	return err;
 }
--- include/asm-parisc/compat.h	28 Oct 2003 06:55:24 -0000	1.2
+++ include/asm-parisc/compat.h	3 Dec 2003 06:49:35 -0000
@@ -24,6 +24,7 @@ typedef u16	compat_nlink_t;
 typedef u16	compat_ipc_pid_t;
 typedef s32	compat_daddr_t;
 typedef u32	compat_caddr_t;
+typedef u32	compat_timer_t;
 
 typedef s32	compat_int_t;
 typedef s32	compat_long_t;
@@ -99,6 +100,15 @@ struct compat_statfs {
 	s32		f_namelen;
 	s32		f_frsize;
 	s32		f_spare[5];
+};
+
+struct compat_sigcontext {
+	compat_int_t sc_flags;
+	compat_int_t sc_gr[32]; /* PSW in sc_gr[0] */
+	u64 sc_fr[32]; /* FIXME, do we need other state info? */
+	compat_int_t sc_iasq[2];
+	compat_int_t sc_iaoq[2];
+	compat_int_t sc_sar; /* cr11 */
 };
 
 #define COMPAT_RLIM_INFINITY 0xffffffff
--- include/asm-parisc/rt_sigframe.h	24 Sep 2003 17:54:31 -0000	1.2
+++ include/asm-parisc/rt_sigframe.h	3 Dec 2003 06:49:35 -0000
@@ -1,22 +1,13 @@
 #ifndef _ASM_PARISC_RT_SIGFRAME_H
 #define _ASM_PARISC_RT_SIGFRAME_H
 
+#include <asm/compat_rt_sigframe.h>
+
 struct rt_sigframe {
 	unsigned int tramp[4];
 	struct siginfo info;
 	struct ucontext uc;
 };
-
-/*
- * The 32-bit ABI wants at least 48 bytes for a function call frame:
- * 16 bytes for arg0-arg3, and 32 bytes for magic (the only part of
- * which Linux/parisc uses is sp-20 for the saved return pointer...)
- * Then, the stack pointer must be rounded to a cache line (64 bytes).
- */
-#define SIGFRAME32		64
-#define FUNCTIONCALLFRAME32	48
-#define PARISC_RT_SIGFRAME_SIZE32					\
-	(((sizeof(struct rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
 
 #ifdef __LP64__
 #define	SIGFRAME		128
--- include/asm-parisc/siginfo.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/siginfo.h	3 Dec 2003 06:49:35 -0000
@@ -1,8 +1,6 @@
 #ifndef _PARISC_SIGINFO_H
 #define _PARISC_SIGINFO_H
 
-#define HAVE_ARCH_COPY_SIGINFO_TO_USER
-
 #include <asm-generic/siginfo.h>
 
 /*
--- include/asm-parisc/ucontext.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/ucontext.h	3 Dec 2003 06:49:35 -0000
@@ -1,12 +1,12 @@
-#ifndef _ASMPARISC_UCONTEXT_H
-#define _ASMPARISC_UCONTEXT_H
+#ifndef _ASM_PARISC_UCONTEXT_H
+#define _ASM_PARISC_UCONTEXT_H
 
 struct ucontext {
-	unsigned long	  uc_flags;
+	unsigned int	  uc_flags;
 	struct ucontext  *uc_link;
 	stack_t		  uc_stack;
 	struct sigcontext uc_mcontext;
 	sigset_t	  uc_sigmask;	/* mask last for extensibility */
 };
 
-#endif /* !_ASMPARISC_UCONTEXT_H */
+#endif /* !_ASM_PARISC_UCONTEXT_H */
--- kernel/Makefile	8 Oct 2003 20:53:06 -0000	1.6
+++ kernel/Makefile	3 Dec 2003 06:49:35 -0000
@@ -5,7 +5,7 @@
 obj-y     = sched.o fork.o exec_domain.o panic.o printk.o profile.o \
 	    exit.o itimer.o time.o softirq.o resource.o \
 	    sysctl.o capability.o ptrace.o timer.o user.o \
-	    signal.o sys.o kmod.o workqueue.o pid.o \
+	    compat_signal.o signal.o sys.o kmod.o workqueue.o pid.o \
 	    rcupdate.o intermodule.o extable.o params.o posix-timers.o
 
 obj-$(CONFIG_FUTEX) += futex.o
--- kernel/signal.c	24 Nov 2003 03:16:26 -0000	1.8
+++ kernel/signal.c	3 Dec 2003 06:49:35 -0000
@@ -24,9 +24,11 @@
 #include <linux/binfmts.h>
 #include <linux/security.h>
 #include <linux/ptrace.h>
+#include <linux/personality.h>
 #include <asm/param.h>
 #include <asm/uaccess.h>
 #include <asm/siginfo.h>
+#include <asm/compat_siginfo.h>
 
 /*
  * SLAB caches for signal bits.
@@ -2006,6 +2008,12 @@ int copy_siginfo_to_user(siginfo_t __use
 	if (from->si_code < 0)
 		return __copy_to_user(to, from, sizeof(siginfo_t))
 			? -EFAULT : 0;
+
+	/* Use compat_siginfo_t with 32-bit signals */
+	if(personality(current->personality) == PER_LINUX32){
+		return compat_copy_siginfo_to_user((compat_siginfo_t __user *)to,from);
+	}
+	
 	/*
 	 * If you change siginfo_t structure, please be sure
 	 * this code is fixed accordingly.
--- arch/parisc/kernel/signal32.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ arch/parisc/kernel/signal32.h	2003-11-28 15:18:40.000000000 -0500
@@ -0,0 +1,22 @@
+#ifndef _PARISC64_KERNEL_SIGNAL32_H
+#define _PARISC64_KERNEL_SIGNAL32_H
+
+#include <linux/compat.h>
+#include <asm/compat_signal.h>
+
+/* ELF32 signal handling */
+
+struct k_sigaction32 {
+	struct compat_sigaction sa;
+};
+
+void sigset_32to64(sigset_t *s64, compat_sigset_t *s32);
+void sigset_64to32(compat_sigset_t *s32, sigset_t *s64);
+int do_sigaltstack32 (const compat_stack_t *uss32, 
+		compat_stack_t *uoss32, unsigned long sp);
+long restore_sigcontext32(struct compat_sigcontext *sc, 
+		struct pt_regs *regs);
+long setup_sigcontext32(struct compat_sigcontext *sc, 
+		struct pt_regs *regs, int in_syscall);
+
+#endif
--- include/asm-generic/compat_siginfo.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-generic/compat_siginfo.h	2003-11-28 07:49:19.000000000 -0500
@@ -0,0 +1,154 @@
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/compat.h>
+
+#ifndef _ASM_GENERIC_COMPAT_SIGINFO_H
+#define _ASM_GENERIC_COMPAT_SIGINFO_H
+
+/* compat view of sigval_t */
+typedef union compat_sigval {
+	compat_int_t sival_int;
+	compat_uptr_t sival_ptr;
+} compat_sigval_t;
+
+/*
+ * This is the size (including padding) of the part of the
+ * struct siginfo that is before the union.
+ */
+#ifndef __ARCH_SI_COMPAT_PREAMBLE_SIZE
+#define __ARCH_SI_COMPAT_PREAMBLE_SIZE	(3 * sizeof(int))
+#endif
+
+#define SI_COMPAT_MAX_SIZE	128
+#ifndef SI_COMPAT_PAD_SIZE
+#define SI_COMPAT_PAD_SIZE	((SI_COMPAT_MAX_SIZE - __ARCH_SI_COMPAT_PREAMBLE_SIZE) / sizeof(int))
+#endif
+
+/* ELF32 view of si.uid_t */
+#ifndef __ARCH_SI_COMPAT_UID_T
+#define __ARCH_SI_COMPAT_UID_T compat_uid_t
+#endif
+
+/* ELF32 view of si.band_t */
+#ifndef __ARCH_SI_COMPAT_BAND_T
+#define __ARCH_SI_COMPAT_BAND_T compat_int_t
+#endif
+
+#ifndef HAVE_ARCH_COMPAT_SIGINFO_T
+
+/* Compat (ELF32) view of siginfo_t */
+typedef struct compat_siginfo {
+	compat_int_t si_signo;
+	compat_int_t si_errno;
+	compat_int_t si_code;
+
+	union {
+		compat_int_t _pad[SI_COMPAT_PAD_SIZE];
+
+		/* kill() */
+		struct {
+			compat_pid_t _pid;	/* sender's pid */
+			__ARCH_SI_COMPAT_UID_T _uid;	/* sender's uid */
+		} _kill;
+
+		/* POSIX.1b timers */
+		struct {
+			compat_timer_t _tid;	/* timer id */
+			compat_int_t _overrun;		/* overrun count */
+			char _pad[sizeof( __ARCH_SI_UID_T) - sizeof(int)];
+			compat_sigval_t _sigval;	/* same as below */
+			compat_int_t _sys_private;       /* not to be passed to user */
+		} _timer;
+
+		/* POSIX.1b signals */
+		struct {
+			compat_pid_t _pid;		/* sender's pid */
+			__ARCH_SI_COMPAT_UID_T _uid;	/* sender's uid */
+			compat_sigval_t _sigval;
+		} _rt;
+
+		/* SIGCHLD */
+		struct {
+			compat_pid_t _pid;		/* which child */
+			__ARCH_SI_COMPAT_UID_T _uid;	/* sender's uid */
+			compat_int_t _status;		/* exit code */
+			compat_clock_t _utime;
+			compat_clock_t _stime;
+		} _sigchld;
+
+		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
+		struct {
+			compat_uptr_t _addr; /* faulting insn/memory ref. */
+#ifdef __ARCH_SI_TRAPNO
+			compat_int_t _trapno;	/* TRAP # which caused the signal */
+#endif
+		} _sigfault;
+
+		/* SIGPOLL */
+		struct {
+			__ARCH_SI_COMPAT_BAND_T _band;	/* POLL_IN, POLL_OUT, POLL_MSG */
+			compat_int_t _fd;
+		} _sigpoll;
+	} _sifields;
+} compat_siginfo_t;
+#endif
+
+/*
+ * sigevent definitions
+ * 
+ * It seems likely that SIGEV_THREAD will have to be handled from 
+ * userspace, libpthread transmuting it to SIGEV_SIGNAL, which the
+ * thread manager then catches and does the appropriate nonsense.
+ * However, everything is written out here so as to not get lost.
+ */
+
+#define SIGEV_COMPAT_MAX_SIZE	64
+#ifndef SIGEV_COMPAT_PAD_SIZE
+#define SIGEV_COMPAT_PAD_SIZE	((SIGEV_COMPAT_MAX_SIZE/sizeof(int)) - 3)
+#endif
+
+#ifndef HAVE_ARCH_COMPAT_SIGEVENT_T
+
+/* ELF32 view of sigevent_t */
+typedef struct compat_sigevent {
+	compat_sigval_t sigev_value;
+	compat_int_t sigev_signo;
+	compat_int_t sigev_notify;
+	union {
+		compat_int_t _pad[SIGEV_COMPAT_PAD_SIZE];
+		compat_int_t _tid;
+
+		struct {
+			compat_uptr_t _function;
+			compat_uptr_t _attribute;	/* really pthread_attr_t */
+		} _sigev_thread;
+	} _sigev_un;
+} compat_sigevent_t;
+
+#endif
+
+#ifdef __KERNEL__
+
+struct compat_siginfo;
+/*void do_schedule_next_timer(struct siginfo *info);*/
+
+#ifndef HAVE_ARCH_COMPAT_COPY_SIGINFO
+
+#include <linux/string.h>
+
+static inline void compat_copy_siginfo(struct compat_siginfo *to, struct compat_siginfo *from)
+{
+	if (from->si_code < 0)
+		memcpy(to, from, sizeof(*to));
+	else
+		/* _sigchld is currently the largest know union member */
+		memcpy(to, from, __ARCH_SI_COMPAT_PREAMBLE_SIZE + sizeof(from->_sifields._sigchld));
+}
+
+#endif
+
+extern int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, struct siginfo *from);
+
+#endif /* __KERNEL__ */
+
+#endif
--- include/asm-generic/compat_signal.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-generic/compat_signal.h	2003-12-02 23:01:44.000000000 -0500
@@ -0,0 +1,28 @@
+#ifndef _ASM_GENERIC_COMPAT_SIGNAL_H
+#define _ASM_GENERIC_COMPAT_SIGNAL_H
+
+# ifndef __ASSEMBLY__
+#  include <linux/types.h>
+
+typedef compat_uptr_t compat_sighandler_t;
+
+typedef struct compat_sigaltstack {
+	compat_uptr_t ss_sp;
+	compat_int_t ss_flags;
+	compat_size_t ss_size;
+} compat_stack_t;
+
+#  ifdef __KERNEL__
+
+/* Most things should be clean enough to redefine this at will, if care
+   is taken to make libc match.  */
+
+struct compat_sigaction {
+	compat_sighandler_t sa_handler;
+	compat_uint_t sa_flags;
+	compat_sigset_t sa_mask;		/* mask last for extensibility */
+};
+
+#  endif /* __KERNEL__ */
+# endif /* !__ASSEMBLY */
+#endif /* _ASM_GENERIC_COMPAT_SIGNAL_H */
--- include/asm-parisc/compat_rt_sigframe.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-parisc/compat_rt_sigframe.h	2003-12-02 23:11:20.000000000 -0500
@@ -0,0 +1,25 @@
+#include<linux/compat.h>
+#include<asm/compat_siginfo.h>
+#include<asm/compat_ucontext.h>
+
+#ifndef _ASM_PARISC_COMPAT_RT_SIGFRAME_H
+#define _ASM_PARISC_COMPAT_RT_SIGFRAME_H
+
+struct compat_rt_sigframe {
+	compat_uint_t tramp[4];
+	compat_siginfo_t info;
+	struct compat_ucontext uc;
+};
+
+/*
+ * The 32-bit ABI wants at least 48 bytes for a function call frame:
+ * 16 bytes for arg0-arg3, and 32 bytes for magic (the only part of
+ * which Linux/parisc uses is sp-20 for the saved return pointer...)
+ * Then, the stack pointer must be rounded to a cache line (64 bytes).
+ */
+#define SIGFRAME32		64
+#define FUNCTIONCALLFRAME32	48
+#define PARISC_RT_SIGFRAME_SIZE32					\
+	(((sizeof(struct compat_rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
+
+#endif
--- include/asm-parisc/compat_siginfo.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-parisc/compat_siginfo.h	2003-11-21 06:11:59.000000000 -0500
@@ -0,0 +1,2 @@
+/* We use the generic compat struct */
+#include <asm-generic/compat_siginfo.h>
--- include/asm-parisc/compat_signal.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-parisc/compat_signal.h	2003-11-28 06:22:13.000000000 -0500
@@ -0,0 +1,2 @@
+/* Use generic */
+#include <asm-generic/compat_signal.h>
--- include/asm-parisc/compat_ucontext.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ include/asm-parisc/compat_ucontext.h	2003-12-02 23:45:17.000000000 -0500
@@ -0,0 +1,19 @@
+#ifndef _ASM_PARISC_COMPAT_UCONTEXT_H
+#define _ASM_PARISC_COMPAT_UCONTEXT_H
+
+#include<linux/compat.h>
+#include<asm/compat_signal.h>
+
+/* ELF32 ucontext as seen from an ELF64 kernel */
+struct compat_ucontext {
+	compat_uint_t uc_flags;
+	compat_uptr_t uc_link;
+	compat_stack_t uc_stack;	/* struct compat_sigaltstack */
+	
+	compat_uint_t pad[1];		/*FIXME: ELF32 structure is padded */
+	
+	struct compat_sigcontext uc_mcontext;
+	compat_sigset_t uc_sigmask;	/* mask last for extensibility */
+};
+
+#endif /* !_ASM_PARISC_COMPAT_UCONTEXT_H */
--- kernel/compat_signal.c.orig	1969-12-31 19:00:00.000000000 -0500
+++ kernel/compat_signal.c	2003-12-02 23:18:13.000000000 -0500
@@ -0,0 +1,126 @@
+/*
+ *  Copyright (C) 2003 Carlos O'Donell
+ * 
+ *  2003-12-20  Carlos O'Donell
+ *              Copied linux/kernel/compat_signal.c (copy_siginfo_to_user)
+ *              and modified to use compat_siginfo_t for thunking down to
+ *              32-bit userspace with an ELF64 kernel.
+ *              
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at
+ * your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ * NON INFRINGEMENT.  See the GNU General Public License for more
+ * details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ */
+
+/*#define __KERNEL_SYSCALLS__*/
+
+#include <asm/errno.h>
+#include <asm/compat_siginfo.h>
+#include <asm/uaccess.h>
+#include <asm/siginfo.h>
+
+#ifndef HAVE_ARCH_COMPAT_COPY_SIGINFO_TO_USER
+
+int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, siginfo_t *from)
+{
+	int err;
+	compat_siginfo_t compat_from;	
+
+	if (!access_ok (VERIFY_WRITE, to, sizeof(compat_siginfo_t)))
+		return -EFAULT;
+	
+	/*
+	 * If you change siginfo_t structure, please be sure
+	 * this code is fixed accordingly.
+	 * It should never copy any pad contained in the structure
+	 * to avoid security leaks, but must copy the generic
+	 * 3 ints plus the relevant union member.
+	 */
+
+	/* Convert structure, don't leak anything in the copy */
+	memset(&compat_from,'\0',sizeof(compat_siginfo_t));
+	compat_from.si_signo = (compat_int_t)(from->si_signo);
+	compat_from.si_errno = (compat_int_t)(from->si_errno);
+	compat_from.si_code = (compat_int_t)(from->si_code);
+	
+	if (from->si_code < 0)
+		return __copy_to_user(to, &compat_from, sizeof(compat_siginfo_t))
+			? -EFAULT : 0;
+	
+	err = __put_user(compat_from.si_signo, &to->si_signo);
+	err |= __put_user(compat_from.si_errno, &to->si_errno);
+	err |= __put_user(compat_from.si_code, &to->si_code);
+	
+	switch (from->si_code & __SI_MASK) {
+	case __SI_KILL:
+		compat_from.si_pid = (compat_pid_t)(from->si_pid);
+		compat_from.si_uid = (__ARCH_SI_COMPAT_UID_T)(from->si_uid);
+		err |= __put_user(compat_from.si_pid, &to->si_pid);
+		err |= __put_user(compat_from.si_uid, &to->si_uid);
+		break;
+	case __SI_TIMER:
+		compat_from.si_pid = (compat_timer_t)(from->si_tid);
+		compat_from.si_overrun = (compat_int_t)(from->si_overrun);
+		compat_from.si_ptr = (compat_uptr_t)((u64)(from->si_ptr) & 0xffffffffUL);
+		err |= __put_user(compat_from.si_tid, &to->si_tid);
+		err |= __put_user(compat_from.si_overrun, &to->si_overrun);
+		err |= __put_user(compat_from.si_ptr, &to->si_ptr);
+		break;
+	case __SI_POLL:
+		compat_from.si_band = (__ARCH_SI_COMPAT_BAND_T)(from->si_band);
+		compat_from.si_fd = (compat_int_t)(from->si_fd);
+		err |= __put_user(compat_from.si_band, &to->si_band);
+		err |= __put_user(compat_from.si_fd, &to->si_fd);
+		break;
+	case __SI_FAULT:
+		compat_from.si_addr = (compat_uptr_t)((u64)(from->si_addr) & 0xffffffffUL);
+		err |= __put_user(compat_from.si_addr, &to->si_addr);
+#ifdef __ARCH_SI_TRAPNO
+		compat_from.si_trapno = (compat_int_t)(from->si_addr);
+		err |= __put_user(compat_from.si_trapno, &to->si_trapno);
+#endif
+		break;
+	case __SI_CHLD:
+		compat_from.si_pid = (compat_pid_t)(from->si_pid);
+		compat_from.si_uid = (__ARCH_SI_COMPAT_UID_T)(from->si_uid);
+		compat_from.si_status = (compat_int_t)(from->si_status);
+		compat_from.si_utime = (compat_clock_t)(from->si_utime);
+		compat_from.si_stime = (compat_clock_t)(from->si_stime);
+		err |= __put_user(compat_from.si_pid, &to->si_pid);
+		err |= __put_user(compat_from.si_uid, &to->si_uid);
+		err |= __put_user(compat_from.si_status, &to->si_status);
+		err |= __put_user(compat_from.si_utime, &to->si_utime);
+		err |= __put_user(compat_from.si_stime, &to->si_stime);
+		break;
+	case __SI_RT: /* This is not generated by the kernel as of now. */
+		compat_from.si_pid = (compat_pid_t)(from->si_pid);
+		compat_from.si_uid = (__ARCH_SI_COMPAT_UID_T)(from->si_uid);
+		compat_from.si_int = (compat_int_t)(from->si_int);
+		compat_from.si_ptr = (compat_uptr_t)((u64)(from->si_ptr) & 0xffffffffUL);
+		err |= __put_user(compat_from.si_pid, &to->si_pid);
+		err |= __put_user(compat_from.si_uid, &to->si_uid);
+		err |= __put_user(compat_from.si_int, &to->si_int);
+		err |= __put_user(compat_from.si_ptr, &to->si_ptr);
+		break;
+	default: /* this is just in case for now ... */
+		compat_from.si_pid = (compat_pid_t)(from->si_pid);
+		compat_from.si_uid = (__ARCH_SI_COMPAT_UID_T)(from->si_uid);
+		err |= __put_user(compat_from.si_pid, &to->si_pid);
+		err |= __put_user(compat_from.si_uid, &to->si_uid);
+		break;
+	}
+	return err;
+}
+
+#endif
