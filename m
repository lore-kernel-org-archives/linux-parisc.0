Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA07210
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 19:45:52 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id ECA934E4
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 21:48:08 -0500 (EST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA22769
	for parisc-linux@puffin.external.hp.com; Wed, 22 Nov 2000 18:47:06 -0800 (PST)
Date: Wed, 22 Nov 2000 18:47:06 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011230247.SAA22769@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CONFIG_DMB_TRAP diff
List-ID: <linux-parisc.vger.kernel.org>

Hello again (last one until Monday - I promise),

With Lamont's wisdom, I implemented support for Date Memory Break trap.

This enables the kernel programmer to capture the evil code which
stomps on other people's "private" data. Only works for stores
through virtual addresses. gsc_writeX() and DMA will still
bypass this mechanism.

pb, dhd, (or some equivalent deity), could you review/commit this code?
Or tell me it's ok to commit?

I've touched:
	arch/parisc/config.in
	arch/parisc/kernel/entry.S
	arch/parisc/mm/kmap.c
	include/asm-parisc/pgtable.h

thanks,
grant


Index: arch/parisc/config.in
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/config.in,v
retrieving revision 1.25
diff -u -p -r1.25 config.in
--- config.in	2000/10/20 18:28:26	1.25
+++ config.in	2000/11/23 02:18:23
@@ -16,8 +16,12 @@ endmenu
 mainmenu_option next_comment
 comment 'General options'
 
-# bool 'Symmetric multi-processing support' CONFIG_SMP
-define_bool CONFIG_SMP n
+bool 'Symmetric multi-processing support' CONFIG_SMP
+# define_bool CONFIG_SMP n
+
+# One needs to tweak dmb_trap_11 code in entry.S to match.
+# Not tested for 64-bit kernel.
+bool 'Debug support for Data Memory Break Trap' CONFIG_DMB_TRAP
 
 bool 'Kernel Debugger support' CONFIG_KWDB
 # define_bool CONFIG_KWDB n
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.53
diff -u -p -r1.53 entry.S
--- entry.S	2000/11/22 16:51:33	1.53
+++ entry.S	2000/11/23 02:18:23
@@ -23,6 +23,7 @@
  */
 
 #include <asm/offset.h>
+#include <linux/autoconf.h>
 
 /* the following is the setup i think we should follow:
  * whenever the CPU is interruptible, the following has to be true:
@@ -349,7 +350,39 @@
 	.endm
 #endif
 
+#ifdef CONFIG_DMB_TRAP
 	/*
+	** Data Memory Bit trap interruption handler (parisc 1.1)
+	**
+	** This is a debugging aid. Use it when you think someone else
+	** is stepping on your memory. It only catches *virtual*
+	** accesses. gsc_writeX() functions disable virtual translation
+	** (D-bit) and will happily scribble whatever physical address
+	** is passed in.
+	**
+	** Here's how to use it:
+	** 1) Call iterate_pages() from your init routine like this:
+	**	iterate_pages( my_private_mem, private_mem_size,
+	**                         set_data_memory_break, 0);
+	** 2) substitute your functions for your_function1 (or 2) in
+	**    dmb_trap_11 code below.
+	**
+	** Thanks to Lamont Jones for telling me how to do this.
+	** - ggg 1/22/2000
+	*/
+	.macro	dmb_11 code
+
+	mfctl	%isr,spc
+	b       dmb_trap_11
+	mfctl	%ior,va
+
+	.align		32
+	.endm
+#else
+#define dmb_11 def
+#endif
+
+	/*
 	 * dirty bit trap interruption handler (parisc 2.0)
 	 */
 
@@ -448,7 +481,7 @@ fault_vector_11:
 	naitlb_11	16
 	nadtlb_11	17
 	def		18
-	def		19
+	dmb_11		19
 	dbit_11		20
 	def		21
 	def		22
@@ -467,7 +500,6 @@ fault_vector_11:
 	.import		handle_interruption,code
 	.import		handle_real_interruption,code
 	.import		do_irq_mask,code
-	.import		parisc_stopkernel,code
 	.import		cpu_irq_region,data
 
 	/*
@@ -903,11 +935,15 @@ dtlb_miss_11:
 	dep		pte,8,7,prot
 
 	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
-	depi		1,12,1,prot
+	depi		1,12,1,prot	/* U-bit */
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
 	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
 	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+#ifdef CONFIG_DMB_TRAP
+	extru,=		pte,_PAGE_DMB_BIT,1,r0
+	depi		1,4,1,prot	/* B-bit */
+#endif
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
@@ -1300,6 +1336,30 @@ dbit_trap_11:
 
 	rfir
 	nop
+
+#ifdef CONFIG_DMB_TRAP
+	.import		your_function1,code
+	.import		your_function2,code
+
+dmb_trap_11:
+	mfctl           pcsq,t0	/* get space */
+	comb,<>,n       t0,%r0,dmb_rfi  /* not kernel - bail */
+
+	mfctl           pcoq,t0		/* get offset */
+	ldil		L%dmb_ok_function1, t1
+	dep		%r0, 31, 12, t0
+	comb,=,n        t0,t1,dmb_rfi /* it's ours - bail */
+
+	ldil		L%dmb_ok_function2, t1
+	comb,<>,n       t0,t1,intr_save /* not ours - panic */
+
+dmb_rfi:
+	mfctl           ipsw,t0		/* Set PSW X-bit - just continue */
+	depi		1,11,1,t0	/* Set X-bit */
+	mtctl           t0, ipsw
+	rfir
+	nop
+#endif
 
 dbit_trap_20:
 	mfctl           %cr25,ptp	/* Assume user space trap */
Index: arch/parisc/mm/kmap.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/mm/kmap.c,v
retrieving revision 1.3
diff -u -p -r1.3 kmap.c
--- kmap.c	2000/05/05 18:05:47	1.3
+++ kmap.c	2000/11/23 02:18:23
@@ -43,7 +43,16 @@ static void unmap_cached_pte(pte_t * pte
 }
 #endif
 
+#ifdef CONFIG_DMB_TRAP
 /* These two routines should probably check a few things... */
+void set_data_memory_break(pte_t * pte, unsigned long arg)
+{
+	pte_val(*pte) |= _PAGE_DMB;
+}
+
+#endif
+
+/* These two routines should probably check a few things... */
 static void set_uncached(pte_t * pte, unsigned long arg)
 {
 	pte_val(*pte) |= _PAGE_NO_CACHE;
@@ -106,7 +115,10 @@ static inline void iterate_pmd(pgd_t * d
 	} while (address < end);
 }
 
-static void iterate_pages(unsigned long address, unsigned long size,
+#ifndef CONFIG_DMB_TRAP
+static
+#endif
+void iterate_pages(unsigned long address, unsigned long size,
 			  pte_iterator_t op, unsigned long arg)
 {
 	pgd_t *dir;
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pgtable.h,v
retrieving revision 1.29
diff -u -p -r1.29 pgtable.h
--- pgtable.h	2000/11/10 21:44:44	1.29
+++ pgtable.h	2000/11/23 02:18:23
@@ -109,6 +109,10 @@ extern  void *vmalloc_start;
 #define _PAGE_USER      0x400   /* Software: User accessable page */
 #define _PAGE_USER_BIT     21   /* Needs to agree with _PAGE_USER above */
 				/* 0x800 still available */
+#ifdef CONFIG_DMB_TRAP
+#define _PAGE_DMB       0x800   /* Data Memory Break Trap */
+#define _PAGE_DMB_BIT      20   /* Data Memory Break Trap */
+#endif
 
 #ifdef __ASSEMBLY__
 #define _PGB_(x)	(1 << (63 - (x)))
