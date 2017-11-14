From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Reduce probability of stack overflow
Date: Mon, 13 Nov 2017 19:35:33 -0500
Message-ID: <0B5E3032-0DA1-457B-B32E-21B318FDB687@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-46--263411265
Cc: Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-46--263411265
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Even with a 32 kB thread stack, I have seen instances where the thread =
stack overflowed on the mx3210 buildd.
Detection of stack overflow only occurs when we have an external =
interrupt.  When an external interrupt occurs,
we switch to the thread stack if we are not already on a kernel stack.  =
Then, registers and specials are saved to
the kernel stack.

The bug occurs in intr_return where interrupts are reenabled prior to =
returning from the interrupt.  This was done
incase we need to schedule or deliver signals.  However, it introduces =
the possibility that multiple external interrupts
may occur on the thread stack and cause a stack overflow.  These might =
not be detected and cause the kernel to
misbehave in random ways.

This patch changes the code to only reenable interrupts when we are =
going to schedule or deliver signals.  As a
result, we generally return from an interrupt before reenabling =
interrupts.  This minimizes the growth of the thread
stack.

This patch conflicts with the patch proposed by Helge here:
https://patchwork.kernel.org/patch/9970169/

In testing, I found that the thread stack can be 16 kB  when using an =
irq stack .  Without it, the thread stack needs
to be 32 kB.  Currently, the irq stack is 32 kB.  While it probably =
could be 16 kB, I would prefer to leave it as is for
safety.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-46--263411265
Content-Disposition: attachment;
	filename=low-stack.d.stack
Content-Type: application/octet-stream;
	name="low-stack.d.stack"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index bc208136bbb2..a960a5e9cfb5 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -34,7 +34,12 @@ struct thread_info {
 
 /* thread information allocation */
 
+#ifdef CONFIG_IRQSTACKS
+#define THREAD_SIZE_ORDER	2 /* PA-RISC requires at least 16k stack */
+#else
 #define THREAD_SIZE_ORDER	3 /* PA-RISC requires at least 32k stack */
+#endif
+
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index a4fd296c958e..0d1603eb1f9f 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -878,9 +878,6 @@ ENTRY_CFI(syscall_exit_rfi)
 	STREG   %r19,PT_SR7(%r16)
 
 intr_return:
-	/* NOTE: Need to enable interrupts incase we schedule. */
-	ssm     PSW_SM_I, %r0
-
 	/* check for reschedule */
 	mfctl   %cr30,%r1
 	LDREG   TI_FLAGS(%r1),%r19	/* sched.h: TIF_NEED_RESCHED */
@@ -912,6 +909,7 @@ intr_check_sig:
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 
+	ssm     PSW_SM_I, %r0
 	BL	do_notify_resume,%r2
 	copy	%r16, %r26			/* struct pt_regs *regs */
 
@@ -963,6 +961,7 @@ intr_do_resched:
 #endif
 
 	ldil	L%intr_check_sig, %r2
+	ssm     PSW_SM_I, %r0
 #ifndef CONFIG_64BIT
 	b	schedule
 #else

--Apple-Mail-46--263411265
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-46--263411265--
