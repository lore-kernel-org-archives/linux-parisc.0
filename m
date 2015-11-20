From: Helge Deller <deller@gmx.de>
Subject: [PATCH 7/9] parisc: Use long branch to do_syscall_trace_exit
Date: Fri, 20 Nov 2015 22:38:40 +0100
Message-ID: <1448055522-11594-8-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Use the 22bit instead of the 17bit branch instruction on a 64bit kernel
to reach the do_syscall_trace_exit function from the gateway page.
A huge page enabled kernel may need the additional branch distance bits.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/syscall.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 0b8d26d..3fbd725 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -369,7 +369,7 @@ tracesys_exit:
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 	ldo	TASK_REGS(%r1),%r26
-	bl	do_syscall_trace_exit,%r2
+	BL	do_syscall_trace_exit,%r2
 	STREG   %r28,TASK_PT_GR28(%r1)          /* save return value now */
 	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	LDREG	TI_TASK(%r1), %r1
@@ -390,7 +390,7 @@ tracesys_sigexit:
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
-	bl	do_syscall_trace_exit,%r2
+	BL	do_syscall_trace_exit,%r2
 	ldo	TASK_REGS(%r1),%r26
 
 	ldil	L%syscall_exit_rfi,%r1
-- 
2.1.0

