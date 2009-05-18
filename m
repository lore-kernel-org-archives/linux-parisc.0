From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 1/2] parport_gsc: fix printk format warning
Date: Mon, 18 May 2009 17:10:52 +0400
Message-ID: <1242652252-1835-1-git-send-email-a.beregalov@gmail.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
To: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix this build warning:
drivers/parport/parport_gsc.c:356: warning: format '%lx' expects type
'long unsigned int', but argument 2 has type 'resource_size_t'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/parport/parport_gsc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 6531db2..51d4866 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -353,7 +353,7 @@ static int __devinit parport_init_chip(struct parisc_device *dev)
 
 	if (!dev->irq) {
 		printk(KERN_WARNING "IRQ not found for parallel device at 0x%lx\n",
-			dev->hpa.start);
+			(unsigned long)dev->hpa.start);
 		return -ENODEV;
 	}
 
-- 
1.6.2.5

