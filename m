From: Roel Kluin <12o3l@tiscali.nl>
Subject: [PATCH?][arch/parisc/kernel/pci-dma.c] pcxl_dma_ops.alloc_noncoherent
 = pa11_dma_alloc_consistent?
Date: Mon, 11 Feb 2008 17:23:33 +0100
Message-ID: <47B07685.5000606@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
To: kyle@parisc-linux.org, Matthew Wilcox <matthew@wil.cx>,
	grundler@parisc-linux.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757658AbYBKQYc@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

duplicate pa11_dma_alloc_consistent; more appropriate appears
pa11_dma_alloc_noncoherent here. 

Not tested, please confirm that this fix is correct
---
fix noncoherent allocation

Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 9448d4e..0e8b71f 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -549,7 +549,7 @@ static void pa11_dma_sync_sg_for_device(struct device *dev, struct scatterlist *
 struct hppa_dma_ops pcxl_dma_ops = {
 	.dma_supported =	pa11_dma_supported,
 	.alloc_consistent =	pa11_dma_alloc_consistent,
-	.alloc_noncoherent =	pa11_dma_alloc_consistent,
+	.alloc_noncoherent =	pa11_dma_alloc_noncoherent,
 	.free_consistent =	pa11_dma_free_consistent,
 	.map_single =		pa11_dma_map_single,
 	.unmap_single =		pa11_dma_unmap_single,
