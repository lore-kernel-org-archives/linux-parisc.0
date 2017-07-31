From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Implement PDT for PAT machines which return cell info
Date: Mon, 31 Jul 2017 15:27:18 +0200
Message-ID: <20170731132718.GA15086@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Machines like rp5470 return their Page Deallocation Table (PDT) info per
cell via the PDC_PAT_MEM_PD_INFO PDC call.

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
index f622a31..a28e42b 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1440,6 +1440,29 @@ int pdc_pat_mem_pdt_info(struct pdc_pat_mem_retinfo *rinfo)
 }
 
 /**
+ * pdc_pat_mem_pdt_cell_info - Retrieve information about page deallocation
+ * 		table of a cell
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
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index d02874e..95e7497 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -59,7 +59,7 @@ void arch_report_meminfo(struct seq_file *m)
  */
 void __init pdc_pdt_init(void)
 {
-	int ret, i;
+	int ret = PDC_BAD_PROC, i;
 	unsigned long entries;
 	struct pdc_mem_read_pdt pdt_read_ret;
 
@@ -67,14 +67,31 @@ void __init pdc_pdt_init(void)
 		struct pdc_pat_mem_retinfo pat_rinfo;
 
 		pdt_type = PDT_PAT_NEW;
+		/* newer machines like C8000 report info for all cells */
 		ret = pdc_pat_mem_pdt_info(&pat_rinfo);
 		pdt_status.pdt_size = pat_rinfo.max_pdt_entries;
 		pdt_status.pdt_entries = pat_rinfo.current_pdt_entries;
 		pdt_status.pdt_status = 0;
 		pdt_status.first_dbe_loc = pat_rinfo.first_dbe_loc;
 		pdt_status.good_mem = pat_rinfo.good_mem;
-	} else {
+	}
+
+	if (is_pdc_pat() && ret != PDC_OK) {
+		struct pdc_pat_mem_cell_pdt_retinfo cell_rinfo;
+
+		pdt_type = PDT_PAT_OLD;
+		/* older machines like rp5470 report cell info only */
+		ret = pdc_pat_mem_pdt_cell_info(&cell_rinfo, parisc_cell_num);
+		pdt_status.pdt_size = cell_rinfo.max_pdt_entries;
+		pdt_status.pdt_entries = cell_rinfo.current_pdt_entries;
+		pdt_status.pdt_status = 0;
+		pdt_status.first_dbe_loc = cell_rinfo.first_dbe_loc;
+		pdt_status.good_mem = cell_rinfo.good_mem;
+	}
+
+	if (ret != PDC_OK) {
 		pdt_type = PDT_PDC;
+		/* non-PAT machines provide the standard PDC call */
 		ret = pdc_mem_pdt_info(&pdt_status);
 	}
 
