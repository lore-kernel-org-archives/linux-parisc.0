From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Static initialization of pcxl_res_lock spinlock
Date: Mon, 7 Aug 2017 23:28:39 +0200
Message-ID: <20170807212839.GA4891@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 5f0067a..bd4c0a7 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -41,7 +41,7 @@ static unsigned long pcxl_used_bytes __read_mostly = 0;
 static unsigned long pcxl_used_pages __read_mostly = 0;
 
 extern unsigned long pcxl_dma_start; /* Start of pcxl dma mapping area */
-static spinlock_t   pcxl_res_lock;
+static DEFINE_SPINLOCK(pcxl_res_lock);
 static char    *pcxl_res_map;
 static int     pcxl_res_hint;
 static int     pcxl_res_size;
@@ -390,7 +390,6 @@ pcxl_dma_init(void)
 	if (pcxl_dma_start == 0)
 		return 0;
 
-	spin_lock_init(&pcxl_res_lock);
 	pcxl_res_size = PCXL_DMA_MAP_SIZE >> (PAGE_SHIFT + 3);
 	pcxl_res_hint = 0;
 	pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
