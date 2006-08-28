From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [RFT] TIF_RESTORE_SIGMASK
Date: Sun, 27 Aug 2006 21:15:28 -0400
Message-ID: <20060828011528.GB6785@athena.road.mcmartin.ca>
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

Could someone taller than me please review this?

-- Kyle

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 663631c..5405a99 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1089,14 +1089,13 @@ intr_do_signal:
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
@@ -2267,16 +2266,14 @@ syscall_do_signal:
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
+	ldi	1, %r25				/* long in_syscall */
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
 	ldo	TASK_REGS(%r1), %r20		/* reload pt_regs */
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 9a04272..e8de263 100644
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
@@ -93,21 +91,20 @@ #endif
 			return -EFAULT;
 	}
 
+	/* sigmask(SIGKILL) | sigmask(SIGSTOP) */
 	sigdelsetmask(&newset, ~_BLOCKABLE);
 
 	spin_lock_irq(&current->sighand->siglock);
-	saveset = current->blocked;
+	current->saved_sigmask = current->blocked;
 	current->blocked = newset;
 	recalc_sigpending();
 	spin_unlock_irq(&current->sighand->siglock);
 
-	regs->gr[28] = -EINTR;
-	while (1) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule();
-		if (do_signal(&saveset, regs, 1))
-			return -EINTR;
-	}
+	current->state = TASK_INTERRUPTIBLE;
+	schedule();
+	set_thread_flag(TIF_RESTORE_SIGMASK);
+
+	return -ERESTARTNOHAND;
 }
 
 /*
@@ -528,12 +525,13 @@ handle_signal(unsigned long sig, siginfo
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
@@ -543,7 +541,9 @@ do_signal(sigset_t *oldset, struct pt_re
 	   we would be called in that case, but for some reason we
 	   are. */
 
-	if (!oldset)
+	if (test_thread_flag(TIF_RESTORE_SIGMASK))
+		oldset = &current->saved_sigmask;
+	else
 		oldset = &current->blocked;
 
 	DBG(1,"do_signal: oldset %08lx / %08lx\n", 
@@ -592,7 +592,9 @@ do_signal(sigset_t *oldset, struct pt_re
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
@@ -653,5 +655,17 @@ #endif
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
index 701d66a..8ee1576 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -377,8 +377,8 @@ #endif
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
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
