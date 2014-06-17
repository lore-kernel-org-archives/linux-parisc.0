From: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [3.13.y.z extended stable] Patch "metag: Reduce maximum stack size to 256MB" has been added to staging queue
Date: Tue, 17 Jun 2014 14:42:21 -0700
Message-ID: <1403041341-9524-1-git-send-email-kamal@canonical.com>
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	"James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>,
	Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>,
	kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a note to let you know that I have just added a patch titled

    metag: Reduce maximum stack size to 256MB

to the linux-3.13.y-queue branch of the 3.13.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.13.y-queue

This patch is scheduled to be released in version 3.13.11.4.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.13.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

------

>From 8dd77187cf712fc849df3725f3676dbe61c4a4ff Mon Sep 17 00:00:00 2001
From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Date: Tue, 13 May 2014 23:58:24 +0100
Subject: metag: Reduce maximum stack size to 256MB

commit d71f290b4e98a39f49f2595a13be3b4d5ce8e1f1 upstream.

Specify the maximum stack size for arches where the stack grows upward
(parisc and metag) in asm/processor.h rather than hard coding in
fs/exec.c so that metag can specify a smaller value of 256MB rather than
1GB.

This fixes a BUG on metag if the RLIMIT_STACK hard limit is increased
beyond a safe value by root. E.g. when starting a process after running
"ulimit -H -s unlimited" it will then attempt to use a stack size of the
maximum 1GB which is far too big for metag's limited user virtual
address space (stack_top is usually 0x3ffff000):

BUG: failure at fs/exec.c:589/shift_arg_pages()!

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Cc: "James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>
Signed-off-by: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 arch/metag/include/asm/processor.h  | 2 ++
 arch/parisc/include/asm/processor.h | 2 ++
 fs/exec.c                           | 6 +++---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/metag/include/asm/processor.h b/arch/metag/include/asm/processor.h
index f16477d..3be8581 100644
--- a/arch/metag/include/asm/processor.h
+++ b/arch/metag/include/asm/processor.h
@@ -22,6 +22,8 @@
 /* Add an extra page of padding at the top of the stack for the guard page. */
 #define STACK_TOP	(TASK_SIZE - PAGE_SIZE)
 #define STACK_TOP_MAX	STACK_TOP
+/* Maximum virtual space for stack */
+#define STACK_SIZE_MAX	(1 << 28)	/* 256 MB */

 /* This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index cc2290a..c6ee865 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -53,6 +53,8 @@
 #define STACK_TOP	TASK_SIZE
 #define STACK_TOP_MAX	DEFAULT_TASK_SIZE

+#define STACK_SIZE_MAX	(1 << 30)	/* 1 GB */
+
 #endif

 #ifndef __ASSEMBLY__
diff --git a/fs/exec.c b/fs/exec.c
index 7ea097f..5743b8f 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -655,10 +655,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	unsigned long rlim_stack;

 #ifdef CONFIG_STACK_GROWSUP
-	/* Limit stack size to 1GB */
+	/* Limit stack size */
 	stack_base = rlimit_max(RLIMIT_STACK);
-	if (stack_base > (1 << 30))
-		stack_base = 1 << 30;
+	if (stack_base > STACK_SIZE_MAX)
+		stack_base = STACK_SIZE_MAX;

 	/* Make sure we didn't let the argument array grow too large. */
 	if (vma->vm_end - vma->vm_start > stack_base)
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
