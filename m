Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70E9C4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 17:12:46 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0H0Cia08640; Fri, 16 Jan 2004 19:12:45 -0500
Subject: Re: [parisc-linux] init and exit text problem
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1074278840.1884.23.camel@mulgrave>
References: <4004805D000027C1@ocpmta3.freegates.net>
	<1074274218.2443.12.camel@mulgrave> <20040116201455.GN533@tausq.org>
	<1074278840.1884.23.camel@mulgrave>
Content-Type: text/plain
Date: 16 Jan 2004 19:12:41 -0500
Message-Id: <1074298363.2443.47.camel@mulgrave>
Mime-Version: 1.0
Cc: Matthew Wilcox <willy@debian.org>, Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

The attached should be a first cut at this.

I shifted around or vmlinux.lds.S with a view to minimising the diffs
between ours and the one in i386 (so we can spot changes more easily).

I also:

- Implemented cacheline_aligned sections (this may save a few bytes, and
it mirrors i386)
- Corrected a misnaming of the init_task section
- updated our bss clearing algorithm
- removed the duplicate ".initcall.init" section from the head.S files
(it was confusing the linker script and we end up with it being called
.initcall.init.1)
- done the correct thing with regard to discard and init/exit sections
(although we still don't do runtime discards).
- added a few other sections that i386 has (but we don't) just in case
they'll be useful one day (also helps reduce the diff between us and
i386)

James

===== arch/parisc/kernel/head.S 1.4 vs edited =====
--- 1.4/arch/parisc/kernel/head.S	Wed Dec 17 23:48:38 2003
+++ edited/arch/parisc/kernel/head.S	Fri Jan 16 16:19:18 2004
@@ -22,17 +22,6 @@
 
 	.level 1.1
 
-	.section	.initcall.init
-	.align		4
-	.export __initcall_start
-__initcall_start:
-	.export __initcall_end
-__initcall_end:
-	.export __setup_start
-__setup_start:
-	.export __setup_end
-__setup_end:
-
 	.data
 
 	.export boot_args
@@ -64,13 +53,13 @@
 
 	/* Clear BSS (shouldn't the boot loader do this?) */
 
-	.import _edata,data
-	.import _end,data
+	.import __bss_start,data
+	.import __bss_stop,data
 
-	ldil            L%PA(_edata),%r3
-	ldo             R%PA(_edata)(%r3),%r3
-	ldil            L%PA(_end),%r4
-	ldo             R%PA(_end)(%r4),%r4
+	ldil            L%PA(__bss_start),%r3
+	ldo             R%PA(__bss_start)(%r3),%r3
+	ldil            L%PA(__bss_stop),%r4
+	ldo             R%PA(__bss_stop)(%r4),%r4
 $bss_loop:
 	cmpb,<<,n       %r3,%r4,$bss_loop
 	stw,ma          %r0,4(%r3)
===== arch/parisc/kernel/head64.S 1.3 vs edited =====
--- 1.3/arch/parisc/kernel/head64.S	Wed Dec 17 23:48:38 2003
+++ edited/arch/parisc/kernel/head64.S	Fri Jan 16 16:17:15 2004
@@ -26,17 +26,6 @@
 
 	.level 2.0w
 
-	.section	.initcall.init
-	.align		4
-	.export __initcall_start
-__initcall_start:
-	.export __initcall_end
-__initcall_end:
-	.export __setup_start
-__setup_start:
-	.export __setup_end
-__setup_end:
-
 	.data
 
 	.export boot_args
@@ -64,13 +53,13 @@
 
 	/* Clear BSS (shouldn't the boot loader do this?) */
 
-	.import _edata,data
-	.import _end,data
+	.import __bss_start,data
+	.import __bss_stop,data
 
-	ldil            L%PA(_edata),%r3
-	ldo             R%PA(_edata)(%r3),%r3
-	ldil            L%PA(_end),%r4
-	ldo             R%PA(_end)(%r4),%r4
+	ldil            L%PA(__bss_start),%r3
+	ldo             R%PA(__bss_start)(%r3),%r3
+	ldil            L%PA(__bss_stop),%r4
+	ldo             R%PA(__bss_stop)(%r4),%r4
 $bss_loop:
 	cmpb,<<,n       %r3,%r4,$bss_loop
 	stb,ma          %r0,1(%r3)
===== arch/parisc/kernel/vmlinux.lds.S 1.15 vs edited =====
--- 1.15/arch/parisc/kernel/vmlinux.lds.S	Mon Sep  8 17:00:21 2003
+++ edited/arch/parisc/kernel/vmlinux.lds.S	Fri Jan 16 16:34:28 2004
@@ -1,5 +1,7 @@
 #include <linux/config.h>
 #include <asm-generic/vmlinux.lds.h>
+/* needed for the processor specific cache alignment size */	
+#include <asm/cache.h>
 	
 /* ld script to make hppa Linux kernel */
 #ifndef CONFIG_PARISC64
@@ -22,7 +24,7 @@
   . = 0x10100000;
 
   _text = .;			/* Text and read-only data */
-  .text BLOCK(16) : {
+  .text ALIGN(16) : {
 	*(.text*)
 	*(.PARISC.unwind)
 	*(.fixup)
@@ -39,11 +41,34 @@
 
   RODATA
 
-  .data BLOCK(8192) : {			/* Data without special */
+  /* writeable */
+  .data : {			/* Data */
 	data_start = .;
 	*(.data)
+	CONSTRUCTORS
 	}
 
+  . = ALIGN(4096);
+  /* nosave data is really only used for software suspend...it's here
+   * just in case we ever implement it */
+  __nosave_begin = .;
+  .data_nosave : { *(.data.nosave) }
+  . = ALIGN(4096);
+  __nosave_end = .;
+
+  . = ALIGN(L1_CACHE_BYTES);
+  .data.cacheline_aligned : { *(.data.cacheline_aligned) }
+
+  _edata = .;			/* End of data section */
+
+  . = ALIGN(16384); 		/* init_task */
+  .data.init_task : { *(.data.init_task) }
+
+  /* The interrupt stack is currently partially coded, but not yet
+   * implemented */
+  . = ALIGN(16384);	
+  init_istack : { *(init_istack) }
+
 #ifdef CONFIG_PARISC64
   . = ALIGN(16);               /* Linkage tables */
   .opd : { *(.opd) } PROVIDE (__gp = .); 
@@ -63,7 +88,7 @@
   __setup_start = .;
   .init.setup : { *(.init.setup) }
   __setup_end = .;
-  __start___param =.; 
+  __start___param = .;
   __param : { *(__param) }
   __stop___param = .;
   __initcall_start = .;
@@ -81,6 +106,19 @@
   .con_initcall.init : { *(.con_initcall.init) }
   __con_initcall_end = .;
   SECURITY_INIT
+  /* alternate instruction replacement.  This is a mechanism x86 uses
+   * to detect the CPU type and replace generic instruction sequences
+   * with CPU specific ones.  We don't currently do this in PA, but
+   * it seems like a good idea... */
+  . = ALIGN(4);
+  __alt_instructions = .;
+  .altinstructions : { *(.altinstructions) } 
+  __alt_instructions_end = .; 
+ .altinstr_replacement : { *(.altinstr_replacement) } 
+  /* .exit.text is discard at runtime, not link time, to deal with references
+     from .altinstructions and .eh_frame */
+  .exit.text : { *(.exit.text) }
+  .exit.data : { *(.exit.data) }
   . = ALIGN(4096);
   __initramfs_start = .;
   .init.ramfs : { *(.init.ramfs) }
@@ -91,17 +129,27 @@
   __per_cpu_end = .;
   . = ALIGN(4096);
   __init_end = .;
-
-  init_task BLOCK(16384) : { *(init_task) }  /* The initial task and kernel stack */
-
-  _edata = .;			/* End of data section */
-
-
-  .bss : { *(.bss) *(COMMON) }		/* BSS */
-
+  /* freed after init ends here */
+	
+  __bss_start = .;		/* BSS */
+  .bss : { *(.bss) *(COMMON) }
+  __bss_stop = .; 
 
   _end = . ;
 
+  /* Sections to be discarded */
+  /DISCARD/ : {
+	*(.exitcall.exit)
+#ifdef CONFIG_PARISC64
+	/* temporary hack until binutils is fixed to not emit these
+	 for static binaries */
+	*(.dynsym)
+	*(.dynstr)
+	*(.dynamic)
+	*(.hash)
+#endif
+	}
+
   /* Stabs debugging sections.  */
   .stab 0 : { *(.stab) }
   .stabstr 0 : { *(.stabstr) }
@@ -112,14 +160,4 @@
   .comment 0 : { *(.comment) }
   .note 0 : { *(.note) }	
 
-#ifdef CONFIG_PARISC64
-  /* temporary hack until binutils is fixed to not emit these
-     for static binaries */
-  /DISCARD/ : {
-    *(.dynsym)
-    *(.dynstr)
-    *(.dynamic)
-    *(.hash)
-  }
-#endif
 }
===== include/asm-parisc/cache.h 1.4 vs edited =====
--- 1.4/include/asm-parisc/cache.h	Sun Jan  5 05:22:53 2003
+++ edited/include/asm-parisc/cache.h	Fri Jan 16 13:13:23 2004
@@ -7,7 +7,6 @@
 
 #include <linux/config.h>
 
-#ifndef __ASSEMBLY__
 /*
  * PA 2.0 processors have 64-byte cachelines; PA 1.1 processors have
  * 32-byte cachelines.  The default configuration is not for SMP anyway,
@@ -24,12 +23,12 @@
 #define L1_CACHE_SHIFT 5
 #endif
 
+#ifndef __ASSEMBLY__
+
 #define L1_CACHE_ALIGN(x)       (((x)+(L1_CACHE_BYTES-1))&~(L1_CACHE_BYTES-1))
 
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
 #define L1_CACHE_SHIFT_MAX 5	/* largest L1 which this arch supports */
-
-#define __cacheline_aligned __attribute__((__aligned__(L1_CACHE_BYTES)))
 
 extern void flush_data_cache_local(void);  /* flushes local data-cache only */
 extern void flush_instruction_cache_local(void); /* flushes local code-cache only */
