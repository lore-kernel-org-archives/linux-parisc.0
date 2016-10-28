From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid trashing sr2 and sr3 in LWS code
Date: Fri, 28 Oct 2016 22:13:42 +0200
Message-ID: <20161028201342.GA23048@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc: Avoid trashing sr2 and sr3 in LWS code
From: John David Anglin <dave.anglin@bell.net>

There is no need to trash sr2 and sr3 in the Leight-weight syscall (LWS).  sr2
already points to kernel space (it's zero in userspace, otherwise syscalls
wouldn't work), and since the LWS code is executed in userspace, we can simply
ignore to preload sr3.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index d03422e..f13836b 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -474,10 +478,8 @@ lws_start:
 	comiclr,>>	__NR_lws_entries, %r20, %r0
 	b,n	lws_exit_nosys
 
-	/* WARNING: Trashing sr2 and sr3 */
-	mfsp	%sr7,%r1			/* get userspace into sr3 */
-	mtsp	%r1,%sr3
-	mtsp	%r0,%sr2			/* get kernel space into sr2 */
+	/* Note: %sr2 is zero when called from userspace,
+	   else syscalls wouldn't work. */
 
 	/* Load table start */
 	ldil	L%lws_table, %r1
@@ -627,9 +629,9 @@ cas_action:
 	stw	%r1, 4(%sr2,%r20)
 #endif
 	/* The load and store could fail */
-1:	ldw,ma	0(%sr3,%r26), %r28
+1:	ldw,ma	0(%r26), %r28
 	sub,<>	%r28, %r25, %r0
-2:	stw,ma	%r24, 0(%sr3,%r26)
+2:	stw,ma	%r24, 0(%r26)
 	/* Free lock */
 	stw,ma	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
@@ -706,9 +708,9 @@ lws_compare_and_swap_2:
 	nop
 
 	/* 8bit load */
-4:	ldb	0(%sr3,%r25), %r25
+4:	ldb	0(%r25), %r25
 	b	cas2_lock_start
-5:	ldb	0(%sr3,%r24), %r24
+5:	ldb	0(%r24), %r24
 	nop
 	nop
 	nop
@@ -716,9 +718,9 @@ lws_compare_and_swap_2:
 	nop
 
 	/* 16bit load */
-6:	ldh	0(%sr3,%r25), %r25
+6:	ldh	0(%r25), %r25
 	b	cas2_lock_start
-7:	ldh	0(%sr3,%r24), %r24
+7:	ldh	0(%r24), %r24
 	nop
 	nop
 	nop
@@ -726,9 +728,9 @@ lws_compare_and_swap_2:
 	nop
 
 	/* 32bit load */
-8:	ldw	0(%sr3,%r25), %r25
+8:	ldw	0(%r25), %r25
 	b	cas2_lock_start
-9:	ldw	0(%sr3,%r24), %r24
+9:	ldw	0(%r24), %r24
 	nop
 	nop
 	nop
@@ -737,14 +739,14 @@ lws_compare_and_swap_2:
 
 	/* 64bit load */
 #ifdef CONFIG_64BIT
-10:	ldd	0(%sr3,%r25), %r25
-11:	ldd	0(%sr3,%r24), %r24
+10:	ldd	0(%r25), %r25
+11:	ldd	0(%r24), %r24
 #else
 	/* Load new value into r22/r23 - high/low */
-10:	ldw	0(%sr3,%r25), %r22
-11:	ldw	4(%sr3,%r25), %r23
+10:	ldw	0(%r25), %r22
+11:	ldw	4(%r25), %r23
 	/* Load new value into fr4 for atomic store later */
-12:	flddx	0(%sr3,%r24), %fr4
+12:	flddx	0(%r24), %fr4
 #endif
 
 cas2_lock_start:
@@ -794,30 +796,30 @@ cas2_action:
 	ldo	1(%r0),%r28
 
 	/* 8bit CAS */
-13:	ldb,ma	0(%sr3,%r26), %r29
+13:	ldb,ma	0(%r26), %r29
 	sub,=	%r29, %r25, %r0
 	b,n	cas2_end
-14:	stb,ma	%r24, 0(%sr3,%r26)
+14:	stb,ma	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
 	nop
 
 	/* 16bit CAS */
-15:	ldh,ma	0(%sr3,%r26), %r29
+15:	ldh,ma	0(%r26), %r29
 	sub,=	%r29, %r25, %r0
 	b,n	cas2_end
-16:	sth,ma	%r24, 0(%sr3,%r26)
+16:	sth,ma	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
 	nop
 
 	/* 32bit CAS */
-17:	ldw,ma	0(%sr3,%r26), %r29
+17:	ldw,ma	0(%r26), %r29
 	sub,=	%r29, %r25, %r0
 	b,n	cas2_end
-18:	stw,ma	%r24, 0(%sr3,%r26)
+18:	stw,ma	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
@@ -825,22 +827,22 @@ cas2_action:
 
 	/* 64bit CAS */
 #ifdef CONFIG_64BIT
-19:	ldd,ma	0(%sr3,%r26), %r29
+19:	ldd,ma	0(%r26), %r29
 	sub,*=	%r29, %r25, %r0
 	b,n	cas2_end
-20:	std,ma	%r24, 0(%sr3,%r26)
+20:	std,ma	%r24, 0(%r26)
 	copy	%r0, %r28
 #else
 	/* Compare first word */
-19:	ldw,ma	0(%sr3,%r26), %r29
+19:	ldw,ma	0(%r26), %r29
 	sub,=	%r29, %r22, %r0
 	b,n	cas2_end
 	/* Compare second word */
-20:	ldw,ma	4(%sr3,%r26), %r29
+20:	ldw,ma	4(%r26), %r29
 	sub,=	%r29, %r23, %r0
 	b,n	cas2_end
 	/* Perform the store */
-21:	fstdx	%fr4, 0(%sr3,%r26)
+21:	fstdx	%fr4, 0(%r26)
 	copy	%r0, %r28
 #endif
 
