From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] v4 : Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 17:55:07 -0600
Message-ID: <20090620235507.GD21560@lackof.org>
References: <20090620224613.GB853@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620224613.GB853@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 04:46:13PM -0600, Grant Grundler wrote:
gcc 4.4 warns about:
drivers/parisc/lba_pci.c: In function 'lba_pat_resources':
drivers/parisc/lba_pci.c:1099: warning: the frame size of 8280 bytes is larger than 4096 bytes

The problem is we declare two large structures on the stack. They don't need
to be on the stack since they are only used during LBA initialization (which
is serialized). Moving to be "static".

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
---
Take #3. Still can not build a kernel to test. Thanks to James Bottomley and
John David Anglin for catching the dumbest errors I've done in a long time.


diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 59fbbf1..bc7a82d 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -980,28 +980,38 @@ static void
 lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 {
 	unsigned long bytecnt;
-	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;	/* PA_VIEW */
-	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;	/* IO_VIEW */
 	long io_count;
 	long status;	/* PDC return status */
 	long pa_count;
+	pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;	/* PA_VIEW */
+	pdc_pat_cell_mod_maddr_block_t *io_pdc_cell;	/* IO_VIEW */
 	int i;
 
+	pa_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
+	if (!pa_pdc_cell)
+		return;
+
+	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
+	if (!pa_pdc_cell) {
+		kfree(pa_pdc_cell);
+		return;
+	}
+
 	/* return cell module (IO view) */
 	status = pdc_pat_cell_module(&bytecnt, pa_dev->pcell_loc, pa_dev->mod_index,
-				PA_VIEW, & pa_pdc_cell);
-	pa_count = pa_pdc_cell.mod[1];
+				PA_VIEW, pa_pdc_cell);
+	pa_count = pa_pdc_cell->mod[1];
 
 	status |= pdc_pat_cell_module(&bytecnt, pa_dev->pcell_loc, pa_dev->mod_index,
-				IO_VIEW, &io_pdc_cell);
-	io_count = io_pdc_cell.mod[1];
+				IO_VIEW, io_pdc_cell);
+	io_count = io_pdc_cell->mod[1];
 
 	/* We've already done this once for device discovery...*/
 	if (status != PDC_OK) {
 		panic("pdc_pat_cell_module() call failed for LBA!\n");
 	}
 
-	if (PAT_GET_ENTITY(pa_pdc_cell.mod_info) != PAT_ENTITY_LBA) {
+	if (PAT_GET_ENTITY(pa_pdc_cell->mod_info) != PAT_ENTITY_LBA) {
 		panic("pdc_pat_cell_module() entity returned != PAT_ENTITY_LBA!\n");
 	}
 
@@ -1016,8 +1026,8 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		} *p, *io;
 		struct resource *r;
 
-		p = (void *) &(pa_pdc_cell.mod[2+i*3]);
-		io = (void *) &(io_pdc_cell.mod[2+i*3]);
+		p = (void *) &(pa_pdc_cell->mod[2+i*3]);
+		io = (void *) &(io_pdc_cell->mod[2+i*3]);
 
 		/* Convert the PAT range data to PCI "struct resource" */
 		switch(p->type & 0xff) {
@@ -1096,6 +1106,9 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 			break;
 		}
 	}
+
+	kfree(pa_pdc_cell);
+	kfree(io_pdc_cell);
 }
 #else
 /* keep compiler from complaining about missing declarations */
