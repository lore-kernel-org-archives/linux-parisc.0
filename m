From: Jiri Slaby <jslaby@suse.cz>
Subject: [patch NOT added to the 3.12 stable tree] parisc,metag: Do not hardcode maximum userspace stack size
Date: Fri, 18 Jul 2014 09:27:07 +0200
Message-ID: <1405668427-13226-1-git-send-email-jslaby@suse.cz>
Cc: jslaby@suse.cz, Helge Deller <deller@gmx.de>,
	James Hogan <james.hogan@imgtec.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org, linux-metag@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: stable@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Helge Deller <deller@gmx.de>

This patch does NOT apply to the 3.12 stable tree. If you still want
it applied, please provide a backport.

===============

commit 042d27acb64924a0e8a43e972485913a32407beb upstream.

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
---
 arch/metag/include/asm/processor.h  |  2 +-
 arch/parisc/include/asm/processor.h |  5 ++++-
 arch/parisc/kernel/sys_parisc.c     |  6 +++---
 mm/Kconfig                          | 15 +++++++++++++++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/metag/include/asm/processor.h b/arch/metag/include/asm/processor.h
index 3be8581af495..a8a37477c66e 100644
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
index 86522ef09d52..d951c9681ab3 100644
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
index 31ffa9b55322..e1ffea2f9a0b 100644
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
index ebe5880c29d6..1b5a95f0fa01 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -581,3 +581,18 @@ config PGTABLE_MAPPING
 
 config GENERIC_EARLY_IOREMAP
 	bool
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
-- 
2.0.0

