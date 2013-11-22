From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: vmlinux.lds.S: use BSS_SECTION() and
 RO_DATA_SECTION()
Date: Fri, 22 Nov 2013 17:30:31 +0100
Message-ID: <20131122163031.GB10699@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

- use predefined BSS_SECTION() and RO_DATA_SECTION() macros
- join data sections: INIT_DATA_SECTION() and .exit.data
- whitespace cleanups

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 4bb095a..f16fa7d 100644
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
@@ -74,7 +89,7 @@ SECTIONS
 	/* Start of data section */
 	_sdata = .;
 
-	RODATA
+	RO_DATA_SECTION(PAGE_SIZE)
 
 	/* writeable */
 	/* Make sure this is page aligned so
@@ -107,29 +122,19 @@ SECTIONS
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
@@ -139,13 +144,12 @@ SECTIONS
 	. = ALIGN(16384);
 	__init_begin = .;
 	INIT_TEXT_SECTION(16384)
-	. = ALIGN(PAGE_SIZE);
-	INIT_DATA_SECTION(16)
 	/* we have to discard exit text and such at runtime, not link time */
 	.exit.text :
 	{
 		EXIT_TEXT
 	}
+	INIT_DATA_SECTION(16)
 	.exit.data :
 	{
 		EXIT_DATA
