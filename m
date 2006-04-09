From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] [RFC] pselect/ppoll support
Date: Sun, 9 Apr 2006 14:25:21 -0400
Message-ID: <20060409182521.GA27661@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

First strike at adding TIF_RESTORE_SIGMASK support for the pselect/ppoll
system calls... Doesn't seem to work at all yet...

For instance, signals appear to be completely broken... Dunno why,
seems to work for other architectures...

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 7c95d76..22e3eed 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -32,6 +32,7 @@
 
 #include <asm/psw.h>
 #include <asm/assembly.h>	/* for LDREG/STREG defines */
+#include <asm/cache.h>
 #include <asm/pgtable.h>
 #include <asm/signal.h>
 #include <asm/unistd.h>
@@ -479,11 +480,7 @@
 	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
 	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	copy		\pmd,%r9
-#ifdef CONFIG_64BIT
-	shld		%r9,PxD_VALUE_SHIFT,\pmd
-#else
-	shlw		%r9,PxD_VALUE_SHIFT,\pmd
-#endif
+	SHLREG		%r9,PxD_VALUE_SHIFT,\pmd
 	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	DEP		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
@@ -962,11 +959,7 @@ intr_return:
 	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) amount
 	** irq_stat[] is defined using ____cacheline_aligned.
 	*/
-#ifdef CONFIG_64BIT
-	shld	%r1, 6, %r20
-#else
-	shlw	%r1, 5, %r20
-#endif
+	SHLREG	%r1, L1_CACHE_SHIFT, %r20
 	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
 #endif /* CONFIG_SMP */
 
@@ -1071,7 +1064,7 @@ intr_do_preempt:
 	b	intr_restore		/* ssm PSW_SM_I done by intr_restore */
 #endif /* CONFIG_PREEMPT */
 
-	.import do_signal,code
+	.import do_notify_resume,code
 intr_do_signal:
 	/* 
 		This check is critical to having LWS
@@ -1088,14 +1081,13 @@ intr_do_signal:
 	CMPIB= 0,%r20,intr_restore /* backward */
 	nop
 
-	copy	%r0, %r24			/* unsigned long in_syscall */
-	copy	%r16, %r25			/* struct pt_regs *regs */
+	copy	%r0, %r25			/* unsigned long in_syscall */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 
-	BL	do_signal,%r2
-	copy	%r0, %r26			/* sigset_t *oldset = NULL */
+	BL	do_notify_resume,%r2
+	copy	%r16, %r26			/* struct pt_regs *regs */
 
 	b	intr_check_sig
 	nop
@@ -2028,32 +2020,6 @@ sys32_sigaltstack_wrapper:
 	nop
 #endif
 
-	.export sys_rt_sigsuspend_wrapper
-sys_rt_sigsuspend_wrapper:
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
-	ldo	TASK_REGS(%r1),%r24
-	reg_save %r24
-
-	STREG	%r2, -RP_OFFSET(%r30)
-#ifdef CONFIG_64BIT
-	ldo	FRAME_SIZE(%r30), %r30
-	b,l	sys_rt_sigsuspend,%r2
-	ldo	-16(%r30),%r29		/* Reference param save area */
-#else
-	bl	sys_rt_sigsuspend,%r2
-	ldo	FRAME_SIZE(%r30), %r30
-#endif
-
-	ldo	-FRAME_SIZE(%r30), %r30
-	LDREG	-RP_OFFSET(%r30), %r2
-
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
-	ldo	TASK_REGS(%r1),%r1
-	reg_restore %r1
-
-	bv	%r0(%r2)
-	nop
-
 	.export syscall_exit
 syscall_exit:
 
@@ -2108,11 +2074,7 @@ syscall_check_bh:
 	ldw     TI_CPU-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r26 /* cpu # */
 
 	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) bits */
-#ifdef CONFIG_64BIT
-	shld	%r26, 6, %r20
-#else
-	shlw	%r26, 5, %r20
-#endif
+	SHLREG	%r26, L1_CACHE_SHIFT, %r20
 	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
 #endif /* CONFIG_SMP */
 
@@ -2264,23 +2226,21 @@ syscall_do_resched:
 	b       syscall_check_bh  /* if resched, we start over again */
 	nop
 
-	.import do_signal,code
+	.import do_notify_resume,code
 syscall_do_signal:
 	/* Save callee-save registers (for sigcontext).
 	   FIXME: After this point the process structure should be
 	   consistent with all the relevant state of the process
 	   before the syscall.  We need to verify this. */
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1 
-	ldo	TASK_REGS(%r1), %r25		/* struct pt_regs *regs */
-	reg_save %r25
-
-	ldi	1, %r24				/* unsigned long in_syscall */
+	ldo	TASK_REGS(%r1), %r26		/* struct pt_regs *regs */
+	reg_save %r26
 
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
-	BL	do_signal,%r2
-	copy	%r0, %r26			/* sigset_t *oldset = NULL */
+	BL	do_notify_resume,%r2
+	ldi	1, %r25				/* unsigned long in_syscall */
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
 	ldo	TASK_REGS(%r1), %r20		/* reload pt_regs */
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 413292f..9aa4af0 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -36,8 +36,7 @@
 #define DBG(x...)
 #endif
 
-#ifdef __LP64__
-
+#ifdef CONFIG_64BIT
 /* This function is needed to translate 32 bit pt_regs offsets in to
  * 64 bit pt_regs offsets.  For example, a 32 bit gdb under a 64 bit kernel
  * will request offset 12 if it wants gr3, but the lower 32 bits of
@@ -90,8 +89,8 @@ long arch_ptrace(struct task_struct *chi
 	case PTRACE_PEEKDATA: {
 		int copied;
 
-#ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+#ifdef CONFIG_64BIT
+		if (__is_compat_task(child)) {
 			unsigned int tmp;
 
 			addr &= 0xffffffffL;
@@ -122,8 +121,8 @@ long arch_ptrace(struct task_struct *chi
 	case PTRACE_POKETEXT: /* write the word at location addr. */
 	case PTRACE_POKEDATA:
 		ret = 0;
-#ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+#ifdef CONFIG_64BIT
+		if (__is_compat_task(child)) {
 			unsigned int tmp = (unsigned int)data;
 			DBG("sys_ptrace(POKE%s, %d, %lx, %lx)\n",
 				request == PTRACE_POKETEXT ? "TEXT" : "DATA",
@@ -145,8 +144,8 @@ long arch_ptrace(struct task_struct *chi
 	   processes, the kernel saves all regs on a syscall. */
 	case PTRACE_PEEKUSR: {
 		ret = -EIO;
-#ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+#ifdef CONFIG_64BIT
+		if (__is_compat_task(child)) {
 			unsigned int tmp;
 
 			if (addr & (sizeof(int)-1))
@@ -204,8 +203,8 @@ long arch_ptrace(struct task_struct *chi
 			ret = 0;
 			goto out_tsk;
 		}
-#ifdef __LP64__
-		if (personality(child->personality) == PER_LINUX32) {
+#ifdef CONFIG_64BIT
+		if (__is_compat_task(child)) {
 			if (addr & (sizeof(int)-1))
 				goto out_tsk;
 			if ((addr = translate_usr_offset(addr)) < 0)
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 05767e8..5a1e21e 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 2000 David Huggins-Daines <dhd@debian.org>
  *  Copyright (C) 2000 Linuxcare, Inc.
+ *  Copyright (C) 2006 Kyle McMartin <kyle@parisc-linux.org>
  *
  *  Based on the ia64, i386, and alpha versions.
  *
@@ -60,58 +61,13 @@
  * this. */
 #define A(__x)	((unsigned long)(__x))
 
-int do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall);
-
 /*
  * Atomically swap in the new signal mask, and wait for a signal.
  */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 #include "sys32.h"
 #endif
 
-asmlinkage int
-sys_rt_sigsuspend(sigset_t __user *unewset, size_t sigsetsize, struct pt_regs *regs)
-{
-	sigset_t saveset, newset;
-#ifdef __LP64__
-	compat_sigset_t newset32;
-
-	if(personality(current->personality) == PER_LINUX32){
-		/* XXX: Don't preclude handling different sized sigset_t's.  */
-		if (sigsetsize != sizeof(compat_sigset_t))
-			return -EINVAL;
-		if (copy_from_user(&newset32, (compat_sigset_t __user *)unewset, sizeof(newset32)))
-			return -EFAULT;
-		sigset_32to64(&newset,&newset32);
-		
-	} else 
-#endif
-	{
-		/* XXX: Don't preclude handling different sized sigset_t's.  */
-		if (sigsetsize != sizeof(sigset_t))
-			return -EINVAL;
-	
-		if (copy_from_user(&newset, unewset, sizeof(newset)))
-			return -EFAULT;
-	}
-
-	sigdelsetmask(&newset, ~_BLOCKABLE);
-
-	spin_lock_irq(&current->sighand->siglock);
-	saveset = current->blocked;
-	current->blocked = newset;
-	recalc_sigpending();
-	spin_unlock_irq(&current->sighand->siglock);
-
-	regs->gr[28] = -EINTR;
-	while (1) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule();
-		if (do_signal(&saveset, regs, 1))
-			return -EINTR;
-	}
-}
-
 /*
  * Do a signal return - restore sigcontext.
  */
@@ -149,11 +105,11 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	sigset_t set;
 	unsigned long usp = (regs->gr[30] & ~(0x01UL));
 	unsigned long sigframe_size = PARISC_RT_SIGFRAME_SIZE;
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	compat_sigset_t compat_set;
 	struct compat_rt_sigframe __user * compat_frame;
 	
-	if(personality(current->personality) == PER_LINUX32)
+	if (__is_compat_task(current))
 		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
 #endif
 
@@ -163,10 +119,10 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 		(usp - sigframe_size);
 	DBG(2,"sys_rt_sigreturn: frame is %p\n", frame);
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
-	if(personality(current->personality) == PER_LINUX32){
+	if (__is_compat_task(current)) {
 		DBG(2,"sys_rt_sigreturn: ELF32 process.\n");
 		if (__copy_from_user(&compat_set, &compat_frame->uc.uc_sigmask, sizeof(compat_set)))
 			goto give_sigsegv;
@@ -185,10 +141,10 @@ sys_rt_sigreturn(struct pt_regs *regs, i
 	spin_unlock_irq(&current->sighand->siglock);
 
 	/* Good thing we saved the old gr[30], eh? */
-#ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32){
+#ifdef CONFIG_64BIT
+	if (__is_compat_task(current)) {
 		DBG(1,"sys_rt_sigreturn: compat_frame->uc.uc_mcontext 0x%p\n",
-				&compat_frame->uc.uc_mcontext);
+		    &compat_frame->uc.uc_mcontext);
 // FIXME: Load upper half from register file
 		if (restore_sigcontext32(&compat_frame->uc.uc_mcontext, 
 					&compat_frame->regs, regs))
@@ -297,12 +253,12 @@ setup_rt_frame(int sig, struct k_sigacti
 	unsigned long rp, usp;
 	unsigned long haddr, sigframe_size;
 	int err = 0;
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	compat_int_t compat_val;
 	struct compat_rt_sigframe __user * compat_frame;
 	compat_sigset_t compat_set;
 #endif
-	
+
 	usp = (regs->gr[30] & ~(0x01UL));
 	/*FIXME: frame_size parameter is unused, remove it. */
 	frame = get_sigframe(ka, usp, sizeof(*frame));
@@ -311,11 +267,10 @@ setup_rt_frame(int sig, struct k_sigacti
 	DBG(1,"setup_rt_frame: frame %p info %p\n", frame, info);
 
 	
-#ifdef __LP64__
-
+#ifdef CONFIG_64BIT
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
-	if(personality(current->personality) == PER_LINUX32) {
+	if (__is_compat_task(current)) {
 		DBG(1,"setup_rt_frame: frame->info = 0x%p\n", &compat_frame->info);
 		err |= copy_siginfo_to_user32(&compat_frame->info, info);
 		DBG(1,"SETUP_RT_FRAME: 1\n");
@@ -391,8 +346,8 @@ setup_rt_frame(int sig, struct k_sigacti
 
 	haddr = A(ka->sa.sa_handler);
 	/* The sa_handler may be a pointer to a function descriptor */
-#ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32) {
+#ifdef CONFIG_64BIT
+	if (__is_compat_task(current)) {
 #endif
 		if (haddr & PA_PLABEL_FDESC) {
 			Elf32_Fdesc fdesc;
@@ -406,7 +361,7 @@ setup_rt_frame(int sig, struct k_sigacti
 			haddr = fdesc.addr;
 			regs->gr[19] = fdesc.gp;
 		}
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	} else {
 		Elf64_Fdesc fdesc;
 		Elf64_Fdesc __user *ufdesc = (Elf64_Fdesc __user *)A(haddr & ~3);
@@ -426,20 +381,20 @@ setup_rt_frame(int sig, struct k_sigacti
 	/* The syscall return path will create IAOQ values from r31.
 	 */
 	sigframe_size = PARISC_RT_SIGFRAME_SIZE;
-#ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32)
+#ifdef CONFIG_64BIT
+	if (__is_compat_task(current))
 		sigframe_size = PARISC_RT_SIGFRAME_SIZE32;
 #endif
 	if (in_syscall) {
 		regs->gr[31] = haddr;
-#ifdef __LP64__
-		if(personality(current->personality) == PER_LINUX)
+#ifdef CONFIG_64BIT
+		if (__is_native_task(current))
 			sigframe_size |= 1;
 #endif
 	} else {
 		unsigned long psw = USER_PSW;
-#ifdef __LP64__
-		if(personality(current->personality) == PER_LINUX)
+#ifdef CONFIG_64BIT
+		if (__is_native_task(current))
 			psw |= PSW_W;
 #endif
 
@@ -463,8 +418,8 @@ setup_rt_frame(int sig, struct k_sigacti
 	regs->gr[2]  = rp;                /* userland return pointer */
 	regs->gr[26] = sig;               /* signal number */
 	
-#ifdef __LP64__
-	if(personality(current->personality) == PER_LINUX32){
+#ifdef CONFIG_64BIT
+	if (__is_compat_task(current)) {
 		regs->gr[25] = A(&compat_frame->info); /* siginfo pointer */
 		regs->gr[24] = A(&compat_frame->uc);   /* ucontext pointer */
 	} else
@@ -485,12 +440,12 @@ setup_rt_frame(int sig, struct k_sigacti
 	       current->comm, current->pid, frame, regs->gr[30],
 	       regs->iaoq[0], regs->iaoq[1], rp);
 
-	return 1;
+	return 0;
 
 give_sigsegv:
 	DBG(1,"setup_rt_frame: sending SIGSEGV\n");
 	force_sigsegv(sig, current);
-	return 0;
+	return -EFAULT;
 }
 
 /*
@@ -499,22 +454,97 @@ give_sigsegv:
 
 static long
 handle_signal(unsigned long sig, siginfo_t *info, struct k_sigaction *ka,
-		sigset_t *oldset, struct pt_regs *regs, int in_syscall)
+	      sigset_t *oldset, struct pt_regs *regs, int in_syscall)
 {
+	int ret;
+	unsigned long flags;
+
 	DBG(1,"handle_signal: sig=%ld, ka=%p, info=%p, oldset=%p, regs=%p\n",
 	       sig, ka, info, oldset, regs);
+
+	/* Restart a system call if necessary. */
+	if (in_syscall) {
+		/* Check the return code */
+		switch (regs->gr[28]) {
+		case -ERESTART_RESTARTBLOCK:
+			current_thread_info()->restart_block.fn = do_no_restart_syscall;
+		case -ERESTARTNOHAND:
+			DBG(1,"ERESTARTNOHAND: returning -EINTR\n");
+			regs->gr[28] = -EINTR;
+			break;
+
+		case -ERESTARTSYS:
+			if (!(ka->sa.sa_flags & SA_RESTART)) {
+				DBG(1,"ERESTARTSYS: putting -EINTR\n");
+				regs->gr[28] = -EINTR;
+				break;
+			}
+			/* fallthrough */
+		case -ERESTARTNOINTR:
+			/* A syscall is just a branch, so all
+			   we have to do is fiddle the return pointer. */
+			regs->gr[31] -= 8; /* delayed branching */
+			/* Preserve original r28. */
+			regs->gr[28] = regs->orig_r28;
+			break;
+		}
+	}
 	
 	/* Set up the stack frame */
-	if (!setup_rt_frame(sig, ka, info, oldset, regs, in_syscall))
-		return 0;
+	ret = setup_rt_frame(sig, ka, info, oldset, regs, in_syscall);
 
-	spin_lock_irq(&current->sighand->siglock);
-	sigorsets(&current->blocked,&current->blocked,&ka->sa.sa_mask);
-	if (!(ka->sa.sa_flags & SA_NODEFER))
-		sigaddset(&current->blocked,sig);
-	recalc_sigpending();
-	spin_unlock_irq(&current->sighand->siglock);
-	return 1;
+	if (ret == 0) {
+		spin_lock_irqsave(&current->sighand->siglock, flags);
+		sigorsets(&current->blocked, &current->blocked, &ka->sa.sa_mask);
+		if (!(ka->sa.sa_flags & SA_NODEFER))
+			sigaddset(&current->blocked,sig);
+		recalc_sigpending();
+		spin_unlock_irqrestore(&current->sighand->siglock, flags);
+	}
+
+	return ret;
+}
+
+/* Setup a trampoline to restart the syscall
+ * with __NR_restart_syscall
+ *
+ *  0: <return address (orig r31)>
+ *  4: <2nd half for 64-bit>
+ *  8: ldw 0(%sp), %r31
+ * 12: be 0x100(%sr2, %r0)
+ * 16: ldi __NR_restart_syscall, %r20
+ */
+static void setup_restart_syscall_tramp(struct pt_regs *regs)
+{
+	unsigned int *usp = (unsigned int *)regs->gr[30];
+
+#ifdef CONFIG_64BIT
+	put_user(regs->gr[31] >> 32, &usp[0]);
+	put_user(regs->gr[31] & 0xffffffff, &usp[1]);
+	put_user(0x0fc010df, &usp[2]);
+#else
+	put_user(regs->gr[31], &usp[0]);
+	put_user(0x0fc0109f, &usp[2]);
+#endif
+	put_user(0xe0008200, &usp[3]);
+	put_user(0x34140000, &usp[4]);
+
+	/* Stack is 64-byte aligned, and we only need
+	 * to flush 1 cache line.
+	 * Flushing one cacheline is cheap.
+	 * "sync" on bigger (> 4 way) boxes is not.
+	 */
+	asm("fdc %%r0(%%sr3, %0)\n"
+	    "sync\n"
+	    "fic %%r0(%%sr3, %0)\n"
+	    "sync\n"
+	    : : "r"(regs->gr[30]));
+
+	regs->gr[31] = regs->gr[30] + 8;
+	/* Preserve original r28. */
+	regs->gr[28] = regs->orig_r28;
+
+	return;
 }
 
 /*
@@ -529,130 +559,91 @@ handle_signal(unsigned long sig, siginfo
  * us due to the magic of delayed branching.
  */
 
-asmlinkage int
-do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall)
+static void
+parisc_do_signal(struct pt_regs *regs, int in_syscall)
 {
 	siginfo_t info;
+	sigset_t *oldset;
 	struct k_sigaction ka;
 	int signr;
 
 	DBG(1,"\ndo_signal: oldset=0x%p, regs=0x%p, sr7 %#lx, in_syscall=%d\n",
 	       oldset, regs, regs->sr[7], in_syscall);
 
-	/* Everyone else checks to see if they are in kernel mode at
-	   this point and exits if that's the case.  I'm not sure why
-	   we would be called in that case, but for some reason we
-	   are. */
+	if (!user_mode(regs))
+		return;
 
-	if (!oldset)
+	if (test_thread_flag(TIF_RESTORE_SIGMASK))
+		oldset = &current->saved_sigmask;
+	else
 		oldset = &current->blocked;
 
 	DBG(1,"do_signal: oldset %08lx / %08lx\n", 
 		oldset->sig[0], oldset->sig[1]);
 
-
 	/* May need to force signal if handle_signal failed to deliver */
-	while (1) {
-	  
-		signr = get_signal_to_deliver(&info, &ka, regs, NULL);
-		DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
+	signr = get_signal_to_deliver(&info, &ka, regs, NULL);
+	DBG(3,"do_signal: signr = %d, regs->gr[28] = %ld\n", signr, regs->gr[28]); 
 	
-		if (signr <= 0)
-		  break;
-		
-		/* Restart a system call if necessary. */
-		if (in_syscall) {
-			/* Check the return code */
-			switch (regs->gr[28]) {
-		        case -ERESTART_RESTARTBLOCK:
-				current_thread_info()->restart_block.fn = do_no_restart_syscall;
-			case -ERESTARTNOHAND:
-				DBG(1,"ERESTARTNOHAND: returning -EINTR\n");
-				regs->gr[28] = -EINTR;
-				break;
-
-			case -ERESTARTSYS:
-				if (!(ka.sa.sa_flags & SA_RESTART)) {
-					DBG(1,"ERESTARTSYS: putting -EINTR\n");
-					regs->gr[28] = -EINTR;
-					break;
-				}
-			/* fallthrough */
-			case -ERESTARTNOINTR:
-				/* A syscall is just a branch, so all
-				   we have to do is fiddle the return pointer. */
-				regs->gr[31] -= 8; /* delayed branching */
-				/* Preserve original r28. */
-				regs->gr[28] = regs->orig_r28;
-				break;
-			}
-		}
+	if (signr > 0) {
 		/* Whee!  Actually deliver the signal.  If the
-		   delivery failed, we need to continue to iterate in
-		   this loop so we can deliver the SIGSEGV... */
-		if (handle_signal(signr, &info, &ka, oldset, regs, in_syscall)) {
+		 * delivery failed, we need to continue to iterate in
+		 * this loop so we can deliver the SIGSEGV...
+		 */
+		if (handle_signal(signr, &info, &ka, oldset, regs, in_syscall) == 0) {
 			DBG(1,KERN_DEBUG "do_signal: Exit (success), regs->gr[28] = %ld\n",
-				regs->gr[28]);
-			return 1;
+			    regs->gr[28]);
+			if (test_thread_flag(TIF_RESTORE_SIGMASK))
+				clear_thread_flag(TIF_RESTORE_SIGMASK);
+			return;
 		}
 	}
-	/* end of while(1) looping forever if we can't force a signal */
 
 	/* Did we come from a system call? */
 	if (in_syscall) {
 		/* Restart the system call - no handlers present */
-		if (regs->gr[28] == -ERESTART_RESTARTBLOCK) {
-			unsigned int *usp = (unsigned int *)regs->gr[30];
-
-			/* Setup a trampoline to restart the syscall
-			 * with __NR_restart_syscall
-			 *
-			 *  0: <return address (orig r31)>
-			 *  4: <2nd half for 64-bit>
-			 *  8: ldw 0(%sp), %r31
-			 * 12: be 0x100(%sr2, %r0)
-			 * 16: ldi __NR_restart_syscall, %r20
-			 */
-#ifndef __LP64__
-			put_user(regs->gr[31], &usp[0]);
-			put_user(0x0fc0109f, &usp[2]);
-#else
-			put_user(regs->gr[31] >> 32, &usp[0]);
-			put_user(regs->gr[31] & 0xffffffff, &usp[1]);
-			put_user(0x0fc010df, &usp[2]);
-#endif
-			put_user(0xe0008200, &usp[3]);
-			put_user(0x34140000, &usp[4]);
-
-			/* Stack is 64-byte aligned, and we only need
-			 * to flush 1 cache line.
-			 * Flushing one cacheline is cheap.
-			 * "sync" on bigger (> 4 way) boxes is not.
+		switch(regs->gr[28]) {
+		case -ERESTART_RESTARTBLOCK:
+			/* Install the restart syscall trampoline on the
+			 * userspace stack.
 			 */
-			asm("fdc %%r0(%%sr3, %0)\n"
-			    "sync\n"
-			    "fic %%r0(%%sr3, %0)\n"
-			    "sync\n"
-			    : : "r"(regs->gr[30]));
-
-			regs->gr[31] = regs->gr[30] + 8;
-			/* Preserve original r28. */
-			regs->gr[28] = regs->orig_r28;
-		} else if (regs->gr[28] == -ERESTARTNOHAND ||
-		           regs->gr[28] == -ERESTARTSYS ||
-		           regs->gr[28] == -ERESTARTNOINTR) {
+			setup_restart_syscall_tramp(regs);
+			break;
+		case -ERESTARTNOHAND:
+		case -ERESTARTSYS:
+		case -ERESTARTNOINTR:
 			/* Hooray for delayed branching.  We don't
-                           have to restore %r20 (the system call
-                           number) because it gets loaded in the delay
-                           slot of the branch external instruction. */
+			 * have to restore %r20 (the system call
+			 * number) because it gets loaded in the delay
+			 * slot of the branch external instruction.
+			 */
 			regs->gr[31] -= 8;
 			/* Preserve original r28. */
 			regs->gr[28] = regs->orig_r28;
+			break;
 		}
 	}
 	
 	DBG(1,"do_signal: Exit (not delivered), regs->gr[28] = %ld\n", 
 		regs->gr[28]);
 
-	return 0;
+	/* If there's no signal to deliver, we just put the saved
+	 * sigmask back.
+	 */
+	if (test_thread_flag(TIF_RESTORE_SIGMASK)) {
+		clear_thread_flag(TIF_RESTORE_SIGMASK);
+		sigprocmask(SIG_SETMASK, &current->saved_sigmask, NULL);
+	}
+
+	return;
+}
+
+void do_notify_resume(struct pt_regs *regs, int in_syscall)
+{
+	/* Hooks go here. */
+	if (test_thread_flag(TIF_SIGPENDING) ||
+	    test_thread_flag(TIF_RESTORE_SIGMASK))
+		parisc_do_signal(regs, in_syscall);
+
+	return;
 }
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index bbeeb61..5744506 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -283,7 +283,7 @@
 	 * struct from a 32-bit user-space app.
 	 */
 	ENTRY_SAME(rt_sigqueueinfo)
-	ENTRY_SAME(rt_sigsuspend_wrapper) /* not really SAME -- see the code */
+	ENTRY_COMP(rt_sigsuspend)
 	ENTRY_SAME(chown)		/* 180 */
 	/* setsockopt() used by iptables: SO_SET_REPLACE/SO_SET_ADD_COUNTERS */
 	ENTRY_COMP(setsockopt)
@@ -377,8 +377,8 @@
 	ENTRY_SAME(inotify_init)
 	ENTRY_SAME(inotify_add_watch)	/* 270 */
 	ENTRY_SAME(inotify_rm_watch)
-	ENTRY_SAME(ni_syscall)		/* 271 ENTRY_COMP(pselect6) */
-	ENTRY_SAME(ni_syscall)		/* 272 ENTRY_COMP(ppoll) */
+	ENTRY_COMP(pselect6)
+	ENTRY_COMP(ppoll)
 	ENTRY_SAME(migrate_pages)
 	ENTRY_COMP(openat)		/* 275 */
 	ENTRY_SAME(mkdirat)
diff --git a/include/asm-parisc/assembly.h b/include/asm-parisc/assembly.h
index 3ce3440..00e387c 100644
--- a/include/asm-parisc/assembly.h
+++ b/include/asm-parisc/assembly.h
@@ -30,6 +30,7 @@
 #define LDREGM	ldd,mb
 #define STREGM	std,ma
 #define SHRREG  shrd
+#define SHLREG	shld
 #define RP_OFFSET	16
 #define FRAME_SIZE	128
 #define CALLEE_REG_FRAME_SIZE	144
@@ -39,7 +40,8 @@
 #define LDREGX  ldwx,s
 #define LDREGM	ldwm
 #define STREGM	stwm
-#define SHRREG  shr
+#define SHRREG  shrw
+#define SHLREG	shld
 #define RP_OFFSET	20
 #define FRAME_SIZE	64
 #define CALLEE_REG_FRAME_SIZE	128
diff --git a/include/asm-parisc/compat.h b/include/asm-parisc/compat.h
index 289624d..cea3c35 100644
--- a/include/asm-parisc/compat.h
+++ b/include/asm-parisc/compat.h
@@ -5,6 +5,7 @@
  */
 #include <linux/types.h>
 #include <linux/sched.h>
+#include <linux/personality.h>
 
 #define COMPAT_USER_HZ 100
 
@@ -149,4 +150,19 @@ static __inline__ void __user *compat_al
 	return (void __user *)regs->gr[30];
 }
 
+static inline int __is_compat_task(struct task_struct *t)
+{
+	return (personality(t->personality) == PER_LINUX32);
+}
+
+static inline int __is_native_task(struct task_struct *t)
+{
+	return (personality(t->personality) == PER_LINUX);
+}
+
+static inline int is_compat_task(void)
+{
+	return __is_compat_task(current);
+}
+
 #endif /* _ASM_PARISC_COMPAT_H */
diff --git a/include/asm-parisc/thread_info.h b/include/asm-parisc/thread_info.h
index f2f83b0..5ae7b38 100644
--- a/include/asm-parisc/thread_info.h
+++ b/include/asm-parisc/thread_info.h
@@ -62,6 +62,7 @@ struct thread_info {
 #define TIF_POLLING_NRFLAG	4	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT               5       /* 32 bit binary */
 #define TIF_MEMDIE		6
+#define TIF_RESTORE_SIGMASK	7	/* restore signal mask in do_signal() */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
@@ -69,9 +70,10 @@ struct thread_info {
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_POLLING_NRFLAG	(1 << TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1 << TIF_32BIT)
+#define _TIF_RESTORE_SIGMASK	(1 << TIF_RESTORE_SIGMASK)
 
 #define _TIF_USER_WORK_MASK     (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | \
-                                 _TIF_NEED_RESCHED)
+                                 _TIF_NEED_RESCHED | _TIF_RESTORE_SIGMASK)
 
 #endif /* __KERNEL__ */
 
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index c56fccb..452e9cb 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -950,6 +950,8 @@ type name(type1 arg1, type2 arg2, type3 
 #define __ARCH_WANT_SYS_SIGPENDING
 #define __ARCH_WANT_SYS_SIGPROCMASK
 #define __ARCH_WANT_SYS_RT_SIGACTION
+#define __ARCH_WANT_SYS_RT_SIGSUSPEND
+#define __ARCH_WANT_COMPAT_SYS_RT_SIGSUSPEND
 #endif
 
 /* mmap & mmap2 take 6 arguments */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
