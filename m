From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Wire up seccomp, getrandom and memfd_create syscalls
Date: Tue, 26 Aug 2014 21:47:42 +0200
Message-ID: <20140826194742.GA16455@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

With secure computing we only support the SECCOMP_MODE_STRICT mode for now.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 6e75e20..1554a6f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -321,6 +321,22 @@ source "fs/Kconfig"
 
 source "arch/parisc/Kconfig.debug"
 
+config SECCOMP
+	def_bool y
+	prompt "Enable seccomp to safely compute untrusted bytecode"
+	---help---
+	  This kernel feature is useful for number crunching applications
+	  that may need to compute untrusted bytecode during their
+	  execution. By using pipes or other transports made available to
+	  the process as file descriptors supporting the read/write
+	  syscalls, it's possible to isolate those applications in
+	  their own address space using seccomp. Once seccomp is
+	  enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
+	  and the task is only allowed to execute a few safe syscalls
+	  defined by each seccomp mode.
+
+	  If unsure, say Y. Only embedded should say N here.
+
 source "security/Kconfig"
 
 source "crypto/Kconfig"
diff --git a/arch/parisc/include/asm/seccomp.h b/arch/parisc/include/asm/seccomp.h
--- /dev/null
+++ b/arch/parisc/include/asm/seccomp.h
@@ -0,0 +1,16 @@
+#ifndef _ASM_PARISC_SECCOMP_H
+#define _ASM_PARISC_SECCOMP_H
+
+#include <linux/unistd.h>
+
+#define __NR_seccomp_read __NR_read
+#define __NR_seccomp_write __NR_write
+#define __NR_seccomp_exit __NR_exit
+#define __NR_seccomp_sigreturn __NR_rt_sigreturn
+
+#define __NR_seccomp_read_32 __NR_read
+#define __NR_seccomp_write_32 __NR_write
+#define __NR_seccomp_exit_32 __NR_exit
+#define __NR_seccomp_sigreturn_32 __NR_rt_sigreturn
+
+#endif	/* _ASM_PARISC_SECCOMP_H */
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 4b9b10c..a846118 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -60,6 +60,7 @@ struct thread_info {
 #define TIF_NOTIFY_RESUME	8	/* callback before returning to user */
 #define TIF_SINGLESTEP		9	/* single stepping? */
 #define TIF_BLOCKSTEP		10	/* branch stepping? */
+#define TIF_SECCOMP		11	/* secure computing */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
@@ -70,11 +71,13 @@ struct thread_info {
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_BLOCKSTEP		(1 << TIF_BLOCKSTEP)
+#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 
 #define _TIF_USER_WORK_MASK     (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | \
                                  _TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_TRACE_MASK (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP |	\
-				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT)
+				 _TIF_BLOCKSTEP | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SECCOMP)
 
 #ifdef CONFIG_64BIT
 # ifdef CONFIG_COMPAT
diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index 47e0e21..8667f18 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -830,8 +830,11 @@
 #define __NR_sched_getattr	(__NR_Linux + 335)
 #define __NR_utimes		(__NR_Linux + 336)
 #define __NR_renameat2		(__NR_Linux + 337)
+#define __NR_seccomp		(__NR_Linux + 338)
+#define __NR_getrandom		(__NR_Linux + 339)
+#define __NR_memfd_create	(__NR_Linux + 340)
 
-#define __NR_Linux_syscalls	(__NR_renameat2 + 1)
+#define __NR_Linux_syscalls	(__NR_memfd_create + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index e842ee2..3bab724 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -270,6 +270,12 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 {
 	long ret = 0;
 
+	/* Do the secure computing check first. */
+	if (secure_computing(regs->gr[20])) {
+		/* seccomp failures shouldn't expose any additional code. */
+		return -1;
+	}
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
 	    tracehook_report_syscall_entry(regs))
 		ret = -1L;
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 84c5d3a..b563d9c 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -433,6 +433,9 @@
 	ENTRY_SAME(sched_getattr)	/* 335 */
 	ENTRY_COMP(utimes)
 	ENTRY_SAME(renameat2)
+	ENTRY_SAME(seccomp)
+	ENTRY_SAME(getrandom)
+	ENTRY_SAME(memfd_create)	/* 340 */
 
 	/* Nothing yet */
 
