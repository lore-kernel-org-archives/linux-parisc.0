Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3PEtga03445; Sun, 25 Apr 2004 10:55:42 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040425145051.10F5C4942B8@palinux.hppa>
References: <20040425145051.10F5C4942B8@palinux.hppa>
Content-Type: text/plain
Date: 25 Apr 2004 09:55:40 -0500
Message-Id: <1082904942.12039.1.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 2004-04-25 at 09:50, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/25 08:50:51
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c entry.S head.S head64.S 
> 	                    pacache.S vmlinux.lds.S 
> 	arch/parisc/mm : init.c 
> 	include/asm-parisc: fixmap.h page.h pgtable.h 
> 
> Log message:
> Eliminate some Magic numbers
> 
> Also move fixed mapping definitions into fixmap.h

Index: arch/parisc/kernel/asm-offsets.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/asm-offsets.c,v
retrieving revision 1.3
diff -u -r1.3 asm-offsets.c
--- a/arch/parisc/kernel/asm-offsets.c	17 Jan 2004 06:39:24 -0000	1.3
+++ b/arch/parisc/kernel/asm-offsets.c	25 Apr 2004 14:48:12 -0000
@@ -32,6 +32,7 @@
 #include <linux/thread_info.h>
 #include <linux/version.h>
 #include <linux/ptrace.h>
+#include <asm/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <asm/processor.h>
@@ -275,6 +276,7 @@
 	BLANK();
 	DEFINE(PA_BLOCKSTEP_BIT, 31-PT_BLOCKSTEP_BIT);
 	DEFINE(PA_SINGLESTEP_BIT, 31-PT_SINGLESTEP_BIT);
+	DEFINE(ASM_PMD_ENTRY, ((__PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
 	BLANK();
 	return 0;
 }
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.7
diff -u -r1.7 entry.S
--- a/arch/parisc/kernel/entry.S	7 Feb 2004 18:32:50 -0000	1.7
+++ b/arch/parisc/kernel/entry.S	25 Apr 2004 14:48:14 -0000
@@ -1041,6 +1041,9 @@
 
 	cmpib,*<>,n     0,spc,dtlb_fault /* forward */
 	ldil            L%(TMPALIAS_MAP_START),t0
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0,31,32,t0	/* clear any sign extension */
+#endif
 	copy            va,t1
 	depdi           0,63,23,t1
 	cmpb,*<>,n      t0,t1,dtlb_fault /* forward */
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.3
diff -u -r1.3 head.S
--- a/arch/parisc/kernel/head.S	17 Jan 2004 15:00:32 -0000	1.3
+++ b/arch/parisc/kernel/head.S	25 Apr 2004 14:48:15 -0000
@@ -83,13 +83,9 @@
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-#if (__PAGE_OFFSET != 0x10000000UL)
-Error! Code below (the next two stw's) needs to be changed
-#endif
-
-	stw             %r3,0x100(%r4)  /* Hardwired 0x1... kernel Vaddr start*/
+	stw             %r3,((__PAGE_OFFSET>>PGDIR_SHIFT)*4)(%r4)
 	ldo		0x1000(%r3),%r3
-	stw             %r3,0x104(%r4)
+	stw             %r3,(((__PAGE_OFFSET>>PGDIR_SHIFT) + 1)*4)(%r4)
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 $pgt_fill_loop:
 	stwm		%r3,4(%r1)
Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.4
diff -u -r1.4 head64.S
--- a/arch/parisc/kernel/head64.S	7 Feb 2004 17:56:51 -0000	1.4
+++ b/arch/parisc/kernel/head64.S	25 Apr 2004 14:48:15 -0000
@@ -88,20 +88,16 @@
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-#if (__PAGE_OFFSET != 0x10000000UL)
-Error! Code below (the next five std's) needs to be changed
-#endif
-
-	std             %r3,0x00(%r4)   /* Hardwired 0x1... kernel Vaddr start*/
+	std             %r3,((__PAGE_OFFSET >> PGDIR_SHIFT)*8)(%r4)
 
 	ldo		_PAGE_TABLE(%r1),%r3
-	std             %r3,0x400(%r5)  /* Hardwired 0x1... kernel Vaddr start*/
+	std             %r3,(ASM_PMD_ENTRY * 8) (%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,0x408(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 1)*8)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,0x410(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 2)*8)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,0x418(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 3)*8)(%r5)
 
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 $pgt_fill_loop:
Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.5
diff -u -r1.5 pacache.S
--- a/arch/parisc/kernel/pacache.S	5 Apr 2004 02:47:39 -0000	1.5
+++ b/arch/parisc/kernel/pacache.S	25 Apr 2004 14:48:16 -0000
@@ -350,10 +350,6 @@
 
 	.procend
 
-#if (TMPALIAS_MAP_START >= 0x80000000UL)
-Warning TMPALIAS_MAP_START changed. If > 2 Gb, code in pacache.S is bogus
-#endif
-
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
  *       maximum alias boundary being 4 Mb. We've been assured by the
@@ -490,6 +486,9 @@
 
 	ldil    L%(TMPALIAS_MAP_START),%r28
 #ifdef __LP64__
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi	0,31,32,%r28	/* clear any sign extension */
+#endif
 	extrd,u %r26,56,32,%r26 /* convert phys addr to tlb insert format */
 	depd    %r25,63,22,%r28 /* Form aliased virtual address 'to' */
 	depdi   0,63,12,%r28    /* Clear any offset bits */
Index: arch/parisc/kernel/vmlinux.lds.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/vmlinux.lds.S,v
retrieving revision 1.11
diff -u -r1.11 vmlinux.lds.S
--- a/arch/parisc/kernel/vmlinux.lds.S	23 Apr 2004 13:57:54 -0000	1.11
+++ b/arch/parisc/kernel/vmlinux.lds.S	25 Apr 2004 14:48:16 -0000
@@ -26,6 +26,7 @@
 #include <asm-generic/vmlinux.lds.h>
 /* needed for the processor specific cache alignment size */	
 #include <asm/cache.h>
+#include <asm/page.h>
 	
 /* ld script to make hppa Linux kernel */
 #ifndef CONFIG_PARISC64
@@ -45,7 +46,7 @@
 SECTIONS
 {
 
-  . = 0x10100000;
+  . = KERNEL_BINARY_TEXT_START;
 
   _text = .;			/* Text and read-only data */
   .text ALIGN(16) : {
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/init.c,v
retrieving revision 1.3
diff -u -r1.3 init.c
--- a/arch/parisc/mm/init.c	29 Sep 2003 16:05:00 -0000	1.3
+++ b/arch/parisc/mm/init.c	25 Apr 2004 14:48:17 -0000
@@ -424,7 +424,12 @@
  * a hole of 4kB between each vmalloced area for the same reason.
  */
 
-#define MAP_START 0x4000 /* Leave room for gateway page expansion */
+ /* Leave room for gateway page expansion */
+#if KERNEL_MAP_START < GATEWAY_PAGE_SIZE
+#error KERNEL_MAP_START is in gateway reserved region
+#endif
+#define MAP_START (KERNEL_MAP_START)
+
 #define VM_MAP_OFFSET  (32*1024)
 #define SET_MAP_OFFSET(x) ((void *)(((unsigned long)(x) + VM_MAP_OFFSET) \
 				     & ~(VM_MAP_OFFSET-1)))
Index: include/asm-parisc/fixmap.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/fixmap.h,v
retrieving revision 1.1
diff -u -r1.1 fixmap.h
--- a/include/asm-parisc/fixmap.h	29 Jul 2003 17:02:03 -0000	1.1
+++ b/include/asm-parisc/fixmap.h	25 Apr 2004 14:48:36 -0000
@@ -2,18 +2,22 @@
 #define _ASM_FIXMAP_H
 
 /*
- * Allocate a 8 Mb temporary mapping area for copy_user_page/clear_user_page.
- * This area needs to be aligned on a 8 Mb boundary.
+ * This file defines the locations of the fixed mappings on parisc.
  *
- * FIXME:
+ * All of the values in this file are machine virtual addresses.
  *
- * For PA-RISC, this has no meaning.  It is starting to be used on x86
- * for vsyscalls.  PA will probably do this using space registers.
- */
+ * All of the values in this file must be <4GB (because of assembly
+ * loading restrictions).  If you place this region anywhere above
+ * __PAGE_OFFSET, you must adjust the memory map accordingly */
 
-/* This TMPALIAS_MAP_START reserves some of the memory where the
- * FIXMAP region is on x86.  It's only real use is to constrain
- * VMALLOC_END (see pktable.h) */
-#define TMPALIAS_MAP_START (__PAGE_OFFSET - 0x01000000)
+/* The alias region is used in kernel space to do copy/clear to or
+ * from areas congruently mapped with user space.  It is 8MB large
+ * and must be 16MB aligned */
+#define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 16*1024*1024)
+/* This is the kernel area for all maps (vmalloc, dma etc.)  most
+ * usually, it extends up to TMPALIAS_MAP_START.  Virtual addresses
+ * 0..GATEWAY_PAGE_SIZE are reserved for the gateway page */
+#define KERNEL_MAP_START	(GATEWAY_PAGE_SIZE)
+#define KERNEL_MAP_END		(TMPALIAS_MAP_START)
 
 #endif
Index: include/asm-parisc/page.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/page.h,v
retrieving revision 1.2
diff -u -r1.2 page.h
--- a/include/asm-parisc/page.h	25 Sep 2003 01:07:21 -0000	1.2
+++ b/include/asm-parisc/page.h	25 Apr 2004 14:48:36 -0000
@@ -89,9 +89,22 @@
 

 #define LINUX_GATEWAY_SPACE     0
+
+/* This governs the relationship between virtual and physical addresses.
+ * If you alter it, make sure to take care of our various fixed mapping
+ * segments in fixmap.h */
 #define __PAGE_OFFSET           (0x10000000)
 
 #define PAGE_OFFSET		((unsigned long)__PAGE_OFFSET)
+
+/* The size of the gateway page (we leave lots of room for expansion) */
+#define GATEWAY_PAGE_SIZE	0x4000
+
+/* The start of the actual kernel binary---used in vmlinux.lds.S
+ * Leave some space after __PAGE_OFFSET for detecting kernel null
+ * ptr derefs */
+#define KERNEL_BINARY_TEXT_START	(__PAGE_OFFSET + 0x100000)
+
 /* These macros don't work for 64-bit C code -- don't allow in C at all */
 #ifdef __ASSEMBLY__
 #   define PA(x)	((x)-__PAGE_OFFSET)
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.4
diff -u -r1.4 pgtable.h
--- a/include/asm-parisc/pgtable.h	27 Jan 2004 18:46:14 -0000	1.4
+++ b/include/asm-parisc/pgtable.h	25 Apr 2004 14:48:37 -0000
@@ -110,7 +110,7 @@
 #define PCXL_DMA_MAP_SIZE   (8*1024*1024)
 #define VMALLOC_START   ((unsigned long)vmalloc_start)
 /* this is a fixmap remnant, see fixmap.h */
-#define VMALLOC_END	(TMPALIAS_MAP_START)
+#define VMALLOC_END	(KERNEL_MAP_END)
 #endif
 
 /* NB: The tlb miss handlers make certain assumptions about the order */
