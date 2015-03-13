From: Alex Dowad <alexinbeijing@gmail.com>
Subject: [PATCH 22/32] parisc: copy_thread(): rename 'arg' argument to 'kthread_arg'
Date: Fri, 13 Mar 2015 20:14:45 +0200
Message-ID: <1426270496-26362-12-git-send-email-alexinbeijing@gmail.com>
References: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org (open list:PARISC ARCHITECTURE)
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426270496-26362-1-git-send-email-alexinbeijing@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The 'arg' argument to copy_thread() is only ever used when forking a new
kernel thread. Hence, rename it to 'kthread_arg' for clarity (and consistency
with do_fork() and other arch-specific implementations of copy_thread()).

Signed-off-by: Alex Dowad <alexinbeijing@gmail.com>
---
 arch/parisc/kernel/process.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 8a488c2..809905a 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -181,9 +181,12 @@ int dump_task_fpu (struct task_struct *tsk, elf_fpregset_t *r)
 	return 1;
 }
 
+/*
+ * Copy architecture-specific thread state
+ */
 int
 copy_thread(unsigned long clone_flags, unsigned long usp,
-	    unsigned long arg, struct task_struct *p)
+	    unsigned long kthread_arg, struct task_struct *p)
 {
 	struct pt_regs *cregs = &(p->thread.regs);
 	void *stack = task_stack_page(p);
@@ -195,11 +198,10 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	extern void * const child_return;
 
 	if (unlikely(p->flags & PF_KTHREAD)) {
+		/* kernel thread */
 		memset(cregs, 0, sizeof(struct pt_regs));
 		if (!usp) /* idle thread */
 			return 0;
-
-		/* kernel thread */
 		/* Must exit via ret_from_kernel_thread in order
 		 * to call schedule_tail()
 		 */
@@ -215,7 +217,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 #else
 		cregs->gr[26] = usp;
 #endif
-		cregs->gr[25] = arg;
+		cregs->gr[25] = kthread_arg;
 	} else {
 		/* user thread */
 		/* usp must be word aligned.  This also prevents users from
-- 
2.0.0.GIT
