From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix dev_printk() compile warnings for accessing a
 device struct
Date: Tue, 13 Jan 2009 21:14:51 +0100
Message-ID: <496CF63B.1050002@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix compile warnings:
drivers/scsi/zalon.c: In function `zalon_probe':
drivers/scsi/zalon.c:140: warning: passing arg 1 of `dev_driver_string' from incompatible pointer type
drivers/scsi/zalon.c:140: warning: passing arg 1 of `dev_name' from incompatible pointer type

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
index 4a4e695..f23c4ca 100644
--- a/drivers/scsi/lasi700.c
+++ b/drivers/scsi/lasi700.c
@@ -103,7 +103,7 @@ lasi700_probe(struct parisc_device *dev)
 
 	hostdata = kzalloc(sizeof(*hostdata), GFP_KERNEL);
 	if (!hostdata) {
-		dev_printk(KERN_ERR, dev, "Failed to allocate host data\n");
+		dev_printk(KERN_ERR, &dev->dev, "Failed to allocate host data\n");
 		return -ENOMEM;
 	}
 
diff --git a/drivers/scsi/zalon.c b/drivers/scsi/zalon.c
index a8d61a6..97f3158 100644
--- a/drivers/scsi/zalon.c
+++ b/drivers/scsi/zalon.c
@@ -137,7 +137,7 @@ zalon_probe(struct parisc_device *dev)
 		goto fail;
 
 	if (request_irq(dev->irq, ncr53c8xx_intr, IRQF_SHARED, "zalon", host)) {
-	  dev_printk(KERN_ERR, dev, "irq problem with %d, detaching\n ",
+	  dev_printk(KERN_ERR, &dev->dev, "irq problem with %d, detaching\n ",
 		     dev->irq);
 		goto fail;
 	}
