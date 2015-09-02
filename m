From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Align locks for LWS syscalls to L1 cache size
Date: Wed, 2 Sep 2015 21:38:40 +0200
Message-ID: <20150902193840.GA4499@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	ohn David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Align the locks for the Light weight syscall (LWS) which is used for
atomic userspace operations (e.g. gcc atomic builtins) on L1 cache
boundaries. This should speed up LWS calls on PA20 systems.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 7ef22e3..80c2306 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -561,9 +561,9 @@ lws_compare_and_swap:
 	extru  %r26, 27, 4, %r20
 
 	/* Find lock to use, the hash is either one of 0 to
-	   15, multiplied by 16 (keep it 16-byte aligned)
+	   15, multiplied by L1_CACHE_BYTES (keep it L1 cache aligned)
 	   and add to the lock table offset. */
-	shlw	%r20, 4, %r20
+	shlw	%r20, L1_CACHE_SHIFT, %r20
 	add	%r20, %r28, %r20
 
 # if ENABLE_LWS_DEBUG
@@ -751,9 +751,9 @@ cas2_lock_start:
 	extru  %r26, 27, 4, %r20
 
 	/* Find lock to use, the hash is either one of 0 to
-	   15, multiplied by 16 (keep it 16-byte aligned)
+	   15, multiplied by L1_CACHE_BYTES (keep it L1 cache aligned)
 	   and add to the lock table offset. */
-	shlw	%r20, 4, %r20
+	shlw	%r20, L1_CACHE_SHIFT, %r20
 	add	%r20, %r28, %r20
 
 	rsm	PSW_SM_I, %r0			/* Disable interrupts */
@@ -931,11 +931,9 @@ END(sys_call_table64)
 ENTRY(lws_lock_start)
 	/* lws locks */
 	.rept 16
-	/* Keep locks aligned at 16-bytes */
+	/* Keep locks aligned to L1_CACHE_BYTES */
 	.word 1
-	.word 0 
-	.word 0
-	.word 0
+	.align	L1_CACHE_BYTES
 	.endr
 END(lws_lock_start)
 	.previous
