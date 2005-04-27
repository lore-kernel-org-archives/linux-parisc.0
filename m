From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 00:58:22 -0600
Message-ID: <20050427065822.GK2612@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rhirst@levanta.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427052055.GJ2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 26, 2005 at 11:20:55PM -0600, Grant Grundler wrote:
> > The example code is just that, an example:
> > 	SSM	0,gr0	; initial RSM, SSM, or MTSM
> > ...
> > 
> > AFAICT, that sequence does nothing but burn some cycles.
> 
> *sigh*. The ssm 0,0/nop * 8/rsm sequence isn't so obvious.
> Richard Hirst added this comment to entry.S in 2001:
>         * The ssm is necessary due to a PCXT bug


Regardless of what this is for, the following patch adds pcxt_ssm_bug
macro to assembly.h. pcxt_ssm_bug is only enabled for CONFIG_PA7000
which is only enabled for generic 32-bit kernel.

I've added pcxt_ssm_bug use to all the locations I could
find where PSW_SM_Q was being twiddled. Until someone can
tell me what the bug is exactly, my assumption is it
is needed for all cases where we "rsm PSW_SM_Q" and not
just at init time.

I've also tried to unify all the RFI asm into a similar layout
that could be (hopefully) replaced with a macro in a future step.
And I've made them all use "PSW_SM_Q+PSW_SM_I" just to be consistent.

I apologize in advance since this patch also replaces __LP64__
with CONFIG_64BIT. I thought it would only be a few but it
turned out to interfer with the patch.

I can split out CONFIG_64BIT changes if someone really needs that
before reviewing it.  It's just too late tonight for me to do it.

Can the asm gurus please closely review this patch?

I don't plan on committing this before it's been tested too.
I've only compiled kernels with it so far.

thanks,
grant


Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.27
diff -u -p -r1.27 entry.S
--- arch/parisc/kernel/entry.S	1 Apr 2005 07:37:25 -0000	1.27
+++ arch/parisc/kernel/entry.S	27 Apr 2005 06:27:57 -0000
@@ -37,7 +37,7 @@
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 #define CMPIB           cmpib,*
 #define CMPB            cmpb,*
 #define COND(x)		*x
@@ -214,7 +214,7 @@
 	va  = r8	/* virtual address for which the trap occured */
 	spc = r24	/* space for which the trap occured */
 
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 
 	/*
 	 * itlb miss interruption handler (parisc 1.1 - 32 bit)
@@ -236,7 +236,7 @@
 
 	.macro	itlb_20 code
 	mfctl	%pcsq, spc
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	b       itlb_miss_20w
 #else
 	b	itlb_miss_20
@@ -246,7 +246,7 @@
 	.align		32
 	.endm
 	
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	/*
 	 * naitlb miss interruption handler (parisc 1.1 - 32 bit)
 	 *
@@ -283,7 +283,7 @@
 	.macro	naitlb_20 code
 
 	mfctl	%isr,spc
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	b       itlb_miss_20w
 #else
 	b	itlb_miss_20
@@ -296,7 +296,7 @@
 	.align		32
 	.endm
 	
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	/*
 	 * dtlb miss interruption handler (parisc 1.1 - 32 bit)
 	 */
@@ -318,7 +318,7 @@
 	.macro	dtlb_20 code
 
 	mfctl	%isr, spc
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	b       dtlb_miss_20w
 #else
 	b	dtlb_miss_20
@@ -328,7 +328,7 @@
 	.align		32
 	.endm
 	
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	/* nadtlb miss interruption handler (parisc 1.1 - 32 bit) */
 
 	.macro	nadtlb_11 code
@@ -346,7 +346,7 @@
 	.macro	nadtlb_20 code
 
 	mfctl	%isr,spc
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	b       nadtlb_miss_20w
 #else
 	b       nadtlb_miss_20
@@ -356,7 +356,7 @@
 	.align		32
 	.endm
 	
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	/*
 	 * dirty bit trap interruption handler (parisc 1.1 - 32 bit)
 	 */
@@ -378,7 +378,7 @@
 	.macro	dbit_20 code
 
 	mfctl	%isr,spc
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	b       dbit_trap_20w
 #else
 	b	dbit_trap_20
@@ -391,7 +391,7 @@
 	/* The following are simple 32 vs 64 bit instruction
 	 * abstractions for the macros */
 	.macro		EXTR	reg1,start,length,reg2
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	extrd,u		\reg1,32+\start,\length,\reg2
 #else
 	extrw,u		\reg1,\start,\length,\reg2
@@ -399,7 +399,7 @@
 	.endm
 
 	.macro		DEP	reg1,start,length,reg2
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	depd		\reg1,32+\start,\length,\reg2
 #else
 	depw		\reg1,\start,\length,\reg2
@@ -407,7 +407,7 @@
 	.endm
 
 	.macro		DEPI	val,start,length,reg
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	depdi		\val,32+\start,\length,\reg
 #else
 	depwi		\val,\start,\length,\reg
@@ -418,7 +418,7 @@
 	 * fault.  We have to extract this and place it in the va,
 	 * zeroing the corresponding bits in the space register */
 	.macro		space_adjust	spc,va,tmp
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	extrd,u		\spc,63,SPACEID_SHIFT,\tmp
 	depd		%r0,63,SPACEID_SHIFT,\spc
 	depd		\tmp,31,SPACEID_SHIFT,\va
@@ -476,7 +476,7 @@
 	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
 	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	copy		\pmd,%r9
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	shld		%r9,PxD_VALUE_SHIFT,\pmd
 #else
 	shlw		%r9,PxD_VALUE_SHIFT,\pmd
@@ -607,7 +607,7 @@
 	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault
 	cmpib,COND(<>),n 0,\spc,\fault
 	ldil		L%(TMPALIAS_MAP_START),\tmp
-#if defined(__LP64__) && (TMPALIAS_MAP_START >= 0x80000000)
+#if defined(CONFIG_64BIT) && (TMPALIAS_MAP_START >= 0x80000000)
 	/* on LP64, ldi will sign extend into the upper 32 bits,
 	 * which is behaviour we don't want */
 	depdi		0,31,32,\tmp
@@ -621,7 +621,7 @@
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.
 	 */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	extrd,u,*=	\va,41,1,%r0
 #else
 	extrw,u,=	\va,9,1,%r0
@@ -688,7 +688,7 @@ fault_vector_20:
 	def		30
 	def		31
 
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 
 	.export fault_vector_11
 	
@@ -761,7 +761,7 @@ __kernel_thread:
 
 	copy	%r30, %r1
 	ldo	PT_SZ_ALGN(%r30),%r30
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	/* Yo, function pointers in wide mode are little structs... -PB */
 	ldd	24(%r26), %r2
 	STREG	%r2, PT_GR27(%r1)	/* Store childs %dp */
@@ -777,7 +777,7 @@ __kernel_thread:
 	or	%r26, %r24, %r26      /* will have kernel mappings.	 */
 	ldi	1, %r25			/* stack_start, signals kernel thread */
 	stw	%r0, -52(%r30)	     	/* user_tid */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 	BL	do_fork, %r2
@@ -806,7 +806,7 @@ ret_from_kernel_thread:
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN(%r30), %r1
 	LDREG	TASK_PT_GR25(%r1), %r26
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	LDREG	TASK_PT_GR27(%r1), %r27
 	LDREG	TASK_PT_GR22(%r1), %r22
 #endif
@@ -814,7 +814,7 @@ ret_from_kernel_thread:
 	ble	0(%sr7, %r1)
 	copy	%r31, %r2
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 	loadgp				/* Thread could have been in a module */
 #endif
@@ -835,7 +835,7 @@ __execve:
 	STREG	%r26, PT_GR26(%r16)
 	STREG	%r25, PT_GR25(%r16)
 	STREG	%r24, PT_GR24(%r16)
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 	BL	sys_execve, %r2
@@ -893,9 +893,6 @@ _switch_to_ret:
 	 * this way, then we will need to copy %sr3 in to PT_SR[3..7], and
 	 * adjust IASQ[0..1].
 	 *
-	 * Note that the following code uses a "relied upon translation".
-	 * See the parisc ACD for details. The ssm is necessary due to a
-	 * PCXT bug.
 	 */
 
 	.align 4096
@@ -916,7 +913,7 @@ syscall_exit_rfi:
 	STREG	%r19,PT_IAOQ1(%r16)
 	LDREG   PT_PSW(%r16),%r19
 	load32	USER_PSW_MASK,%r1
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	load32	USER_PSW_HI_MASK,%r20
 	depd    %r20,31,32,%r1
 #endif
@@ -960,7 +957,7 @@ intr_return:
 	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) amount
 	** irq_stat[] is defined using ____cacheline_aligned.
 	*/
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	shld	%r1, 6, %r20
 #else
 	shlw	%r1, 5, %r20
@@ -990,24 +987,18 @@ intr_restore:
 	rest_fp         %r1
 	rest_general    %r29
 
-	/* Create a "relied upon translation" PA 2.0 Arch. F-5 */
-	ssm		0,%r0
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	tophys_r1       %r29
-	rsm             (PSW_SM_Q|PSW_SM_P|PSW_SM_D|PSW_SM_I),%r0
+	rsm             PSW_SM_QUIET,%r0	/* prepare for rfi */
 
 	/* Restore space id's and special cr's from PT_REGS
-	 * structure pointed to by r29 */
+	 * structure pointed to by r29
+	 */
 	rest_specials	%r29
 
-	/* Important: Note that rest_stack restores r29
-	 * last (we are using it)! It also restores r1 and r30. */
+	/* IMPORTANT: rest_stack restores r29 last (we are using it)!
+	 * It also restores r1 and r30.
+	 */
 	rest_stack
 
 	rfi
@@ -1023,7 +1014,7 @@ intr_restore:
 	.import do_softirq,code
 intr_do_softirq:
 	BL      do_softirq,%r2
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #else
 	nop
@@ -1041,7 +1032,7 @@ intr_do_resched:
 	CMPIB= 0,%r20,intr_restore /* backward */
 	nop
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
@@ -1074,7 +1065,7 @@ intr_do_signal:
 
 	copy	%r0, %r24			/* unsigned long in_syscall */
 	copy	%r16, %r25			/* struct pt_regs *regs */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 
@@ -1098,7 +1089,7 @@ intr_extint:
 	mfctl	%cr31,%r1
 	copy	%r30,%r17
 	/* FIXME! depi below has hardcoded idea of interrupt stack size (32k)*/
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	depdi	0,63,15,%r17
 #else
 	depi	0,31,15,%r17
@@ -1125,7 +1116,7 @@ intr_extint:
 
 	ldil	L%intr_return, %r2
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29	/* Reference param save area */
 #endif
 
@@ -1168,7 +1159,7 @@ intr_save:
 	mfctl           %cr20, %r16 /* isr */
 	mfctl           %cr21, %r17 /* ior */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	/*
 	 * If the interrupted code was running with W bit off (32 bit),
 	 * clear the b bits (bits 0 & 1) in the ior.
@@ -1202,7 +1193,7 @@ skip_save_ior:
 	loadgp
 
 	copy		%r29, %r25	/* arg1 is pt_regs */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo		-16(%r30),%r29	/* Reference param save area */
 #endif
 
@@ -1240,7 +1231,7 @@ skip_save_ior:
 	spc  = r24	/* space for which the trap occured */
 	ptp = r25	/* page directory/page table pointer */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 
 dtlb_miss_20w:
 	space_adjust	spc,va,t0
@@ -1531,7 +1522,7 @@ nadtlb_probe_check:
 	nop
 
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 itlb_miss_20w:
 
 	/*
@@ -1598,7 +1589,7 @@ itlb_miss_20:
 
 #endif
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 
 dbit_trap_20w:
 	space_adjust	spc,va,t0
@@ -1807,7 +1798,7 @@ sys_fork_wrapper:
 
 	STREG	%r2,-RP_OFFSET(%r30)
 	ldo	FRAME_SIZE(%r30),%r30
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
@@ -1857,7 +1848,7 @@ sys_clone_wrapper:
 
 	STREG	%r2,-RP_OFFSET(%r30)
 	ldo	FRAME_SIZE(%r30),%r30
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
@@ -1879,7 +1870,7 @@ sys_vfork_wrapper:
 
 	STREG	%r2,-RP_OFFSET(%r30)
 	ldo	FRAME_SIZE(%r30),%r30
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
@@ -1907,7 +1898,7 @@ sys_vfork_wrapper:
 
 	STREG %r2,-RP_OFFSET(%r30)
 	ldo FRAME_SIZE(%r30),%r30
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 	BL \execve,%r2
@@ -1933,7 +1924,7 @@ error_\execve:
 sys_execve_wrapper:
 	execve_wrapper sys_execve
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	.export sys32_execve_wrapper
 	.import sys32_execve
 
@@ -1947,7 +1938,7 @@ sys_rt_sigreturn_wrapper:
 	ldo	TASK_REGS(%r26),%r26	/* get pt regs */
 	/* Don't save regs, we are going to restore them from sigcontext. */
 	STREG	%r2, -RP_OFFSET(%r30)
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	FRAME_SIZE(%r30), %r30
 	BL	sys_rt_sigreturn,%r2
 	ldo	-16(%r30),%r29		/* Reference param save area */
@@ -1978,7 +1969,7 @@ sys_sigaltstack_wrapper:
 	ldo	TASK_REGS(%r1),%r24	/* get pt regs */
 	LDREG	TASK_PT_GR30(%r24),%r24
 	STREG	%r2, -RP_OFFSET(%r30)
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	FRAME_SIZE(%r30), %r30
 	b,l	do_sigaltstack,%r2
 	ldo	-16(%r30),%r29		/* Reference param save area */
@@ -1992,7 +1983,7 @@ sys_sigaltstack_wrapper:
 	bv	%r0(%r2)
 	nop
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	.export sys32_sigaltstack_wrapper
 sys32_sigaltstack_wrapper:
 	/* Get the user stack pointer */
@@ -2016,7 +2007,7 @@ sys_rt_sigsuspend_wrapper:
 	reg_save %r24
 
 	STREG	%r2, -RP_OFFSET(%r30)
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	FRAME_SIZE(%r30), %r30
 	b,l	sys_rt_sigsuspend,%r2
 	ldo	-16(%r30),%r29		/* Reference param save area */
@@ -2089,7 +2080,7 @@ syscall_check_bh:
 	ldw     TI_CPU-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r26 /* cpu # */
 
 	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) bits */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	shld	%r26, 6, %r20
 #else
 	shlw	%r26, 5, %r20
@@ -2154,7 +2145,7 @@ syscall_restore:
 
 	depi	3,31,2,%r31			   /* ensure return to user mode. */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	/* decide whether to reset the wide mode bit
 	 *
 	 * For a syscall, the W bit is stored in the lowest bit
@@ -2250,7 +2241,7 @@ syscall_do_softirq:
 	.import schedule,code
 syscall_do_resched:
 	BL	schedule,%r2
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #else
 	nop
@@ -2270,7 +2261,7 @@ syscall_do_signal:
 
 	ldi	1, %r24				/* unsigned long in_syscall */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29			/* Reference param save area */
 #endif
 	BL	do_signal,%r2
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.11
diff -u -p -r1.11 head.S
--- arch/parisc/kernel/head.S	1 Nov 2004 16:15:50 -0000	1.11
+++ arch/parisc/kernel/head.S	27 Apr 2005 06:27:57 -0000
@@ -36,7 +36,7 @@ boot_args:
 	.align	4
 	.import init_thread_union,data
 	.import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
 	.import	$global$		/* forward declaration */
 #endif /*!LP64*/
@@ -76,7 +76,7 @@ $bss_loop:
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	/* Set pmd in pgd */
 	load32		PA(pmd0),%r5
 	shrd            %r5,PxD_VALUE_SHIFT,%r3	
@@ -99,7 +99,7 @@ $bss_loop:
 	stw		%r3,0(%r4)
 	ldo		(ASM_PAGE_SIZE >> PxD_VALUE_SHIFT)(%r3),%r3
 	addib,>		-1,%r1,1b
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	ldo             ASM_PMD_ENTRY_SIZE(%r4),%r4
 #else
 	ldo             ASM_PGD_ENTRY_SIZE(%r4),%r4
@@ -170,7 +170,7 @@ common_stext:
 	stw		%r0,0x28(%r0)	/* MEM_RENDEZ_HI */
 #endif /*CONFIG_SMP*/
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	tophys_r1	%sp
 
 	/* Save the rfi target address */
@@ -235,7 +235,7 @@ stext_pdc_ret:
 	 * following short sequence of instructions can determine this
 	 * (without being illegal on a PA1.1 machine).
 	 */
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	ldi		32,%r10
 	mtctl		%r10,%cr11
 	.level 2.0
@@ -254,32 +254,14 @@ $is_pa20:
 $install_iva:
 	mtctl		%r10,%cr14
 
-#ifdef __LP64__
 	b		aligned_rfi
 	nop
 
-	.align          256
+	.align          128
 aligned_rfi:
-	ssm             0,0
-	nop             /* 1 */
-	nop             /* 2 */
-	nop             /* 3 */
-	nop             /* 4 */
-	nop             /* 5 */
-	nop             /* 6 */
-	nop             /* 7 */
-	nop             /* 8 */
-#endif
-
-#ifdef __LP64__ /* move to psw.h? */
-#define		PSW_BITS	PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
-#else
-#define		PSW_BITS	PSW_SM_Q
-#endif
-
-$rfi:	
-	/* turn off troublesome PSW bits */
-	rsm		PSW_BITS,%r0
+	pcxt_ssm_bug
+	rsm		PSW_SM_QUIET,%r0	/* off troublesome PSW bits */
+	/* Don't need NOPs, have 8 compliant insn below */
 
 	/* kernel PSW:
 	 *  - no interruptions except HPMC and TOC (which are handled by PDC)
@@ -313,7 +295,7 @@ $rfi:	
 	.import smp_init_current_idle_task,data
 	.import	smp_callin,code
 
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 smp_callin_rtn:
         .proc
 	.callinfo
@@ -356,7 +338,7 @@ smp_slave_stext:
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 	/* Setup PDCE_PROC entry */
 	copy            %arg0,%r3
 #else
@@ -373,7 +355,7 @@ smp_slave_stext:
 
 	.procend
 #endif /* CONFIG_SMP */
-#ifndef __LP64__
+#ifndef CONFIG_64BIT
 	.data
 
 	.align	4
Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.17
diff -u -p -r1.17 pacache.S
--- arch/parisc/kernel/pacache.S	18 Apr 2005 05:52:31 -0000	1.17
+++ arch/parisc/kernel/pacache.S	27 Apr 2005 06:27:57 -0000
@@ -62,25 +62,10 @@ flush_tlb_all_local:
 	 * to happen in real mode with all interruptions disabled.
 	 */
 
-	/*
-	 * Once again, we do the rfi dance ... some day we need examine
-	 * all of our uses of this type of code and see what can be
-	 * consolidated.
-	 */
-
-	rsm		PSW_SM_I, %r19		/* relied upon translation! PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	
-	rsm		PSW_SM_Q, %r0		/* Turn off Q bit to load iia queue */
-	ldil		L%REAL_MODE_PSW, %r1
-	ldo		R%REAL_MODE_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	/* relied upon translation! PA 2.0 Arch. F-4 and F-5 */
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%PA(1f), %r1
@@ -88,6 +73,8 @@ flush_tlb_all_local:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -178,15 +165,14 @@ fdtonemiddle:					/* Loop if LOOP = 1 */
 	ADDIB>		-1, %r22, fdtoneloop	/* Outer loop count decr */
 	add		%r21, %r20, %r20	/* increment space */
 
-fdtdone:
 
-	/* Switch back to virtual mode */
+fdtdone:
+	/*
+	 * Switch back to virtual mode
+	 */
+	pcxt_ssm_bug
 
-	rsm		PSW_SM_Q, %r0		/* clear Q bit to load iia queue */
-	ldil		L%KERNEL_PSW, %r1
-	ldo		R%KERNEL_PSW(%r1), %r1
-	or		%r1, %r19, %r1		/* Set I bit if set on entry */
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%(2f), %r1
@@ -194,6 +180,9 @@ fdtdone:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	or		%r1, %r19, %r1		/* Set I bit if set on entry */
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -238,7 +227,7 @@ fioneloop:					/* Loop if LOOP = 1 */
 
 fisync:
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -281,7 +270,7 @@ fdoneloop:					/* Loop if LOOP = 1 */
 fdsync:
 	syncdma
 	sync
-	mtsm		%r22
+	mtsm		%r22			/* restore I-bit */
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -1005,21 +994,12 @@ disable_sr_hashing_asm:
 	.callinfo NO_CALLS
 	.entry
 
-	/* Switch to real mode */
+	/*
+	 * Switch to real mode
+	 */
+	pcxt_ssm_bug
 
-	ssm		0, %r0			/* relied upon translation! */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	
-	rsm		(PSW_SM_Q|PSW_SM_I), %r0 /* disable Q&I to load the iia queue */
-	ldil		L%REAL_MODE_PSW, %r1
-	ldo		R%REAL_MODE_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil		L%PA(1f), %r1
@@ -1027,6 +1007,8 @@ disable_sr_hashing_asm:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		REAL_MODE_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
@@ -1065,13 +1047,10 @@ srdis_pa20:
 	.word		0x145c1840		/* mtdiag %r28, %dr2 */
 
 srdis_done:
-
 	/* Switch back to virtual mode */
+	pcxt_ssm_bug
 
-	rsm		PSW_SM_Q, %r0		/* clear Q bit to load iia queue */
-	ldil		L%KERNEL_PSW, %r1
-	ldo		R%KERNEL_PSW(%r1), %r1
-	mtctl		%r1, %cr22
+	rsm		PSW_SM_Q+PSW_SM_I, %r0	/* prep to load iia queue */
 	mtctl		%r0, %cr17		/* Clear IIASQ tail */
 	mtctl		%r0, %cr17		/* Clear IIASQ head */
 	ldil 	   	L%(2f), %r1
@@ -1079,6 +1058,8 @@ srdis_done:
 	mtctl		%r1, %cr18		/* IIAOQ head */
 	ldo		4(%r1), %r1
 	mtctl		%r1, %cr18		/* IIAOQ tail */
+	load32		KERNEL_PSW, %r1
+	mtctl		%r1, %cr22
 	rfi
 	nop
 
Index: arch/parisc/kernel/real2.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/real2.S,v
retrieving revision 1.17
diff -u -p -r1.17 real2.S
--- arch/parisc/kernel/real2.S	7 Jan 2005 21:14:33 -0000	1.17
+++ arch/parisc/kernel/real2.S	27 Apr 2005 06:27:57 -0000
@@ -147,17 +147,9 @@ restore_control_regs:
 	.text
 rfi_virt2real:
 	/* switch to real mode... */
-	ssm		0,0		/* See "relied upon translation" */
-	nop				/* PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
+	pcxt_ssm_bug
 	
-	rsm             (PSW_SM_Q|PSW_SM_I),%r0  /* disable Q & I bits to load iia queue */
+	rsm             PSW_SM_Q+PSW_SM_I,%r0  /* prep to load iia queue */
 	mtctl		%r0, %cr17	/* Clear IIASQ tail */
 	mtctl		%r0, %cr17	/* Clear IIASQ head */
 	load32		PA(rfi_v2r_1), %r1
@@ -184,17 +176,9 @@ rfi_v2r_1:
 	.text
 	.align 128
 rfi_real2virt:
-	ssm		0,0		/* See "relied upon translation" */
-	nop				/* PA 2.0 Arch. F-5 */
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	
-	rsm             PSW_SM_Q,%r0    /* disable Q bit to load iia queue */
+	pcxt_ssm_bug
+
+	rsm             PSW_SM_Q+PSW_SM_I,%r0    /* prep to load iia queue */
 	mtctl		%r0, %cr17	/* Clear IIASQ tail */
 	mtctl		%r0, %cr17	/* Clear IIASQ head */
 	load32		(rfi_r2v_1), %r1
Index: include/asm-parisc/assembly.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/assembly.h,v
retrieving revision 1.10
diff -u -p -r1.10 assembly.h
--- include/asm-parisc/assembly.h	4 Feb 2005 19:34:33 -0000	1.10
+++ include/asm-parisc/assembly.h	27 Apr 2005 06:27:59 -0000
@@ -450,5 +450,23 @@
 	REST_CR	(%cr22, PT_PSW	(\regs))
 	.endm
 
+#if defined(CONFIG_PA7000)
+	.macro	pcxt_ssm_bug
+	/* Create a "relied upon translation" PA 2.0 Arch. page F-4 and F-5
+	* The ssm is necessary due to a PCXT bug. Ie not needed for 64-bit.
+	*/
+	ssm	0,%r0
+	nop	/* 1 */
+	nop	/* 2 */
+	nop	/* 3 */
+	nop	/* 4 */
+	nop	/* 5 */
+	nop	/* 6 */
+	nop	/* 7 */
+	.endm
+#else
+#define pcxt_ssm_bug	/* Thank $DIETY. You don't have brain damaged HW. */
+#endif
+
 #endif /* __ASSEMBLY__ */
 #endif
Index: include/asm-parisc/psw.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/psw.h,v
retrieving revision 1.1
diff -u -p -r1.1 psw.h
--- include/asm-parisc/psw.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/psw.h	27 Apr 2005 06:27:59 -0000
@@ -9,6 +9,16 @@
 #define	PSW_G	0x00000040	/* PA1.x only */
 #define PSW_O	0x00000080	/* PA2.0 only */
 
+/* ssm/rsm instructions number PSW_W and PSW_E differently */
+#define PSW_SM_I	PSW_I	/* Enable External Interrupts */
+#define PSW_SM_D	PSW_D
+#define PSW_SM_P	PSW_P
+#define PSW_SM_Q	PSW_Q	/* Enable Interrupt State Collection */
+#define PSW_SM_R	PSW_R	/* Enable Recover Counter Trap */
+#define PSW_SM_W	0x200	/* PA2.0 only : Enable Wide Mode */
+
+#define PSW_SM_QUIET	PSW_SM_R+PSW_SM_Q+PSW_SM_P+PSW_SM_D+PSW_SM_I
+
 #define PSW_CB	0x0000ff00
 
 #define	PSW_M	0x00010000
@@ -30,33 +40,21 @@
 #define	PSW_Z	0x40000000	/* PA1.x only */
 #define	PSW_Y	0x80000000	/* PA1.x only */
 
-#ifdef __LP64__
-#define PSW_HI_CB 0x000000ff    /* PA2.0 only */
+#ifdef CONFIG_64BIT
+#  define PSW_HI_CB 0x000000ff    /* PA2.0 only */
 #endif
 
-/* PSW bits to be used with ssm/rsm */
-#define PSW_SM_I        0x1
-#define PSW_SM_D        0x2
-#define PSW_SM_P        0x4
-#define PSW_SM_Q        0x8
-#define PSW_SM_R        0x10
-#define PSW_SM_F        0x20
-#define PSW_SM_G        0x40
-#define PSW_SM_O        0x80
-#define PSW_SM_E        0x100
-#define PSW_SM_W        0x200
-
-#ifdef __LP64__
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_W | PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_W | PSW_Q)
-#  define USER_PSW_MASK (PSW_W | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
-#  define USER_PSW_HI_MASK (PSW_HI_CB)
-#else
-#  define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
-#  define KERNEL_PSW    (PSW_C | PSW_Q | PSW_P | PSW_D)
-#  define REAL_MODE_PSW (PSW_Q)
-#  define USER_PSW_MASK (PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
+#ifdef CONFIG_64BIT
+#  define USER_PSW_HI_MASK	PSW_HI_CB
+#  define WIDE_PSW		PSW_W
+#else 
+#  define WIDE_PSW		0
 #endif
+
+/* Used when setting up for rfi */
+#define KERNEL_PSW    (WIDE_PSW | PSW_C | PSW_Q | PSW_P | PSW_D)
+#define REAL_MODE_PSW (WIDE_PSW | PSW_Q)
+#define USER_PSW_MASK (WIDE_PSW | PSW_T | PSW_N | PSW_X | PSW_B | PSW_V | PSW_CB)
+#define USER_PSW      (PSW_C | PSW_Q | PSW_P | PSW_D | PSW_I)
 
 #endif
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
