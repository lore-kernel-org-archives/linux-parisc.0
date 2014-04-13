From: Helge Deller <deller@gmx.de>
Subject: [RFC,PATCH] parisc: avoid saving & restoring fp regs at syscall entry
Date: Sun, 13 Apr 2014 22:17:33 +0200
Message-ID: <20140413201733.GA7858@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, dave.anglin@bell.net
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a work-in-progress patch to avoid unneccesary saving of floating
point regs when entering syscalls (it still generates segfaults...!).
The compiler option -mdisable-fpregs takes care that we don't use fp
regs in kernel code by accident.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index e8f07dd..810769b 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -785,9 +785,13 @@ ENDPROC(ret_from_kernel_thread)
 ENTRY(_switch_to)
 	STREG	 %r2, -RP_OFFSET(%r30)
 
-	callee_save_float
 	callee_save
 
+	/* TODO: we could check TASK_FLAGS and only save the fpregs when
+	 * switching away from a userspace task. */
+	ldo	TASK_PT_FR0(%r26), %r1	/* save fpregs for task switch */
+	save_fp	%r1
+
 	load32	_switch_to_ret, %r2
 
 	STREG	%r2, TASK_PT_KPC(%r26)
@@ -795,6 +799,12 @@ ENTRY(_switch_to)
 
 	STREG	%r30, TASK_PT_KSP(%r26)
 	LDREG	TASK_PT_KSP(%r25), %r30
+
+	/* TODO: we could check TASK_FLAGS and restore the fpregs only when
+	 * we return to a userspace task. */
+	ldo	TASK_PT_FR31(%r25),%r1	/* reload fpregs */
+	rest_fp	%r1
+
 	LDREG	TASK_THREAD_INFO(%r25), %r25
 	bv	%r0(%r2)
 	mtctl   %r25,%cr30
@@ -802,7 +812,6 @@ ENTRY(_switch_to)
 _switch_to_ret:
 	mtctl	%r0, %cr0		/* Needed for single stepping */
 	callee_rest
-	callee_rest_float
 
 	LDREG	-RP_OFFSET(%r30), %r2
 	bv	%r0(%r2)
@@ -913,8 +922,6 @@ intr_check_sig:
 
 intr_restore:
 	copy            %r16,%r29
-	ldo             PT_FR31(%r29),%r1
-	rest_fp         %r1
 	rest_general    %r29
 
 	/* inverse of virt_map */
@@ -1013,9 +1020,6 @@ intr_extint:
 	virt_map
 	save_general	%r29
 
-	ldo	PT_FR0(%r29), %r24
-	save_fp	%r24
-	
 	loadgp
 
 	copy	%r29, %r26	/* arg0 is pt_regs */
@@ -1094,9 +1098,6 @@ skip_save_ior:
 	virt_map
 	save_general	%r29
 
-	ldo		PT_FR0(%r29), %r25
-	save_fp		%r25
-	
 	loadgp
 
 	copy		%r29, %r25	/* arg1 is pt_regs */
@@ -1856,9 +1857,6 @@ syscall_restore:
 	and,COND(=)	%r19,%r2,%r0
 	b,n	syscall_restore_rfi
 
-	ldo	TASK_PT_FR31(%r1),%r19		   /* reload fpregs */
-	rest_fp	%r19
-
 	LDREG	TASK_PT_SAR(%r1),%r19		   /* restore SAR */
 	mtsar	%r19
 
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index a63bb179..89163e7 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -184,9 +184,6 @@ linux_gateway_entry:
 	STREG	%r29, TASK_PT_GR29(%r1)		/* return value 1 */
 	STREG	%r31, TASK_PT_GR31(%r1)		/* preserve syscall return ptr */
 	
-	ldo	TASK_PT_FR0(%r1), %r27		/* save fpregs from the kernel */
-	save_fp	%r27				/* or potential task switch  */
