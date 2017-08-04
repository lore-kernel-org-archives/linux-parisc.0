From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: PDT/firmware: Add support to read PDT on older
 PAT-machines
Date: Fri, 4 Aug 2017 19:12:39 +0200
Message-ID: <20170804171239.GA29604@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Older machines with a PAT firmware (e.g. the rp5470) return their Page
Deallocation Table (PDT) info per cell via the PDC_PAT_MEM_PD_INFO PDC call.
This patch adds the necessary structures and wrappers to call firmware.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index e3c0586..a468a17 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -223,6 +223,18 @@ struct pdc_pat_mem_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_PD_INFO (return info) */
 	unsigned long clear_time; /* last PDT clear time (since Jan 1970) */
 };
 
+struct pdc_pat_mem_cell_pdt_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_CELL_INFO */
+	u64 reserved:32;
+	u64 cs:1;		/* clear status: cleared since the last call? */
+	u64 current_pdt_entries:15;
+	u64 ic:1;		/* interleaving had to be changed ? */
+	u64 max_pdt_entries:15;
+	unsigned long good_mem;
+	unsigned long first_dbe_loc; /* first location of double bit error */
+	unsigned long clear_time; /* last PDT clear time (since Jan 1970) */
+};
+
+
 struct pdc_pat_mem_read_pd_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_PD_READ */
 	unsigned long actual_count_bytes;
 	unsigned long pdt_entries;
@@ -325,6 +337,8 @@ extern int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, u32 *va
 extern int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, u32 val); 
 
 extern int pdc_pat_mem_pdt_info(struct pdc_pat_mem_retinfo *rinfo);
+extern int pdc_pat_mem_pdt_cell_info(struct pdc_pat_mem_cell_pdt_retinfo *rinfo,
+		unsigned long cell);
 extern int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 		unsigned long *pdt_entries_ptr, unsigned long max_entries);
 extern int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index f622a31..be9a2e8 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -142,8 +142,8 @@ static void convert_to_wide(unsigned long *addr)
 	int i;
 	unsigned int *p = (unsigned int *)addr;
 
-	if(unlikely(parisc_narrow_firmware)) {
-		for(i = 31; i >= 0; --i)
+	if (unlikely(parisc_narrow_firmware)) {
+		for (i = (NUM_PDC_RESULT-1); i >= 0; --i)
 			addr[i] = p[i];
 	}
 #endif
@@ -979,16 +979,22 @@ int pdc_mem_pdt_read_entries(struct pdc_mem_read_pdt *pret,
 
 	spin_lock_irqsave(&pdc_lock, flags);
 	retval = mem_pdc_call(PDC_MEM, PDC_MEM_READ_PDT, __pa(pdc_result),
-			__pa(pdc_result2));
+			__pa(pdt_entries_ptr));
 	if (retval == PDC_OK) {
 		convert_to_wide(pdc_result);
 		memcpy(pret, pdc_result, sizeof(*pret));
-		convert_to_wide(pdc_result2);
-		memcpy(pdt_entries_ptr, pdc_result2,
-			pret->pdt_entries * sizeof(*pdt_entries_ptr));
 	}
 	spin_unlock_irqrestore(&pdc_lock, flags);
 
+#ifdef CONFIG_64BIT
+	/*
+	 * 64-bit kernels should not call this PDT function in narrow mode.
+	 * The pdt_entries_ptr array above will now contain 32-bit values
+	 */
+	if (WARN_ON_ONCE((retval == PDC_OK) && parisc_narrow_firmware))
+		return PDC_ERROR;
+#endif
+
 	return retval;
 }
 
@@ -1440,6 +1446,29 @@ int pdc_pat_mem_pdt_info(struct pdc_pat_mem_retinfo *rinfo)
 }
 
 /**
+ * pdc_pat_mem_pdt_cell_info - Retrieve information about page deallocation
+ *				table of a cell
+ * @rinfo: memory pdt information
+ * @cell: cell number
+ *
+ */
+int pdc_pat_mem_pdt_cell_info(struct pdc_pat_mem_cell_pdt_retinfo *rinfo,
+		unsigned long cell)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_CELL_INFO,
+			__pa(&pdc_result), cell);
+	if (retval == PDC_OK)
+		memcpy(rinfo, &pdc_result, sizeof(*rinfo));
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
+/**
  * pdc_pat_mem_read_cell_pdt - Read PDT entries from (old) PAT firmware
  * @pret: array of PDT entries
  * @pdt_entries_ptr: ptr to hold number of PDT entries
@@ -1455,14 +1484,14 @@ int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 	spin_lock_irqsave(&pdc_lock, flags);
 	/* PDC_PAT_MEM_CELL_READ is available on early PAT machines only */
 	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_CELL_READ,
-			__pa(&pdc_result), parisc_cell_num, __pa(&pdc_result2));
+			__pa(&pdc_result), parisc_cell_num,
+			__pa(pdt_entries_ptr));
 
 	if (retval == PDC_OK) {
 		/* build up return value as for PDC_PAT_MEM_PD_READ */
 		entries = min(pdc_result[0], max_entries);
 		pret->pdt_entries = entries;
 		pret->actual_count_bytes = entries * sizeof(unsigned long);
-		memcpy(pdt_entries_ptr, &pdc_result2, pret->actual_count_bytes);
 	}
 
 	spin_unlock_irqrestore(&pdc_lock, flags);
@@ -1474,6 +1503,8 @@ int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
  * pdc_pat_mem_read_pd_pdt - Read PDT entries from (newer) PAT firmware
  * @pret: array of PDT entries
  * @pdt_entries_ptr: ptr to hold number of PDT entries
+ * @count: number of bytes to read
+ * @offset: offset to start (in bytes)
  *
  */
 int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
