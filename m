From: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] parisc,metag: Do not hardcode maximum userspace stack size
Date: Wed, 30 Apr 2014 23:26:02 +0200
Message-ID: <20140430212602.GA20601@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>,
	John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>,
	linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <linux-metag.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch affects only architectures where the stack grows upwards
(currently parisc and metag only). On those do not hardcode the maximum
initial stack size to 1GB, but make it configurable via a config option.

The main problem with the hardcoded stack size is, that we have two
memory regions which grow upwards: stack and heap. To keep most of the
memory available for heap in a flexmap memoy layout, it makes no sense
to hard allocate up to 1GB of the memory for stack which can't be used
as heap then.

This patch makes the stack size configurable and uses 80MB as default
value which has been in use during the last few years on parisc and
which didn't showed any problems yet.

Signed-off-by: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John David Anglin <dave.anglin-CzeTG9NwML0@public.gmane.org>

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 7d8cbd1..9118f01 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -72,10 +72,10 @@ static unsigned long mmap_upper_limit(void)
 {
 	unsigned long stack_base;
 
-	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
+	/* Limit stack size - see setup_arg_pages() in fs/exec.c */
 	stack_base = rlimit_max(RLIMIT_STACK);
-	if (stack_base > (1 << 30))
-		stack_base = 1 << 30;
+	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
+		stack_base = CONFIG_MAX_STACK_SIZE_MB*1024*1024;
 
 	return PAGE_ALIGN(STACK_TOP - stack_base);
 }
diff --git a/fs/exec.c b/fs/exec.c
index 476f3eb..994108c 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -657,10 +657,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	unsigned long rlim_stack;
 
 #ifdef CONFIG_STACK_GROWSUP
-	/* Limit stack size to 1GB */
+	/* Limit stack size */
 	stack_base = rlimit_max(RLIMIT_STACK);
-	if (stack_base > (1 << 30))
-		stack_base = 1 << 30;
+	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
+		stack_base = CONFIG_MAX_STACK_SIZE_MB*1024*1024;
 
 	/* Make sure we didn't let the argument array grow too large. */
 	if (vma->vm_end - vma->vm_start > stack_base)
diff --git a/init/Kconfig b/init/Kconfig
index 9d3585b..436e479 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1862,6 +1862,17 @@ config STOP_MACHINE
 	help
 	  Need stop_machine() primitive.
 
+config MAX_STACK_SIZE_MB
+	int "Default initial maximum stack size"
+	default 80
+	range 8 2048
+	depends on STACK_GROWSUP
+	help
+	  This is the default initial stack size in Megabytes in the VM layout of user
+	  processes when the stack grows upwards (currently only on parisc and matag
+	  arch).  The stack will be located at the highest memory address minus the
+	  given value. A sane initial value is 80 MB.
+
 source "block/Kconfig"
 
 config PREEMPT_NOTIFIERS
--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
