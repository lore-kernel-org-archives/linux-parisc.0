From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add ARCH_TRACEHOOK and regset support
Date: Sat, 9 Apr 2016 08:30:40 +0200
Message-ID: <20160409063040.GC4203@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Paul Moore <paul@paul-moore.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

By adding TRACEHOOK support we now get a clean user interface to access
registers via PTRACE_GETREGS, PTRACE_SETREGS, PTRACE_GETFPREGS and
PTRACE_SETFPREGS.

The user-visible regset struct user_regs_struct and user_fp_struct are
modelled similiar to x86 and can be accessed via PTRACE_GETREGSET.

Add support for the parisc architecture to the seccomp_bpf testcase.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bd3c873..ea72046 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -31,6 +31,7 @@ config PARISC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_TRACEHOOK
 	select ARCH_NO_COHERENT_DMA_MMAP
 
 	help
diff --git a/arch/parisc/include/uapi/asm/ptrace.h b/arch/parisc/include/uapi/asm/ptrace.h
index c4fa6c8..02ce2eb 100644
--- a/arch/parisc/include/uapi/asm/ptrace.h
+++ b/arch/parisc/include/uapi/asm/ptrace.h
@@ -13,6 +13,11 @@
  * N.B. gdb/strace care about the size and offsets within this
  * structure. If you change things, you may break object compatibility
  * for those applications.
+ *
+ * Please do NOT use this structure for future programs, but use
+ * user_regs_struct (see below) instead.
+ *
+ * It can be accessed through PTRACE_PEEKUSR/PTRACE_POKEUSR only.
  */
 
 struct pt_regs {
@@ -33,6 +38,45 @@ struct pt_regs {
 	unsigned long ipsw;	/* CR22 */
 };
 
+/**
+ * struct user_regs_struct - User general purpose registers
+ *
+ * This is the user-visible general purpose register state structure
+ * which is used to define the elf_gregset_t.
+ *
+ * It can be accessed through PTRACE_GETREGSET with NT_PRSTATUS
+ * and through PTRACE_GETREGS.
+ */
+struct user_regs_struct {
+	unsigned long gr[32];	/* PSW is in gr[0] */
+	unsigned long sr[8];
+	unsigned long iaoq[2];
+	unsigned long iasq[2];
+	unsigned long sar;	/* CR11 */
+	unsigned long iir;	/* CR19 */
+	unsigned long isr;	/* CR20 */
+	unsigned long ior;	/* CR21 */
+	unsigned long ipsw;	/* CR22 */
+	unsigned long cr0;
+	unsigned long cr24, cr25, cr26, cr27, cr28, cr29, cr30, cr31;
+	unsigned long cr8, cr9, cr12, cr13, cr10, cr15;
+	unsigned long _pad[80-64];	/* pad to ELF_NGREG (80) */
+};
+
+/**
+ * struct user_fp_struct - User floating point registers
+ *
+ * This is the user-visible floating point register state structure.
+ * It uses the same layout and size as elf_fpregset_t.
+ *
+ * It can be accessed through PTRACE_GETREGSET with NT_PRFPREG
+ * and through PTRACE_GETFPREGS.
+ */
+struct user_fp_struct {
+	__u64 fr[32];
+};
+
+
 /*
  * The numbers chosen here are somewhat arbitrary but absolutely MUST
  * not overlap with any of the number assigned in <linux/ptrace.h>.
@@ -43,5 +87,9 @@ struct pt_regs {
  */
 #define PTRACE_SINGLEBLOCK	12	/* resume execution until next branch */
 
+#define PTRACE_GETREGS		18
+#define PTRACE_SETREGS		19
+#define PTRACE_GETFPREGS	14
+#define PTRACE_SETFPREGS	15
 
 #endif /* _UAPI_PARISC_PTRACE_H */
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 8fb81a3..f936fc6 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -4,18 +4,20 @@
  * Copyright (C) 2000 Hewlett-Packard Co, Linuxcare Inc.
  * Copyright (C) 2000 Matthew Wilcox <matthew@wil.cx>
  * Copyright (C) 2000 David Huggins-Daines <dhd@debian.org>
- * Copyright (C) 2008 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2008-2016 Helge Deller <deller@gmx.de>
  */
 
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
+#include <linux/elf.h>
 #include <linux/errno.h>
 #include <linux/ptrace.h>
 #include <linux/tracehook.h>
 #include <linux/user.h>
 #include <linux/personality.h>
+#include <linux/regset.h>
 #include <linux/security.h>
 #include <linux/seccomp.h>
 #include <linux/compat.h>
@@ -31,6 +33,14 @@
 #define USER_PSW_BITS	(PSW_N | PSW_B | PSW_V | PSW_CB)
 
 /*
+ * These are our native regset flavors.
+ */
+enum parisc_regset {
+	REGSET_GENERAL,
+	REGSET_FP
+};
+
+/*
  * Called by kernel/ptrace.c when detaching..
  *
  * Make sure single step bits etc are not set.
@@ -114,6 +124,7 @@ void user_enable_block_step(struct task_struct *task)
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
+	unsigned long __user *datap = (unsigned long __user *)data;
 	unsigned long tmp;
 	long ret = -EIO;
 
@@ -126,7 +137,7 @@ long arch_ptrace(struct task_struct *child, long request,
 		     addr >= sizeof(struct pt_regs))
 			break;
 		tmp = *(unsigned long *) ((char *) task_regs(child) + addr);
-		ret = put_user(tmp, (unsigned long __user *) data);
+		ret = put_user(tmp, datap);
 		break;
 
 	/* Write the word at location addr in the USER area.  This will need
@@ -165,6 +176,34 @@ long arch_ptrace(struct task_struct *child, long request,
 		}
 		break;
 
+	case PTRACE_GETREGS:	/* Get all gp regs from the child. */
+		return copy_regset_to_user(child,
+					   task_user_regset_view(current),
+					   REGSET_GENERAL,
+					   0, sizeof(struct user_regs_struct),
+					   datap);
+
+	case PTRACE_SETREGS:	/* Set all gp regs in the child. */
+		return copy_regset_from_user(child,
+					     task_user_regset_view(current),
+					     REGSET_GENERAL,
+					     0, sizeof(struct user_regs_struct),
+					     datap);
+
+	case PTRACE_GETFPREGS:	/* Get the child FPU state. */
+		return copy_regset_to_user(child,
+					   task_user_regset_view(current),
+					   REGSET_FP,
+					   0, sizeof(struct user_fp_struct),
+					   datap);
+
+	case PTRACE_SETFPREGS:	/* Set the child FPU state. */
+		return copy_regset_from_user(child,
+					     task_user_regset_view(current),
+					     REGSET_FP,
+					     0, sizeof(struct user_fp_struct),
+					     datap);
+
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
@@ -314,3 +353,316 @@ void do_syscall_trace_exit(struct pt_regs *regs)
 	if (stepping || test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, stepping);
 }
+
+
+/*
+ * regset functions.
+ */
+
+static int fpr_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	__u64 *k = kbuf;
+	__u64 __user *u = ubuf;
+	__u64 reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NFPREG; --count)
+			*k++ = regs->fr[pos++];
+	else
+		for (; count > 0 && pos < ELF_NFPREG; --count)
+			if (__put_user(regs->fr[pos++], u++))
+				return -EFAULT;
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					ELF_NFPREG * sizeof(reg), -1);
+}
+
+static int fpr_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	const __u64 *k = kbuf;
+	const __u64 __user *u = ubuf;
+	__u64 reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NFPREG; --count)
+			regs->fr[pos++] = *k++;
+	else
+		for (; count > 0 && pos < ELF_NFPREG; --count) {
+			if (__get_user(reg, u++))
+				return -EFAULT;
+			regs->fr[pos++] = reg;
+		}
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					 ELF_NFPREG * sizeof(reg), -1);
+}
+
+#define RI(reg) (offsetof(struct user_regs_struct,reg) / sizeof(long))
+
+static unsigned long get_reg(struct pt_regs *regs, int num)
+{
+	switch (num) {
+	case RI(gr[0]) ... RI(gr[31]):	return regs->gr[num - RI(gr[0])];
+	case RI(sr[0]) ... RI(sr[7]):	return regs->sr[num - RI(sr[0])];
+	case RI(iasq[0]):		return regs->iasq[0];
+	case RI(iasq[1]):		return regs->iasq[1];
+	case RI(iaoq[0]):		return regs->iaoq[0];
+	case RI(iaoq[1]):		return regs->iaoq[1];
+	case RI(sar):			return regs->sar;
+	case RI(iir):			return regs->iir;
+	case RI(isr):			return regs->isr;
+	case RI(ior):			return regs->ior;
+	case RI(ipsw):			return regs->ipsw;
+	case RI(cr27):			return regs->cr27;
+	case RI(cr0):			return mfctl(0);
+	case RI(cr24):			return mfctl(24);
+	case RI(cr25):			return mfctl(25);
+	case RI(cr26):			return mfctl(26);
+	case RI(cr28):			return mfctl(28);
+	case RI(cr29):			return mfctl(29);
+	case RI(cr30):			return mfctl(30);
+	case RI(cr31):			return mfctl(31);
+	case RI(cr8):			return mfctl(8);
+	case RI(cr9):			return mfctl(9);
+	case RI(cr12):			return mfctl(12);
+	case RI(cr13):			return mfctl(13);
+	case RI(cr10):			return mfctl(10);
+	case RI(cr15):			return mfctl(15);
+	default:			return 0;
+	}
+}
+
+static void set_reg(struct pt_regs *regs, int num, unsigned long val)
+{
+	switch (num) {
+	case RI(gr[0]): /*
+			 * PSW is in gr[0].
+			 * Allow writing to Nullify, Divide-step-correction,
+			 * and carry/borrow bits.
+			 * BEWARE, if you set N, and then single step, it won't
+			 * stop on the nullified instruction.
+			 */
+			val &= USER_PSW_BITS;
+			regs->gr[0] &= ~USER_PSW_BITS;
+			regs->gr[0] |= val;
+			return;
+	case RI(gr[1]) ... RI(gr[31]):
+			regs->gr[num - RI(gr[0])] = val;
+			return;
+	case RI(iaoq[0]):
+	case RI(iaoq[1]):
+			regs->iaoq[num - RI(iaoq[0])] = val;
+			return;
+	case RI(sar):	regs->sar = val;
+			return;
+	default:	return;
+#if 0
+	/* do not allow to change any of the following registers (yet) */
+	case RI(sr[0]) ... RI(sr[7]):	return regs->sr[num - RI(sr[0])];
+	case RI(iasq[0]):		return regs->iasq[0];
+	case RI(iasq[1]):		return regs->iasq[1];
+	case RI(iir):			return regs->iir;
+	case RI(isr):			return regs->isr;
+	case RI(ior):			return regs->ior;
+	case RI(ipsw):			return regs->ipsw;
+	case RI(cr27):			return regs->cr27;
+        case cr0, cr24, cr25, cr26, cr27, cr28, cr29, cr30, cr31;
+        case cr8, cr9, cr12, cr13, cr10, cr15;
+#endif
+	}
+}
+
+static int gpr_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	unsigned long *k = kbuf;
+	unsigned long __user *u = ubuf;
+	unsigned long reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			*k++ = get_reg(regs, pos++);
+	else
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			if (__put_user(get_reg(regs, pos++), u++))
+				return -EFAULT;
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					ELF_NGREG * sizeof(reg), -1);
+}
+
+static int gpr_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	const unsigned long *k = kbuf;
+	const unsigned long __user *u = ubuf;
+	unsigned long reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			set_reg(regs, pos++, *k++);
+	else
+		for (; count > 0 && pos < ELF_NGREG; --count) {
+			if (__get_user(reg, u++))
+				return -EFAULT;
+			set_reg(regs, pos++, reg);
+		}
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					 ELF_NGREG * sizeof(reg), -1);
+}
+
+static const struct user_regset native_regsets[] = {
+	[REGSET_GENERAL] = {
+		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		.size = sizeof(long), .align = sizeof(long),
+		.get = gpr_get, .set = gpr_set
+	},
+	[REGSET_FP] = {
+		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		.size = sizeof(__u64), .align = sizeof(__u64),
+		.get = fpr_get, .set = fpr_set
+	}
+};
+
+static const struct user_regset_view user_parisc_native_view = {
+	.name = "parisc", .e_machine = ELF_ARCH, .ei_osabi = ELFOSABI_LINUX,
+	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
+};
+
+#ifdef CONFIG_64BIT
+#include <linux/compat.h>
+
+static int gpr32_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	compat_ulong_t *k = kbuf;
+	compat_ulong_t __user *u = ubuf;
+	compat_ulong_t reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			*k++ = get_reg(regs, pos++);
+	else
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			if (__put_user((compat_ulong_t) get_reg(regs, pos++), u++))
+				return -EFAULT;
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					ELF_NGREG * sizeof(reg), -1);
+}
+
+static int gpr32_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	struct pt_regs *regs = task_regs(target);
+	const compat_ulong_t *k = kbuf;
+	const compat_ulong_t __user *u = ubuf;
+	compat_ulong_t reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < ELF_NGREG; --count)
+			set_reg(regs, pos++, *k++);
+	else
+		for (; count > 0 && pos < ELF_NGREG; --count) {
+			if (__get_user(reg, u++))
+				return -EFAULT;
+			set_reg(regs, pos++, reg);
+		}
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					 ELF_NGREG * sizeof(reg), -1);
+}
+
+/*
+ * These are the regset flavors matching the 32bit native set.
+ */
+static const struct user_regset compat_regsets[] = {
+	[REGSET_GENERAL] = {
+		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		.size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
+		.get = gpr32_get, .set = gpr32_set
+	},
+	[REGSET_FP] = {
+		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		.size = sizeof(__u64), .align = sizeof(__u64),
+		.get = fpr_get, .set = fpr_set
+	}
+};
+
+static const struct user_regset_view user_parisc_compat_view = {
+	.name = "parisc", .e_machine = EM_PARISC, .ei_osabi = ELFOSABI_LINUX,
+	.regsets = compat_regsets, .n = ARRAY_SIZE(compat_regsets)
+};
+#endif	/* CONFIG_64BIT */
+
+const struct user_regset_view *task_user_regset_view(struct task_struct *task)
+{
+	BUILD_BUG_ON(sizeof(struct user_regs_struct)/sizeof(long) != ELF_NGREG);
+	BUILD_BUG_ON(sizeof(struct user_fp_struct)/sizeof(__u64) != ELF_NFPREG);
+#ifdef CONFIG_64BIT
+	if (is_compat_task())
+		return &user_parisc_compat_view;
+#endif
+	return &user_parisc_native_view;
+}
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index b9453b8..e9eec23 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1234,6 +1234,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS	struct user_pt_regs
 # define SYSCALL_NUM	regs[8]
 # define SYSCALL_RET	regs[0]
+#elif defined(__hppa__)
+# define ARCH_REGS	struct user_regs_struct
+# define SYSCALL_NUM	gr[20]
+# define SYSCALL_RET	gr[28]
 #elif defined(__powerpc__)
 # define ARCH_REGS	struct pt_regs
 # define SYSCALL_NUM	gpr[0]
@@ -1293,7 +1297,7 @@ void change_syscall(struct __test_metadata *_metadata,
 	EXPECT_EQ(0, ret);
 
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
-    defined(__s390__)
+    defined(__s390__) || defined(__hppa__)
 	{
 		regs.SYSCALL_NUM = syscall;
 	}
@@ -1479,6 +1483,8 @@ TEST_F(TRACE_syscall, syscall_dropped)
 #  define __NR_seccomp 383
 # elif defined(__aarch64__)
 #  define __NR_seccomp 277
+# elif defined(__hppa__)
+#  define __NR_seccomp 338
 # elif defined(__powerpc__)
 #  define __NR_seccomp 358
 # elif defined(__s390__)
