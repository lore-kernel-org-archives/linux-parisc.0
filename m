From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve LWS-CAS performance
Date: Sun, 11 May 2014 18:40:50 -0400
Message-ID: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-62-634056063"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-62-634056063
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The attached change significantly improves the performance of the LWS- 
CAS code in syscall.S.
This allows a number of packages to build (e.g., zeromq3, gtest and  
libxs) that previously failed because
slow LWS-CAS performance under contention.  In particular, interrupts  
taken while the lock was taken
degraded performance significantly.

The change does the following:

1) Disables interrupts around the CAS operation,
2) Removes the lock code on UP systems where it is not needed, and
3) Changes the loads and stores to use the ordered completer, "o", on
PA 2.0.  "o" and "ma" with a zero offset are equivalent.  The latter  
is accepted
on both PA 1.X and 2.0.

The use of ordered loads and stores probably makes no difference on  
all existing
hardware, but it seemed pedantically correct.  In particular, the CAS  
operation must
complete before LDCW lock is released.  As written before, a processor  
could reorder
the operations.

I don't believe the period interrupts are disabled is long enough to  
significantly
increase interrupt latency.  For example, the TLB insert code is  
longer.  Worst
case is a memory fault in the CAS operation.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---



--Apple-Mail-62-634056063
Content-Disposition: attachment; filename="syscall.S.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="syscall.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index a63bb179..801ba08 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -589,12 +589,16 @@ cas_nocontend:
 # endif
 /* ENABLE_LWS_DEBUG */
 
+	rsm	PSW_SM_I, %r0				/* Disable interrupts */
+#ifdef CONFIG_SMP
 	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
 	cmpb,<>,n	%r0, %r28, cas_action		/* Did we get it? */
 cas_wouldblock:
 	ldo	2(%r0), %r28				/* 2nd case */
+	ssm	PSW_SM_I, %r0
 	b	lws_exit				/* Contended... */
 	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+#endif
 
 	/*
 		prev = *addr;
@@ -619,15 +623,19 @@ cas_action:
 	stw	%r1, 4(%sr2,%r20)
 #endif
 	/* The load and store could fail */
-1:	ldw	0(%sr3,%r26), %r28
+1:	ldw,ma	0(%sr3,%r26), %r28
 	sub,<>	%r28, %r25, %r0
-2:	stw	%r24, 0(%sr3,%r26)
+2:	stw,ma	%r24, 0(%sr3,%r26)
+#ifdef CONFIG_SMP
 	/* Free lock */
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)
+#endif
 #if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
 #endif
+	/* Enable interrupts */
+	ssm	PSW_SM_I, %r0
 	/* Return to userspace, set no error */
 	b	lws_exit
 	copy	%r0, %r21
@@ -639,6 +647,7 @@ cas_action:
 #if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
 #endif
+	ssm	PSW_SM_I, %r0
 	b	lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
 	nop

--Apple-Mail-62-634056063
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-62-634056063--
