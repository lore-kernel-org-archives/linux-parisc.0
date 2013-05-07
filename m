From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: only re-enable interrupts if we need to schedule or deliver signals when returning to userspace
Date: Mon, 6 May 2013 20:07:25 -0400
Message-ID: <BLU0-SMTP2976B214C9FCD25EE260CD97BA0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-23-883505527"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-23-883505527
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Helge and I have found that we have a kernel stack overflow problem  
which causes a variety of random failures.
Currently, we re-enable interrupts when returning from an external  
interrupt incase we need to schedule or delivery
signals.  As a result, a potentially unlimited number of interrupts  
can occur while we are running on the kernel
stack.  It is very limited in space (currently, 16k).  This change  
defers enabling interrupts until we have
actually decided to schedule or delivery signals.  This only occurs  
when we about to return to userspace.  This
limits the number of interrupts on the kernel stack to one.  In other  
cases, interrupts remain disabled until the
final return from interrupt (rfi).

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-23-883505527
Content-Disposition: attachment; filename="irq_enable.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="irq_enable.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..bd7bec3 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -825,11 +826,6 @@ ENTRY(syscall_exit_rfi)
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
@@ -856,6 +852,11 @@ intr_check_sig:
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
@@ -907,6 +908,10 @@ intr_do_resched:
 	cmpib,COND(=)	0, %r20, intr_do_preempt
 	nop
 
+	/* NOTE: We need to enable interrupts if we schedule.  We used
+	 * to do this earlier but it caused kernel stack overflows. */
+	ssm     PSW_SM_I, %r0
+
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif

--Apple-Mail-23-883505527
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-23-883505527--
