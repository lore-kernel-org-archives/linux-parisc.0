From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH 1/2] parisc: processor.c, fix bloated stack frame
Date: Tue, 23 Jun 2009 13:18:26 -0400
Message-ID: <1245777507-14997-1-git-send-email-kyle@mcmartin.ca>
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Kyle McMartin <kyle@shortfin.cabal.ca>

The pa_pdc_cell struct can be kmalloc'd, so do that instead.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/kernel/processor.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 1ca69a8..c8fb61e 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -120,22 +120,28 @@ static int __cpuinit processor_probe(struct parisc_device *dev)
 	if (is_pdc_pat()) {
 		ulong status;
 		unsigned long bytecnt;
-	        pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+	        pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;
 #undef USE_PAT_CPUID
 #ifdef USE_PAT_CPUID
 		struct pdc_pat_cpu_num cpu_info;
 #endif
 
+		pa_pdc_cell = kmalloc(sizeof (*pa_pdc_cell), GFP_KERNEL);
+		if (!pa_pdc_cell)
+			panic("couldn't allocate memory for PDC_PAT_CELL!");
+
 		status = pdc_pat_cell_module(&bytecnt, dev->pcell_loc,
-			dev->mod_index, PA_VIEW, &pa_pdc_cell);
+			dev->mod_index, PA_VIEW, pa_pdc_cell);
 
 		BUG_ON(PDC_OK != status);
 
 		/* verify it's the same as what do_pat_inventory() found */
-		BUG_ON(dev->mod_info != pa_pdc_cell.mod_info);
-		BUG_ON(dev->pmod_loc != pa_pdc_cell.mod_location);
+		BUG_ON(dev->mod_info != pa_pdc_cell->mod_info);
+		BUG_ON(dev->pmod_loc != pa_pdc_cell->mod_location);
+
+		txn_addr = pa_pdc_cell->mod[0];   /* id_eid for IO sapic */
 
-		txn_addr = pa_pdc_cell.mod[0];   /* id_eid for IO sapic */
+		kfree(pa_pdc_cell);
 
 #ifdef USE_PAT_CPUID
 /* We need contiguous numbers for cpuid. Firmware's notion
-- 
1.6.3.1

