From: Helge Deller <deller@gmx.de>
Subject: [PATCH] liquidio: Use %pad printk format for dma_addr_t values
Date: Thu, 12 Jul 2018 22:36:29 +0200
Message-ID: <20180712203629.GA32537@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Derek Chickles <derek.chickles@caviumnetworks.com>,
        Satanand Burla <satananda.burla@caviumnetworks.com>,
        Felix Manlunas <felix.manlunas@caviumnetworks.com>,
        Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>,
        netdev@vger.kernel.org
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>

Use the existing %pad printk format to print dma_addr_t values.
This avoids the following warnings when compiling on the parisc platform:

warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index 1f2e75da28f8..d5d9e47daa4b 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -110,8 +110,8 @@ int octeon_init_instr_queue(struct octeon_device *oct,
 
 	memset(iq->request_list, 0, sizeof(*iq->request_list) * num_descs);
 
-	dev_dbg(&oct->pci_dev->dev, "IQ[%d]: base: %p basedma: %llx count: %d\n",
-		iq_no, iq->base_addr, iq->base_addr_dma, iq->max_count);
+	dev_dbg(&oct->pci_dev->dev, "IQ[%d]: base: %p basedma: %pad count: %d\n",
+		iq_no, iq->base_addr, &iq->base_addr_dma, iq->max_count);
 
 	iq->txpciq.u64 = txpciq.u64;
 	iq->fill_threshold = (u32)conf->db_min;
