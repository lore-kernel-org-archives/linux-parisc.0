From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v1] parisc : eisa :- Prevent resource leake and NULL error in error path
Date: Wed, 18 Jan 2017 13:41:31 +0530
Message-ID: <1484727091-2357-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here, If ioremap_nocache will fail. It will return NULL.
Kernel can run into a NULL-pointer dereference.

If eisa_probe will fail, Handle ERROR properly.
 -Release resource
 -Free irq line.
 -Unmap I/O memory from kernel address space.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parisc/eisa.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 103095b..2c7f90f 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -334,7 +334,7 @@ static int __init eisa_probe(struct parisc_device *dev)
 	result = request_irq(dev->irq, eisa_irq, IRQF_SHARED, "EISA", &eisa_dev);
 	if (result) {
 		printk(KERN_ERR "EISA: request_irq failed!\n");
-		return result;
+		goto error_release;
 	}
 	
 	/* Reserve IRQ2 */
@@ -358,6 +358,11 @@ static int __init eisa_probe(struct parisc_device *dev)
 		}
 	}
 	eisa_eeprom_addr = ioremap_nocache(eisa_dev.eeprom_addr, HPEE_MAX_LENGTH);
+	if (!eisa_eeprom_addr) {
+		result = -ENOMEM;
+		printk(KERN_ERR "EISA: ioremap_nocache failed!\n");
+		goto error_free_irq;
+	}
 	result = eisa_enumerator(eisa_dev.eeprom_addr, &eisa_dev.hba.io_space,
 			&eisa_dev.hba.lmmio_space);
 	init_eisa_pic();
@@ -371,12 +376,21 @@ static int __init eisa_probe(struct parisc_device *dev)
 		eisa_dev.root.slots = result;
 		eisa_dev.root.dma_mask = 0xffffffff; /* wild guess */
 		if (eisa_root_register (&eisa_dev.root)) {
+			result = -ENOMEM;
 			printk(KERN_ERR "EISA: Failed to register EISA root\n");
-			return -1;
+			goto error_iounmap;
 		}
 	}
 	
 	return 0;
+
+error_iounmap:
+	iounmap(eisa_eeprom_addr);
+error_free_irq:
+	free_irq(dev->irq, &eisa_dev);
+error_release:
+	release_resource(&eisa_dev.hba.io_space);
+	return result;
 }
 
 static const struct parisc_device_id eisa_tbl[] = {
-- 
1.9.1
