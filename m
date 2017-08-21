From: Helge Deller <deller@gmx.de>
Subject: [PATCH 08/14] parisc/parport_gsc: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:55 +0200
Message-ID: <1503346981-28024-9-git-send-email-deller@gmx.de>
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
 drivers/parport/parport_gsc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 3858b87..435e6f7 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -346,7 +346,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 
 static int parport_count;
 
-static int parport_init_chip(struct parisc_device *dev)
+static int __init parport_init_chip(struct parisc_device *dev)
 {
 	struct parport *p;
 	unsigned long port;
@@ -381,7 +381,7 @@ static int parport_init_chip(struct parisc_device *dev)
 	return 0;
 }
 
-static int parport_remove_chip(struct parisc_device *dev)
+static int __exit parport_remove_chip(struct parisc_device *dev)
 {
 	struct parport *p = dev_get_drvdata(&dev->dev);
 	if (p) {
@@ -403,18 +403,18 @@ static int parport_remove_chip(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id parport_tbl[] = {
+static struct parisc_device_id parport_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x74 },
 	{ 0, }
 };
 
 MODULE_DEVICE_TABLE(parisc, parport_tbl);
 
-static struct parisc_driver parport_driver = {
+static struct parisc_driver parport_driver __refdata = {
 	.name		= "Parallel",
 	.id_table	= parport_tbl,
 	.probe		= parport_init_chip,
-	.remove		= parport_remove_chip,
+	.remove		= __exit_p(parport_remove_chip),
 };
 
 int parport_gsc_init(void)
-- 
2.1.0

