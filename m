From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] Document LWS ABI.
Date: Mon, 29 Dec 2008 22:47:38 +0100
Message-ID: <4959457A.4060709@gmx.de>
References: <20080716030552.766ED4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070908010606010208060901"
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080716030552.766ED4E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------070908010606010208060901
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Carlos, Dave,

This patch hasn't been finally discussed (and merged) yet.
I've attached the last version of the patch from Carlos, that way it get 
archived in Kyle's Patchwork as well :-)

My personal opinion is, that we should try to reduce the number of clobbered 
registers (which is in line with what Dave said below).

Thread is here:
http://marc.info/?t=121612540800004&r=1&w=2

Helge

John David Anglin wrote:
>> The question is "Are you OK with the existing ABI?" :-)
> 
> No.  As I understand it, r2 doesn't need to be clobbered because
> glibc doesn't currently clobber it.  So, using it in the LWS code
> would cause an ABI break.  That's one register back to userspace.
> 
> I want to keep r19 and r27 for userspace so the PIC register doesn't
> have to be saved and restored in the asm (linux-atomic.c is compiled
> as PIC code).  You can have r29.
> 
> That leaves three free registers for the LWS code: r22, r23 and r29.
> The LWS ABI has r1, r20-r26 and r28-r31.  Userspace has two call-clobbered
> registers free across the asm in PIC code, and three in non-PIC code.
> That's enough to efficiently perform the error comparisons.
> 
> The asm would be more efficient if the registers used for lws_mem,
> lws_old and lws_new were not written to.  This occurs only for the
> call in the 32-bit runtime with a 64-bit kernel.  As it stands,
> the lws_mem, lws_old and lws_new arguments get reloaded every time
> around the EAGAIN loop.  This is the crucial code in the compare
> and swap:
> 
>         /* The load and store could fail */
> 1:      ldw     0(%sr3,%r26), %r28
> 	sub,<>  %r28, %r25, %r0
> 2:      stw     %r24, 0(%sr3,%r26)
> 
> The sub,<> instruction uses a 32-bit compare/subtract condition, so
> the clipping of r25 isn't necessary.  Similarly, the stw instruction
> ignores the most significant 32-bits of r24.  The value in r26 needs
> clipping but you have three free registers, and it looks like r1 is
> also free at this point in the code.  You can deposit the least
> significant 32-bits of r26 into a field of zeros in another register
> in one instruction.
> 
> It looks like lws_compare_and_swap64 and lws_compare_and_swap32 become
> more or less functionally identical.  The above would become something
> like:
> 
> #ifdef CONFIG_64BIT
> 	depd,z	%r26,63,32,%r1
> 1:      ldw     0(%sr3,%r1), %r28
>         sub,<>  %r28, %r25, %r0
> 2:      stw     %r24, 0(%sr3,%r1)
> #else
> 1:      ldw     0(%sr3,%r26), %r28
>         sub,<>  %r28, %r25, %r0
> 2:      stw     %r24, 0(%sr3,%r26)
> #endif
> 
> The argument clipping in the current code would be removed.  As a result,
> the branch to lws_compare_and_swap can be eliminated in the 64-bit path.
> 
> It's my impression that the tightness of the loop for the compare/exchange
> operation is important.
> 
> Dave


--------------070908010606010208060901
Content-Type: text/x-patch;
 name="syscall.S.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="syscall.S.diff"

[PARISC] Document LWS ABI and LWS cleanups.

Document the LWS ABI including implementation notes for
userspace, and comment cleanup.

Remove extraneous .align 16 after lws_lock_start.

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..3fc73ad 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -365,17 +365,51 @@ tracesys_sigexit:
 
 
 	/*********************************************************
-		Light-weight-syscall code
+		32/64-bit Light-Weight-Syscall ABI
 
-		r20 - lws number
-		r26,r25,r24,r23,r22 - Input registers
-		r28 - Function return register
-		r21 - Error code.
+		* - Indicates a hint for userspace inline asm
+		implementations.
 
-		Scracth: Any of the above that aren't being
-		currently used, including r1. 
+		Syscall number (caller-saves)
+	        - %r20
+	        * In asm clobber.
 
-		Return pointer: r31 (Not usable)
+		Argument registers (caller-saves)
+	        - %r26, %r25, %r24, %r23, %r22
+	        * In asm input.
+
+		Return registers (caller-saves)
+	        - %r28 (return), %r21 (errno)
+	        * In asm output.
+
+		Caller-saves registers
+	        - %r1, %r27, %r29
+	        - %r2 (return pointer)
+	        - %r31 (ble link register)
+	        * In asm clobber.
+
+		Callee-saves registers
+	        - %r3-%r18
+	        - %r30 (stack pointer)
+	        * Not in asm clobber.
+
+		If userspace is 32-bit:
+		Callee-saves registers
+	        - %r19 (32-bit PIC register)
+
+		Differences from 32-bit calling convention:
+		- Syscall number in %r20
+		- Additional argument register %r22 (arg4)
+		- Callee-saves %r19.
+
+		If userspace is 64-bit:
+		Callee-saves registers
+		- %r27 (64-bit PIC register)
+
+		Differences from 64-bit calling convention:
+		- Syscall number in %r20
+		- Additional argument register %r22 (arg4)
+		- Callee-saves %r27.
 
 		Error codes returned by entry path:
 
@@ -473,7 +507,8 @@ lws_compare_and_swap64:
 	b,n	lws_compare_and_swap
 #else
 	/* If we are not a 64-bit kernel, then we don't
-	 * implement having 64-bit input registers
+	 * have 64-bit input registers, and calling
+	 * the 64-bit LWS CAS returns ENOSYS.
 	 */
 	b,n	lws_exit_nosys
 #endif
@@ -635,12 +670,15 @@ END(sys_call_table64)
 	/*
 		All light-weight-syscall atomic operations 
 		will use this set of locks 
+
+		NOTE: The lws_lock_start symbol must be 
+		at least 16-byte aligned for safe use
+		with ldcw.
 	*/
 	.section .data
 	.align	PAGE_SIZE
 ENTRY(lws_lock_start)
 	/* lws locks */
-	.align 16
 	.rept 16
 	/* Keep locks aligned at 16-bytes */
 	.word 1

--------------070908010606010208060901--
