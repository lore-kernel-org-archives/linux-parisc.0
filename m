From: kyle@mcmartin.ca (Kyle McMartin)
Subject: [parisc-linux] [RFC] head.S merge, take 2
Date: Thu, 5 Aug 2004 21:55:54 -0400
Message-ID: <20040806015554.GA5319@leibniz.int.mcmartin.ca>
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

Just thought I'd toss this out after incorporating tausq and jda's
comments.

Cheers,

Index: arch/parisc/kernel/Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/Makefile,v
retrieving revision 1.4
diff -u -r1.4 Makefile
--- arch/parisc/kernel/Makefile	9 May 2004 04:13:00 -0000	1.4
+++ arch/parisc/kernel/Makefile	6 Aug 2004 01:27:52 -0000
@@ -3,7 +3,6 @@
 #
 
 head-y			:= head.o
-head-$(CONFIG_PARISC64)	:= head64.o
 extra-y			:= init_task.o $(head-y) vmlinux.lds.s
 
 AFLAGS_entry.o	:= -traditional
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.8
diff -u -r1.8 head.S
--- arch/parisc/kernel/head.S	29 Jul 2004 15:38:06 -0000	1.8
+++ arch/parisc/kernel/head.S	6 Aug 2004 01:27:53 -0000
@@ -1,12 +1,13 @@
-/*
- *
- * This file is subject to the terms and conditions of the GNU General Public
+/* This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
  * Copyright (C) 1999 by Helge Deller
  * Copyright 1999 SuSE GmbH (Philipp Rumpf)
  * Copyright 1999 Philipp Rumpf (prumpf@tux.org)
+ * Copyright 2000 Hewlett Packard (Paul Bame, bame@puffin.external.hp.com)
+ * Copyright (C) 2001 Grant Grundler (Hewlett Packard)
+ * Copyright (C) 2004 Kyle McMartin <kyle@debian.org>
  *
  * Initial Version 04-23-1999 by Helge Deller <deller@gmx.de>
  */
@@ -15,12 +16,12 @@
 
 #include <asm/offsets.h>
 #include <asm/psw.h>
-
+#include <asm/pdc.h>
+	
 #include <asm/assembly.h>
 #include <asm/pgtable.h>
 
-
-	.level 1.1
+	.level	LEVEL
 
 	.data
 
@@ -32,12 +33,13 @@
 	.word 0 /* arg3 */
 
 	.text
-	.align	4	
+	.align	4
 	.import init_thread_union,data
+	.import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
+	.import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
+#ifndef __LP64__
 	.import	$global$		/* forward declaration */
-	.import fault_vector_11,code	/* IVA parisc 1.1 32 bit */
-	.import fault_vector_20,code	/* IVA parisc 2.0 32 bit */
-
+#endif /*!LP64*/
 	.export stext
 	.export _stext,data		/* Kernel want it this way! */
 _stext:
@@ -56,82 +58,108 @@
 	.import __bss_start,data
 	.import __bss_stop,data
 
-	ldil            L%PA(__bss_start),%r3
-	ldo             R%PA(__bss_start)(%r3),%r3
-	ldil            L%PA(__bss_stop),%r4
-	ldo             R%PA(__bss_stop)(%r4),%r4
+	load32		PA(__bss_start),%r3
+	load32		PA(__bss_stop),%r4
 $bss_loop:
 	cmpb,<<,n       %r3,%r4,$bss_loop
+#ifdef __LP64__
+	stb,ma          %r0,1(%r3)
+#else
 	stw,ma          %r0,4(%r3)
+#endif
 
 	/* Save away the arguments the boot loader passed in (32 bit args) */
-
-	ldil            L%PA(boot_args),%r1
-	ldo             R%PA(boot_args)(%r1),%r1
+	load32		PA(boot_args),%r1
 	stw,ma          %arg0,4(%r1)
 	stw,ma          %arg1,4(%r1)
 	stw,ma          %arg2,4(%r1)
 	stw,ma          %arg3,4(%r1)
 
 	/* Initialize startup VM. Just map first 8 MB of memory */
-	ldil		L%PA(pg0),%r1
-	ldo		R%PA(pg0)(%r1),%r1
-	shr		%r1,PxD_VALUE_SHIFT,%r3
-	ldo		(PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3
+	load32		PA(pg0),%r1
 
-	ldil		L%PA(swapper_pg_dir),%r4
-	ldo		R%PA(swapper_pg_dir)(%r4),%r4
+#ifdef __LP64__
+	load32		PA(pmd0),%r5
+	shrd            %r5,PxD_VALUE_SHIFT,%r3	
+#else
+	shr		%r1,PxD_VALUE_SHIFT,%r3
+#endif
+        ldo             (PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3	
+	
+	load32		PA(swapper_pg_dir),%r4
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
+
+#ifdef __LP64__
+	stw		%r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
+	shrd		%r1,PxD_VALUE_SHIFT,%r3
+	ldo		(PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3
+	ldo		ASM_PMD_ENTRY*ASM_PMD_ENTRY_SIZE(%r5),%r5
+#else
+        ldo             ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4),%r4
+#endif
 	ldi		ASM_PT_INITIAL,%r1
-	ldo		ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4),%r4
+
 1:
+#ifdef __LP64__
+	stw             %r3,0(%r5)
+#else
 	stw             %r3,0(%r4)
+#endif
+	
 	ldo		(ASM_PAGE_SIZE >> PxD_VALUE_SHIFT)(%r3),%r3
 	addib,>		-1,%r1,1b
+
+#ifdef __LP64__
+	ldo		ASM_PMD_ENTRY_SIZE(%r5),%r5
+#else
 	ldo		ASM_PGD_ENTRY_SIZE(%r4),%r4
+#endif
 
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
-	ldil		L%PA(pg0),%r1
-	ldo		R%PA(pg0)(%r1),%r1
+	load32		PA(pg0),%r1
+
 $pgt_fill_loop:
-	stwm		%r3,ASM_PTE_ENTRY_SIZE(%r1)
+	STREGM          %r3,ASM_PTE_ENTRY_SIZE(%r1)
 	ldo		ASM_PAGE_SIZE(%r3),%r3
 	bb,>=		%r3,31-KERNEL_INITIAL_ORDER,$pgt_fill_loop
 	nop
 
-
 	/* Load the return address...er...crash 'n burn */
 	copy		%r0,%r2
 
 	/* And the RFI Target address too */
-	ldil            L%start_kernel,%r11
-	ldo             R%start_kernel(%r11),%r11
+	load32		start_kernel,%r11
 
 	/* And the initial task pointer */
-
-	ldil            L%init_thread_union,%r6
-	ldo             R%init_thread_union(%r6),%r6
+	load32		init_thread_union,%r6
 	mtctl           %r6,%cr30
 
 	/* And the stack pointer too */
-
+#ifdef __LP64__
+	load32          PA(init_thread_union+THREAD_SZ_ALGN),%sp
+#else
 	ldo             THREAD_SZ_ALGN(%r6),%sp
+#endif
 
 	/* And the interrupt stack */
-
-	ldil            L%interrupt_stack,%r6
-	ldo             R%interrupt_stack(%r6),%r6
+	load32		interrupt_stack,%r6
 	mtctl           %r6,%cr31
 
+#ifdef __LP64__
+#define MEM_PDC_LO 0x388
+#define MEM_PDC_HI 0x35C
+	ldw             MEM_PDC_LO(%r0),%r3
+	ldw             MEM_PDC_HI(%r0),%r6
+	depd            %r6, 31, 32, %r3        /* move to upper word */
+#endif
 #ifdef CONFIG_SMP
 	/* Set the smp rendevous address into page zero.
 	** It would be safer to do this in init_smp_config() but
 	** it's just way easier to deal with here because
 	** of 64-bit function ptrs and the address is local to this file.
 	*/
-	ldil		L%PA(smp_slave_stext),%r10
-	ldo		R%PA(smp_slave_stext)(%r10),%r10
+	load32		PA(smp_slave_stext),%r10
 	stw		%r10,0x10(%r0)	/* MEM_RENDEZ */
 	stw		%r0,0x28(%r0)	/* MEM_RENDEZ_HI - assume addr < 4GB */
 
@@ -141,10 +169,16 @@
 	/*
 	** Code Common to both Monarch and Slave processors.
 	** Entry:
+	**
+	**  1.1:	
 	**    %r11 must contain RFI target address.
 	**    %r25/%r26 args to pass to target function
 	**    %r2  in case rfi target decides it didn't like something
 	**
+	**  2.0w:
+	**    %r3  PDCE_PROC address
+	**    %r11 RFI target address
+	**
 	** Caller must init: SR4-7, %sp, %r10, %cr24/25, 
 	*/
 common_stext:
@@ -154,8 +188,41 @@
 	/* Clear PDC entry point - we won't use it */
 	stw		%r0,0x10(%r0)	/* MEM_RENDEZ */
 	stw		%r0,0x28(%r0)	/* MEM_RENDEZ_HI */
-#endif
+#endif /*CONFIG_SMP*/
 
+#ifdef __LP64__
+	/* Save the rfi target address */
+	ldd             TI_TASK-THREAD_SZ_ALGN(%sp), %r10
+	tophys_r1       %r10
+	std             %r11,  TASK_PT_GR11(%r10)
+	/* Switch to wide mode Superdome doesn't support narrow PDC
+	** calls.
+	*/
+1:	mfia            %rp             /* clear upper part of pcoq */
+	ldo             2f-1b(%rp),%rp
+	depdi           0,31,32,%rp
+	bv              (%rp)
+	ssm             PSW_SM_W,%r0
+
+        /* Set Wide mode as the "Default" (eg for traps)
+        ** First trap occurs *right* after (or part of) rfi for slave CPUs.
+        ** Someday, palo might not do this for the Monarch either.
+        */
+2:
+	ldo             PDC_PSW(%r0),%arg0              /* 21 */
+	ldo             PDC_PSW_SET_DEFAULTS(%r0),%arg1 /* 2 */
+	ldo             PDC_PSW_WIDE_BIT(%r0),%arg2     /* 2 */
+	load32          PA(stext_pdc_ret), %rp
+	bv              (%r3)
+	copy            %r0,%arg3
+
+stext_pdc_ret:
+	/* restore rfi target address*/
+	ldd             TI_TASK-THREAD_SZ_ALGN(%sp), %r10
+	tophys_r1       %r10
+	ldd             TASK_PT_GR11(%r10), %r11
+#endif
+	
 	/* PARANOID: clear user scratch/user space SR's */
 	mtsp	%r0,%sr0
 	mtsp	%r0,%sr1
@@ -168,12 +235,15 @@
 	mtctl	%r0,%cr12
 	mtctl	%r0,%cr13
 
+#ifdef __LP64__
+	/* Prepare to RFI! Man all the cannons! */
+	tovirt_r1       %sp
+#endif
+	
 	/* Initialize the global data pointer */
-	ldil		L%$global$,%dp
-	ldo		R%$global$(%dp),%dp
+	loadgp
 
-	/*
-	 * Set up our interrupt table.  HPMCs might not work after this! 
+	/* Set up our interrupt table.  HPMCs might not work after this! 
 	 *
 	 * We need to install the correct iva for PA1.1 or PA2.0. The
 	 * following short sequence of instructions can determine this
@@ -190,14 +260,35 @@
 	ldo		R%PA(fault_vector_11)(%r10),%r10
 
 $is_pa20:
-	ldil		L%PA(fault_vector_20),%r10
-	ldo		R%PA(fault_vector_20)(%r10),%r10
+	.level		LEVEL /* restore 1.1 || 2.0w */
+	load32		PA(fault_vector_20),%r10
 
 $install_iva:
 	mtctl		%r10,%cr14
 
-	/* Disable Q bit so we can load the iia queue */
-	rsm            PSW_SM_Q,%r0
+#ifdef __LP64__
+	.align          256
+aligned_rfi:
+	ssm             0,0
+	nop             /* 1 */
+	nop             /* 2 */
+	nop             /* 3 */
+	nop             /* 4 */
+	nop             /* 5 */
+	nop             /* 6 */
+	nop             /* 7 */
+	nop             /* 8 */
+#endif
+
+#ifdef __LP64__ /* move to psw.h? */
+#define		PSW_BITS	PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
+#else
+#define		PSW_BITS	PSW_SM_Q
+#endif
+
+$rfi:	
+	/* turn off troublesome PSW bits */
+	rsm		PSW_BITS,%r0
 
 	/* kernel PSW:
 	 *  - no interruptions except HPMC and TOC (which are handled by PDC)
@@ -205,8 +296,7 @@
 	 *  - big-endian
 	 *  - virtually mapped
 	 */
-	ldil		L%KERNEL_PSW,%r10
-	ldo		R%KERNEL_PSW(%r10),%r10
+	load32		KERNEL_PSW,%r10
 	mtctl		%r10,%ipsw
 
 	/* Set the space pointers for the post-RFI world
@@ -232,6 +322,7 @@
 	.import smp_init_current_idle_task,data
 	.import	smp_callin,code
 
+#ifndef __LP64__
 smp_callin_rtn:
         .proc
 	.callinfo
@@ -239,9 +330,9 @@
 	nop
 	nop
         .procend
+#endif /*!LP64*/
 
 /***************************************************************************
-*
 * smp_slave_stext is executed by all non-monarch Processors when the Monarch
 * pokes the slave CPUs in smp.c:smp_boot_cpus().
 *
@@ -249,8 +340,6 @@
 * mode. Once all available/eligible CPUs are in virtual mode, all are
 * released and start out by executing their own idle task.
 *****************************************************************************/
-
-
 smp_slave_stext:
         .proc
 	.callinfo
@@ -264,28 +353,31 @@
 	mtsp	   %r0,%sr7
 
 	/*  Initialize the SP - monarch sets up smp_init_current_idle_task */
-	ldil		L%PA(smp_init_current_idle_task),%sp
-	ldo		R%PA(smp_init_current_idle_task)(%sp),%sp
-	ldw		0(%sp),%sp	/* load task address */
+	load32		PA(smp_init_current_idle_task),%sp
+	LDREG		0(%sp),%sp	/* load task address */
 	tophys_r1	%sp
-	ldw		TASK_THREAD_INFO(%sp), %sp
+	LDREG		TASK_THREAD_INFO(%sp),%sp
 	mtctl           %sp,%cr30       /* store in cr30 */
-	addil		L%THREAD_SZ_ALGN,%sp	/* stack is above task */
-	ldo		R%THREAD_SZ_ALGN(%r1),%sp
+	ldo             THREAD_SZ_ALGN(%sp),%sp
+#ifdef __LP64__
+	tophys_r1       %sp
+#endif
 
 	/* point CPU to kernel page tables */
-	ldil		L%PA(swapper_pg_dir),%r4
-	ldo		R%PA(swapper_pg_dir)(%r4),%r4
+	load32		PA(swapper_pg_dir),%r4
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
+#ifdef __LP64__
+	/* Setup PDCE_PROC entry */
+	copy            %arg0,%r3
+#else
 	/* Load RFI *return* address in case smp_callin bails */
-	ldil		L%smp_callin_rtn,%r2
-	ldo		R%smp_callin_rtn(%r2),%r2
-
+	load32		smp_callin_rtn,%r2
+#endif
+	
 	/* Load RFI target address.  */
-	ldil		L%smp_callin,%r11
-	ldo		R%smp_callin(%r11),%r11
+	load32		smp_callin,%r11
 	
 	/* ok...common code can handle the rest */
 	b		common_stext
@@ -293,7 +385,7 @@
 
 	.procend
 #endif /* CONFIG_SMP */
-
+#ifndef __LP64__
 	.data
 
 	.align	4
@@ -303,3 +395,4 @@
 	.size	$global$,4
 $global$:	
 	.word 0
+#endif /*!LP64*/
Index: include/asm-parisc/assembly.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/assembly.h,v
retrieving revision 1.3
diff -u -r1.3 assembly.h
--- include/asm-parisc/assembly.h	30 Jul 2004 23:23:20 -0000	1.3
+++ include/asm-parisc/assembly.h	6 Aug 2004 01:28:04 -0000
@@ -26,6 +26,7 @@
 #define STREG	std
 #define LDREGM	ldd,mb
 #define STREGM	std,ma
+#define SHRREG  shrd
 #define RP_OFFSET	16
 #define FRAME_SIZE	128
 #else
@@ -33,14 +34,21 @@
 #define STREG	stw
 #define LDREGM	ldwm
 #define STREGM	stwm
+#define SHRREG  shr
 #define RP_OFFSET	20
 #define FRAME_SIZE	64
 #endif
 
 #ifdef CONFIG_PA20
 #define BL		b,l
+#ifdef CONFIG_PA64
+#define LEVEL 2.0w
+#else
+#define LEVEL 2.0
+#endif
 #else
 #define BL		bl
+#define LEVEL 1.1
 #endif
 
 #ifdef __ASSEMBLY__
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
