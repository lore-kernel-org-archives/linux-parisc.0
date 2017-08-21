From: Helge Deller <deller@gmx.de>
Subject: [PATCH 06/14] parisc/scsi/zalon: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:53 +0200
Message-ID: <1503346981-28024-7-git-send-email-deller@gmx.de>
References: <1503346981-28024-1-git-send-email-deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1503346981-28024-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/scsi/zalon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/zalon.c b/drivers/scsi/zalon.c
index b2cf1fa..a2fb7ad 100644
--- a/drivers/scsi/zalon.c
+++ b/drivers/scsi/zalon.c
@@ -160,14 +160,14 @@ zalon_probe(struct parisc_device *dev)
 	return error;
 }
 
-static struct parisc_device_id zalon_tbl[] = {
+static struct parisc_device_id zalon_tbl[] __initconst = {
 	{ HPHW_A_DMA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00089 }, 
 	{ 0, }
 };
 
 MODULE_DEVICE_TABLE(parisc, zalon_tbl);
 
-static int zalon_remove(struct parisc_device *dev)
+static int __exit zalon_remove(struct parisc_device *dev)
 {
 	struct Scsi_Host *host = dev_get_drvdata(&dev->dev);
 
@@ -178,11 +178,11 @@ static int zalon_remove(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_driver zalon_driver = {
+static struct parisc_driver zalon_driver __refdata = {
 	.name =		"zalon",
 	.id_table =	zalon_tbl,
 	.probe =	zalon_probe,
-	.remove =	zalon_remove,
+	.remove =	__exit_p(zalon_remove),
 };
 
 static int __init zalon7xx_init(void)
-- 
2.1.0

