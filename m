From: Grant Grundler <grundler@parisc-linux.org>
Subject: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 16:46:13 -0600
Message-ID: <20090620224613.GB853@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

gcc 4.4 warns about:
drivers/parisc/lba_pci.c: In function 'lba_pat_resources':
drivers/parisc/lba_pci.c:1099: warning: the frame size of 8280 bytes is larger than 4096 bytes

The problem is we declare two large structures on the stack. They don't need
to be on the stack since they are only used during LBA initialization (which
is serialized). Moving to be "static".

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
---

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 59fbbf1..7535cb3 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -980,13 +980,17 @@ static void
 lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 {
 	unsigned long bytecnt;
-	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;	/* PA_VIEW */
-	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;	/* IO_VIEW */
 	long io_count;
 	long status;	/* PDC return status */
 	long pa_count;
 	int i;
 
+	/* We don't need additional locking around the use of pdc_pat_cell
+	**  since init time PDC device discovery is already serialized.
+	*/
+	static pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;	/* PA_VIEW */
+	static pdc_pat_cell_mod_maddr_block_t io_pdc_cell;	/* IO_VIEW */
+
 	/* return cell module (IO view) */
 	status = pdc_pat_cell_module(&bytecnt, pa_dev->pcell_loc, pa_dev->mod_index,
 				PA_VIEW, & pa_pdc_cell);
