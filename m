From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add function to return DIMM slot of physical address
Date: Tue, 25 Jul 2017 19:26:23 +0200
Message-ID: <20170725172623.GA11117@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add a firmware wrapper function, which asks PDC firmware for the DIMM slot of a
physical address. This is needed to show users which DIMM module needs
replacement in case a broken DIMM was encountered.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index 32e105f..e3c0586 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -150,7 +150,7 @@
 #define PDC_PAT_MEM_SETGM		9L /* Set Good Memory value        */
 #define PDC_PAT_MEM_ADD_PAGE		10L /* ADDs a page to the cell      */
 #define PDC_PAT_MEM_ADDRESS		11L /* Get Physical Location From   */
-                                    		 /* Memory Address               */
+					    /* Memory Address               */
 #define PDC_PAT_MEM_GET_TXT_SIZE   	12L /* Get Formatted Text Size   */
 #define PDC_PAT_MEM_GET_PD_TXT     	13L /* Get PD Formatted Text     */
 #define PDC_PAT_MEM_GET_CELL_TXT   	14L /* Get Cell Formatted Text   */
@@ -228,6 +228,17 @@ struct pdc_pat_mem_read_pd_retinfo { /* PDC_PAT_MEM/PDC_PAT_MEM_PD_READ */
 	unsigned long pdt_entries;
 };
 
+struct pdc_pat_mem_phys_mem_location { /* PDC_PAT_MEM/PDC_PAT_MEM_ADDRESS */
+	u64 cabinet:8;
+	u64 ign1:8;
+	u64 ign2:8;
+	u64 cell_slot:8;
+	u64 ign3:8;
+	u64 dimm_slot:8; /* DIMM slot, e.g. 0x1A, 0x2B, show user hex value! */
+	u64 ign4:8;
+	u64 source:4; /* for mem: always 0x07 */
+	u64 source_detail:4; /* for mem: always 0x04 (SIMM or DIMM) */
+};
 
 struct pdc_pat_pd_addr_map_entry {
 	unsigned char entry_type;       /* 1 = Memory Descriptor Entry Type */
@@ -319,6 +330,9 @@ extern int pdc_pat_mem_read_cell_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 extern int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 		unsigned long *pdt_entries_ptr, unsigned long count,
 		unsigned long offset);
+extern int pdc_pat_mem_get_dimm_phys_location(
+                struct pdc_pat_mem_phys_mem_location *pret,
+                unsigned long phys_addr);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 526ed90..f622a31 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1498,6 +1498,31 @@ int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 
 	return retval;
 }
+
+/**
+ * pdc_pat_mem_get_dimm_phys_location - Get physical DIMM slot via PAT firmware
+ * @pret: ptr to hold returned information
+ * @phys_addr: physical address to examine
+ *
+ */
+int pdc_pat_mem_get_dimm_phys_location(
+		struct pdc_pat_mem_phys_mem_location *pret,
+		unsigned long phys_addr)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_ADDRESS,
+		__pa(&pdc_result), phys_addr);
+
+	if (retval == PDC_OK)
+		memcpy(pret, &pdc_result, sizeof(*pret));
+
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
 #endif /* CONFIG_64BIT */
 
 
