From: domen@coderock.org
Subject: [parisc-linux] [patch 1/1] parisc/kernel/pci-dma: Audit return code
	of create_proc_*
Date: Fri, 15 Jul 2005 00:19:38 +0200
Message-ID: <20050714221937.998948000@homer>
Cc: domen@coderock.org,
 parisc-linux@parisc-linux.org
To: matthew@wil.cx
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

From: Christophe Lucas <clucas@rotomalug.org>


---
 pci-dma.c |   30 ++++++++++++++++++++----------
 1 files changed, 20 insertions(+), 10 deletions(-)

Index: quilt/arch/parisc/kernel/pci-dma.c
===================================================================
--- quilt.orig/arch/parisc/kernel/pci-dma.c
+++ quilt/arch/parisc/kernel/pci-dma.c
@@ -333,18 +333,28 @@ pcxl_free_range(unsigned long vaddr, siz
 static int __init
 pcxl_dma_init(void)
 {
-    if (pcxl_dma_start == 0)
-	return 0;
+	if (pcxl_dma_start == 0)
+		return 0;
 
-    spin_lock_init(&pcxl_res_lock);
-    pcxl_res_size = PCXL_DMA_MAP_SIZE >> (PAGE_SHIFT + 3);
-    pcxl_res_hint = 0;
-    pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
+	spin_lock_init(&pcxl_res_lock);
+	pcxl_res_size = PCXL_DMA_MAP_SIZE >> (PAGE_SHIFT + 3);
+	pcxl_res_hint = 0;
+	pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
 					    get_order(pcxl_res_size));
-    memset(pcxl_res_map, 0, pcxl_res_size);
-    proc_gsc_root = proc_mkdir("gsc", 0);
-    create_proc_info_entry("dino", 0, proc_gsc_root, pcxl_proc_info);
-    return 0;
+	memset(pcxl_res_map, 0, pcxl_res_size);
+	proc_gsc_root = proc_mkdir("gsc", 0);
+	if (!proc_gsc_root)
+    		printk(KERN_WARNING
+			"pcxl_dma_init: Unable to create gsc /proc dir entry\n");
+	else {
+		struct proc_dir_entry* ent;
+		ent = create_proc_info_entry("dino", 0,
+				proc_gsc_root, pcxl_proc_info);
+		if (!ent)
+			printk(KERN_WARNING
+				"pci-dma.c: Unable to create dino /proc entry.\n");
+	}
+	return 0;
 }
 
 __initcall(pcxl_dma_init);

--
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
