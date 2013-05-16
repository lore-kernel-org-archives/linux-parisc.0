From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: only re-enable interrupts if we need to schedule or
 deliver signals when returning to userspace
Date: Thu, 16 May 2013 21:22:20 +0200
Message-ID: <20130516192220.GA32308@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: stable@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

please include to stable kernel v3.9 series.
upstream commit c207a76bf155cb5cf24cf849c08f6555e9180594

From: John David Anglin <dave.anglin@bell.net>

Helge and I have found that we have a kernel stack overflow problem
which causes a variety of random failures.  Currently, we re-enable
interrupts when returning from an external interrupt incase we need to
schedule or delivery signals.  As a result, a potentially unlimited
number of interrupts can occur while we are running on the kernel stack.
It is very limited in space (currently, 16k).  This change defers
enabling interrupts until we have actually decided to schedule or
delivery signals.  This only occurs when we about to return to
userspace.  This limits the number of interrupts on the kernel stack to
one.  In other cases, interrupts remain disabled until the final return
from interrupt (rfi).

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 36f4f1d..3f3326d 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -833,11 +833,6 @@ ENTRY(syscall_exit_rfi)
 	STREG   %r19,PT_SR7(%r16)
 
 intr_return:
-	/* NOTE: Need to enable interrupts incase we schedule. */
-	ssm     PSW_SM_I, %r0
-
-intr_check_resched:
-
 	/* check for reschedule */
 	mfctl   %cr30,%r1
 	LDREG   TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
@@ -864,6 +859,11 @@ intr_check_sig:
 	LDREG	PT_IASQ1(%r16), %r20
 	cmpib,COND(=),n 0,%r20,intr_restore /* backward */
 
+	/* NOTE: We need to enable interrupts if we have to deliver
+	 * signals. We used to do this earlier but it caused kernel
+	 * stack overflows. */
+	ssm     PSW_SM_I, %r0
+
 	copy	%r0, %r25			/* long in_syscall = 0 */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
@@ -915,6 +915,10 @@ intr_do_resched:
 	cmpib,COND(=)	0, %r20, intr_do_preempt
 	nop
 
+	/* NOTE: We need to enable interrupts if we schedule.  We used
+	 * to do this earlier but it caused kernel stack overflows. */
+	ssm     PSW_SM_I, %r0
+
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
