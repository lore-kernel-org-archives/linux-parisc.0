From: Chuck Ebbert <cebbert.lkml@gmail.com>
Subject: [PATCH] Fix end_of_stack() fn and location of stack canary for
 archs using STACK_GROWSUP
Date: Tue, 16 Sep 2014 02:37:36 -0500
Message-ID: <20140916023736.49db964e@as>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Aaron Tomlin <atomlin@redhat.com>,
	James Hogan <james.hogan@imgtec.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Aaron Tomlin recently posted patches [1] to enable checking the stack canary on
every task switch. Looking at the canary code, I realized that every arch
(except ia64, which adds some space for register spill above the stack) shares a
definition of end_of_stack() that makes it the first long after the threadinfo.

For stacks that grow down, this low address is correct because the stack starts
at the end of the thread area and grows toward lower addresses. However, for
stacks that grow up, toward higher addresses, this is wrong. (The stack actually
grows away from the canary.) On these archs end_of_stack() should return the 
address of the last long, at the highest possible address for the stack.

[1] http://lkml.org/lkml/2014/9/12/293

Signed-off-by: Chuck Ebbert <cebbert.lkml@gmail.com>

---

Compile tested only, with Aaron's patches applied and the new option
CONFIG_SCHED_STACK_END_CHECK they add enabled. I have no way to test
this any further.

diff a/include/linux/sched.h b/include/linux/sched.h
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2610,7 +2610,11 @@ static inline void setup_thread_stack(struct task_struct *p, struct task_struct
 
 static inline unsigned long *end_of_stack(struct task_struct *p)
 {
+#ifdef CONFIG_STACK_GROWSUP
+	return (unsigned long *)((unsigned long)task_thread_info(p) + THREAD_SIZE) - 1;
+#else
 	return (unsigned long *)(task_thread_info(p) + 1);
+#endif
 }
 
 #endif


