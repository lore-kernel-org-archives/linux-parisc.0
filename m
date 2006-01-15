From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Make parisc64 work on Linus
Date: Sun, 15 Jan 2006 14:18:47 -0500
Message-ID: <20060115191847.GE21721@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all, 

I spent the early afternoon kludging this into place... I wanted to
get parisc64 compiling without the compat patchset. Here's the work
in progress against current Linus head. Can someone check this over
to make sure I didn't do anything obviously stupid?

(Note, includes atomic64 and the missing fix from mm/init.c, since I 
needed it to compile.)

Compile and boot tested on 64-bit, but that's about it.

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 27160e8..413292f 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -91,7 +91,7 @@ long arch_ptrace(struct task_struct *chi
 		int copied;
 
 #ifdef __LP64__
-		if (is_compat_task(child)) {
+		if (personality(child->personality) == PER_LINUX32) {
 			unsigned int tmp;
 
 			addr &= 0xffffffffL;
@@ -123,7 +123,7 @@ long arch_ptrace(struct task_struct *chi
 	case PTRACE_POKEDATA:
 		ret = 0;
 #ifdef __LP64__
-		if (is_compat_task(child)) {
+		if (personality(child->personality) == PER_LINUX32) {
 			unsigned int tmp = (unsigned int)data;
 			DBG("sys_ptrace(POKE%s, %d, %lx, %lx)\n",
 				request == PTRACE_POKETEXT ? "TEXT" : "DATA",
@@ -146,7 +146,7 @@ long arch_ptrace(struct task_struct *chi
 	case PTRACE_PEEKUSR: {
 		ret = -EIO;
 #ifdef __LP64__
-		if (is_compat_task(child)) {
+		if (personality(child->personality) == PER_LINUX32) {
 			unsigned int tmp;
 
 			if (addr & (sizeof(int)-1))
@@ -205,7 +205,7 @@ long arch_ptrace(struct task_struct *chi
 			goto out_tsk;
 		}
 #ifdef __LP64__
-		if (is_compat_task(child)) {
+		if (personality(child->personality) == PER_LINUX32) {
 			if (addr & (sizeof(int)-1))
 				goto out_tsk;
 			if ((addr = translate_usr_offset(addr)) < 0)
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 3a25a7b..05767e8 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -317,7 +317,7 @@ setup_rt_frame(int sig, struct k_sigacti
 	
 	if(personality(current->personality) == PER_LINUX32) {
 		DBG(1,"setup_rt_frame: frame->info = 0x%p\n", &compat_frame->info);
-		err |= compat_copy_siginfo_to_user(&compat_frame->info, info);
+		err |= copy_siginfo_to_user32(&compat_frame->info, info);
 		DBG(1,"SETUP_RT_FRAME: 1\n");
 		compat_val = (compat_int_t)current->sas_ss_sp;
 		err |= __put_user(compat_val, &compat_frame->uc.uc_stack.ss_sp);
diff --git a/arch/parisc/kernel/signal32.c b/arch/parisc/kernel/signal32.c
index 0792e20..75a803f 100644
--- a/arch/parisc/kernel/signal32.c
+++ b/arch/parisc/kernel/signal32.c
@@ -31,7 +31,6 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 
-#include <asm/compat_signal.h>
 #include <asm/uaccess.h>
 
 #include "signal32.h"
@@ -50,6 +49,107 @@
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
+int
+copy_siginfo_from_user32 (siginfo_t *to, compat_siginfo_t __user *from)
+{
+        unsigned long tmp;
+        int err;
+
+        if (!access_ok(VERIFY_READ, from, sizeof(compat_siginfo_t)))
+                return -EFAULT;
+
+        err = __get_user(to->si_signo, &from->si_signo);
+        err |= __get_user(to->si_errno, &from->si_errno);
+        err |= __get_user(to->si_code, &from->si_code);
+
+        if (to->si_code < 0)
+                err |= __copy_from_user(&to->_sifields._pad, &from->_sifields._pad, SI_PAD_SIZE);
+        else {
+                switch (to->si_code >> 16) {
+                      case __SI_CHLD >> 16:
+                        err |= __get_user(to->si_utime, &from->si_utime);
+                        err |= __get_user(to->si_stime, &from->si_stime);
+                        err |= __get_user(to->si_status, &from->si_status);
+                      default:
+                        err |= __get_user(to->si_pid, &from->si_pid);
+                        err |= __get_user(to->si_uid, &from->si_uid);
+                        break;
+                      case __SI_FAULT >> 16:
+                        err |= __get_user(tmp, &from->si_addr);
+                        to->si_addr = (void __user *) tmp;
+                        break;
+                      case __SI_POLL >> 16:
+                        err |= __get_user(to->si_band, &from->si_band);
+                        err |= __get_user(to->si_fd, &from->si_fd);
+                        break;
+                      case __SI_RT >> 16: /* This is not generated by the kernel  as of now.  */
+                      case __SI_MESGQ >> 16:
+                        err |= __get_user(to->si_pid, &from->si_pid);
+                        err |= __get_user(to->si_uid, &from->si_uid);
+                        err |= __get_user(to->si_int, &from->si_int);
+                        break;
+                }
+        }
+        return err;
+}
+
+int
+copy_siginfo_to_user32 (compat_siginfo_t __user *to, siginfo_t *from)
+{
+        unsigned int addr;
+        int err;
+
+        if (!access_ok(VERIFY_WRITE, to, sizeof(compat_siginfo_t)))
+                return -EFAULT;
+
+        /* If you change siginfo_t structure, please be sure
+           this code is fixed accordingly.
+           It should never copy any pad contained in the structure
+           to avoid security leaks, but must copy the generic
+           3 ints plus the relevant union member.
+           This routine must convert siginfo from 64bit to 32bit as well
+           at the same time.  */
+        err = __put_user(from->si_signo, &to->si_signo);
+        err |= __put_user(from->si_errno, &to->si_errno);
+        err |= __put_user((short)from->si_code, &to->si_code);
+        if (from->si_code < 0)
+                err |= __copy_to_user(&to->_sifields._pad, &from->_sifields._pad, SI_PAD_SIZE);
+        else {
+                switch (from->si_code >> 16) {
+                case __SI_CHLD >> 16:
+                        err |= __put_user(from->si_utime, &to->si_utime);
+                        err |= __put_user(from->si_stime, &to->si_stime);
+                        err |= __put_user(from->si_status, &to->si_status);
+                default:
+                        err |= __put_user(from->si_pid, &to->si_pid);
+                        err |= __put_user(from->si_uid, &to->si_uid);
+                        break;
+                case __SI_FAULT >> 16:
+                        /* avoid type-checking warnings by copying _pad[0] in lieu of si_addr... */
+                        err |= __put_user(from->_sifields._pad[0], &to->si_addr);
+                        break;
+                case __SI_POLL >> 16:
+                        err |= __put_user(from->si_band, &to->si_band);
+                        err |= __put_user(from->si_fd, &to->si_fd);
+                        break;
+                case __SI_TIMER >> 16:
+                        err |= __put_user(from->si_tid, &to->si_tid);
+                        err |= __put_user(from->si_overrun, &to->si_overrun);
+                        addr = (unsigned long) from->si_ptr;
+                        err |= __put_user(addr, &to->si_ptr);
+                        break;
+                case __SI_RT >> 16:     /* Not generated by the kernel as of now. */
+                case __SI_MESGQ >> 16:
+                        err |= __put_user(from->si_uid, &to->si_uid);
+                        err |= __put_user(from->si_pid, &to->si_pid);
+                        addr = (unsigned long) from->si_ptr;
+                        err |= __put_user(addr, &to->si_ptr);
+                        break;
+                }
+        }
+        return err;
+}
+
 inline void
 sigset_32to64(sigset_t *s64, compat_sigset_t *s32)
 {
@@ -398,3 +498,4 @@ setup_sigcontext32(struct compat_sigcont
 
 	return err;
 }
+
diff --git a/arch/parisc/kernel/signal32.h b/arch/parisc/kernel/signal32.h
index 4d1569e..e39b38a 100644
--- a/arch/parisc/kernel/signal32.h
+++ b/arch/parisc/kernel/signal32.h
@@ -20,8 +20,34 @@
 #define _PARISC64_KERNEL_SIGNAL32_H
 
 #include <linux/compat.h>
-#include <asm/compat_signal.h>
-#include <asm/compat_rt_sigframe.h>
+
+typedef compat_uptr_t compat_sighandler_t;
+
+typedef struct compat_sigaltstack {
+        compat_uptr_t ss_sp;
+        compat_int_t ss_flags;
+        compat_size_t ss_size;
+} compat_stack_t;
+
+/* Most things should be clean enough to redefine this at will, if care
+   is taken to make libc match.  */
+
+struct compat_sigaction {
+        compat_sighandler_t sa_handler;
+        compat_uint_t sa_flags;
+        compat_sigset_t sa_mask;               /* mask last for extensibility */
+};
+
+/* 32-bit ucontext as seen from an 64-bit kernel */
+struct compat_ucontext {
+        compat_uint_t uc_flags;
+        compat_uptr_t uc_link;
+        compat_stack_t uc_stack;        /* struct compat_sigaltstack (12 bytes)*/
+        /* FIXME: Pad out to get uc_mcontext to start at an 8-byte aligned boundary */
+        compat_uint_t pad[1];
+        struct compat_sigcontext uc_mcontext;
+        compat_sigset_t uc_sigmask;     /* mask last for extensibility */
+};
 
 /* ELF32 signal handling */
 
@@ -29,6 +55,103 @@ struct k_sigaction32 {
 	struct compat_sigaction sa;
 };
 
+typedef struct compat_siginfo {
+        int si_signo;
+        int si_errno;
+        int si_code;
+
+        union {
+                int _pad[((128/sizeof(int)) - 3)];
+
+                /* kill() */
+                struct {
+                        unsigned int _pid;      /* sender's pid */
+                        unsigned int _uid;      /* sender's uid */
+                } _kill;
+
+                /* POSIX.1b timers */
+                struct {
+                        compat_timer_t _tid;            /* timer id */
+                        int _overrun;           /* overrun count */
+                        char _pad[sizeof(unsigned int) - sizeof(int)];
+                        compat_sigval_t _sigval;        /* same as below */
+                        int _sys_private;       /* not to be passed to user */
+                } _timer;
+
+                /* POSIX.1b signals */
+                struct {
+                        unsigned int _pid;      /* sender's pid */
+                        unsigned int _uid;      /* sender's uid */
+                        compat_sigval_t _sigval;
+                } _rt;
+
+                /* SIGCHLD */
+                struct {
+                        unsigned int _pid;      /* which child */
+                        unsigned int _uid;      /* sender's uid */
+                        int _status;            /* exit code */
+                        compat_clock_t _utime;
+                        compat_clock_t _stime;
+                } _sigchld;
+
+                /* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
+                struct {
+                        unsigned int _addr;     /* faulting insn/memory ref. */
+                } _sigfault;
+
+                /* SIGPOLL */
+                struct {
+                        int _band;      /* POLL_IN, POLL_OUT, POLL_MSG */
+                        int _fd;
+                } _sigpoll;
+        } _sifields;
+} compat_siginfo_t;
+
+int copy_siginfo_to_user32 (compat_siginfo_t __user *to, siginfo_t *from);
+int copy_siginfo_from_user32 (siginfo_t *to, compat_siginfo_t __user *from);
+
+/* In a deft move of uber-hackery, we decide to carry the top half of all
+ * 64-bit registers in a non-portable, non-ABI, hidden structure.
+ * Userspace can read the hidden structure if it *wants* but is never
+ * guaranteed to be in the same place. Infact the uc_sigmask from the
+ * ucontext_t structure may push the hidden register file downards
+ */
+struct compat_regfile {
+        /* Upper half of all the 64-bit registers that were truncated
+           on a copy to a 32-bit userspace */
+        compat_int_t rf_gr[32];
+        compat_int_t rf_iasq[2];
+        compat_int_t rf_iaoq[2];
+        compat_int_t rf_sar;
+};
+
+#define COMPAT_SIGRETURN_TRAMP 4
+#define COMPAT_SIGRESTARTBLOCK_TRAMP 5
+#define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + \
+				COMPAT_SIGRESTARTBLOCK_TRAMP)
+
+struct compat_rt_sigframe {
+        /* XXX: Must match trampoline size in arch/parisc/kernel/signal.c
+                Secondary to that it must protect the ERESTART_RESTARTBLOCK
+                trampoline we left on the stack (we were bad and didn't
+                change sp so we could run really fast.) */
+        compat_uint_t tramp[COMPAT_TRAMP_SIZE];
+        compat_siginfo_t info;
+        struct compat_ucontext uc;
+        /* Hidden location of truncated registers, *must* be last. */
+        struct compat_regfile regs;
+};
+
+/*
+ * The 32-bit ABI wants at least 48 bytes for a function call frame:
+ * 16 bytes for arg0-arg3, and 32 bytes for magic (the only part of
+ * which Linux/parisc uses is sp-20 for the saved return pointer...)
+ * Then, the stack pointer must be rounded to a cache line (64 bytes).
+ */
+#define SIGFRAME32              64
+#define FUNCTIONCALLFRAME32     48
+#define PARISC_RT_SIGFRAME_SIZE32 (((sizeof(struct compat_rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
+
 void sigset_32to64(sigset_t *s64, compat_sigset_t *s32);
 void sigset_64to32(compat_sigset_t *s32, sigset_t *s64);
 int do_sigaltstack32 (const compat_stack_t __user *uss32, 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 720287d..9e03227 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -792,8 +792,6 @@ map_hpux_gateway_page(struct task_struct
 EXPORT_SYMBOL(map_hpux_gateway_page);
 #endif
 
-extern void flush_tlb_all_local(void);
-
 void __init paging_init(void)
 {
 	int i;
@@ -802,7 +800,7 @@ void __init paging_init(void)
 	pagetable_init();
 	gateway_init();
 	flush_cache_all_local(); /* start with known state */
-	flush_tlb_all_local();
+	flush_tlb_all_local(NULL);
 
 	for (i = 0; i < npmem_ranges; i++) {
 		unsigned long zones_size[MAX_NR_ZONES] = { 0, 0, 0 };
diff --git a/include/asm-generic/atomic.h b/include/asm-generic/atomic.h
index 0fada8f..42a95d9 100644
--- a/include/asm-generic/atomic.h
+++ b/include/asm-generic/atomic.h
@@ -35,7 +35,7 @@ static inline void atomic_long_set(atomi
 {
 	atomic64_t *v = (atomic64_t *)l;
 
-	atomic_set(v, i);
+	atomic64_set(v, i);
 }
 
 static inline void atomic_long_inc(atomic_long_t *l)
diff --git a/include/asm-parisc/atomic.h b/include/asm-parisc/atomic.h
index 2ca56d3..a168690 100644
--- a/include/asm-parisc/atomic.h
+++ b/include/asm-parisc/atomic.h
@@ -1,9 +1,12 @@
+/* Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
+ * Copyright (C) 2006 Kyle McMartin <kyle@parisc-linux.org>
+ */
+
 #ifndef _ASM_PARISC_ATOMIC_H_
 #define _ASM_PARISC_ATOMIC_H_
 
 #include <linux/config.h>
 #include <asm/system.h>
-/* Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>.  */
 
 /*
  * Atomic operations that C can't guarantee us.  Useful for
@@ -46,15 +49,6 @@ extern raw_spinlock_t __atomic_hash[ATOM
 #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
 #endif
 
-/* Note that we need not lock read accesses - aligned word writes/reads
- * are atomic, so a reader never sees unconsistent values.
- *
- * Cache-line alignment would conflict with, for example, linux/module.h
- */
-
-typedef struct { volatile int counter; } atomic_t;
-
-
 /* This should get optimized out since it's never called.
 ** Or get a link error if xchg is used "wrong".
 */
@@ -69,10 +63,9 @@ extern unsigned long __xchg64(unsigned l
 #endif
 
 /* optimizer better get rid of switch since size is a constant */
-static __inline__ unsigned long __xchg(unsigned long x, __volatile__ void * ptr,
-                                       int size)
+static __inline__ unsigned long 
+__xchg(unsigned long x, __volatile__ void * ptr, int size)
 {
-
 	switch(size) {
 #ifdef __LP64__
 	case 8: return __xchg64(x,(unsigned long *) ptr);
@@ -129,7 +122,13 @@ __cmpxchg(volatile void *ptr, unsigned l
 				    (unsigned long)_n_, sizeof(*(ptr))); \
   })
 
+/* Note that we need not lock read accesses - aligned word writes/reads
+ * are atomic, so a reader never sees unconsistent values.
+ *
+ * Cache-line alignment would conflict with, for example, linux/module.h
+ */
 
+typedef struct { volatile s32 counter; } atomic_t;
 
 /* It's possible to reduce all atomic operations to either
  * __atomic_add_return, atomic_set and atomic_read (the latter
@@ -217,5 +216,59 @@ static __inline__ int atomic_read(const 
 #define smp_mb__before_atomic_inc()	smp_mb()
 #define smp_mb__after_atomic_inc()	smp_mb()
 
+#ifdef __LP64__
+
+typedef struct { volatile s64 counter; } atomic64_t;
+
+#define ATOMIC64_INIT(i) { (i) }
+
+static __inline__ int 
+__atomic64_add_return(s64 i, atomic64_t *v)
+{
+	int ret;
+	unsigned long flags;
+	_atomic_spin_lock_irqsave(v, flags);
+
+	ret = (v->counter += i);
+
+	_atomic_spin_unlock_irqrestore(v, flags);
+	return ret;
+}
+
+static __inline__ void 
+atomic64_set(atomic64_t *v, s64 i) 
+{
+	unsigned long flags;
+	_atomic_spin_lock_irqsave(v, flags);
+
+	v->counter = i;
+
+	_atomic_spin_unlock_irqrestore(v, flags);
+}
+
+static __inline__ s64 
+atomic64_read(const atomic64_t *v)
+{
+	return v->counter;
+}
+
+#define atomic64_add(i,v)	((void)(__atomic64_add_return( ((s64)i),(v))))
+#define atomic64_sub(i,v)	((void)(__atomic64_add_return(-((s64)i),(v))))
+#define atomic64_inc(v)		((void)(__atomic64_add_return(   1,(v))))
+#define atomic64_dec(v)		((void)(__atomic64_add_return(  -1,(v))))
+
+#define atomic64_add_return(i,v)	(__atomic64_add_return( ((s64)i),(v)))
+#define atomic64_sub_return(i,v)	(__atomic64_add_return(-((s64)i),(v)))
+#define atomic64_inc_return(v)		(__atomic64_add_return(   1,(v)))
+#define atomic64_dec_return(v)		(__atomic64_add_return(  -1,(v)))
+
+#define atomic64_add_negative(a, v)	(atomic64_add_return((a), (v)) < 0)
+
+#define atomic64_inc_and_test(v) 	(atomic64_inc_return(v) == 0)
+#define atomic64_dec_and_test(v)	(atomic64_dec_return(v) == 0)
+
+#endif /* __LP64__ */
+
 #include <asm-generic/atomic.h>
-#endif
+
+#endif /* _ASM_PARISC_ATOMIC_H_ */
diff --git a/include/asm-parisc/compat_rt_sigframe.h b/include/asm-parisc/compat_rt_sigframe.h
deleted file mode 100644
index 81bec28..0000000
--- a/include/asm-parisc/compat_rt_sigframe.h
+++ /dev/null
@@ -1,50 +0,0 @@
-#include<linux/compat.h>
-#include<linux/compat_siginfo.h>
-#include<asm/compat_ucontext.h>
-
-#ifndef _ASM_PARISC_COMPAT_RT_SIGFRAME_H
-#define _ASM_PARISC_COMPAT_RT_SIGFRAME_H
-
-/* In a deft move of uber-hackery, we decide to carry the top half of all
- * 64-bit registers in a non-portable, non-ABI, hidden structure.
- * Userspace can read the hidden structure if it *wants* but is never
- * guaranteed to be in the same place. Infact the uc_sigmask from the 
- * ucontext_t structure may push the hidden register file downards
- */
-struct compat_regfile {
-	/* Upper half of all the 64-bit registers that were truncated
-	   on a copy to a 32-bit userspace */
-	compat_int_t rf_gr[32];
-	compat_int_t rf_iasq[2];
-	compat_int_t rf_iaoq[2];
-	compat_int_t rf_sar;
-};
-
-#define COMPAT_SIGRETURN_TRAMP 4
-#define COMPAT_SIGRESTARTBLOCK_TRAMP 5 
-#define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + COMPAT_SIGRESTARTBLOCK_TRAMP)
-
-struct compat_rt_sigframe {
-	/* XXX: Must match trampoline size in arch/parisc/kernel/signal.c 
-	        Secondary to that it must protect the ERESTART_RESTARTBLOCK
-		trampoline we left on the stack (we were bad and didn't 
-		change sp so we could run really fast.) */
-	compat_uint_t tramp[COMPAT_TRAMP_SIZE];
-	compat_siginfo_t info;
-	struct compat_ucontext uc;
-	/* Hidden location of truncated registers, *must* be last. */
-	struct compat_regfile regs; 
-};
-
-/*
- * The 32-bit ABI wants at least 48 bytes for a function call frame:
- * 16 bytes for arg0-arg3, and 32 bytes for magic (the only part of
- * which Linux/parisc uses is sp-20 for the saved return pointer...)
- * Then, the stack pointer must be rounded to a cache line (64 bytes).
- */
-#define SIGFRAME32		64
-#define FUNCTIONCALLFRAME32	48
-#define PARISC_RT_SIGFRAME_SIZE32					\
-	(((sizeof(struct compat_rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
-
-#endif
diff --git a/include/asm-parisc/compat_signal.h b/include/asm-parisc/compat_signal.h
deleted file mode 100644
index 6ad02c3..0000000
--- a/include/asm-parisc/compat_signal.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* Use generic */
-#include <asm-generic/compat_signal.h>
diff --git a/include/asm-parisc/compat_ucontext.h b/include/asm-parisc/compat_ucontext.h
index a1228a3..2f7292a 100644
--- a/include/asm-parisc/compat_ucontext.h
+++ b/include/asm-parisc/compat_ucontext.h
@@ -1,8 +1,7 @@
 #ifndef _ASM_PARISC_COMPAT_UCONTEXT_H
 #define _ASM_PARISC_COMPAT_UCONTEXT_H
 
-#include<linux/compat.h>
-#include<asm/compat_signal.h>
+#include <linux/compat.h>
 
 /* 32-bit ucontext as seen from an 64-bit kernel */
 struct compat_ucontext {
diff --git a/include/asm-parisc/rt_sigframe.h b/include/asm-parisc/rt_sigframe.h
index 5623c03..f0dd3b3 100644
--- a/include/asm-parisc/rt_sigframe.h
+++ b/include/asm-parisc/rt_sigframe.h
@@ -1,10 +1,6 @@
 #ifndef _ASM_PARISC_RT_SIGFRAME_H
 #define _ASM_PARISC_RT_SIGFRAME_H
 
-#ifdef CONFIG_COMPAT
-#include <asm/compat_rt_sigframe.h>
-#endif
