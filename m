From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Ensure consistent state when switching to kernel
 stack at syscall entry
Date: Fri, 28 Oct 2016 22:04:14 +0200
Message-ID: <20161028200414.GA20703@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We have one critical section in the syscall entry path in which we switch from
the userspace stack to kernel stack. In the event of an external interrupt, the
interrupt code distinguishes between those two states by analyzing the value of
sr7. If sr7 is zero, it uses the kernel stack. Therefore it's important, that
the value of sr7 is in sync with the currently enabled stack.

This patch now disables interrupts while executing the critical section.  This
prevents the interrupt handler to possibly see an inconsitent state which in
the worst case can lead to crashes.

Interestingly, in the syscall exit path interrupts were already disabled in the
critical section which switches back to the userspace stack.

Cc: <stable@vger.kernel.org>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index d03422e..f13836b 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -106,8 +106,6 @@ linux_gateway_entry:
 	mtsp	%r0,%sr4			/* get kernel space into sr4 */
 	mtsp	%r0,%sr5			/* get kernel space into sr5 */
 	mtsp	%r0,%sr6			/* get kernel space into sr6 */
-	mfsp    %sr7,%r1                        /* save user sr7 */
-	mtsp    %r1,%sr3                        /* and store it in sr3 */
 
 #ifdef CONFIG_64BIT
 	/* for now we can *always* set the W bit on entry to the syscall
@@ -134,20 +132,26 @@ linux_gateway_entry:
 1:	
 #endif
 	mfctl   %cr30,%r1
-	xor     %r1,%r30,%r30                   /* ye olde xor trick */
-	xor     %r1,%r30,%r1
-	xor     %r1,%r30,%r30
-	
-	ldo     THREAD_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */
+	ldo     THREAD_SZ_ALGN+FRAME_SIZE(%r1),%r1  /* set up kernel stack */
 
 	/* N.B.: It is critical that we don't set sr7 to 0 until r30
 	 *       contains a valid kernel stack pointer. It is also
 	 *       critical that we don't start using the kernel stack
-	 *       until after sr7 has been set to 0.
+	 *       until after sr7 has been set to 0. To ensure this we
+	 *       use a rsm/ssm pair to make this operation atomic.
+	 *       At syscall entry %sr2 points to kernel space, otherwise
+	 *       syscalls wouldn't work.
 	 */
+	rsm     PSW_SM_I, %r0			/* turn interrupts off */
+	STREGM	%r30,FRAME_SIZE(%sr2, %r1)	/* save usp on kernel stack */
+	copy    %r1, %r30			/* switch to kernel stack */
+
+	mfsp    %sr7,%r1                        /* get user sr7 */
+	mtsp    %r1,%sr3                        /* store user sr7 in sr3 */
 
 	mtsp	%r0,%sr7			/* get kernel space into sr7 */
-	STREGM	%r1,FRAME_SIZE(%r30)		/* save r1 (usp) here for now */
+	ssm     PSW_SM_I, %r0			/* turn interrupts on */
+
 	mfctl	%cr30,%r1			/* get task ptr in %r1 */
 	LDREG	TI_TASK(%r1),%r1
 
