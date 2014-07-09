From: Helge Deller <deller@gmx.de>
Subject: [STABLE][PATCH] parisc,metag: Do not hardcode maximum userspace
 stack size
Date: Wed, 9 Jul 2014 21:57:59 +0200
Message-ID: <20140709195759.GA2765@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Hogan <james.hogan@imgtec.com>, linux-parisc@vger.kernel.org
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dear stable kernel team,

Can you please consider adding this patch to stable kernel 3.14 ?

It's upstream commit 042d27acb64924a0e8a43e972485913a32407beb with a minor
trivial cleanup in mm/Kconfig so that it applies cleanly to 3.14.

Without this patch, we always use 1 GB stack on hppa which hurts us on 32bit
userspace. This patch changes it to use 80 MB by default on hppa and metag.

Thanks,
Helge


Author: Helge Deller <deller@gmx.de>
Date:   Wed Apr 30 23:26:02 2014 +0200

parisc,metag: Do not hardcode maximum userspace stack size

(based on upstream commit 042d27acb64924a0e8a43e972485913a32407beb)

This patch affects only architectures where the stack grows upwards
(currently parisc and metag only). On those do not hardcode the maximum
initial stack size to 1GB for 32-bit processes, but make it configurable
via a config option.

The main problem with the hardcoded stack size is, that we have two
memory regions which grow upwards: stack and heap. To keep most of the
memory available for heap in a flexmap memory layout, it makes no sense
to hard allocate up to 1GB of the memory for stack which can't be used
as heap then.

This patch makes the stack size for 32-bit processes configurable and
uses 80MB as default value which has been in use during the last few
years on parisc and which hasn't showed any problems yet.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
Cc: linux-metag@vger.kernel.org
Cc: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/metag/include/asm/processor.h b/arch/metag/include/asm/processor.h
index 3be8581..a8a3747 100644
--- a/arch/metag/include/asm/processor.h
+++ b/arch/metag/include/asm/processor.h
@@ -23,7 +23,7 @@
 #define STACK_TOP	(TASK_SIZE - PAGE_SIZE)
 #define STACK_TOP_MAX	STACK_TOP
 /* Maximum virtual space for stack */
-#define STACK_SIZE_MAX	(1 << 28)	/* 256 MB */
+#define STACK_SIZE_MAX	(CONFIG_MAX_STACK_SIZE_MB*1024*1024)
 
 /* This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 86522ef..d951c96 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -55,7 +55,10 @@
 #define STACK_TOP	TASK_SIZE
 #define STACK_TOP_MAX	DEFAULT_TASK_SIZE
 
-#define STACK_SIZE_MAX	(1 << 30)	/* 1 GB */
+/* Allow bigger stacks for 64-bit processes */
+#define STACK_SIZE_MAX	(USER_WIDE_MODE					\
+			 ? (1 << 30)	/* 1 GB */			\
+			 : (CONFIG_MAX_STACK_SIZE_MB*1024*1024))
 
 #endif
 
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index 31ffa9b..e1ffea2 100644
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
+	if (stack_base > STACK_SIZE_MAX)
+		stack_base = STACK_SIZE_MAX;
 
 	return PAGE_ALIGN(STACK_TOP - stack_base);
 }
diff --git a/mm/Kconfig b/mm/Kconfig
index 9b63c15..0862816 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -580,3 +580,18 @@ config PGTABLE_MAPPING
 
 	  You can check speed with zsmalloc benchmark:
 	  https://github.com/spartacus06/zsmapbench
+
+config MAX_STACK_SIZE_MB
+	int "Maximum user stack size for 32-bit processes (MB)"
+	default 80
+	range 8 256 if METAG
+	range 8 2048
+	depends on STACK_GROWSUP && (!64BIT || COMPAT)
+	help
+	  This is the maximum stack size in Megabytes in the VM layout of 32-bit
+	  user processes when the stack grows upwards (currently only on parisc
+	  and metag arch). The stack will be located at the highest memory
+	  address minus the given value, unless the RLIMIT_STACK hard limit is
+	  changed to a smaller value in which case that is used.
+
+	  A sane initial value is 80 MB.
