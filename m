From: Helge Deller <deller@gmx.de>
Subject: [PATCH 07/14] parisc/scsi/lasi700: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:54 +0200
Message-ID: <1503346981-28024-8-git-send-email-deller@gmx.de>
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
 drivers/scsi/lasi700.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
index 5c4ded9..576aae4 100644
--- a/drivers/scsi/lasi700.c
+++ b/drivers/scsi/lasi700.c
@@ -81,7 +81,7 @@ MODULE_LICENSE("GPL");
 #define LASI710_CLOCK	40
 #define LASI_SCSI_CORE_OFFSET 0x100
 
-static struct parisc_device_id lasi700_ids[] = {
+static struct parisc_device_id lasi700_ids[] __initconst = {
 	LASI700_ID_TABLE,
 	LASI710_ID_TABLE,
 	{ 0 }
@@ -164,11 +164,11 @@ lasi700_driver_remove(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_driver lasi700_driver = {
+static struct parisc_driver lasi700_driver __refdata = {
 	.name =		"lasi_scsi",
 	.id_table =	lasi700_ids,
 	.probe =	lasi700_probe,
-	.remove =	lasi700_driver_remove,
+	.remove =	__exit_p(lasi700_driver_remove),
 };
 
 static int __init
-- 
2.1.0

