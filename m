Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C3634A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 23:52:48 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 813F110A9
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 22:52:47 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id WAA04894
	for parisc-linux@lists.parisc-linux.org; Tue, 6 Feb 2001 22:55:14 -0800 (PST)
Date: Tue, 6 Feb 2001 22:55:14 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200102070655.WAA04894@milano.cup.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc64 head.S patch
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,
This patch is another step towards enabling SMP.
Please review and comment.

NOTE: head.S are seperate files for parisc and parisc64.

The basic change here is PDC_PSW is called to set DEFAULT_PSW bit to wide.
This *must* happen before RFIing to virtual mode. The first
thing the RFI does is cause a trap where we need land with both
feet on the ground (ie in wide mode).

Currently, PALO does this when it loads an ELF64 binary.  But since
the PDC call only applies to the CPU making the call, under SMP, all
slave CPU's have to do this too.
Paul Bame and I agree it's reasonable for PALO to not make this PDC call
and the PDC call should be in the common path between Monarch (or !SMP)
and Slave (enabled CONFIG_SMP) CPU's. Eventually, Paul intends to remove
the call from PALO.

The rest of the changes are cleanup (eg use of load32 macro)
and drop the smp_callin_rtn() which will never get invoked.

I wasn't 100% sure of one thing: usage of "TASK_PT_GR26-TASK_SZ_ALGN"
and %sp usage. I think it is and also suspect it doesn't really matter
at this point.

This code was only tested on an A500 and CONFIG_SMP=n.
(and with the init_new_context() patch from matthew)
The kernel booted fine w/o new complaints.

thanks,
grant


Index: arch/parisc64/kernel/head.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc64/kernel/head.S,v
retrieving revision 1.4
diff -u -p -r1.4 head.S
--- head.S	2001/01/28 13:39:15	1.4
+++ head.S	2001/02/07 06:21:11
@@ -21,6 +21,7 @@
 
 #include <asm/assembly.h>
 #include <asm/pgtable.h>
+#include <asm/pdc.h>		/* for PDC_PSW defines */
 
 
 	.level 2.0
@@ -88,14 +89,19 @@ $pgt_fill_loop:
 	bb,>=		%r3,8,$pgt_fill_loop
 	nop
 
-	/* Load the return address...er...crash 'n burn */
-	copy		%r0,%r2
-
 	/* And the RFI Target address too */
 	load32		start_parisc, %r11
 
 	/* And the stack pointer too */
-	load32		init_task_union+TASK_SZ_ALGN,%sp
+	load32		PA(init_task_union+TASK_SZ_ALGN),%sp
+
+	/* Act like PDC just called us - that's how slave CPUs enter */
+#define MEM_PDC_LO 0x388
+#define MEM_PDC_HI 0x35C
+	ldw		MEM_PDC_LO(%r0),%r6
+	ldw		MEM_PDC_HI(%r0),%r7
+	depd,z		%r7, 31, 32, %r3	/* move to upper word */
+	or		%r6, %r3, %r3		/* combine both parts */
 
 #ifdef CONFIG_SMP
 	/* Set the smp rendevous address into page zero.
@@ -114,21 +120,56 @@ $pgt_fill_loop:
 	/*
 	** Code Common to both Monarch and Slave processors.
 	** Entry:
-	**    %r11 must contain RFI target address.
-	**    %r25/%r26 args to pass to target function
-	**    %r2  in case rfi target decides it didn't like something
+	**    %r3	PDCE_PROC address
+	**    %r11	RFI target address.
+	**    %r26-%r23 args to pass to target function
 	**
 	** Caller must init: SR4-7, %sp, %r10, %cr24/25, 
 	*/
 common_stext:
 	.proc
 	.callinfo
-#else
+#else /* CONFIG_SMP */
 	/* Clear PDC's CPU handoff address - we won't use it */
 	stw		%r0,0x10(%r0)	/* MEM_RENDEZ */
 	stw		%r0,0x28(%r0)	/* MEM_RENDEZ_HI */
-#endif
+#endif /* CONFIG_SMP */
+
+	/* Save parameters from PALO/PDC */
+	std		%arg0, TASK_PT_GR26-TASK_SZ_ALGN(%sp)
+	std		%arg1, TASK_PT_GR25-TASK_SZ_ALGN(%sp)
+	std		%arg2, TASK_PT_GR24-TASK_SZ_ALGN(%sp)
+	std		%arg3, TASK_PT_GR23-TASK_SZ_ALGN(%sp)
+	std		%r11,  TASK_PT_GR11-TASK_SZ_ALGN(%sp)
+
+	/* Set Wide mode as the "Default" (eg for traps)
+	** First trap occurs *right* after (or part of) rfi for slave CPUs.
+	** Someday, palo might not do this for the Monarch either.
+	*/
 
+	ldo		PDC_PSW(%r0),%arg0		/* 21 */
+	ldo		PDC_PSW_SET_DEFAULTS(%r0),%arg1	/* 2 */
+	ldo		PDC_PSW_WIDE_BIT(%r0),%arg2	/* 2 */
+
+	load32		PA(stext_pdc_ret), %rp
+
+	bv		(%r3)
+	copy		%r0,%arg3
+
+stext_pdc_ret:
+	/* restore PDC/PALO parameters */
+	ldd		TASK_PT_GR26-TASK_SZ_ALGN(%sp), %arg0
+	ldd		TASK_PT_GR25-TASK_SZ_ALGN(%sp), %arg1
+	ldd		TASK_PT_GR24-TASK_SZ_ALGN(%sp), %arg2
+	ldd		TASK_PT_GR23-TASK_SZ_ALGN(%sp), %arg3
+	ldd		TASK_PT_GR11-TASK_SZ_ALGN(%sp), %r11
+
+	std		%r0, TASK_PT_GR26-TASK_SZ_ALGN(%sp)
+	std		%r0, TASK_PT_GR25-TASK_SZ_ALGN(%sp)
+	std		%r0, TASK_PT_GR24-TASK_SZ_ALGN(%sp)
+	std		%r0, TASK_PT_GR23-TASK_SZ_ALGN(%sp)
+	std		%r0, TASK_PT_GR11-TASK_SZ_ALGN(%sp)
+
 	/* PARANOID: clear user scratch/user space SR's */
 	mtsp	%r0,%sr0
 	mtsp	%r0,%sr1
@@ -141,6 +182,9 @@ common_stext:
 	mtctl	%r0,%cr12
 	mtctl	%r0,%cr13
 
+	/* Prepare to RFI! Man all the cannons! */
+	tovirt		%sp
+
 	/* Initialize the global data pointer */
 	load32		__gp,%dp
 
@@ -208,14 +252,6 @@ aligned_rfi:
 	.import smp_init_current_idle_task,data
 	.import	smp_callin,code
 
-smp_callin_rtn:
-        .proc
-	.callinfo
-	break	1,1		/*  Break if returned from start_secondary */
-	nop
-	nop
-        .procend
-
 /***************************************************************************
 *
 * smp_slave_stext is executed by all non-monarch Processors when the Monarch
@@ -239,32 +275,19 @@ smp_slave_stext:
 	mtsp	   %r0,%sr6
 	mtsp	   %r0,%sr7
 
-	/* Initialize the global data pointer */
-	ldil		L%__gp,%dp
-	ldo		R%__gp(%dp),%dp
-	depi		0, 31, 32, %dp
-
 	/*  Initialize the SP - monarch sets up smp_init_current_idle_task */
-	ldil		L%PA(smp_init_current_idle_task),%sp
-	ldo		R%PA(smp_init_current_idle_task)(%sp),%sp
-	depdi		0, 31, 32, %sp
-#ifdef __LP64__
+	load32		PA(smp_init_current_idle_task),%sp
 	ldd		0(%sp),%sp	/* load task address */
-#else
-	ldw		0(%sp),%sp	/* load task address */
-#endif
 	addil		L%TASK_SZ_ALGN,%sp	/* Stack is above task */
 	ldo		R%TASK_SZ_ALGN(%r1),%sp
 
 	/* point CPU to kernel page tables */
-	ldil		L%PA(swapper_pg_dir),%r4
-	ldo		R%PA(swapper_pg_dir)(%r4),%r4
-	depdi		0, 31, 32, %r4
+	load32		PA(swapper_pg_dir),%r4
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-	/* Load RFI *return* address in case smp_callin bails */
-	load32		smp_callin_rtn, %r2
+	/* Setup PDCE_PROC entry */
+	copy		%arg0,%r3
 
 	/* Load RFI target address.  */
 	load32		smp_callin, %r11
