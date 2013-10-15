From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: add kernel auditing feature
Date: Tue, 15 Oct 2013 19:25:46 +0200
Message-ID: <20131015172546.GA1188@p100.box>
References: <20131014190856.GA1483@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131014190856.GA1483@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

updated (functional) patch:

parisc: add kernel auditing feature (v2)

Add kernel auditing feature for parisc.

Changes to v1:
	- ptrace.h: added regs_return_value() function
	- init/Kconfig: enable CONFIG_AUDITSYSCALL for parisc
	  architecture in Kconfig

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ad2ce8d..73e0ac2 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -287,6 +287,10 @@ config SYSVIPC_COMPAT
 	def_bool y
 	depends on COMPAT && SYSVIPC
 
+config AUDIT_ARCH
+	def_bool y
+	depends on COMPAT
+
 config HPUX
 	bool "Support for HP-UX binaries"
 	depends on !64BIT
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 540c88f..bc7cf12 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -59,6 +59,7 @@ struct thread_info {
 #define TIF_32BIT               4       /* 32 bit binary */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_RESTORE_SIGMASK	6	/* restore saved signal mask */
+#define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_NOTIFY_RESUME	8	/* callback before returning to user */
 #define TIF_SINGLESTEP		9	/* single stepping? */
 #define TIF_BLOCKSTEP		10	/* branch stepping? */
@@ -68,6 +69,7 @@ struct thread_info {
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_POLLING_NRFLAG	(1 << TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1 << TIF_32BIT)
+#define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_BLOCKSTEP		(1 << TIF_BLOCKSTEP)
@@ -75,7 +77,7 @@ struct thread_info {
 #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | \
                                  _TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
-				 _TIF_BLOCKSTEP)
+				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT)
 
 #endif /* __KERNEL__ */
 
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 66ee3f1..ad1e3a6 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -31,5 +31,6 @@ obj-$(CONFIG_64BIT)	+= binfmt_elf32.o sys_parisc32.o signal32.o
 obj-$(CONFIG_STACKTRACE)+= stacktrace.o
 # only supported for PCX-W/U in 64-bit mode at the moment
 obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o
+obj-$(CONFIG_AUDIT_ARCH) += audit.o compat_audit.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
diff --git a/arch/parisc/kernel/audit.c b/arch/parisc/kernel/audit.c
new file mode 100644
index 0000000..bdc7773
--- /dev/null
+++ b/arch/parisc/kernel/audit.c
@@ -0,0 +1,81 @@
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/audit.h>
+#include <asm/unistd.h>
+
+static unsigned dir_class[] = {
+#include <asm-generic/audit_dir_write.h>
+~0U
+};
+
+static unsigned read_class[] = {
+#include <asm-generic/audit_read.h>
+~0U
+};
+
+static unsigned write_class[] = {
+#include <asm-generic/audit_write.h>
+~0U
+};
+
+static unsigned chattr_class[] = {
+#include <asm-generic/audit_change_attr.h>
+~0U
+};
+
+static unsigned signal_class[] = {
+#include <asm-generic/audit_signal.h>
+~0U
+};
+
+int audit_classify_arch(int arch)
+{
+#ifdef CONFIG_COMPAT
+	if (arch == AUDIT_ARCH_PARISC)
+		return 1;
+#endif
+	return 0;
+}
+
+int audit_classify_syscall(int abi, unsigned syscall)
+{
+#ifdef CONFIG_COMPAT
+	extern int parisc32_classify_syscall(unsigned);
+	if (abi == AUDIT_ARCH_PARISC)
+		return parisc32_classify_syscall(syscall);
+#endif
+	switch (syscall) {
+	case __NR_open:
+		return 2;
+	case __NR_openat:
+		return 3;
+	case __NR_execve:
+		return 5;
+	default:
+		return 0;
+	}
+}
+
+static int __init audit_classes_init(void)
+{
+#ifdef CONFIG_COMPAT
+	extern __u32 parisc32_dir_class[];
+	extern __u32 parisc32_write_class[];
+	extern __u32 parisc32_read_class[];
+	extern __u32 parisc32_chattr_class[];
+	extern __u32 parisc32_signal_class[];
+	audit_register_class(AUDIT_CLASS_WRITE_32, parisc32_write_class);
+	audit_register_class(AUDIT_CLASS_READ_32, parisc32_read_class);
+	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, parisc32_dir_class);
+	audit_register_class(AUDIT_CLASS_CHATTR_32, parisc32_chattr_class);
+	audit_register_class(AUDIT_CLASS_SIGNAL_32, parisc32_signal_class);
+#endif
+	audit_register_class(AUDIT_CLASS_WRITE, write_class);
+	audit_register_class(AUDIT_CLASS_READ, read_class);
+	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
+	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
+	audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
+	return 0;
+}
+
+__initcall(audit_classes_init);
diff --git a/arch/parisc/kernel/compat_audit.c b/arch/parisc/kernel/compat_audit.c
new file mode 100644
index 0000000..ba64dfe
--- /dev/null
+++ b/arch/parisc/kernel/compat_audit.c
@@ -0,0 +1,40 @@
+#include <asm/unistd.h>
+
+unsigned int parisc32_dir_class[] = {
+#include <asm-generic/audit_dir_write.h>
+~0U
+};
+
+unsigned int parisc32_chattr_class[] = {
+#include <asm-generic/audit_change_attr.h>
+~0U
+};
+
+unsigned int parisc32_write_class[] = {
+#include <asm-generic/audit_write.h>
+~0U
+};
+
+unsigned int parisc32_read_class[] = {
+#include <asm-generic/audit_read.h>
+~0U
+};
+
+unsigned int parisc32_signal_class[] = {
+#include <asm-generic/audit_signal.h>
+~0U
+};
+
+int parisc32_classify_syscall(unsigned syscall)
+{
+	switch (syscall) {
+	case __NR_open:
+		return 2;
+	case __NR_openat:
+		return 3;
+	case __NR_execve:
+		return 5;
+	default:
+		return 1;
+	}
+}
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 534abd4..e842ee2 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -19,6 +19,7 @@
 #include <linux/security.h>
 #include <linux/compat.h>
 #include <linux/signal.h>
+#include <linux/audit.h>
 
 #include <asm/uaccess.h>
 #include <asm/pgtable.h>
@@ -267,11 +268,28 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 
 long do_syscall_trace_enter(struct pt_regs *regs)
 {
+	long ret = 0;
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
 	    tracehook_report_syscall_entry(regs))
-		return -1L;
-
-	return regs->gr[20];
+		ret = -1L;
+
+#ifdef CONFIG_64BIT
+	if (!is_compat_task())
+		audit_syscall_entry(AUDIT_ARCH_PARISC64,
+			regs->gr[20],
+			regs->gr[26], regs->gr[25],
+			regs->gr[24], regs->gr[23]);
+	else
+#endif
+		audit_syscall_entry(AUDIT_ARCH_PARISC,
+			regs->gr[20] & 0xffffffff,
+			regs->gr[26] & 0xffffffff,
+			regs->gr[25] & 0xffffffff,
+			regs->gr[24] & 0xffffffff,
+			regs->gr[23] & 0xffffffff);
+
+	return ret ? : regs->gr[20];
 }
 
 void do_syscall_trace_exit(struct pt_regs *regs)
@@ -279,6 +297,8 @@ void do_syscall_trace_exit(struct pt_regs *regs)
 	int stepping = test_thread_flag(TIF_SINGLESTEP) ||
 		test_thread_flag(TIF_BLOCKSTEP);
 
+	audit_syscall_exit(regs);
+
 	if (stepping || test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, stepping);
 }


diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index a2db278..3c3cb00 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -19,5 +19,9 @@
 #define user_stack_pointer(regs)	((regs)->gr[30])
 unsigned long profile_pc(struct pt_regs *);
 
+static inline unsigned long regs_return_value(struct pt_regs *regs)
+{
+	return regs->gr[20];
+}
 
 #endif
diff --git a/init/Kconfig b/init/Kconfig
index 3ecd8a1..d988745 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -284,7 +284,7 @@ config AUDIT
 
 config AUDITSYSCALL
 	bool "Enable system-call auditing support"
-	depends on AUDIT && (X86 || PPC || S390 || IA64 || UML || SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT))
+	depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML || SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT))
 	default y if SECURITY_SELINUX
 	help
 	  Enable low-overhead system-call auditing infrastructure that
