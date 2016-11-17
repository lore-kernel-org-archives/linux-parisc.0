From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Enhance CPU detection code on PAT machines
Date: Thu, 17 Nov 2016 21:27:50 +0100
Message-ID: <20161117202750.GA5812@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes the debug code which runs during the inventory scan on
machines with PAT firmware.

Additionally print out the relationship between the detected logical CPU
number and it's physical location and physical cpu number.
This leads to information which can be used to feed numa-structures in
the kernel in later patches. An example output is from my single-CPU (2
cores) C8000 machine is:

  Logical CPU #0 is physical cpu #0 at 0xffff0000ffff15, hpa 0xfffffffffe780000
  Logical CPU #1 is physical cpu #1 at 0xffff0000ffff15, hpa 0xfffffffffe781000

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index 47539f1..e1d2890 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -289,7 +289,7 @@ extern int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info);
 extern int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod, unsigned long view_type, void *mem_addr);
 extern int pdc_pat_cell_num_to_loc(void *, unsigned long);
 
-extern int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa);
+extern int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, unsigned long hpa);
 
 extern int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, unsigned long count, unsigned long offset);
 
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index e5d7190..9d797ae 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1258,7 +1258,7 @@ int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long
  *
  * Retrieve the cpu number for the cpu at the specified HPA.
  */
-int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, void *hpa)
+int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, unsigned long hpa)
 {
 	int retval;
 	unsigned long flags;
diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index 545f9d2..c9789d9 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -216,9 +216,9 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 	register_parisc_device(dev);	/* advertise device */
 
 #ifdef DEBUG_PAT
-	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;
 	/* dump what we see so far... */
 	switch (PAT_GET_ENTITY(dev->mod_info)) {
+		pdc_pat_cell_mod_maddr_block_t io_pdc_cell;
 		unsigned long i;
 
 	case PAT_ENTITY_PROC:
@@ -259,9 +259,9 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 				pa_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
 			printk(KERN_DEBUG 
 				"  IO_VIEW %ld: 0x%016lx 0x%016lx 0x%016lx\n", 
-				i, io_pdc_cell->mod[2 + i * 3],	/* type */
-				io_pdc_cell->mod[3 + i * 3],	/* start */
-				io_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
+				i, io_pdc_cell.mod[2 + i * 3],	/* type */
+				io_pdc_cell.mod[3 + i * 3],	/* start */
+				io_pdc_cell.mod[4 + i * 3]);	/* finish (ie end) */
 		}
 		printk(KERN_DEBUG "\n");
 		break;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 0c2a94a..12cdec5 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -99,6 +99,7 @@ static int processor_probe(struct parisc_device *dev)
 	unsigned long txn_addr;
 	unsigned long cpuid;
 	struct cpuinfo_parisc *p;
+	struct pdc_pat_cpu_num cpu_info __maybe_unused;
 
 #ifdef CONFIG_SMP
 	if (num_online_cpus() >= nr_cpu_ids) {
@@ -123,10 +124,6 @@ static int processor_probe(struct parisc_device *dev)
 		ulong status;
 		unsigned long bytecnt;
 	        pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;
-#undef USE_PAT_CPUID
-#ifdef USE_PAT_CPUID
-		struct pdc_pat_cpu_num cpu_info;
-#endif
 
 		pa_pdc_cell = kmalloc(sizeof (*pa_pdc_cell), GFP_KERNEL);
 		if (!pa_pdc_cell)
@@ -145,22 +142,25 @@ static int processor_probe(struct parisc_device *dev)
 
 		kfree(pa_pdc_cell);
 
+		/* get the cpu number */
+		status = pdc_pat_cpu_get_number(&cpu_info, dev->hpa.start);
+		BUG_ON(PDC_OK != status);
+
+		pr_info("Logical CPU #%lu is physical cpu #%lu at 0x%lx, hpa %pa\n",
+			cpuid, cpu_info.cpu_num, cpu_info.cpu_loc, &dev->hpa.start);
+
+#undef USE_PAT_CPUID
 #ifdef USE_PAT_CPUID
 /* We need contiguous numbers for cpuid. Firmware's notion
  * of cpuid is for physical CPUs and we just don't care yet.
  * We'll care when we need to query PAT PDC about a CPU *after*
  * boot time (ie shutdown a CPU from an OS perspective).
  */
-		/* get the cpu number */
-		status = pdc_pat_cpu_get_number(&cpu_info, dev->hpa.start);
-
-		BUG_ON(PDC_OK != status);
