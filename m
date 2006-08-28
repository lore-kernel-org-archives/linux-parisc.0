From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [RFT] TIF_RESTORE_SIGMASK
Date: Mon, 28 Aug 2006 16:21:41 -0400
Message-ID: <20060828202141.GC11462@athena.road.mcmartin.ca>
References: <20060828011528.GB6785@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060828011528.GB6785@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Round 2, Fight!

Fix a few bugs since the last patch... Properly check and loop
on the thread_info flags in intr_check_sig and syscall_check_sig.

Switch to using the generic {compat_,}sys_rt_sigsuspend.

Kill rt_sigsuspend_wrapper since we no longer need a pt_regs
argument.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

Boots, and seems to run fine. Needs more extensive testing though.

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 663631c..e52e0c7 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -978,11 +978,39 @@ intr_check_resched:
 	LDREG   TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
 	bb,<,n	%r19,31-TIF_NEED_RESCHED,intr_do_resched /* forward */
 
+	.import do_notify_resume,code
 intr_check_sig:
 	/* As above */
 	mfctl   %cr30,%r1
-	LDREG	TI_FLAGS(%r1),%r19	/* sched.h: TIF_SIGPENDING */
-	bb,<,n %r19, 31-TIF_SIGPENDING, intr_do_signal /* forward */
+	LDREG	TI_FLAGS(%r1),%r19
+	load32	(_TIF_SIGPENDING|_TIF_RESTORE_SIGMASK), %r20
+	and,COND(<>)	%r19, %r20, %r0
+	b,n	intr_restore	/* skip past if we've nothing to do */
+
+	/* This check is critical to having LWS
+	 * working. The IASQ is zero on the gateway
+	 * page and we cannot deliver any signals until
+	 * we get off the gateway page.
+	 *
+	 * Only do signals if we are returning to user space
+	 */
+	LDREG	PT_IASQ0(%r16), %r20
+	CMPIB= 0,%r20,intr_restore /* backward */
+	nop
+	LDREG	PT_IASQ1(%r16), %r20
+	CMPIB= 0,%r20,intr_restore /* backward */
+	nop
+
+	copy	%r0, %r25			/* long in_syscall = 0 */
+#ifdef CONFIG_64BIT
+	ldo	-16(%r30),%r29			/* Reference param save area */
+#endif
+
+	BL	do_notify_resume,%r2
+	copy	%r16, %r26			/* struct pt_regs *regs */
+
+	b	intr_check_sig
+	nop
 
 intr_restore:
 	copy            %r16,%r29
@@ -1072,35 +1100,6 @@ intr_do_preempt:
 	b	intr_restore		/* ssm PSW_SM_I done by intr_restore */
 #endif /* CONFIG_PREEMPT */
 
-	.import do_signal,code
-intr_do_signal:
-	/* 
-		This check is critical to having LWS
-		working. The IASQ is zero on the gateway
-		page and we cannot deliver any signals until
-		we get off the gateway page.
-
-		Only do signals if we are returning to user space 
-	*/
-	LDREG	PT_IASQ0(%r16), %r20
-	CMPIB= 0,%r20,intr_restore /* backward */
-	nop
-	LDREG	PT_IASQ1(%r16), %r20
-	CMPIB= 0,%r20,intr_restore /* backward */
-	nop
-
-	copy	%r0, %r24			/* unsigned long in_syscall */
-	copy	%r16, %r25			/* struct pt_regs *regs */
-#ifdef CONFIG_64BIT
-	ldo	-16(%r30),%r29			/* Reference param save area */
-#endif
-
-	BL	do_signal,%r2
-	copy	%r0, %r26			/* sigset_t *oldset = NULL */
-
-	b	intr_check_sig
-	nop
-
 	/*
 	 * External interrupts.
 	 */
@@ -2028,32 +2027,6 @@ sys32_sigaltstack_wrapper:
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
 
@@ -2119,9 +2092,35 @@ syscall_check_resched:
 	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19	/* long */
 	bb,<,n	%r19, 31-TIF_NEED_RESCHED, syscall_do_resched /* forward */
 
+	.import do_signal,code
 syscall_check_sig:
-	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19    /* get ti flags */
-	bb,<,n	%r19, 31-TIF_SIGPENDING, syscall_do_signal /* forward */
+	LDREG	TI_FLAGS-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r19
+	load32	(_TIF_SIGPENDING|_TIF_RESTORE_SIGMASK), %r26
+	and,COND(<>)	%r19, %r26, %r0
+	b,n	syscall_restore	/* skip past if we've nothing to do */
+
+syscall_do_signal:
+	/* Save callee-save registers (for sigcontext).
+	 * FIXME: After this point the process structure should be
+	 * consistent with all the relevant state of the process
+	 * before the syscall.  We need to verify this.
+	 */
+	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1 
+	ldo	TASK_REGS(%r1), %r26		/* struct pt_regs *regs */
+	reg_save %r26
+
+#ifdef CONFIG_64BIT
+	ldo	-16(%r30),%r29			/* Reference param save area */
+#endif
+
+	BL	do_notify_resume,%r2
+	ldi	1, %r25				/* long in_syscall = 1 */
+
+	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
+	ldo	TASK_REGS(%r1), %r20		/* reload pt_regs */
+	reg_restore %r20
+
+	b,n     syscall_check_sig
 
 syscall_restore:
 	/* Are we being ptraced? */
@@ -2260,30 +2259,6 @@ #endif
 	b       syscall_check_bh  /* if resched, we start over again */
 	nop
 
-	.import do_signal,code
-syscall_do_signal:
-	/* Save callee-save registers (for sigcontext).
-	   FIXME: After this point the process structure should be
-	   consistent with all the relevant state of the process
-	   before the syscall.  We need to verify this. */
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1 
-	ldo	TASK_REGS(%r1), %r25		/* struct pt_regs *regs */
-	reg_save %r25
-
-	ldi	1, %r24				/* unsigned long in_syscall */
-
-#ifdef CONFIG_64BIT
-	ldo	-16(%r30),%r29			/* Reference param save area */
-#endif
-	BL	do_signal,%r2
-	copy	%r0, %r26			/* sigset_t *oldset = NULL */
-
-	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
-	ldo	TASK_REGS(%r1), %r20		/* reload pt_regs */
-	reg_restore %r20
-
-	b,n     syscall_check_sig
-
 	/*
 	 * get_register is used by the non access tlb miss handlers to
 	 * copy the value of the general register specified in r8 into
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 9a04272..2710f7a 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -58,8 +58,6 @@ #define _BLOCKABLE (~(sigmask(SIGKILL) |
  * this. */
 #define A(__x)	((unsigned long)(__x))
 
-int do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall);
-
 /*
  * Atomically swap in the new signal mask, and wait for a signal.
  */
@@ -67,49 +65,6 @@ #ifdef __LP64__
 #include "sys32.h"
 #endif
 
-asmlinkage int
-sys_rt_sigsuspend(sigset_t __user *unewset, size_t sigsetsize, struct pt_regs *regs)
-{
-	sigset_t saveset, newset;
-#ifdef __LP64__
-	compat_sigset_t newset32;
-
-	if (is_compat_task()) {
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
@@ -528,12 +483,13 @@ handle_signal(unsigned long sig, siginfo
  * us due to the magic of delayed branching.
  */
 
-asmlinkage int
-do_signal(sigset_t *oldset, struct pt_regs *regs, int in_syscall)
+asmlinkage void
+do_signal(struct pt_regs *regs, long in_syscall)
 {
 	siginfo_t info;
 	struct k_sigaction ka;
 	int signr;
+	sigset_t *oldset;
 
 	DBG(1,"\ndo_signal: oldset=0x%p, regs=0x%p, sr7 %#lx, in_syscall=%d\n",
 	       oldset, regs, regs->sr[7], in_syscall);
@@ -543,7 +499,9 @@ do_signal(sigset_t *oldset, struct pt_re
 	   we would be called in that case, but for some reason we
 	   are. */
 
-	if (!oldset)
+	if (test_thread_flag(TIF_RESTORE_SIGMASK))
+		oldset = &current->saved_sigmask;
+	else
 		oldset = &current->blocked;
 
 	DBG(1,"do_signal: oldset %08lx / %08lx\n", 
@@ -592,7 +550,9 @@ do_signal(sigset_t *oldset, struct pt_re
 		if (handle_signal(signr, &info, &ka, oldset, regs, in_syscall)) {
 			DBG(1,KERN_DEBUG "do_signal: Exit (success), regs->gr[28] = %ld\n",
 				regs->gr[28]);
-			return 1;
+			if (test_thread_flag(TIF_RESTORE_SIGMASK))
+				clear_thread_flag(TIF_RESTORE_SIGMASK);
+			return;
 		}
 	}
 	/* end of while(1) looping forever if we can't force a signal */
@@ -653,5 +613,17 @@ #endif
 	DBG(1,"do_signal: Exit (not delivered), regs->gr[28] = %ld\n", 
 		regs->gr[28]);
 
-	return 0;
+	if (test_thread_flag(TIF_RESTORE_SIGMASK)) {
+		clear_thread_flag(TIF_RESTORE_SIGMASK);
+		sigprocmask(SIG_SETMASK, &current->saved_sigmask, NULL);
+	}
+
+	return;
+}
+
+void do_notify_resume(struct pt_regs *regs, long in_syscall)
+{
+	if (test_thread_flag(TIF_SIGPENDING) ||
+	    test_thread_flag(TIF_RESTORE_SIGMASK))
+		do_signal(regs, in_syscall);
 }
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 701d66a..efa7e53 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -283,7 +283,7 @@ #endif
 	 * struct from a 32-bit user-space app.
 	 */
 	ENTRY_SAME(rt_sigqueueinfo)
-	ENTRY_SAME(rt_sigsuspend_wrapper) /* not really SAME -- see the code */
+	ENTRY_COMP(rt_sigsuspend)
 	ENTRY_SAME(chown)		/* 180 */
 	/* setsockopt() used by iptables: SO_SET_REPLACE/SO_SET_ADD_COUNTERS */
 	ENTRY_COMP(setsockopt)
diff --git a/include/asm-parisc/thread_info.h b/include/asm-parisc/thread_info.h
index f2f83b0..949314c 100644
--- a/include/asm-parisc/thread_info.h
+++ b/include/asm-parisc/thread_info.h
@@ -62,6 +62,7 @@ #define TIF_NEED_RESCHED	3	/* rescheduli
 #define TIF_POLLING_NRFLAG	4	/* true if poll_idle() is polling TIF_NEED_RESCHED */
 #define TIF_32BIT               5       /* 32 bit binary */
 #define TIF_MEMDIE		6
+#define TIF_RESTORE_SIGMASK	7	/* restore saved signal mask */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
@@ -69,9 +70,10 @@ #define _TIF_SIGPENDING		(1 << TIF_SIGPE
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_POLLING_NRFLAG	(1 << TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1 << TIF_32BIT)
+#define _TIF_RESTORE_SIGMASK	(1 << TIF_RESTORE_SIGMASK)
 
 #define _TIF_USER_WORK_MASK     (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | \
-                                 _TIF_NEED_RESCHED)
+                                 _TIF_NEED_RESCHED | _TIF_RESTORE_SIGMASK)
 
 #endif /* __KERNEL__ */
 
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index 27bcfad..eb8a14f 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -951,6 +951,8 @@ #define __ARCH_WANT_SYS_OLDUMOUNT
 #define __ARCH_WANT_SYS_SIGPENDING
 #define __ARCH_WANT_SYS_SIGPROCMASK
 #define __ARCH_WANT_SYS_RT_SIGACTION
+#define __ARCH_WANT_SYS_RT_SIGSUSPEND
+#define __ARCH_WANT_COMPAT_SYS_RT_SIGSUSPEND
 
 /* mmap & mmap2 take 6 arguments */
 #define _syscall6(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5,type6,arg6) \
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
