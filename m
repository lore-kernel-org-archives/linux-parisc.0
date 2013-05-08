From: Helge Deller <deller@gmx.de>
Subject: [RFC] [PATCH] parisc: use Page Deallocation Table from firmware to
 exclude broken memory (v1)
Date: Wed, 8 May 2013 22:22:06 +0200
Message-ID: <20130508202206.GA10645@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is an initial patch which uses the Page Deallocation Table (PDT) from
firmware to exclude known-to-be-broken memory regions.

Currently only reporting is implemented.

TODOs:
- really exclude broken memory regions from being used by Linux
- check if PDT works as expected on a 32bit kernel as well.
- check if currently implemented reporting is correct.

Feedback/Testers (with broken hardware :-)) wanted!

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 7eb616e..8b8ad6f 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -143,6 +143,18 @@ struct pdc_btlb_info {	/* PDC_BLOCK_TLB, return of PDC_BTLB_INFO */
 
 #endif /* !CONFIG_PA20 */
 
+struct pdc_memory_retinfo { /* PDC_MEM/PDC_MEM_MEMINFO (return info) */
+	unsigned long pdt_size;
+	unsigned long page_entries;
+	unsigned long pdt_status;
+	unsigned long dbe_loc;
+	unsigned long good_mem;
+};
+
+struct pdc_memory_read_pdt { /* PDC_MEM/PDC_MEM_READ_PDT (return info) */
+	unsigned long page_entries;
+};
+
 #ifdef CONFIG_64BIT
 struct pdc_memory_table_raddr { /* PDC_MEM/PDC_MEM_TABLE (return info) */
 	unsigned long entries_returned;
@@ -301,6 +313,9 @@ int pdc_get_initiator(struct hardware_path *, struct pdc_initiator *);
 int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
 
+int pdc_mem_pdt_info(struct pdc_memory_retinfo *rinfo);
+int pdc_mem_pdt_read_entries(struct pdc_memory_read_pdt *rpdt_read,
+		unsigned long *pdt_entries_ptr);
 #ifdef CONFIG_64BIT
 int pdc_mem_mem_table(struct pdc_memory_table_raddr *r_addr,
 		struct pdc_memory_table *tbl, unsigned long entries);
diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 702498f..b067b86 100644
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
+#define PDC_MEM_MEMINFO		0	/* Return Page Deallocation Table (PDT) info */
+#define PDC_MEM_ADD_PAGE	1	/* Add page to PDT		*/
+#define PDC_MEM_CLEAR_PDT	2	/* Clear PDT			*/
+#define PDC_MEM_READ_PDT	3	/* Read PDT entry		*/
+#define PDC_MEM_RESET_CLEAR	4	/* Reset PDT clear flag		*/
+#define PDC_MEM_GOODMEM		5	/* Set good_mem value		*/
 #define PDC_MEM_TABLE		128	/* Non contig mem map (sprockets) */
 #define PDC_MEM_RETURN_ADDRESS_TABLE	PDC_MEM_TABLE
 #define PDC_MEM_GET_MEMORY_SYSTEM_TABLES_SIZE	131
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index f65fa48..87ad71c 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -955,6 +955,41 @@ int pdc_tod_read(struct pdc_tod *tod)
 }
 EXPORT_SYMBOL(pdc_tod_read);
 
+int __init pdc_mem_pdt_info(struct pdc_memory_retinfo *rinfo)
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
+int __init pdc_mem_pdt_read_entries(struct pdc_memory_read_pdt *rpdt_read,
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
+		memcpy(rpdt_read, pdc_result, sizeof(*rpdt_read));
+		convert_to_wide(pdc_result2);
+		memcpy(pdt_entries_ptr, pdc_result2,
+			rpdt_read->page_entries * sizeof(*pdt_entries_ptr));
+	}
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
 /**
  * pdc_tod_set - Set the Time-Of-Day clock.
  * @sec: The number of seconds since epoch.
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index ce939ac..32b9bbc 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -111,6 +111,49 @@ static void __init mem_limit_func(void)
 		mem_limit = limit;
 }
 
+/*
+ * Check Page Deallocation Table (PDT). The PDT is maintained in firmware and
+ * provides a list of bad memory areas.
+ */
+static int __init reserve_pdt_pages(void)
+{
+	int ret, i;
+	struct pdc_memory_retinfo rinfo;
+	struct pdc_memory_read_pdt pdt_read_ret;
+	unsigned long pdt_entry[80];
+
+	ret = pdc_mem_pdt_info(&rinfo);
+	if (ret != PDC_OK) {
+		pr_warn("Firmware (PDT) provides invalid information (%d).\n",
+			ret);
+		return 0;
+	}
+
+	/* printk("PDT: ret = %d, pdt_size = %lu, page_entries = %lu,
+			pdt_status = %lu, dbe_loc = %lu, good_mem = %lu\n",
+			ret, rinfo.pdt_size, rinfo.page_entries,
+			rinfo.pdt_status, rinfo.dbe_loc, rinfo.good_mem); */
+
+	if (rinfo.page_entries == 0) {
+		pr_info("Firmware (PDT) reports fully functional memory.\n");
+		return 0;
+	}
+
+	pr_warn("WARNING: Firmware (PDT) reports %lu pages of broken memory:\n",
+		rinfo.page_entries);
+	BUG_ON(rinfo.page_entries > ARRAY_SIZE(pdt_entry));
+
+	ret = pdc_mem_pdt_read_entries(&pdt_read_ret, pdt_entry);
+	BUG_ON(ret != PDC_OK);
+
+	for (i = 0; i < pdt_read_ret.page_entries; i++)
+		pr_warn("BAD PAGE at 0x%lx (error_tye = %lu)\n",
+			pdt_entry[i] & (1UL << (BITS_PER_LONG-4)),
+			pdt_entry[i] >> (BITS_PER_LONG-1));
+
+	return 0;
+}
+
 #define MAX_GAP (0x40000000UL >> PAGE_SHIFT)
 
 static void __init setup_bootmem(void)
@@ -202,6 +245,9 @@ static void __init setup_bootmem(void)
 		request_resource(&iomem_resource, res);
 	}
 
+	/* Check Page Deallocation Table (PDT) for bad memory. */
+	reserve_pdt_pages();
+
 	/*
 	 * For 32 bit kernels we limit the amount of memory we can
 	 * support, in order to preserve enough kernel address space
