From: Luis Henriques <luis.henriques@canonical.com>
Subject: [3.11.y.z extended stable] Patch "metag: Reduce maximum stack size to 256MB" has been added to staging queue
Date: Fri, 30 May 2014 10:29:05 +0100
Message-ID: <1401442145-9949-1-git-send-email-luis.henriques@canonical.com>
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org, linux-metag@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>,
	Luis Henriques <luis.henriques@canonical.com>,
	kernel-team@lists.ubuntu.com
To: James Hogan <james.hogan@imgtec.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a note to let you know that I have just added a patch titled

    metag: Reduce maximum stack size to 256MB

to the linux-3.11.y-queue branch of the 3.11.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.11.y-queue

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.11.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Luis

------

>From 446548dfdf62f1c5a749ac36b2ac311444d26892 Mon Sep 17 00:00:00 2001
From: James Hogan <james.hogan@imgtec.com>
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

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
Cc: linux-metag@vger.kernel.org
Cc: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
---
 arch/metag/include/asm/processor.h  | 2 ++
 arch/parisc/include/asm/processor.h | 2 ++
 fs/exec.c                           | 6 +++---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/metag/include/asm/processor.h b/arch/metag/include/asm/processor.h
index f16477d1f571..3be8581af495 100644
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
index cc2290a3cace..c6ee86542fec 100644
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
index e72f6bbbde2e..87e9edb36fe0 100644
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

