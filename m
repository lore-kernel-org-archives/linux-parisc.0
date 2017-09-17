From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Stop unwinding at start of stack
Date: Sun, 17 Sep 2017 21:05:02 +0200
Message-ID: <20170917190502.GA8355@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Check stack pointer if we are reaching the stack end and stop unwinding
if we do. This fixes early backtraces and avoids showing unrealistic
call stacks.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 48dc7d4..caab39d 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
 #include <linux/sort.h>
+#include <linux/sched.h>
 
 #include <linux/uaccess.h>
 #include <asm/assembly.h>
@@ -279,6 +280,17 @@ static void unwind_frame_regs(struct unwind_frame_info *info)
 
 			info->prev_sp = sp - 64;
 			info->prev_ip = 0;
+
+			/* The stack is at the end inside the thread_union
+			 * struct. If we reach data, we have reached the
+			 * beginning of the stack and should stop unwinding. */
+			if (info->prev_sp >= (unsigned long) task_thread_info(info->t) &&
+			    info->prev_sp < ((unsigned long) task_thread_info(info->t)
+						+ THREAD_SZ_ALGN)) {
+				info->prev_sp = 0;
+				break;
+			}
+
 			if (get_user(tmp, (unsigned long *)(info->prev_sp - RP_OFFSET))) 
 				break;
 			info->prev_ip = tmp;
