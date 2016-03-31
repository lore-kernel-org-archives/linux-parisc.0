From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix and enable seccomp filter support
Date: Thu, 31 Mar 2016 12:24:09 +0200
Message-ID: <20160331102409.GB30590@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The seccomp filter support requires careful handling of task registers.
This includes reloading of the return value (%r28) and clean exiting at
syscall exit if secure_computing() returned -1. Additionally we need to
sign-extend the syscall number from signed 32bit to signed 64bit in
do_syscall_trace_enter() since the ptrace interface only allows setting
32bit values in compat mode.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 14f655c..86ed376 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -29,6 +29,7 @@ config PARISC
 	select TTY # Needed for pdc_cons.c
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_SECCOMP_FILTER
 	select ARCH_NO_COHERENT_DMA_MMAP
 
 	help
diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
index a5eba95..637ce8d 100644
--- a/arch/parisc/include/asm/syscall.h
+++ b/arch/parisc/include/asm/syscall.h
@@ -39,6 +39,19 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
 	}
 }
 
+static inline void syscall_set_return_value(struct task_struct *task,
+					    struct pt_regs *regs,
+					    int error, long val)
+{
+	regs->gr[28] = error ? error : val;
+}
+
+static inline void syscall_rollback(struct task_struct *task,
+				    struct pt_regs *regs)
+{
+	/* do nothing */
+}
+
 static inline int syscall_get_arch(void)
 {
 	int arch = AUDIT_ARCH_PARISC;
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index ce0b2b4..8fb81a3 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -270,7 +270,8 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 long do_syscall_trace_enter(struct pt_regs *regs)
 {
 	/* Do the secure computing check first. */
-	secure_computing_strict(regs->gr[20]);
+	if (secure_computing() == -1)
+		return -1;
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
 	    tracehook_report_syscall_entry(regs)) {
@@ -296,7 +297,11 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 			regs->gr[23] & 0xffffffff);
 
 out:
-	return regs->gr[20];
+	/*
+	 * Sign extend the syscall number to 64bit since it may have been
+	 * modified by a compat ptrace call
+	 */
+	return (int) ((u32) regs->gr[20]);
 }
 
 void do_syscall_trace_exit(struct pt_regs *regs)
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index fbafa0d..c976ebf 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -329,6 +329,7 @@ tracesys_next:
 
 	ldo     -THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1      /* get task ptr */
 	LDREG	TI_TASK(%r1), %r1
+	LDREG   TASK_PT_GR28(%r1), %r28		/* Restore return value */
 	LDREG   TASK_PT_GR26(%r1), %r26		/* Restore the users args */
 	LDREG   TASK_PT_GR25(%r1), %r25
 	LDREG   TASK_PT_GR24(%r1), %r24
@@ -342,6 +343,7 @@ tracesys_next:
 	stw     %r21, -56(%r30)                 /* 6th argument */
 #endif
 
+	cmpib,COND(=),n -1,%r20,tracesys_exit /* seccomp may have returned -1 */
 	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Ltracesys_nosys
 
