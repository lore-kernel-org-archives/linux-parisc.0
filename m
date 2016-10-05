From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add cfi_startproc and cfi_endproc to assembly code
Date: Wed, 5 Oct 2016 22:28:46 +0200
Message-ID: <20161005202846.GA4117@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add ENTRY_CFI() and ENDPROC_CFI() macros for dwarf debug info and
convert assembly users to new macros.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/linkage.h b/arch/parisc/include/asm/linkage.h
index 0b19a72..67e6b43 100644
--- a/arch/parisc/include/asm/linkage.h
+++ b/arch/parisc/include/asm/linkage.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_PARISC_LINKAGE_H
 #define __ASM_PARISC_LINKAGE_H
 
+#include <asm/dwarf.h>
+
 #ifndef __ALIGN
 #define __ALIGN         .align 4
 #define __ALIGN_STR     ".align 4"
@@ -10,6 +12,8 @@
  * In parisc assembly a semicolon marks a comment while a
  * exclamation mark is used to separate independent lines.
  */
+#define ASM_NL	!
+
 #ifdef __ASSEMBLY__
 
 #define ENTRY(name) \
@@ -26,6 +30,14 @@ name:
 	END(name)
 #endif
 
+#define ENTRY_CFI(name) \
+	ENTRY(name)	ASM_NL\
+	CFI_STARTPROC
+
+#define ENDPROC_CFI(name) \
+	ENDPROC(name)	ASM_NL\
+	CFI_ENDPROC
+
 #endif /* __ASSEMBLY__ */
 
 #endif  /* __ASM_PARISC_LINKAGE_H */
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index baa3d9d..4fcff2d 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -766,7 +766,7 @@ ENTRY(end_fault_vector)
 	 * copy_thread moved args into task save area.
 	 */
 
-ENTRY(ret_from_kernel_thread)
+ENTRY_CFI(ret_from_kernel_thread)
 
 	/* Call schedule_tail first though */
 	BL	schedule_tail, %r2
@@ -782,7 +782,7 @@ ENTRY(ret_from_kernel_thread)
 	copy	%r31, %r2
 	b	finish_child_return
 	nop
-ENDPROC(ret_from_kernel_thread)
+ENDPROC_CFI(ret_from_kernel_thread)
 
 
 	/*
@@ -790,7 +790,7 @@ ENDPROC(ret_from_kernel_thread)
 	 *	struct task_struct *next)
 	 *
 	 * switch kernel stacks and return prev */
-ENTRY(_switch_to)
+ENTRY_CFI(_switch_to)
 	STREG	 %r2, -RP_OFFSET(%r30)
 
 	callee_save_float
@@ -815,7 +815,7 @@ _switch_to_ret:
 	LDREG	-RP_OFFSET(%r30), %r2
 	bv	%r0(%r2)
 	copy	%r26, %r28
-ENDPROC(_switch_to)
+ENDPROC_CFI(_switch_to)
 
 	/*
 	 * Common rfi return path for interruptions, kernel execve, and
@@ -833,7 +833,7 @@ ENDPROC(_switch_to)
 
 	.align	PAGE_SIZE
 
-ENTRY(syscall_exit_rfi)
+ENTRY_CFI(syscall_exit_rfi)
 	mfctl   %cr30,%r16
 	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
 	ldo	TASK_REGS(%r16),%r16
@@ -1037,12 +1037,12 @@ intr_extint:
 
 	b	do_cpu_irq_mask
 	ldo	R%intr_return(%r2), %r2	/* return to intr_return, not here */
-ENDPROC(syscall_exit_rfi)
+ENDPROC_CFI(syscall_exit_rfi)
 
 
 	/* Generic interruptions (illegal insn, unaligned, page fault, etc) */
 
-ENTRY(intr_save)		/* for os_hpmc */
+ENTRY_CFI(intr_save)		/* for os_hpmc */
 	mfsp    %sr7,%r16
 	cmpib,COND(=),n 0,%r16,1f
 	get_stack_use_cr30
@@ -1117,7 +1117,7 @@ skip_save_ior:
 
 	b		handle_interruption
 	ldo		R%intr_check_sig(%r2), %r2
-ENDPROC(intr_save)
+ENDPROC_CFI(intr_save)
 
 
 	/*
@@ -1720,7 +1720,7 @@ dtlb_fault:
 	.endm
 
 	.macro	fork_like name
-ENTRY(sys_\name\()_wrapper)
+ENTRY_CFI(sys_\name\()_wrapper)
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30), %r1
 	ldo	TASK_REGS(%r1),%r1
 	reg_save %r1
@@ -1728,7 +1728,7 @@ ENTRY(sys_\name\()_wrapper)
 	ldil	L%sys_\name, %r31
 	be	R%sys_\name(%sr4,%r31)
 	STREG	%r28, PT_CR27(%r1)
-ENDPROC(sys_\name\()_wrapper)
+ENDPROC_CFI(sys_\name\()_wrapper)
 	.endm
 
 fork_like clone
@@ -1736,7 +1736,7 @@ fork_like fork
 fork_like vfork
 
 	/* Set the return value for the child */
-ENTRY(child_return)
+ENTRY_CFI(child_return)
 	BL	schedule_tail, %r2
 	nop
 finish_child_return:
@@ -1748,9 +1748,9 @@ finish_child_return:
 	reg_restore %r1
 	b	syscall_exit
 	copy	%r0,%r28
-ENDPROC(child_return)
+ENDPROC_CFI(child_return)
 
-ENTRY(sys_rt_sigreturn_wrapper)
+ENTRY_CFI(sys_rt_sigreturn_wrapper)
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r26
 	ldo	TASK_REGS(%r26),%r26	/* get pt regs */
 	/* Don't save regs, we are going to restore them from sigcontext. */
@@ -1778,9 +1778,9 @@ ENTRY(sys_rt_sigreturn_wrapper)
 	 */
 	bv	%r0(%r2)
 	LDREG	PT_GR28(%r1),%r28  /* reload original r28 for syscall_exit */
-ENDPROC(sys_rt_sigreturn_wrapper)
+ENDPROC_CFI(sys_rt_sigreturn_wrapper)
 
-ENTRY(syscall_exit)
+ENTRY_CFI(syscall_exit)
 	/* NOTE: Not all syscalls exit this way.  rt_sigreturn will exit
 	 * via syscall_exit_rfi if the signal was received while the process
 	 * was running.
@@ -1979,7 +1979,7 @@ syscall_do_resched:
 #else
 	nop
 #endif
-ENDPROC(syscall_exit)
+ENDPROC_CFI(syscall_exit)
 
 
 #ifdef CONFIG_FUNCTION_TRACER
@@ -2023,7 +2023,7 @@ ENDPROC(mcount)
 	.align 8
 	.globl return_to_handler
 	.type  return_to_handler, @function
-ENTRY(return_to_handler)
+ENTRY_CFI(return_to_handler)
 	.proc
 	.callinfo caller,frame=FRAME_SIZE
 	.entry
@@ -2067,7 +2067,7 @@ parisc_return_to_handler:
 	LDREGM -FRAME_SIZE(%sp),%r3
 	.exit
 	.procend
-ENDPROC(return_to_handler)
+ENDPROC_CFI(return_to_handler)
 
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
@@ -2076,7 +2076,7 @@ ENDPROC(return_to_handler)
 #ifdef CONFIG_IRQSTACKS
 /* void call_on_stack(unsigned long param1, void *func,
 		      unsigned long new_stack) */
-ENTRY(call_on_stack)
+ENTRY_CFI(call_on_stack)
 	copy	%sp, %r1
 
 	/* Regarding the HPPA calling conventions for function pointers,
@@ -2112,10 +2112,10 @@ ENTRY(call_on_stack)
 	bv	(%rp)
 	LDREG	-68(%sp), %sp
 # endif /* CONFIG_64BIT */
-ENDPROC(call_on_stack)
+ENDPROC_CFI(call_on_stack)
 #endif /* CONFIG_IRQSTACKS */
 
-get_register:
+ENTRY_CFI(get_register)
 	/*
 	 * get_register is used by the non access tlb miss handlers to
 	 * copy the value of the general register specified in r8 into
@@ -2192,9 +2192,10 @@ get_register:
 	copy    %r30,%r1
 	bv      %r0(%r25)    /* r31 */
 	copy    %r31,%r1
+ENDPROC_CFI(get_register)
 
 
-set_register:
+ENTRY_CFI(set_register)
 	/*
 	 * set_register is used by the non access tlb miss handlers to
 	 * copy the value of r1 into the general register specified in
@@ -2266,4 +2267,5 @@ set_register:
 	copy    %r1,%r30
 	bv      %r0(%r25)    /* r31 */
 	copy    %r1,%r31
+ENDPROC_CFI(set_register)
 
diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 8b87020..0fbd0a0 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -83,7 +83,7 @@ END(hpmc_pim_data)
 	.text
 
 	.import intr_save, code
-ENTRY(os_hpmc)
+ENTRY_CFI(os_hpmc)
 .os_hpmc:
 
 	/*
@@ -299,7 +299,7 @@ os_hpmc_6:
 
 	b .
 	nop
-ENDPROC(os_hpmc)
+ENDPROC_CFI(os_hpmc)
 .os_hpmc_end:
 
 
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b743a80..b508802 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -41,7 +41,7 @@
 	.text
 	.align	128
 
-ENTRY(flush_tlb_all_local)
+ENTRY_CFI(flush_tlb_all_local)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -190,11 +190,11 @@ fdtdone:
 
 	.exit
 	.procend
-ENDPROC(flush_tlb_all_local)
+ENDPROC_CFI(flush_tlb_all_local)
 
 	.import cache_info,data
 
-ENTRY(flush_instruction_cache_local)
+ENTRY_CFI(flush_instruction_cache_local)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -257,11 +257,11 @@ fisync:
 	.exit
 
 	.procend
-ENDPROC(flush_instruction_cache_local)
+ENDPROC_CFI(flush_instruction_cache_local)
 
 
 	.import cache_info, data
-ENTRY(flush_data_cache_local)
+ENTRY_CFI(flush_data_cache_local)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -325,7 +325,7 @@ fdsync:
 	.exit
 
 	.procend
-ENDPROC(flush_data_cache_local)
+ENDPROC_CFI(flush_data_cache_local)
 
 	.align	16
 
@@ -356,7 +356,7 @@ ENDPROC(flush_data_cache_local)
 
 /* Clear page using kernel mapping.  */
 
-ENTRY(clear_page_asm)
+ENTRY_CFI(clear_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -422,11 +422,11 @@ ENTRY(clear_page_asm)
 	.exit
 
 	.procend
-ENDPROC(clear_page_asm)
+ENDPROC_CFI(clear_page_asm)
 
 /* Copy page using kernel mapping.  */
 
-ENTRY(copy_page_asm)
+ENTRY_CFI(copy_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -540,7 +540,7 @@ ENTRY(copy_page_asm)
 	.exit
 
 	.procend
-ENDPROC(copy_page_asm)
+ENDPROC_CFI(copy_page_asm)
 
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
@@ -586,7 +586,7 @@ ENDPROC(copy_page_asm)
 	 *
 	 */
 
-ENTRY(copy_user_page_asm)
+ENTRY_CFI(copy_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -742,9 +742,9 @@ ENTRY(copy_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(copy_user_page_asm)
+ENDPROC_CFI(copy_user_page_asm)
 
-ENTRY(clear_user_page_asm)
+ENTRY_CFI(clear_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -828,9 +828,9 @@ ENTRY(clear_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(clear_user_page_asm)
+ENDPROC_CFI(clear_user_page_asm)
 
-ENTRY(flush_dcache_page_asm)
+ENTRY_CFI(flush_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -904,9 +904,9 @@ ENTRY(flush_dcache_page_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_dcache_page_asm)
+ENDPROC_CFI(flush_dcache_page_asm)
 
-ENTRY(flush_icache_page_asm)
+ENTRY_CFI(flush_icache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -982,9 +982,9 @@ ENTRY(flush_icache_page_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_icache_page_asm)
+ENDPROC_CFI(flush_icache_page_asm)
 
-ENTRY(flush_kernel_dcache_page_asm)
+ENTRY_CFI(flush_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1025,9 +1025,9 @@ ENTRY(flush_kernel_dcache_page_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_kernel_dcache_page_asm)
+ENDPROC_CFI(flush_kernel_dcache_page_asm)
 
-ENTRY(purge_kernel_dcache_page_asm)
+ENTRY_CFI(purge_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1067,9 +1067,9 @@ ENTRY(purge_kernel_dcache_page_asm)
 	.exit
 
 	.procend
-ENDPROC(purge_kernel_dcache_page_asm)
+ENDPROC_CFI(purge_kernel_dcache_page_asm)
 
-ENTRY(flush_user_dcache_range_asm)
+ENTRY_CFI(flush_user_dcache_range_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1088,9 +1088,9 @@ ENTRY(flush_user_dcache_range_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_user_dcache_range_asm)
+ENDPROC_CFI(flush_user_dcache_range_asm)
 
-ENTRY(flush_kernel_dcache_range_asm)
+ENTRY_CFI(flush_kernel_dcache_range_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1110,9 +1110,9 @@ ENTRY(flush_kernel_dcache_range_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_kernel_dcache_range_asm)
+ENDPROC_CFI(flush_kernel_dcache_range_asm)
 
-ENTRY(flush_user_icache_range_asm)
+ENTRY_CFI(flush_user_icache_range_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1131,9 +1131,9 @@ ENTRY(flush_user_icache_range_asm)
 	.exit
 
 	.procend
-ENDPROC(flush_user_icache_range_asm)
+ENDPROC_CFI(flush_user_icache_range_asm)
 
-ENTRY(flush_kernel_icache_page)
+ENTRY_CFI(flush_kernel_icache_page)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1174,9 +1174,9 @@ ENTRY(flush_kernel_icache_page)
 	.exit
 
 	.procend
-ENDPROC(flush_kernel_icache_page)
+ENDPROC_CFI(flush_kernel_icache_page)
 
-ENTRY(flush_kernel_icache_range_asm)
+ENTRY_CFI(flush_kernel_icache_range_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1194,13 +1194,13 @@ ENTRY(flush_kernel_icache_range_asm)
 	nop
 	.exit
 	.procend
-ENDPROC(flush_kernel_icache_range_asm)
+ENDPROC_CFI(flush_kernel_icache_range_asm)
 
 	/* align should cover use of rfi in disable_sr_hashing_asm and
 	 * srdis_done.
 	 */
 	.align	256
-ENTRY(disable_sr_hashing_asm)
+ENTRY_CFI(disable_sr_hashing_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -1289,6 +1289,6 @@ srdis_done:
 	.exit
 
 	.procend
-ENDPROC(disable_sr_hashing_asm)
+ENDPROC_CFI(disable_sr_hashing_asm)
 
 	.end
diff --git a/arch/parisc/kernel/real2.S b/arch/parisc/kernel/real2.S
index 5f3d3a1..1db58e5 100644
--- a/arch/parisc/kernel/real2.S
+++ b/arch/parisc/kernel/real2.S
@@ -61,7 +61,7 @@ save_cr_end:
 	 *	iodc_fn is the IODC function to call
 	 */
 
-ENTRY(real32_call_asm)
+ENTRY_CFI(real32_call_asm)
 	STREG	%rp, -RP_OFFSET(%sp)	/* save RP */
 #ifdef CONFIG_64BIT
 	callee_save
@@ -119,14 +119,14 @@ ric_ret:
 	LDREG	-RP_OFFSET(%sp), %rp	/* restore RP */
 	bv	0(%rp)
 	nop
-ENDPROC(real32_call_asm)
+ENDPROC_CFI(real32_call_asm)
 
 
 #  define PUSH_CR(r, where) mfctl r, %r1 ! STREG,ma %r1, REG_SZ(where)
 #  define POP_CR(r, where) LDREG,mb -REG_SZ(where), %r1 ! mtctl %r1, r
 
 	.text
-save_control_regs:
+ENTRY_CFI(save_control_regs)
 	load32	PA(save_cr_space), %r28
 	PUSH_CR(%cr24, %r28)
 	PUSH_CR(%cr25, %r28)
@@ -139,8 +139,9 @@ save_control_regs:
 	PUSH_CR(%cr15, %r28)
 	bv 0(%r2)
 	nop
+ENDPROC_CFI(save_control_regs)
 
-restore_control_regs:
+ENTRY_CFI(restore_control_regs)
 	load32	PA(save_cr_end), %r26
 	POP_CR(%cr15, %r26)
 	POP_CR(%cr31, %r26)
@@ -153,13 +154,14 @@ restore_control_regs:
 	POP_CR(%cr24, %r26)
 	bv 0(%r2)
 	nop
+ENDPROC_CFI(restore_control_regs)
 
 /* rfi_virt2real() and rfi_real2virt() could perhaps be adapted for
  * more general-purpose use by the several places which need RFIs
  */
 	.text
 	.align 128
-rfi_virt2real:
+ENTRY_CFI(rfi_virt2real)
 	/* switch to real mode... */
 	rsm		PSW_SM_I,%r0
 	load32		PA(rfi_v2r_1), %r1
@@ -191,10 +193,11 @@ rfi_v2r_1:
 	tophys_r1 %r2
 	bv	0(%r2)
 	nop
+ENDPROC_CFI(rfi_virt2real)
 
 	.text
 	.align 128
-rfi_real2virt:
+ENTRY_CFI(rfi_real2virt)
 	rsm		PSW_SM_I,%r0
 	load32		(rfi_r2v_1), %r1
 	nop
@@ -225,6 +228,7 @@ rfi_r2v_1:
 	tovirt_r1 %r2
 	bv	0(%r2)
 	nop
+ENDPROC_CFI(rfi_real2virt)
 
 #ifdef CONFIG_64BIT
 
@@ -238,7 +242,7 @@ rfi_r2v_1:
 	 *	arg0p points to where saved arg values may be found
 	 *	iodc_fn is the IODC function to call
 	 */
-ENTRY(real64_call_asm)
+ENTRY_CFI(real64_call_asm)
 	std	%rp, -0x10(%sp)		/* save RP */
 	std	%sp, -8(%arg0)		/* save SP on real-mode stack */
 	copy	%arg0, %sp		/* adopt the real-mode SP */
@@ -284,7 +288,7 @@ r64_ret:
 	ldd	-0x10(%sp), %rp		/* restore RP */
 	bv	0(%rp)
 	nop
-ENDPROC(real64_call_asm)
+ENDPROC_CFI(real64_call_asm)
 
 #endif
 
@@ -293,12 +297,12 @@ ENDPROC(real64_call_asm)
 	**	GCC 3.3 and later has a new function in libgcc.a for
 	**	comparing function pointers.
 	*/
-ENTRY(__canonicalize_funcptr_for_compare)
+ENTRY_CFI(__canonicalize_funcptr_for_compare)
 #ifdef CONFIG_64BIT
 	bve (%r2)
 #else
 	bv %r0(%r2)
 #endif
 	copy %r26,%r28
-ENDPROC(__canonicalize_funcptr_for_compare)
+ENDPROC_CFI(__canonicalize_funcptr_for_compare)
 
diff --git a/arch/parisc/lib/fixup.S b/arch/parisc/lib/fixup.S
index 1052b74..a5b72f2 100644
--- a/arch/parisc/lib/fixup.S
+++ b/arch/parisc/lib/fixup.S
@@ -65,34 +65,34 @@
 	.section .fixup, "ax"
 
 	/* get_user() fixups, store -EFAULT in r8, and 0 in r9 */
-ENTRY(fixup_get_user_skip_1)
+ENTRY_CFI(fixup_get_user_skip_1)
 	get_fault_ip %r1,%r8
 	ldo 4(%r1), %r1
 	ldi -EFAULT, %r8
 	bv %r0(%r1)
 	copy %r0, %r9
-ENDPROC(fixup_get_user_skip_1)
+ENDPROC_CFI(fixup_get_user_skip_1)
 
-ENTRY(fixup_get_user_skip_2)
+ENTRY_CFI(fixup_get_user_skip_2)
 	get_fault_ip %r1,%r8
 	ldo 8(%r1), %r1
 	ldi -EFAULT, %r8
 	bv %r0(%r1)
 	copy %r0, %r9
-ENDPROC(fixup_get_user_skip_2)
+ENDPROC_CFI(fixup_get_user_skip_2)
 
 	/* put_user() fixups, store -EFAULT in r8 */
-ENTRY(fixup_put_user_skip_1)
+ENTRY_CFI(fixup_put_user_skip_1)
 	get_fault_ip %r1,%r8
 	ldo 4(%r1), %r1
 	bv %r0(%r1)
 	ldi -EFAULT, %r8
-ENDPROC(fixup_put_user_skip_1)
+ENDPROC_CFI(fixup_put_user_skip_1)
 
-ENTRY(fixup_put_user_skip_2)
+ENTRY_CFI(fixup_put_user_skip_2)
 	get_fault_ip %r1,%r8
 	ldo 8(%r1), %r1
 	bv %r0(%r1)
 	ldi -EFAULT, %r8
-ENDPROC(fixup_put_user_skip_2)
+ENDPROC_CFI(fixup_put_user_skip_2)
 
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index a512f07..56845de 100644
--- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -67,7 +67,7 @@
 	 * otherwise, returns number of bytes not transferred.
 	 */
 
-ENTRY(lclear_user)
+ENTRY_CFI(lclear_user)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -81,7 +81,7 @@ $lclu_done:
 	bv          %r0(%r2)
 	copy        %r25,%r28
 	.exit
-ENDPROC(lclear_user)
+ENDPROC_CFI(lclear_user)
 
 	.section .fixup,"ax"
 2:      fixup_branch $lclu_done
@@ -100,7 +100,7 @@ ENDPROC(lclear_user)
 	 *         else strlen + 1 (i.e. includes zero byte).
 	 */
 
-ENTRY(lstrnlen_user)
+ENTRY_CFI(lstrnlen_user)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -120,7 +120,7 @@ $lslen_done:
 $lslen_nzero:
 	b           $lslen_done
 	ldo         1(%r26),%r26 /* special case for N == 0 */
-ENDPROC(lstrnlen_user)
+ENDPROC_CFI(lstrnlen_user)
 
 	.section .fixup,"ax"
 3:      fixup_branch $lslen_done
