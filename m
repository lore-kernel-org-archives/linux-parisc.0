From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC, PATCH] parisc: add support for force_successful_syscall_return()
Date: Wed, 14 Jan 2009 00:07:50 +0100
Message-ID: <496D1EC6.7000100@gmx.de>
References: <496520D6.9040801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <496520D6.9040801@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> I just stumbled over this commit from Paul Mackerras which added 
> support for force_successful_syscall_return() to compat_sys_time()
> and compat_sys_times():
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=e3d5a27d5862b6425d0879272e24abecf7245105
> 
> This made me wondering, if we couldn't add support for this as
> well for parisc. Important part is of course to keep backwards
> binary compatibility for userspace.
> 
> The following patch is just a draft, fully untested (not even
> compiled) and incomplete (e.g. initialization for r29 in kernel still
> needed), but it should give the idea that I have.
> My idea is to use e.g. r29 as error indicator, since r29 is even 
> marked as clobbered in old userspace syscall implementations.
> 
> So, my main question is:
> Do you think it makes sense to continue on this idea?
> My personal feeling is, that it is doable to implement
> force_successful_syscall_return() in a sane manner while keeping
> backwards ABI compatibility for parisc.
> 
> Feedback very much appreciated.

Sadly I didn't received any feedback. Anyway, maybe this just means the
idea wasn't that bad.

Here is another approach, which I personally like more.
Instead of using r29 as indication flag, this patch modifies the syscall
number itself (r20). If the highest bit is set, this indicates the
syscall was sucessful.
The benefit of r20 is, is that even the very oldest parisc kernels
returned the original syscall number in r20 and since we don't have that
many syscalls the highest bit was never touched. This means, on older
kernels the highest bit of r20 is always zero and we have a forwards- and
backwards compatible solution (e.g. new glibc on old kernel and vice versa).

Opinions?
(I'd post/add the necessary glibc patches of course as well if you think we should
add this feature to the parisc port...)

Helge

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index 302f68d..81d745f 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -61,6 +61,20 @@ void user_enable_block_step(struct task_struct *task);
 #define instruction_pointer(regs)	((regs)->iaoq[0] & ~3)
 unsigned long profile_pc(struct pt_regs *);
 extern void show_regs(struct pt_regs *);
+
+  /*
+   * System call handlers that, upon successful completion, need to return a negative value
+   * should call force_successful_syscall_return() right before returning.  On architectures
+   * where the syscall convention provides for a separate error flag (e.g., alpha, ia64,
+   * ppc{,64}, sparc{,64}, possibly others), this macro can be used to ensure that the error
+   * flag will not get set.  On architectures which do not support a separate error flag,
+   * the macro is a no-op and the spurious error condition needs to be filtered out by some
+   * other means (e.g., in user-level, by passing an extra argument to the syscall handler,
+   * or something along those lines).
+   *
+   * On parisc, we set the highest bit in the syscall function call number (r20).
+   */
+# define force_successful_syscall_return()	(current->thread.regs.gr[20] |= 0x80000000)
 #endif
 
 #endif
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index ef26b00..62de2ee 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -852,14 +852,19 @@
    are treated specially. Although r19 is clobbered by the syscall
    we cannot say this because it would violate ABI, thus we say
    r4 is clobbered and use that register to save/restore r19
-   across the syscall. */
+   across the syscall.
+   On syscall entry r20 holds the syscall number. On syscall exit
+   the highest bit of r20 is set if the syscall was successful
+   even if the return value (r28) has a negative value (which
+   itself indicates an unsuccessful syscall). */
 
 #define K_CALL_CLOB_REGS "%r1", "%r2", K_USING_GR4 \
-	        	 "%r20", "%r29", "%r31"
+	        	 "%r29", "%r31"
 
 #undef K_INLINE_SYSCALL
 #define K_INLINE_SYSCALL(name, nr, args...)	({			\
 	long __sys_res;							\
+	register unsigned long __sys_syscall __asm__("r20");		\
 	{								\
 		register unsigned long __res __asm__("r28");		\
 		K_LOAD_ARGS_##nr(args)					\
@@ -867,15 +872,16 @@
 		__asm__ volatile(					\
 			K_STW_ASM_PIC					\
 			"	ble  0x100(%%sr2, %%r0)\n"		\
-			"	ldi %1, %%r20\n"			\
+			"	ldi %2, %1\n"				\
 			K_LDW_ASM_PIC					\
-			: "=r" (__res)					\
+			: "=r" (__res), "=r" (__sys_syscall)		\
 			: "i" (SYS_ify(name)) K_ASM_ARGS_##nr   	\
 			: "memory", K_CALL_CLOB_REGS K_CLOB_ARGS_##nr	\
 		);							\
 		__sys_res = (long)__res;				\
 	}								\
-	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
+	if ( (__sys_syscall & 0x80000000) == 0 &&			\
+	     (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
 		errno = -__sys_res;		        		\
 		__sys_res = -1;						\
 	}								\
