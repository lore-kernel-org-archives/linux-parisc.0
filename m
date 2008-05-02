From: Helge Deller <deller@gmx.de>
Subject: [PARISC][PATCH] fix trivial section name warnings
Date: Fri, 2 May 2008 22:02:48 +0200
Message-ID: <200805022202.48586.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This trivial patch fixes the following section warnings on PARISC:
> WARNING: vmlinux.o (.text.1): unexpected section name.
>The (.[number]+) following section name are ld generated and not expected. 
> Did you forget to use "ax"/"aw" in a .S file?
> Note that for example <linux/init.h> contains
> section definitions for use in .S files.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/hpux/gate.S b/arch/parisc/hpux/gate.S
index 38a1c1b..f0b18ce 100644
--- a/arch/parisc/hpux/gate.S
+++ b/arch/parisc/hpux/gate.S
@@ -13,9 +13,10 @@
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	.level	LEVEL
-	.text
+	__HEAD
 
 	.import hpux_call_table
 	.import hpux_syscall_exit,code
diff --git a/arch/parisc/hpux/wrappers.S b/arch/parisc/hpux/wrappers.S
index 58c53c8..ccd3a50 100644
--- a/arch/parisc/hpux/wrappers.S
+++ b/arch/parisc/hpux/wrappers.S
@@ -28,9 +28,10 @@
 #include <asm/assembly.h>
 #include <asm/signal.h>
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	.level	LEVEL
-	.text
+	__HEAD
 
 	/* These should probably go in a header file somewhere.
 	 * They are duplicated in kernel/wrappers.S
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 111d472..1a3935e 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -38,6 +38,7 @@
 #include <asm/thread_info.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 #ifdef CONFIG_64BIT
 #define CMPIB           cmpib,*
@@ -629,7 +630,7 @@
 	 * the static part of the kernel address space.
 	 */
 
-	.text
+	__HEAD
 
 	.align	PAGE_SIZE
 
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index ec2482d..5680a2c 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -32,7 +32,7 @@ ENTRY(boot_args)
 	.word 0 /* arg3 */
 END(boot_args)
 
-	.section .text.head
+	__HEAD
 	.align	4
 	.import init_thread_union,data
 	.import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 2cbf13b..068322e 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -47,6 +47,7 @@
 #include <asm/pdc.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	/*
 	 * stack for os_hpmc, the HPMC handler.
@@ -76,7 +77,7 @@ ENTRY(hpmc_pim_data)
 	.block HPMC_PIM_DATA_SIZE
 END(hpmc_pim_data)
 
-	.text
+	__HEAD
 
 	.import intr_save, code
 ENTRY(os_hpmc)
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 5901092..7e4a339 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -37,8 +37,9 @@
 #include <asm/pgtable.h>
 #include <asm/cache.h>
 #include <linux/linkage.h>
+#include <linux/init.h>
 
-	.text
+	__HEAD
 	.align	128
 
 ENTRY(flush_tlb_all_local)
diff --git a/arch/parisc/kernel/perf_asm.S b/arch/parisc/kernel/perf_asm.S
index 43874ca..b2a9d05 100644
--- a/arch/parisc/kernel/perf_asm.S
+++ b/arch/parisc/kernel/perf_asm.S
@@ -41,7 +41,7 @@
 ; The coprocessor only needs to be enabled when
 ; starting/stopping the coprocessor with the pmenb/pmdis.
 ;
-	.text
+	__HEAD
 
 ENTRY(perf_intrigue_enable_perf_counters)
 	.proc
diff --git a/arch/parisc/kernel/real2.S b/arch/parisc/kernel/real2.S
index 7a92695..47fbdae 100644
--- a/arch/parisc/kernel/real2.S
+++ b/arch/parisc/kernel/real2.S
@@ -12,6 +12,7 @@
 #include <asm/assembly.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	.section	.bss
 	.export real_stack
@@ -39,7 +40,7 @@ save_cr_end:
 /************************ 32-bit real-mode calls ***********************/
 /* This can be called in both narrow and wide kernels */
 
-	.text
+	__HEAD
 
 	/* unsigned long real32_call_asm(unsigned int *sp,
 	 *		unsigned int *arg0p,
@@ -113,7 +114,7 @@ ENDPROC(real32_call_asm)
 #  define PUSH_CR(r, where) mfctl r, %r1 ! STREG,ma %r1, REG_SZ(where)
 #  define POP_CR(r, where) LDREG,mb -REG_SZ(where), %r1 ! mtctl %r1, r
 
-	.text
+	__HEAD
 save_control_regs:
 	load32	PA(save_cr_space), %r28
 	PUSH_CR(%cr24, %r28)
@@ -145,7 +146,7 @@ restore_control_regs:
 /* rfi_virt2real() and rfi_real2virt() could perhaps be adapted for
  * more general-purpose use by the several places which need RFIs
  */
-	.text
+	__HEAD
 	.align 128
 rfi_virt2real:
 	/* switch to real mode... */
@@ -180,7 +181,7 @@ rfi_v2r_1:
 	bv	0(%r2)
 	nop
 
-	.text
+	__HEAD
 	.align 128
 rfi_real2virt:
 	rsm		PSW_SM_I,%r0
@@ -218,7 +219,7 @@ rfi_r2v_1:
 
 /************************ 64-bit real-mode calls ***********************/
 /* This is only usable in wide kernels right now and will probably stay so */
-	.text
+	__HEAD
 	/* unsigned long real64_call_asm(unsigned long *sp,
 	 *		unsigned long *arg0p,
 	 *		unsigned long fn)
@@ -276,7 +277,7 @@ ENDPROC(real64_call_asm)
 
 #endif
 
-	.text
+	__HEAD
 	/* http://lists.parisc-linux.org/hypermail/parisc-linux/10916.html
 	**	GCC 3.3 and later has a new function in libgcc.a for
 	**	comparing function pointers.
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..f598e2c 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -17,6 +17,7 @@
 #include <asm/processor.h>
 
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 	/* We fill the empty parts of the gateway page with
  	 * something that will kill the kernel or a
@@ -26,7 +27,7 @@
 
 	.level          LEVEL
 
-	.text
+	__HEAD
 
 	.import syscall_exit,code
 	.import syscall_exit_rfi,code
@@ -636,7 +637,7 @@ END(sys_call_table64)
 		All light-weight-syscall atomic operations 
 		will use this set of locks 
 	*/
-	.section .data
+	.section .data, "aw"
 	.align	PAGE_SIZE
 ENTRY(lws_lock_start)
 	/* lws locks */
diff --git a/arch/parisc/lib/fixup.S b/arch/parisc/lib/fixup.S
index d172d42..4821ad6 100644
--- a/arch/parisc/lib/fixup.S
+++ b/arch/parisc/lib/fixup.S
@@ -23,6 +23,7 @@
 #include <asm/assembly.h>
 #include <asm/errno.h>
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 #ifdef CONFIG_SMP
 	.macro  get_fault_ip t1 t2
@@ -55,7 +56,7 @@
 
 	.level LEVEL
 
-	.text
+	__HEAD
 	.section .fixup, "ax"
 
 	/* get_user() fixups, store -EFAULT in r8, and 0 in r9 */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 1bd23cc..f61e8c3 100644
--- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -33,12 +33,13 @@
  */
 
 
-	.text
-	
 #include <asm/assembly.h>
 #include <asm/errno.h>
 #include <linux/linkage.h>
+#include <linux/init.h>
 
+	__HEAD
+	
 	/*
 	 * get_sr gets the appropriate space value into
 	 * sr1 for kernel/user space access, depending
