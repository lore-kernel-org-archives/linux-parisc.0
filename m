From: Hans Wennborg <hans@hanshq.net>
Subject: [PATCH 13/19] drivers: parisc: fix %d confusingly prefixed with 0x in format string
Date: Sun,  3 Aug 2014 17:20:30 -0700
Message-ID: <1407111630-15087-1-git-send-email-hans@hanshq.net>
Cc: Hans Wennborg <hans@hanshq.net>
To: jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Hans Wennborg <hans@hanshq.net>
---
 drivers/parisc/dino.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 9eae983..a0580af 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -913,7 +913,7 @@ static int __init dino_probe(struct parisc_device *dev)
 	printk("%s version %s found at 0x%lx\n", name, version, hpa);
 
 	if (!request_mem_region(hpa, PAGE_SIZE, name)) {
-		printk(KERN_ERR "DINO: Hey! Someone took my MMIO space (0x%ld)!\n",
+		printk(KERN_ERR "DINO: Hey! Someone took my MMIO space (0x%lx)!\n",
 			hpa);
 		return 1;
 	}
-- 
2.0.0.526.g5318336
