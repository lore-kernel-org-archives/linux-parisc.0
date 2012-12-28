From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve ptrace support for gdb single-step
Date: Fri, 28 Dec 2012 18:18:01 -0500
Message-ID: <BLU0-SMTP34ED8A5FC4451C5BECF0F6973F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-32-472359560"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-32-472359560
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Various GCC tests use gdb to simulate a multithreaded application.  Many
of these tests have been failing on parisc linux.

GCC does this by using gdb to single-step the application, then gdb is  
used to
call other test specific code.  Where this fails is when the  
application is stepped
into the delay slot of a taken branch.  This sets the PSW B bit.  When  
the test
specific code is executed, this usually clears the PSW B bit.   
Currently, gdb is
not allowed to set the B bit.  So, the code falls through what should  
be a taken
branch.

The attached patch adds the PSW B bit to the set of bits that gdb is  
allowed to
set.  In order to set the B bit, the trace system call must return  
using an interrupt
restore.  The patch also modifies this code to use the saved IAOQ  
values when
they are saved by a ptrace syscall or interruption.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---



--Apple-Mail-32-472359560
Content-Disposition: attachment; filename="ptrace-gdb.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="ptrace-gdb.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 18670a0..c19b2b0 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2064,7 +2057,7 @@ syscall_restore:
 
 	/* Are we being ptraced? */
 	ldw	TASK_FLAGS(%r1),%r19
-	ldi	(_TIF_SINGLESTEP|_TIF_BLOCKSTEP),%r2
+	ldi	_TIF_SYSCALL_TRACE_MASK,%r2
 	and,COND(=)	%r19,%r2,%r0
 	b,n	syscall_restore_rfi
 
@@ -2177,15 +2170,23 @@ syscall_restore_rfi:
 	/* sr2 should be set to zero for userspace syscalls */
 	STREG	%r0,TASK_PT_SR2(%r1)
 
-pt_regs_ok:
 	LDREG	TASK_PT_GR31(%r1),%r2
-	depi	3,31,2,%r2			   /* ensure return to user mode. */
-	STREG	%r2,TASK_PT_IAOQ0(%r1)
+	depi	3,31,2,%r2		   /* ensure return to user mode. */
+	STREG   %r2,TASK_PT_IAOQ0(%r1)
 	ldo	4(%r2),%r2
 	STREG	%r2,TASK_PT_IAOQ1(%r1)
+	b	intr_restore
 	copy	%r25,%r16
+
+pt_regs_ok:
+	LDREG	TASK_PT_IAOQ0(%r1),%r2
+	depi	3,31,2,%r2		   /* ensure return to user mode. */
+	STREG	%r2,TASK_PT_IAOQ0(%r1)
+	LDREG	TASK_PT_IAOQ1(%r1),%r2
+	depi	3,31,2,%r2
+	STREG	%r2,TASK_PT_IAOQ1(%r1)
 	b	intr_restore
-	nop
+	copy	%r25,%r16
 
 	.import schedule,code
 syscall_do_resched:
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 857c2f5..534abd4 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -26,7 +26,7 @@
 #include <asm/asm-offsets.h>
 
 /* PSW bits we allow the debugger to modify */
-#define USER_PSW_BITS	(PSW_N | PSW_V | PSW_CB)
+#define USER_PSW_BITS	(PSW_N | PSW_B | PSW_V | PSW_CB)
 
 /*
  * Called by kernel/ptrace.c when detaching..

--Apple-Mail-32-472359560
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net
--Apple-Mail-32-472359560--
