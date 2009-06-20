From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 17:34:21 -0600
Message-ID: <20090620233421.GB21560@lackof.org>
References: <20090620224613.GB853@lackof.org> <20090620231151.GA21477@lackof.org> <1245540375.31688.2.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1245540375.31688.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 06:26:15PM -0500, James Bottomley wrote:
...
> > Take 2. Per Kyle's request (offlist), use kzalloc instead since it's not
> > ever used again after boot.
> 
> Um, wouldn't one of the points of using kzalloc over a static allocation
> be to free the memory again after we've finished using it?  Otherwise we
> leek a page for every lba.

James,
Thanks again for gating my utter fail.
Fixed in this version.

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
----
Again...still not tested. :(

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 59fbbf1..a30e668 100644
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
 
+	pa_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));
+	if (!pa_pdc_cell)
+		return;
+
+	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));
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
