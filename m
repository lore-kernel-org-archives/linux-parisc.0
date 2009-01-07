From: Helge Deller <deller@gmx.de>
Subject: [RFC, PATCH] parisc: add support for force_successful_syscall_return()
Date: Wed, 07 Jan 2009 22:38:30 +0100
Message-ID: <496520D6.9040801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I just stumbled over this commit from Paul Mackerras which added 
support for force_successful_syscall_return() to compat_sys_time()
and compat_sys_times():
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=e3d5a27d5862b6425d0879272e24abecf7245105

This made me wondering, if we couldn't add support for this as
well for parisc. Important part is of course to keep backwards
binary compatibility for userspace.

The following patch is just a draft, fully untested (not even
compiled) and incomplete (e.g. initialization for r29 in kernel still
needed), but it should give the idea that I have.
My idea is to use e.g. r29 as error indicator, since r29 is even 
marked as clobbered in old userspace syscall implementations.

So, my main question is:
Do you think it makes sense to continue on this idea?
My personal feeling is, that it is doable to implement
force_successful_syscall_return() in a sane manner while keeping
backwards ABI compatibility for parisc.

Feedback very much appreciated.

Helge

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index 302f68d..a54f7bb 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -61,6 +61,9 @@ void user_enable_block_step(struct task_struct *task);
 #define instruction_pointer(regs)	((regs)->iaoq[0] & ~3)
 unsigned long profile_pc(struct pt_regs *);
 extern void show_regs(struct pt_regs *);
+
+#define force_successful_syscall_return() (current->thread.regs.gr[29] = 0)
+
 #endif
 
 #endif
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index ef26b00..3649008 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -852,16 +852,20 @@
    are treated specially. Although r19 is clobbered by the syscall
    we cannot say this because it would violate ABI, thus we say
    r4 is clobbered and use that register to save/restore r19
-   across the syscall. */
+   across the syscall. If r28 is between -4095 and -1, r29==0
+   indicates a sucessful syscall even if the return value is
+   negative. */
 
 #define K_CALL_CLOB_REGS "%r1", "%r2", K_USING_GR4 \
-	        	 "%r20", "%r29", "%r31"
+	        	 "%r20", /* "%r29",*/ "%r31"
 
 #undef K_INLINE_SYSCALL
 #define K_INLINE_SYSCALL(name, nr, args...)	({			\
 	long __sys_res;							\
+	unsigned long __sys_res_unsucessful;				\
 	{								\
 		register unsigned long __res __asm__("r28");		\
+		register unsigned long __res_not_ok __asm__("r29");	\
 		K_LOAD_ARGS_##nr(args)					\
 		/* FIXME: HACK stw/ldw r19 around syscall */		\
 		__asm__ volatile(					\
@@ -874,8 +878,10 @@
 			: "memory", K_CALL_CLOB_REGS K_CLOB_ARGS_##nr	\
 		);							\
 		__sys_res = (long)__res;				\
+		__sys_res_unsucessful = __res_not_ok;			\
 	}								\
-	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
+	if ( __sys_res_unsucessful && 					\
+	    (unsigned long)__sys_res >= (unsigned long)-4095 ){		\
 		errno = -__sys_res;		        		\
 		__sys_res = -1;						\
 	}								\
