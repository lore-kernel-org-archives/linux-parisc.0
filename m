Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34E984A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 13:51:07 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 64CC8B73
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 12:51:06 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id MAA06953
	for parisc-linux@lists.parisc-linux.org; Thu, 8 Feb 2001 12:53:35 -0800 (PST)
Date: Thu, 8 Feb 2001 12:53:35 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200102082053.MAA06953@milano.cup.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] more CONFIG_SMP changes to review
List-ID: <linux-parisc.vger.kernel.org>

Could interested folks review the following two file changes?
I'd like to commit this later tonight if possible.

arch/parisc/kernel/entry.S	Fix indexing into irq_stat[]
include/asm-parisc/assembly.h	Add shl, shlw (alias), and shld as per
				PA2.0 arch manual.

I've only tested on A500 w/CONFIG_SMP and will test
32-bit on c3k (CONFIG_SMP=n) as well.

A500 now gets past:
...
SMP: bootstrap CPU ID is 0
sboc: task 0x00000000cfff0000 for 1/1
sboc: CPU 1 state 0x0 flags 0x40
FP[1] enabled: Rev 1 Model 16
SMP: CPU:1  CR15 ffffffffffffffff CR22 804000e CR23 0
SMP: CPU:1 (num 1) came alive after 9800 _us
SMP: Total 2 of 2 processors activated (1756.36 BogoMIPS noticed).
SMP: BSP before
SMP: CPU:1  CR15 ffffffffffffffff CR22 804000e CR23 0 
SMP: CPU:1 calling cpu_idle()
SMP: BSP proceeding
...
SBA found Astro 2.1 at 0xfffffffffed00000                                       
Linux NET4.0 for Linux 2.4                                                      
Based upon Swansea University Computer Society NET3.039                         
kernel BUG at sched.c:522!
...
and then gives a stack dump with:

Kernel Fault: Code=26 regs=00000000cfff0c40 (Addr=00000024)                     


but that's good forward progress with help from recent commits
by jsm, richard, and hints from paul bame!

thanks,
grant


Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.65
diff -u -p -r1.65 entry.S
--- entry.S	2001/02/08 18:26:47	1.65
+++ entry.S	2001/02/08 20:23:30
@@ -617,21 +617,24 @@ intr_return:
 
 	.import irq_stat,data
 
-	ldil    L%irq_stat,%r19
-	ldo     R%irq_stat(%r19),%r19
+	ldil	L%irq_stat,%r19
+	ldo	R%irq_stat(%r19),%r19
 	LDIL_FIXUP(%r19)
 
 #ifdef CONFIG_SMP
-	copy    %r30,%r1
+	copy	%r30,%r1
 	/* FIXME! depi below has hardcoded dependency on kernel stack size */
-	depi    0,31,14,%r1 /* get task pointer */
-	ldw     TASK_PROCESSOR(%r1),%r20 /* get cpu # - int */
-#if (IRQSTAT_SZ == 32)
-	dep     %r20,26,27,%r20 /* shift left 5 bits */
+	depi	0,31,14,%r1 /* get task pointer */
+	ldw	TASK_PROCESSOR(%r1),%r1 /* get cpu # - int */
+	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) amount
+	** irq_stat[] is defined using ____cacheline_aligned.
+	*/
+#if __LP64__
+	shld	%r1, 6, %r20
 #else
-#error IRQSTAT_SZ changed, fix dep
-#endif /* IRQSTAT_SZ */
-	add     %r19,%r20,%r19
+	shl	%r1, 5, %r20
+#endif
+	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
 #endif /* CONFIG_SMP */
 
 	ldw     IRQSTAT_SI_ACTIVE(%r19),%r20	/* hardirq.h: unsigned int */
@@ -2006,15 +2009,17 @@ syscall_check_bh:
 
 #ifdef CONFIG_SMP
 	/* sched.h: int processor */
-	ldw     TASK_PROCESSOR-TASK_SZ_ALGN-FRAME_SIZE(%r30),%r20 /* get cpu # */
-#if (IRQSTAT_SZ == 32)
-	dep     %r20,26,27,%r20 /* shift left 5 bits */
+	/* %r26 is used as scratch register to index into irq_stat[] */
+	ldw     TASK_PROCESSOR-TASK_SZ_ALGN-FRAME_SIZE(%r30),%r26 /* cpu # */
+
+	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) bits */
+#if __LP64__
+	shld	%r26, 6, %r20
 #else
-#error IRQSTAT_SZ changed, fix dep
-#endif /* IRQSTAT_SZ */
-	add     %r19,%r20,%r19
+	shl	%r26, 5, %r20
+#endif
+	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
 #endif /* CONFIG_SMP */
-
 	ldw     IRQSTAT_SI_ACTIVE(%r19),%r20	/* hardirq.h: unsigned int */
 	ldw     IRQSTAT_SI_MASK(%r19),%r19	/* hardirq.h: unsigned int */
 	and     %r19,%r20,%r20

Index: include/asm-parisc/assembly.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/assembly.h,v
retrieving revision 1.15
diff -u -p -r1.15 assembly.h
--- assembly.h	2000/12/11 13:10:49	1.15
+++ assembly.h	2001/02/08 20:23:31
@@ -59,7 +59,20 @@
 	.macro	debug value
 	.endm
 
+
+	/* Shift Left - note the r and t can NOT be the same! */
+	.macro shl r, sa, t
+	dep,z	\r, 31-\sa, 32-\sa, \t
+	.endm
+
 #ifdef __LP64__
+/* Alias for pa2.0 insn name. */
+#define	shlw	shl
+
+	.macro shld r, sa, t
+	depd,z	\r, 63-\sa, 64-\sa, \t
+	.endm
+
 # define LDIL_FIXUP(reg) depdi 0,31,32,reg
 #else
 # define LDIL_FIXUP(reg)
 
