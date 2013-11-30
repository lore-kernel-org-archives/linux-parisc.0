From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix kernel memory layout in vmlinux.ld.S
Date: Sat, 30 Nov 2013 22:07:51 +0100
Message-ID: <20131130210751.GA29456@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When building a 64bit kernel sometimes functions in the .init section were not
able to reach the standard kernel function. Main reason for this problem is,
that the linkage tables (.plt, .opd, .dlt) tend to become pretty huge and thus
the distance gets too big for short calls.

One option to avoid this is to use the -mlong-calls compiler option, but this
increases the binary size and introduces a performance penalty.

Instead, with this patch we just lay out the binary differently.  Init code is
stored first, followed by text, R/O and finally R/W data. This means, that init
and text code is now much closer to each other, which is sufficient to reach
each other by short calls.
 
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index d2d5825..d4dc588 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -41,9 +41,7 @@ END(boot_args)
         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
 	.import	$global$		/* forward declaration */
 #endif /*!CONFIG_64BIT*/
-	.export _stext,data		/* Kernel want it this way! */
-_stext:
-ENTRY(stext)
+ENTRY(parisc_kernel_start)
 	.proc
 	.callinfo
 
@@ -347,7 +345,7 @@ smp_slave_stext:
 	.procend
 #endif /* CONFIG_SMP */
 
-ENDPROC(stext)
+ENDPROC(parisc_kernel_start)
 
 #ifndef CONFIG_64BIT
 	.section .data..read_mostly
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 4bb095a..0dacc5c 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -6,24 +6,19 @@
  *    Copyright (C) 2000 Michael Ang <mang with subcarrier.org>
  *    Copyright (C) 2002 Randolph Chung <tausq with parisc-linux.org>
  *    Copyright (C) 2003 James Bottomley <jejb with parisc-linux.org>
- *    Copyright (C) 2006 Helge Deller <deller@gmx.de>
- *
- *
- *    This program is free software; you can redistribute it and/or modify
- *    it under the terms of the GNU General Public License as published by
- *    the Free Software Foundation; either version 2 of the License, or
- *    (at your option) any later version.
- *
- *    This program is distributed in the hope that it will be useful,
- *    but WITHOUT ANY WARRANTY; without even the implied warranty of
- *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *    GNU General Public License for more details.
- *
- *    You should have received a copy of the GNU General Public License
- *    along with this program; if not, write to the Free Software
- *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *    Copyright (C) 2006-2013 Helge Deller <deller@gmx.de>
+ */
+
+/*
+ * Put page table entries (swapper_pg_dir) as the first thing in .bss. This
+ * will ensure that it has .bss alignment (PAGE_SIZE).
  */
+#define BSS_FIRST_SECTIONS	*(.data..vm0.pmd) \
+				*(.data..vm0.pgd) \
+				*(.data..vm0.pte)
+
 #include <asm-generic/vmlinux.lds.h>
+
 /* needed for the processor specific cache alignment size */	
 #include <asm/cache.h>
 #include <asm/page.h>
@@ -39,7 +34,7 @@ OUTPUT_FORMAT("elf64-hppa-linux")
 OUTPUT_ARCH(hppa:hppa2.0w)
 #endif
 
-ENTRY(_stext)
+ENTRY(parisc_kernel_start)
 #ifndef CONFIG_64BIT
 jiffies = jiffies_64 + 4;
 #else
@@ -49,11 +44,29 @@ SECTIONS
 {
 	. = KERNEL_BINARY_TEXT_START;
 
+	__init_begin = .;
+	HEAD_TEXT_SECTION
+	INIT_TEXT_SECTION(8)
+
+	. = ALIGN(PAGE_SIZE);
+	INIT_DATA_SECTION(PAGE_SIZE)
+	/* we have to discard exit text and such at runtime, not link time */
+	.exit.text :
+	{
+		EXIT_TEXT
+	}
+	.exit.data :
+	{
+		EXIT_DATA
+	}
+	PERCPU_SECTION(8)
+	. = ALIGN(PAGE_SIZE);
+	__init_end = .;
+	/* freed after init ends here */
+
 	_text = .;		/* Text and read-only data */
-	.head ALIGN(16) : {
-		HEAD_TEXT
-	} = 0
-	.text ALIGN(16) : {
+	_stext = .;
+	.text ALIGN(PAGE_SIZE) : {
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
@@ -68,21 +81,28 @@ SECTIONS
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
 	}
-	/* End of text section */
+	. = ALIGN(PAGE_SIZE);
 	_etext = .;
+	/* End of text section */
 
 	/* Start of data section */
 	_sdata = .;
 
-	RODATA
+	RO_DATA_SECTION(8)
 
-	/* writeable */
-	/* Make sure this is page aligned so
-	 * that we can properly leave these
-	 * as writable
-	 */
-	. = ALIGN(PAGE_SIZE);
-	data_start = .;
+#ifdef CONFIG_64BIT
+	. = ALIGN(16);
+	/* Linkage tables */
+	.opd : {
+		*(.opd)
+	} PROVIDE (__gp = .);
+	.plt : {
+		*(.plt)
+	}
+	.dlt : {
+		*(.dlt)
+	}
+#endif
 
 	/* unwind info */
 	.PARISC.unwind : {
@@ -91,7 +111,15 @@ SECTIONS
 		__stop___unwind = .;
 	}
 
-	EXCEPTION_TABLE(16)
+	/* writeable */
+	/* Make sure this is page aligned so
+	 * that we can properly leave these
+	 * as writable
+	 */
+	. = ALIGN(PAGE_SIZE);
+	data_start = .;
+
+	EXCEPTION_TABLE(8)
 	NOTES
 
 	/* Data */
@@ -107,54 +135,8 @@ SECTIONS
 	_edata = .;
 
 	/* BSS */
-	__bss_start = .;
-	/* page table entries need to be PAGE_SIZE aligned */
-	. = ALIGN(PAGE_SIZE);
-	.data..vmpages : {
-		*(.data..vm0.pmd)
-		*(.data..vm0.pgd)
-		*(.data..vm0.pte)
-	}
-	.bss : {
-		*(.bss)
-		*(COMMON)
-	}
-	__bss_stop = .;
-
-#ifdef CONFIG_64BIT
-	. = ALIGN(16);
-	/* Linkage tables */
-	.opd : {
-		*(.opd)
-	} PROVIDE (__gp = .); 
-	.plt : {
-		*(.plt)
-	} 
-	.dlt : {
-		*(.dlt)
-	}
-#endif
+	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 8)
 
-	/* reserve space for interrupt stack by aligning __init* to 16k */
-	. = ALIGN(16384);
-	__init_begin = .;
-	INIT_TEXT_SECTION(16384)
-	. = ALIGN(PAGE_SIZE);
-	INIT_DATA_SECTION(16)
-	/* we have to discard exit text and such at runtime, not link time */
-	.exit.text :
-	{
-		EXIT_TEXT
-	}
-	.exit.data :
-	{
-		EXIT_DATA
-	}
-
-	PERCPU_SECTION(L1_CACHE_BYTES)
-	. = ALIGN(PAGE_SIZE);
-	__init_end = .;
-	/* freed after init ends here */
 	_end = . ;
 
 	STABS_DEBUG
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index b0f96c0..96f8168 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -32,6 +32,7 @@
 #include <asm/sections.h>
 
 extern int  data_start;
+extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */
 
 #if PT_NLEVELS == 3
 /* NOTE: This layout exactly conforms to the hybrid L2/L3 page table layout
@@ -324,8 +325,9 @@ static void __init setup_bootmem(void)
 	reserve_bootmem_node(NODE_DATA(0), 0UL,
 			(unsigned long)(PAGE0->mem_free +
 				PDC_CONSOLE_IO_IODC_SIZE), BOOTMEM_DEFAULT);
-	reserve_bootmem_node(NODE_DATA(0), __pa((unsigned long)_text),
-			(unsigned long)(_end - _text), BOOTMEM_DEFAULT);
+	reserve_bootmem_node(NODE_DATA(0), __pa(KERNEL_BINARY_TEXT_START),
+			(unsigned long)(_end - KERNEL_BINARY_TEXT_START),
+			BOOTMEM_DEFAULT);
 	reserve_bootmem_node(NODE_DATA(0), (bootmap_start_pfn << PAGE_SHIFT),
 			((bootmap_pfn - bootmap_start_pfn) << PAGE_SHIFT),
 			BOOTMEM_DEFAULT);
@@ -378,6 +380,17 @@ static void __init setup_bootmem(void)
 	request_resource(&sysram_resources[0], &pdcdata_resource);
 }
 
+static int __init parisc_text_address(unsigned long vaddr)
+{
+	static unsigned long head_ptr __initdata;
+
+	if (!head_ptr)
+		head_ptr = PAGE_MASK & (unsigned long)
+			dereference_function_descriptor(&parisc_kernel_start);
+
+	return core_kernel_text(vaddr) || vaddr == head_ptr;
+}
+
 static void __init map_pages(unsigned long start_vaddr,
 			     unsigned long start_paddr, unsigned long size,
 			     pgprot_t pgprot, int force)
@@ -466,7 +479,7 @@ static void __init map_pages(unsigned long start_vaddr,
 				 */
 				if (force)
 					pte =  __mk_pte(address, pgprot);
-				else if (core_kernel_text(vaddr) &&
+				else if (parisc_text_address(vaddr) &&
 					 address != fv_addr)
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
 				else
