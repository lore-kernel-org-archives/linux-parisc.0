From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH 2/2] parisc: inventory.c, fix bloated stack frame
Date: Tue, 23 Jun 2009 13:18:27 -0400
Message-ID: <1245777507-14997-2-git-send-email-kyle@mcmartin.ca>
References: <1245777507-14997-1-git-send-email-kyle@mcmartin.ca>
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1245777507-14997-1-git-send-email-kyle@mcmartin.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Kyle McMartin <kyle@shortfin.cabal.ca>

The pa_pdc_cell struct can be kmalloc'd, so do that
instead.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/kernel/inventory.c |   41 +++++++++++++++++++++++----------------
 1 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index bd1f7f1..bb3195b 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -170,23 +170,27 @@ static void __init pagezero_memconfig(void)
 static int __init 
 pat_query_module(ulong pcell_loc, ulong mod_index)
 {
-	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+	pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;
 	unsigned long bytecnt;
 	unsigned long temp;	/* 64-bit scratch value */
 	long status;		/* PDC return value status */
 	struct parisc_device *dev;
 
+	pa_pdc_cell = kmalloc(sizeof (*pa_pdc_cell), GFP_KERNEL);
+	if (!pa_pdc_cell)
+		panic("couldn't allocate memory for PDC_PAT_CELL!");
+
 	/* return cell module (PA or Processor view) */
 	status = pdc_pat_cell_module(&bytecnt, pcell_loc, mod_index,
-				     PA_VIEW, &pa_pdc_cell);
+				     PA_VIEW, pa_pdc_cell);
 
 	if (status != PDC_OK) {
 		/* no more cell modules or error */
 		return status;
 	}
 
-	temp = pa_pdc_cell.cba;
-	dev = alloc_pa_dev(PAT_GET_CBA(temp), &pa_pdc_cell.mod_path);
+	temp = pa_pdc_cell->cba;
+	dev = alloc_pa_dev(PAT_GET_CBA(temp), &(pa_pdc_cell->mod_path));
 	if (!dev) {
 		return PDC_OK;
 	}
@@ -203,8 +207,8 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 
 	/* save generic info returned from the call */
 	/* REVISIT: who is the consumer of this? not sure yet... */
-	dev->mod_info = pa_pdc_cell.mod_info;	/* pass to PAT_GET_ENTITY() */
-	dev->pmod_loc = pa_pdc_cell.mod_location;
+	dev->mod_info = pa_pdc_cell->mod_info;	/* pass to PAT_GET_ENTITY() */
+	dev->pmod_loc = pa_pdc_cell->mod_location;
 
 	register_parisc_device(dev);	/* advertise device */
 
@@ -216,14 +220,14 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 
 	case PAT_ENTITY_PROC:
 		printk(KERN_DEBUG "PAT_ENTITY_PROC: id_eid 0x%lx\n",
-			pa_pdc_cell.mod[0]);
+			pa_pdc_cell->mod[0]);
 		break;
 
 	case PAT_ENTITY_MEM:
 		printk(KERN_DEBUG 
 			"PAT_ENTITY_MEM: amount 0x%lx min_gni_base 0x%lx min_gni_len 0x%lx\n",
-			pa_pdc_cell.mod[0], pa_pdc_cell.mod[1], 
-			pa_pdc_cell.mod[2]);
+			pa_pdc_cell->mod[0], pa_pdc_cell->mod[1], 
+			pa_pdc_cell->mod[2]);
 		break;
 	case PAT_ENTITY_CA:
 		printk(KERN_DEBUG "PAT_ENTITY_CA: %ld\n", pcell_loc);
@@ -243,23 +247,26 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
  print_ranges:
 		pdc_pat_cell_module(&bytecnt, pcell_loc, mod_index,
 				    IO_VIEW, &io_pdc_cell);
-		printk(KERN_DEBUG "ranges %ld\n", pa_pdc_cell.mod[1]);
-		for (i = 0; i < pa_pdc_cell.mod[1]; i++) {
+		printk(KERN_DEBUG "ranges %ld\n", pa_pdc_cell->mod[1]);
+		for (i = 0; i < pa_pdc_cell->mod[1]; i++) {
 			printk(KERN_DEBUG 
 				"  PA_VIEW %ld: 0x%016lx 0x%016lx 0x%016lx\n", 
-				i, pa_pdc_cell.mod[2 + i * 3],	/* type */
-				pa_pdc_cell.mod[3 + i * 3],	/* start */
-				pa_pdc_cell.mod[4 + i * 3]);	/* finish (ie end) */
+				i, pa_pdc_cell->mod[2 + i * 3],	/* type */
+				pa_pdc_cell->mod[3 + i * 3],	/* start */
+				pa_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
 			printk(KERN_DEBUG 
 				"  IO_VIEW %ld: 0x%016lx 0x%016lx 0x%016lx\n", 
-				i, io_pdc_cell.mod[2 + i * 3],	/* type */
-				io_pdc_cell.mod[3 + i * 3],	/* start */
-				io_pdc_cell.mod[4 + i * 3]);	/* finish (ie end) */
+				i, io_pdc_cell->mod[2 + i * 3],	/* type */
+				io_pdc_cell->mod[3 + i * 3],	/* start */
+				io_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
 		}
 		printk(KERN_DEBUG "\n");
 		break;
 	}
 #endif /* DEBUG_PAT */
+
+	kfree(pa_pdc_cell);
+
 	return PDC_OK;
 }
 
-- 
1.6.3.1

