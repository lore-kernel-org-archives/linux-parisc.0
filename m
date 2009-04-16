From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] parisc/superio: fix build breakage
Date: Thu, 16 Apr 2009 18:45:59 +0400
Message-ID: <1239893159-18112-1-git-send-email-a.beregalov@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Beregalov <a.beregalov@gmail.com>
To: alan@lxorguk.ukuu.org.uk
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Usage of parport_pc_probe_port was changed in 28783eb52
(parport: Fix various uses of parport_pc).

It introduced this build error:
drivers/parisc/superio.c: In function 'superio_parport_init':
drivers/parisc/superio.c:437: error: too few arguments to function
				'parport_pc_probe_port'

Fix it.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/parisc/superio.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index 33e5ade..9ab9796 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -434,8 +434,8 @@ static void __init superio_parport_init(void)
 			0 /*base_hi*/,
 			PAR_IRQ, 
 			PARPORT_DMA_NONE /* dma */,
-			NULL /*struct pci_dev* */),
-			0 /* shared irq flags */ )
+			NULL /*struct pci_dev* */,
+			0 /* shared irq flags */))
 
 		printk(KERN_WARNING PFX "Probing parallel port failed.\n");
 #endif	/* CONFIG_PARPORT_PC */
-- 
1.6.2.3

