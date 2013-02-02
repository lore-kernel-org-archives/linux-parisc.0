From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Pass the 5th and 6th argument for on the stack for
 32bit ptraced processes too
Date: Sun, 3 Feb 2013 00:46:43 +0100
Message-ID: <20130202234643.GE1188@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Author: John David Anglin <dave.anglin@bell.net>

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 86742df..c893ec4 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -309,10 +309,13 @@ tracesys_next:
 	LDREG   TASK_PT_GR25(%r1), %r25
 	LDREG   TASK_PT_GR24(%r1), %r24
 	LDREG   TASK_PT_GR23(%r1), %r23
-#ifdef CONFIG_64BIT
 	LDREG   TASK_PT_GR22(%r1), %r22
 	LDREG   TASK_PT_GR21(%r1), %r21
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
+#else
+	stw	%r22, -52(%r30)			/* 5th argument */
+	stw	%r21, -56(%r30)			/* 6th argument */
 #endif
 
 	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
