From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] dec: tulip: de4x5: Replace mdelay with usleep_range in de4x5_hw_init
Date: Wed, 11 Apr 2018 10:00:54 +0800
Message-ID: <1523412054-2108-1-git-send-email-baijiaju1990@gmail.com>
Cc: netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
To: davem@davemloft.net, dhowells@redhat.com,
        stephen@networkplumber.org, johannes.berg@intel.com,
        arvind.yadav.cs@gmail.com
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

de4x5_hw_init() is never called in atomic context.

de4x5_hw_init() is only called by de4x5_pci_probe(), which is only 
set as ".probe" in struct pci_driver.

Despite never getting called from atomic context, de4x5_hw_init() 
calls mdelay() to busily wait.
This is not necessary and can be replaced with usleep_range() to 
avoid busy waiting.

This is found by a static analysis tool named DCNS written by myself.
And I also manually check it.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/net/ethernet/dec/tulip/de4x5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/de4x5.c b/drivers/net/ethernet/dec/tulip/de4x5.c
index 0affee9..3fb0119 100644
--- a/drivers/net/ethernet/dec/tulip/de4x5.c
+++ b/drivers/net/ethernet/dec/tulip/de4x5.c
@@ -1107,7 +1107,7 @@ static int (*dc_infoblock[])(struct net_device *dev, u_char, u_char *) = {
 	pdev = to_pci_dev (gendev);
 	pci_write_config_byte(pdev, PCI_CFDA_PSM, WAKEUP);
     }
-    mdelay(10);
+    usleep(10000, 11000);
 
     RESET_DE4X5;
 
-- 
1.9.1
