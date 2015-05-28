From: Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [3.16.y-ckt stable] Patch "parisc,metag: Fix crashes due to stack randomization on stack-grows-upwards architectures" has been added to staging queue
Date: Thu, 28 May 2015 11:56:49 +0100
Message-ID: <1432810609-24332-1-git-send-email-luis.henriques@canonical.com>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>,
	linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>,
	kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
To: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a note to let you know that I have just added a patch titled

    parisc,metag: Fix crashes due to stack randomization on stack-grows-upwards architectures

to the linux-3.16.y-queue branch of the 3.16.y-ckt extended stable tree 
which can be found at:

    http://kernel.ubuntu.com/git/ubuntu/linux.git/log/?h=linux-3.16.y-queue

This patch is scheduled to be released in version 3.16.7-ckt13.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.16.y-ckt tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Luis

------

>From 441b34775e8375194ce741e53f0e19241749ef35 Mon Sep 17 00:00:00 2001
From: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Date: Mon, 11 May 2015 22:01:27 +0200
Subject: parisc,metag: Fix crashes due to stack randomization on
 stack-grows-upwards architectures

commit d045c77c1a69703143a36169c224429c48b9eecd upstream.

On architectures where the stack grows upwards (CONFIG_STACK_GROWSUP=y,
currently parisc and metag only) stack randomization sometimes leads to crashes
when the stack ulimit is set to lower values than STACK_RND_MASK (which is 8 MB
by default if not defined in arch-specific headers).

The problem is, that when the stack vm_area_struct is set up in fs/exec.c, the
additional space needed for the stack randomization (as defined by the value of
STACK_RND_MASK) was not taken into account yet and as such, when the stack
randomization code added a random offset to the stack start, the stack
effectively got smaller than what the user defined via rlimit_max(RLIMIT_STACK)
which then sometimes leads to out-of-stack situations and crashes.

This patch fixes it by adding the maximum possible amount of memory (based on
STACK_RND_MASK) which theoretically could be added by the stack randomization
code to the initial stack size. That way, the user-defined stack size is always
guaranteed to be at minimum what is defined via rlimit_max(RLIMIT_STACK).

This bug is currently not visible on the metag architecture, because on metag
STACK_RND_MASK is defined to 0 which effectively disables stack randomization.

The changes to fs/exec.c are inside an "#ifdef CONFIG_STACK_GROWSUP"
section, so it does not affect other platformws beside those where the
stack grows upwards (parisc and metag).

Signed-off-by: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 arch/parisc/include/asm/elf.h   | 4 ++++
 arch/parisc/kernel/sys_parisc.c | 3 +++
 fs/exec.c                       | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/parisc/include/asm/elf.h b/arch/parisc/include/asm/elf.h
index 3391d061eccc..78c9fd32c554 100644
--- a/arch/parisc/include/asm/elf.h
+++ b/arch/parisc/include/asm/elf.h
@@ -348,6 +348,10 @@ struct pt_regs;	/* forward declaration... */

 #define ELF_HWCAP	0

+#define STACK_RND_MASK	(is_32bit_task() ? \
+				0x7ff >> (PAGE_SHIFT - 12) : \
+				0x3ffff >> (PAGE_SHIFT - 12))
+
 struct mm_struct;
 extern unsigned long arch_randomize_brk(struct mm_struct *);
 #define arch_randomize_brk arch_randomize_brk
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index e1ffea2f9a0b..5aba01ac457f 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -77,6 +77,9 @@ static unsigned long mmap_upper_limit(void)
 	if (stack_base > STACK_SIZE_MAX)
 		stack_base = STACK_SIZE_MAX;

+	/* Add space for stack randomization. */
+	stack_base += (STACK_RND_MASK << PAGE_SHIFT);
+
 	return PAGE_ALIGN(STACK_TOP - stack_base);
 }

diff --git a/fs/exec.c b/fs/exec.c
index 68a0843250c9..993ed0aba99a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -662,6 +662,9 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	if (stack_base > STACK_SIZE_MAX)
 		stack_base = STACK_SIZE_MAX;

+	/* Add space for stack randomization. */
+	stack_base += (STACK_RND_MASK << PAGE_SHIFT);
+
 	/* Make sure we didn't let the argument array grow too large. */
 	if (vma->vm_end - vma->vm_start > stack_base)
 		return -ENOMEM;
