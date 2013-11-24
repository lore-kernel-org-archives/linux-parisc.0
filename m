From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: vmlinux.lds.S: fix linkage of the 64bit SMP
 debian kernel
Date: Sun, 24 Nov 2013 23:46:59 +0100
Message-ID: <20131124224659.GA7628@p100.box>
References: <20131122162952.GA10699@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131122162952.GA10699@ls3530.dhcp.wdf.sap.corp>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here is an updated (complete) patch.


* Helge Deller <deller@gmx.de>:
> When building the 64bit SMP kernel for debian it may happen that it becomes too
> big so that functions in the .init.text or .exit.text may not be able to reach
> important kernel functions in the .text section. Main reason why this happens
> with a 64bit kernel build is that we include the linkage tables (.opd, .plt,
> .dlt) in that data section.  Those linkage tables tend to become huge, and
> since they are located between the .text and the .init sections the distance
> gets too far.
> 
> If the linker fails to link vmlinux, it will either crash without any error
> message, or it will - with newer linker versions - report the following error:
> 
> hppa64-linux-gnu-ld: drivers/built-in.o(.exit.text+0xc4): cannot reach _raw_read_lock
> drivers/built-in.o: In function `pdc_stable_exit':
> drivers/parisc/pdc_stable.o:(.exit.text+0xc4): relocation truncated to fit: R_PARISC_PCREL22F against symbol `_raw_read_lock' defined in .spinlock.text section in kernel/built-in.o
> 
> We have three options to solve this issue:
> a) Turn on CONFIG_MLONGCALLS, which will instruct the compiler to use the
>    -mlongcall option. But this option will hurt performance.
> b) Tell the linker (via vmlinux.lds.S) to move the .init.text and .exit.text
>    sections into the normal .text section. Downside here is, that those sections
>    will not be discarded at runtime.
> c) Move the linkage tables somewhere else. Even if this would be possible I did
>    not find a nice solution without any other bad side effects.
> 
> Since we are compiling a 64bit kernel which usually runs on machines with lots
> of memory, I preferred option b) since performance is usually more imortant than
> some lost memory area.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 4bb095a..4d7a1f0 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -23,13 +23,23 @@
  *    along with this program; if not, write to the Free Software
  *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
+
+/*
+ * Put page table entries (swapper_pg_dir) as the first thing in .bss. This
+ * will ensure that it has .bss alignment (PAGE_SIZE).
+ */
+#define BSS_FIRST_SECTIONS	*(.data..vm0.pmd) \
+				*(.data..vm0.pgd) \
+				*(.data..vm0.pte)
+
 #include <asm-generic/vmlinux.lds.h>
+
 /* needed for the processor specific cache alignment size */	
 #include <asm/cache.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
-	
+
 /* ld script to make hppa Linux kernel */
 #ifndef CONFIG_64BIT
 OUTPUT_FORMAT("elf32-hppa-linux")
@@ -53,6 +63,7 @@ SECTIONS
 	.head ALIGN(16) : {
 		HEAD_TEXT
 	} = 0
+
 	.text ALIGN(16) : {
 		TEXT_TEXT
 		SCHED_TEXT
@@ -64,17 +75,23 @@ SECTIONS
 		*(.text.do_sigaltstack)
 		*(.text.do_fork)
 		*(.text.*)
+#if defined(CONFIG_64BIT) && !defined(CONFIG_MLONGCALLS)
+		EXIT_TEXT
+#endif
 		*(.fixup)
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
 	}
+#if defined(CONFIG_64BIT) && !defined(CONFIG_MLONGCALLS)
+	INIT_TEXT_SECTION(16)
+#endif
 	/* End of text section */
 	_etext = .;
 
 	/* Start of data section */
 	_sdata = .;
 
-	RODATA
+	RO_DATA_SECTION(PAGE_SIZE)
 
 	/* writeable */
 	/* Make sure this is page aligned so
@@ -107,45 +124,36 @@ SECTIONS
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
+	BSS_SECTION(16, PAGE_SIZE, 16)
+
 
 #ifdef CONFIG_64BIT
+	/* Linkage tables are huge. */
 	. = ALIGN(16);
 	/* Linkage tables */
 	.opd : {
 		*(.opd)
-	} PROVIDE (__gp = .); 
+	} PROVIDE (__gp = .);
 	.plt : {
 		*(.plt)
-	} 
+	}
 	.dlt : {
 		*(.dlt)
 	}
 #endif
 
-	/* reserve space for interrupt stack by aligning __init* to 16k */
-	. = ALIGN(16384);
-	__init_begin = .;
-	INIT_TEXT_SECTION(16384)
 	. = ALIGN(PAGE_SIZE);
-	INIT_DATA_SECTION(16)
+	__init_begin = .;
+
+#if !defined(CONFIG_64BIT) || defined(CONFIG_MLONGCALLS)
+	INIT_TEXT_SECTION(16)
 	/* we have to discard exit text and such at runtime, not link time */
 	.exit.text :
 	{
 		EXIT_TEXT
 	}
+#endif
+	INIT_DATA_SECTION(16)
 	.exit.data :
 	{
 		EXIT_DATA
