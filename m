From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add Page Deallocation Table (PDT) support
Date: Thu, 11 May 2017 22:24:15 +0200
Message-ID: <20170511202415.GA1771@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The firmare in most parisc machines maintains a Page Deallocation Table (PDT)
which holds a list of physical memory addresses where hardware detected memory
errors (single bit and double bit errors).

This patch adds the missing PDC firmware calls and the logic to read the PDT
from firmware, report all current PDT entries and exclude the reported bad
memory from being used by Linux.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 451906d..7569627 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -6,6 +6,8 @@
 #if !defined(__ASSEMBLY__)
 
 extern int pdc_type;
+extern unsigned long parisc_cell_num; /* cell number the CPU runs on (PAT) */
+extern unsigned long parisc_cell_loc; /* cell location of CPU (PAT)	   */
 
 /* Values for pdc_type */
 #define PDC_TYPE_ILLEGAL	-1
@@ -143,6 +145,18 @@ struct pdc_btlb_info {	/* PDC_BLOCK_TLB, return of PDC_BTLB_INFO */
 
 #endif /* !CONFIG_PA20 */
 
+struct pdc_mem_retinfo { /* PDC_MEM/PDC_MEM_MEMINFO (return info) */
+	unsigned long pdt_size;
+	unsigned long pdt_entries;
+	unsigned long pdt_status;
+	unsigned long first_dbe_loc;
+	unsigned long good_mem;
+};
+
+struct pdc_mem_read_pdt { /* PDC_MEM/PDC_MEM_READ_PDT (return info) */
+	unsigned long pdt_entries;
+};
+
 #ifdef CONFIG_64BIT
 struct pdc_memory_table_raddr { /* PDC_MEM/PDC_MEM_TABLE (return info) */
 	unsigned long entries_returned;
@@ -301,6 +315,10 @@ int pdc_get_initiator(struct hardware_path *, struct pdc_initiator *);
 int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
 
+void pdc_pdt_init(void);	/* in pdt.c */
+int pdc_mem_pdt_info(struct pdc_mem_retinfo *rinfo);
+int pdc_mem_pdt_read_entries(struct pdc_mem_read_pdt *rpdt_read,
+		unsigned long *pdt_entries_ptr);
 #ifdef CONFIG_64BIT
 int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr,
 		struct pdc_memory_table *tbl, unsigned long entries);
diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index e1d2890..32e105f 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -147,9 +147,9 @@
 #define PDC_PAT_MEM_CELL_CLEAR  	6L /* Clear PDT For Cell           */
 #define PDC_PAT_MEM_CELL_READ   	7L /* Read PDT entries For Cell    */
 #define PDC_PAT_MEM_CELL_RESET  	8L /* Reset clear bit For Cell     */
-#define PDC_PAT_MEM_SETGM	  	9L /* Set Golden Memory value      */
-#define PDC_PAT_MEM_ADD_PAGE    	10L /* ADDs a page to the cell      */
-#define PDC_PAT_MEM_ADDRESS     	11L /* Get Physical Location From   */
+#define PDC_PAT_MEM_SETGM		9L /* Set Good Memory value        */
+#define PDC_PAT_MEM_ADD_PAGE		10L /* ADDs a page to the cell      */
+#define PDC_PAT_MEM_ADDRESS		11L /* Get Physical Location From   */
                                     		 /* Memory Address               */
 #define PDC_PAT_MEM_GET_TXT_SIZE   	12L /* Get Formatted Text Size   */
 #define PDC_PAT_MEM_GET_PD_TXT     	13L /* Get PD Formatted Text     */
@@ -212,6 +212,23 @@ struct pdc_pat_cpu_num {
 	unsigned long cpu_loc;
 };
 
+struct pdc_pat_mem_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_PD_INFO (return info) */
+	unsigned int ke;	/* bit 0: memory inside good memory? */
+	unsigned int current_pdt_entries:16;
+	unsigned int max_pdt_entries:16;
+	unsigned long Cs_bitmap;
+	unsigned long Ic_bitmap;
+	unsigned long good_mem;
+	unsigned long first_dbe_loc; /* first location of double bit error */
+	unsigned long clear_time; /* last PDT clear time (since Jan 1970) */
+};
+
+struct pdc_pat_mem_read_pd_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_PD_READ */
+	unsigned long actual_count_bytes;
+	unsigned long pdt_entries;
+};
+
+
 struct pdc_pat_pd_addr_map_entry {
 	unsigned char entry_type;       /* 1 = Memory Descriptor Entry Type */
 	unsigned char reserve1[5];
@@ -293,15 +310,15 @@ extern int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, unsigned lon
 
 extern int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, unsigned long count, unsigned long offset);
 
-
 extern int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, u32 *val); 
 extern int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val); 
 
-
-/* Flag to indicate this is a PAT box...don't use this unless you
-** really have to...it might go away some day.
-*/
-extern int pdc_pat;     /* arch/parisc/kernel/inventory.c */
+extern int pdc_pat_mem_pdt_info(struct pdc_pat_mem_retinfo *rinfo);
+extern int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
+		unsigned long *pdt_entries_ptr, unsigned long max_entries);
+extern int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
+		unsigned long *pdt_entries_ptr, unsigned long count,
+		unsigned long offset);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 3a4ed9f..71ca86c 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -511,6 +511,9 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
 
+struct seq_file;
+extern void arch_report_meminfo(struct seq_file *m);
+
 #endif /* !__ASSEMBLY__ */
 
 
diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 0609ff1..1f30b49 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -131,12 +131,12 @@
 #define PDC_TLB_SETUP		1	/* set up miss handling 	*/
 
 #define PDC_MEM		20		/* Manage memory		*/
-#define PDC_MEM_MEMINFO		0
-#define PDC_MEM_ADD_PAGE	1
-#define PDC_MEM_CLEAR_PDT	2
-#define PDC_MEM_READ_PDT	3
-#define PDC_MEM_RESET_CLEAR	4
-#define PDC_MEM_GOODMEM		5
+#define PDC_MEM_MEMINFO		0	/* Return PDT info		*/
+#define PDC_MEM_ADD_PAGE	1	/* Add page to PDT		*/
+#define PDC_MEM_CLEAR_PDT	2	/* Clear PDT			*/
+#define PDC_MEM_READ_PDT	3	/* Read PDT entry		*/
+#define PDC_MEM_RESET_CLEAR	4	/* Reset PDT clear flag		*/
+#define PDC_MEM_GOODMEM		5	/* Set good_mem value		*/
 #define PDC_MEM_TABLE		128	/* Non contig mem map (sprockets) */
 #define PDC_MEM_RETURN_ADDRESS_TABLE	PDC_MEM_TABLE
 #define PDC_MEM_GET_MEMORY_SYSTEM_TABLES_SIZE	131
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 69a1118..c4294df 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -4,7 +4,7 @@
 
 extra-y			:= head.o vmlinux.lds
 
-obj-y	     	:= cache.o pacache.o setup.o traps.o time.o irq.o \
+obj-y	     	:= cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 9d797ae..9819025 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -957,6 +957,41 @@ int pdc_tod_read(struct pdc_tod *tod)
 }
 EXPORT_SYMBOL(pdc_tod_read);
 
+int pdc_mem_pdt_info(struct pdc_mem_retinfo *rinfo)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_MEM, PDC_MEM_MEMINFO, __pa(pdc_result), 0);
+	convert_to_wide(pdc_result);
+	memcpy(rinfo, pdc_result, sizeof(*rinfo));
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
+int pdc_mem_pdt_read_entries(struct pdc_mem_read_pdt *pret,
+		unsigned long *pdt_entries_ptr)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_MEM, PDC_MEM_READ_PDT, __pa(pdc_result),
+			__pa(pdc_result2));
+	if (retval == PDC_OK) {
+		convert_to_wide(pdc_result);
+		memcpy(pret, pdc_result, sizeof(*pret));
+		convert_to_wide(pdc_result2);
+		memcpy(pdt_entries_ptr, pdc_result2,
+			pret->pdt_entries * sizeof(*pdt_entries_ptr));
+	}
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
 /**
  * pdc_tod_set - Set the Time-Of-Day clock.
  * @sec: The number of seconds since epoch.
@@ -1383,6 +1418,79 @@ int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val)
 
 	return retval;
 }
+
+/**
+ * pdc_pat_mem_pdc_info - Retrieve information about page deallocation table
+ * @rinfo: memory pdt information
+ *
+ */
+int pdc_pat_mem_pdt_info(struct pdc_pat_mem_retinfo *rinfo)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_PD_INFO,
+			__pa(&pdc_result));
+	if (retval == PDC_OK)
+		memcpy(rinfo, &pdc_result, sizeof(*rinfo));
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
+/**
+ * pdc_pat_mem_read_cell_pdt - Read PDT entries from (old) PAT firmware
+ * @pret: array of PDT entries
+ * @pdt_entries_ptr: ptr to hold number of PDT entries
+ * @max_entries: maximum number of entries to be read
+ *
+ */
+int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
+		unsigned long *pdt_entries_ptr, unsigned long max_entries)
+{
+	int retval;
+	unsigned long flags, entries;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	/* PDC_PAT_MEM_CELL_READ is available on early PAT machines only */
+	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_CELL_READ,
+			__pa(&pdc_result), parisc_cell_num, __pa(&pdc_result2));
+
+	if (retval == PDC_OK) {
+		/* build up return value as for PDC_PAT_MEM_PD_READ */
+		entries = min(pdc_result[0], max_entries);
+		pret->pdt_entries = entries;
+		pret->actual_count_bytes = entries * sizeof(unsigned long);
+		memcpy(pdt_entries_ptr, &pdc_result2, pret->actual_count_bytes);
+	}
+
+	spin_unlock_irqrestore(&pdc_lock, flags);
+	WARN_ON(retval == PDC_OK && pdc_result[0] > max_entries);
+
+	return retval;
+}
+/**
+ * pdc_pat_mem_read_pd_pdt - Read PDT entries from (newer) PAT firmware
+ * @pret: array of PDT entries
+ * @pdt_entries_ptr: ptr to hold number of PDT entries
+ *
+ */
+int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
+		unsigned long *pdt_entries_ptr, unsigned long count,
+		unsigned long offset)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_PD_READ,
+		__pa(&pret), __pa(pdt_entries_ptr),
+		count, offset);
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
 #endif /* CONFIG_64BIT */
 
 
diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index c9789d9..b0fe19a 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -40,6 +40,11 @@
 
 int pdc_type __read_mostly = PDC_TYPE_ILLEGAL;
 
+/* cell number and location (PAT firmware only) */
+unsigned long parisc_cell_num __read_mostly;
+unsigned long parisc_cell_loc __read_mostly;
+
+
 void __init setup_pdc(void)
 {
 	long status;
@@ -78,6 +83,10 @@ void __init setup_pdc(void)
 	if (status == PDC_OK) {
 		pdc_type = PDC_TYPE_PAT;
 		pr_cont("64 bit PAT.\n");
+		parisc_cell_num = cell_info.cell_num;
+		parisc_cell_loc = cell_info.cell_loc;
+		pr_info("PAT: Running on cell %lu and location %lu.\n",
+			parisc_cell_num, parisc_cell_loc);
 		return;
 	}
 #endif
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
new file mode 100644
index 0000000..fcc895a
--- /dev/null
+++ b/arch/parisc/kernel/pdt.c
@@ -0,0 +1,141 @@
+/*
+ *    Page Deallocation Table (PDT) support
+ *
+ *    The Page Deallocation Table (PDT) holds a table with pointers to bad
+ *    memory (broken RAM modules) which is maintained by firmware.
+ *
+ *    Copyright 2017 by Helge Deller <deller@gmx.de>
+ *
+ *    TODO:
+ *    - check regularily for new bad memory
+ *    - add userspace interface with procfs or sysfs
+ *    - increase number of PDT entries dynamically
+ */
+
+#include <linux/memblock.h>
+#include <linux/seq_file.h>
+
+#include <asm/pdc.h>
+#include <asm/pdcpat.h>
+#include <asm/sections.h>
+#include <asm/pgtable.h>
+
+enum pdt_access_type {
+	PDT_NONE,
+	PDT_PDC,
+	PDT_PAT_NEW,
+	PDT_PAT_OLD
+};
+
+static enum pdt_access_type pdt_type;
+
+/* global PDT status information */
+static struct pdc_mem_retinfo pdt_status;
+
+#define MAX_PDT_TABLE_SIZE	PAGE_SIZE
+#define MAX_PDT_ENTRIES		(MAX_PDT_TABLE_SIZE / sizeof(unsigned long))
+static unsigned long pdt_entry[MAX_PDT_ENTRIES] __page_aligned_bss;
+
+
+/* report PDT entries via /proc/meminfo */
+void arch_report_meminfo(struct seq_file *m)
+{
+	if (pdt_type == PDT_NONE)
+		return;
+
+	seq_printf(m, "PDT max entries: %7lu\n",
+			pdt_status.pdt_size);
+	seq_printf(m, "PDT entries    : %7lu\n",
+			pdt_status.pdt_entries);
+}
+
+/*
+ * pdc_pdt_init()
+ *
+ * Initialize kernel PDT structures, read initial PDT table from firmware,
+ * report all current PDT entries and mark bad memory with memblock_reserve()
+ * to avoid that the kernel will use broken memory areas.
+ *
+ */
+void __init pdc_pdt_init(void)
+{
+	int ret, i;
+	unsigned long entries;
+	struct pdc_mem_read_pdt pdt_read_ret;
+
+	if (is_pdc_pat()) {
+		struct pdc_pat_mem_retinfo pat_rinfo;
+
+		pdt_type = PDT_PAT_NEW;
+		ret = pdc_pat_mem_pdt_info(&pat_rinfo);
+		pdt_status.pdt_size = pat_rinfo.max_pdt_entries;
+		pdt_status.pdt_entries = pat_rinfo.current_pdt_entries;
+		pdt_status.pdt_status = 0;
+		pdt_status.first_dbe_loc = pat_rinfo.first_dbe_loc;
+		pdt_status.good_mem = pat_rinfo.good_mem;
+	} else {
+		pdt_type = PDT_PDC;
+		ret = pdc_mem_pdt_info(&pdt_status);
+	}
+
+	if (ret != PDC_OK) {
+		pdt_type = PDT_NONE;
+		pr_info("PDT: Firmware does not provide any page deallocation"
+			" information.\n");
+		return;
+	}
+
+	entries = pdt_status.pdt_entries;
+	WARN_ON(entries > MAX_PDT_ENTRIES);
+
+	pr_info("PDT: size = %lu, entries = %lu, status = %lu, dbe_loc = 0x%lx,"
+		" good_mem = %lu\n",
+			pdt_status.pdt_size, pdt_status.pdt_entries,
+			pdt_status.pdt_status, pdt_status.first_dbe_loc,
+			pdt_status.good_mem);
+
+	if (entries == 0) {
+		pr_info("PDT: Firmware reports no faulty memory.\n");
+		return;
+	}
+
+	if (pdt_status.first_dbe_loc &&
+		pdt_status.first_dbe_loc <= __pa((unsigned long)&_end))
+		pr_crit("CRITICAL: Bad memory inside kernel memory area!\n");
+
+	pr_warn("PDT: Firmware reports %lu entries of faulty memory:\n",
+		entries);
+
+	if (pdt_type == PDT_PDC)
+		ret = pdc_mem_pdt_read_entries(&pdt_read_ret, pdt_entry);
+	else {
+#ifdef CONFIG_64BIT
+		struct pdc_pat_mem_read_pd_retinfo pat_pret;
+
+		ret = pdc_pat_mem_read_cell_pdt(&pat_pret, pdt_entry,
+			MAX_PDT_ENTRIES);
+		if (ret != PDC_OK) {
+			pdt_type = PDT_PAT_OLD;
+			ret = pdc_pat_mem_read_pd_pdt(&pat_pret, pdt_entry,
+				MAX_PDT_TABLE_SIZE, 0);
+		}
+#else
+		ret = PDC_BAD_PROC;
+#endif
+	}
+
+	if (ret != PDC_OK) {
+		pdt_type = PDT_NONE;
+		pr_debug("PDT type %d, retval = %d\n", pdt_type, ret);
+		return;
+	}
+
+	for (i = 0; i < pdt_status.pdt_entries; i++) {
+		pr_warn("PDT: BAD PAGE at 0x%08lx (error_tye = %lu)\n",
+			pdt_entry[i] & PAGE_MASK,
+			pdt_entry[i] & 1);
+
+		/* mark memory page bad */
+		memblock_reserve(pdt_entry[i] & PAGE_MASK, PAGE_SIZE);
+	}
+}
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 66f3a63..1ca9a2b 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -381,6 +381,9 @@ static void __init setup_bootmem(void)
 		request_resource(res, &data_resource);
 	}
 	request_resource(&sysram_resources[0], &pdcdata_resource);
+
+	/* Initialize Page Deallocation Table (PDT) and check for bad memory. */
+	pdc_pdt_init();
 }
 
 static int __init parisc_text_address(unsigned long vaddr)
