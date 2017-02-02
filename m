From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] parisc: ccio-dma: Handle return NULL error from ioremap_nocache
Date: Thu,  2 Feb 2017 18:52:34 +0530
Message-ID: <1486041754-12996-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here, If ioremap_nocache will fail. It will return NULL.
Kernel can run into a NULL-pointer dereference.
This error check will avoid NULL pointer dereference.

If kzalloc will fail return -ENOMEM instead of '1'.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parisc/ccio-dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 553ef8a..b0558e2 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1539,7 +1539,7 @@ static int __init ccio_probe(struct parisc_device *dev)
 	ioc = kzalloc(sizeof(struct ioc), GFP_KERNEL);
 	if (ioc == NULL) {
 		printk(KERN_ERR MODULE_NAME ": memory allocation failure\n");
-		return 1;
+		return -ENOMEM;
 	}
 
 	ioc->name = dev->id.hversion == U2_IOA_RUNWAY ? "U2" : "UTurn";
@@ -1554,6 +1554,10 @@ static int __init ccio_probe(struct parisc_device *dev)
 
 	ioc->hw_path = dev->hw_path;
 	ioc->ioc_regs = ioremap_nocache(dev->hpa.start, 4096);
+	if (!ioc->ioc_regs) {
+		kfree(ioc);
+		return -ENOMEM;
+	}
 	ccio_ioc_init(ioc);
 	ccio_init_resources(ioc);
 	hppa_dma_ops = &ccio_ops;
-- 
1.9.1
