Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE6174921
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 13:48:05 -0600 (MDT)
Received: from puffin (IDENT:grundler@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA10588
	for <parisc-linux@lists.parisc-linux.org>; Tue, 9 Oct 2001 13:44:58 -0600
Message-Id: <200110091944.NAA10588@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] review of Documentation/parisc/unwritten 
In-Reply-To: Message from Grant Grundler <grundler@puffin.external.hp.com>
   of "Sat, 06 Oct 2001 03:19:58 MDT." <200110060919.DAA06756@puffin.external.hp.com>
Date: Tue, 09 Oct 2001 13:44:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Hi all,
> In summary, it looks like unwritten file can be deleted.
> Notes from reviewing Documentation/parisc/unwritten are appended.

Update of remaining items appended.  I'll file wishlist
severity bugs for the those items unless told otherwise.
And then delete unwritten and close kernel bug #35.

I've committed the "easy" changes (diff appended).
Since I'm only removing unused stuff, no -paXX change.

thanks,
grant

csum_partial_copy
csum_partial_copy_from_user
		arch/parisc/lib/checksum.c
		We want optimized asm for both of those.

do_check_pgt_cache	arch/parisc/mm/init.c
		NOP. this seems wrong.
		all the other arches have (about) the same thing here.
		sparc64 has some CONFIG_SMP in it.

sigaddset
sigdelset	include/linux/signal.h
		Only i386 and m68k define __HAVE_ARCH_SIG_BITOPS.
		parisc ends up using "generic" code like most other arches.
		Is this an issue?



Index: Documentation/parisc/unwritten
===================================================================
RCS file: /home/cvs/parisc/linux/Documentation/parisc/unwritten,v
retrieving revision 1.7
diff -u -p -r1.7 unwritten
--- unwritten	2001/10/09 05:23:19	1.7
+++ unwritten	2001/10/09 19:22:25
@@ -1,59 +1,16 @@
-Hi all,
-Notes from reviewing Documentation/parisc/unwritten.
-In summary, it looks like unwritten file can be deleted.
-
-I'll take care of things marked delete unless someone objects.
-
-Please give feedback on items marked "review?".
-It means I didn't know what to do but status quo didn't seem
-right to me either.
-
-grant
-
-
-sys_idle	./include/asm-parisc/unistd.h
-		obsolete - delete usage.
-
-reboot_setup()	arch/parisc/kernel/process.c
-		not used. delete function.
-
-machine_halt		BUG. NOP.  Should update LEDs/ChassisCode.
-machine_power_on	obsolete - delete it
-		arch/parisc/kernel/process.c
-
-exit_thread		NOP is ok.
-flush_thread		review?
-		arch/parisc/kernel/process.c.
-		Only needs to handle fpu stuff or perf monitors.
-		(several arches implement a "lazy fpu state"...interesting)
-
-strlen_user	include/asm-parisc/uaccess.h
-		#define strlen_user(str) lstrnlen_user(str, 0x7fffffffL)
-		review?
+csum_partial_copy
+csum_partial_copy_from_user
+		arch/parisc/lib/checksum.c
+		We want optimized asm for both of those.
+

 do_check_pgt_cache	arch/parisc/mm/init.c
 		NOP. this seems wrong.
 		all the other arches have (about) the same thing here.
 		sparc64 has some CONFIG_SMP in it.
 
-set_pte_phys	arch/parisc/mm/init.c
-		orphaned. delete it.
-
-check_bugs	include/asm-parisc/bugs.h
-		NOP. Check for CPU bugs or misconfigured kernel.
-		review?
-
-csum_partial_copy
-csum_partial_copy_from_user
-		arch/parisc/lib/checksum.c
-		We want optimized asm for both of those.
-
 sigaddset
 sigdelset	include/linux/signal.h
 		Only i386 and m68k define __HAVE_ARCH_SIG_BITOPS.
 		parisc ends up using "generic" code like most other arches.
 		Is this an issue?
-
-get_cycles	include/asm-parisc/timex.h
-		Defined as "mfctl(16)". Is this ok?
-		Only used in drivers/drm/ and kernel/sched.c.
Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.37
diff -u -p -r1.37 process.c
--- process.c	2001/06/30 23:47:53	1.37
+++ process.c	2001/10/09 19:22:25
@@ -74,9 +74,6 @@ void cpu_idle(void)
 	}
 }
 
-void __init reboot_setup(char *str, int *ints)
-{
-}
 
 #ifdef __LP64__
 #define COMMAND_GLOBAL  0xfffffffffffe0030UL
@@ -130,11 +127,12 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	/*
+	** The LED/ChassisCodes are updated by the led_halt()
+	** function, called by the reboot notifier chain.
+	*/
 }
 
-void machine_power_on(void)
-{
-}
 
 /* This routine is called from sys_reboot to actually turn off the
  * machine */
@@ -171,6 +169,9 @@ void exit_thread(void)
 
 void flush_thread(void)
 {
+	/* Only needs to handle fpu stuff or perf monitors.
+	** REVISIT: several arches implement a "lazy fpu state".
+	*/
 	set_fs(USER_DS);
 }
 
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/mm/init.c,v
retrieving revision 1.40
diff -u -p -r1.40 init.c
--- init.c	2001/10/07 01:15:02	1.40
+++ init.c	2001/10/09 19:22:25
@@ -467,9 +467,6 @@ void show_mem(void)
 	show_buffers();
 }
 
-void set_pte_phys (unsigned long vaddr, unsigned long phys)
-{
-}
 
 static void __init map_pages(unsigned long start_vaddr, unsigned long start_paddr, unsigned long size, pgprot_t pgprot)
 {
Index: include/asm-parisc/unistd.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/unistd.h,v
retrieving revision 1.22
diff -u -p -r1.22 unistd.h
--- unistd.h	2001/07/05 23:09:06	1.22
+++ unistd.h	2001/10/09 19:22:26
@@ -809,13 +809,8 @@ type name(type1 arg1, type2 arg2, type3 
     return K_INLINE_SYSCALL(name, 6, arg1, arg2, arg3, arg4, arg5, arg6);	\
 }
 
-#ifdef __KERNEL_SYSCALLS__
 
-static inline int idle(void)
-{
-	extern int sys_idle(void);
-	return sys_idle();
-}
+#ifdef __KERNEL_SYSCALLS__
 
 static inline int pause(void)
 {
@@ -859,6 +854,13 @@ static inline int dup(int fd)
 	return sys_dup(fd);
 }
 
+static inline int execve(char *filename, char * argv [],
+	char * envp[])
+{
+	extern int __execve(char *, char **, char **, struct task_struct *);
+	return __execve(filename, argv, envp, current);
+}
+
 static inline int open(const char *file, int flag, int mode)
 {
 	extern long sys_open(const char *, int, int);
@@ -891,15 +893,8 @@ static inline pid_t wait(int * wait_stat
 {
 	return sys_wait4(-1, wait_stat, 0, NULL);
 }
-
-static inline int execve(char *filename, char * argv [],
-	char * envp[])
-{
-	extern int __execve(char *, char **, char **, struct task_struct *);
-	return __execve(filename, argv, envp, current);
-}
 
-#endif
+#endif	/* __KERNEL_SYSCALLS__ */
 
 #endif /* __ASSEMBLY__ */
 
