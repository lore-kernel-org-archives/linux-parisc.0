From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Re-enable interrupts early
Date: Mon, 24 Oct 2016 21:55:58 +0200
Message-ID: <20161024195553.GA27612@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since kernel 3.9 we re-enable interrupts quite late due to commit c207a76bf15
("parisc: only re-enable interrupts if we need to schedule or deliver signals
when returning to userspace"). At that time the parisc kernel had no dedicated
IRQ stack, and this commit prevented kernel stack overflows.

But since commit 200c880420a ("parisc: implement irq stacks") we now have an
IRQ stack, so we may be safe now.  And when CONFIG_DEBUG_STACKOVERFLOW=y is
enabled, we can even check at runtime for overflows.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4fcff2d..ad4cb16 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -878,6 +878,9 @@ ENTRY_CFI(syscall_exit_rfi)
 	STREG   %r19,PT_SR7(%r16)
 
 intr_return:
+	/* NOTE: Need to enable interrupts incase we schedule. */
+	ssm     PSW_SM_I, %r0
+
 	/* check for reschedule */
 	mfctl   %cr30,%r1
 	LDREG   TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
@@ -904,11 +907,6 @@ intr_check_sig:
 	LDREG	PT_IASQ1(%r16), %r20
 	cmpib,COND(=),n 0,%r20,intr_restore /* backward */
 
-	/* NOTE: We need to enable interrupts if we have to deliver
-	 * signals. We used to do this earlier but it caused kernel
-	 * stack overflows. */
-	ssm     PSW_SM_I, %r0
-
 	copy	%r0, %r25			/* long in_syscall = 0 */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
@@ -960,10 +958,6 @@ intr_do_resched:
 	cmpib,COND(=)	0, %r20, intr_do_preempt
 	nop
 
-	/* NOTE: We need to enable interrupts if we schedule.  We used
-	 * to do this earlier but it caused kernel stack overflows. */
-	ssm     PSW_SM_I, %r0
