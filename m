From: Helge Deller <deller@gmx.de>
Subject: [PATCH 10/14] parisc/serio: Fix section mismatches in gscps2 and hp_sdc drivers
Date: Mon, 21 Aug 2017 22:22:57 +0200
Message-ID: <1503346981-28024-11-git-send-email-deller@gmx.de>
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
 drivers/input/serio/gscps2.c | 10 +++++-----
 drivers/input/serio/hp_sdc.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index ecba666..0fa592c 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -325,7 +325,7 @@ static void gscps2_close(struct serio *port)
  * @return: success/error report
  */
 
-static int gscps2_probe(struct parisc_device *dev)
+static int __init gscps2_probe(struct parisc_device *dev)
 {
 	struct gscps2port *ps2port;
 	struct serio *serio;
@@ -412,7 +412,7 @@ static int gscps2_probe(struct parisc_device *dev)
  * @return: success/error report
  */
 
-static int gscps2_remove(struct parisc_device *dev)
+static int __exit gscps2_remove(struct parisc_device *dev)
 {
 	struct gscps2port *ps2port = dev_get_drvdata(&dev->dev);
 
@@ -430,7 +430,7 @@ static int gscps2_remove(struct parisc_device *dev)
 }
 
 
-static struct parisc_device_id gscps2_device_tbl[] = {
+static struct parisc_device_id gscps2_device_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00084 }, /* LASI PS/2 */
 #ifdef DINO_TESTED
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00096 }, /* DINO PS/2 */
@@ -439,11 +439,11 @@ static struct parisc_device_id gscps2_device_tbl[] = {
 };
 MODULE_DEVICE_TABLE(parisc, gscps2_device_tbl);
 
-static struct parisc_driver parisc_ps2_driver = {
+static struct parisc_driver parisc_ps2_driver __refdata = {
 	.name		= "gsc_ps2",
 	.id_table	= gscps2_device_tbl,
 	.probe		= gscps2_probe,
-	.remove		= gscps2_remove,
+	.remove		= __exit_p(gscps2_remove),
 };
 
 static int __init gscps2_init(void)
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 1bfdae4..cb9ae5b 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -805,7 +805,7 @@ static void hp_sdc_kicker(unsigned long data)
 
 #if defined(__hppa__)
 
-static const struct parisc_device_id hp_sdc_tbl[] = {
+static struct parisc_device_id hp_sdc_tbl[] __initconst = {
 	{
 		.hw_type =	HPHW_FIO,
 		.hversion_rev =	HVERSION_REV_ANY_ID,
@@ -820,7 +820,7 @@ MODULE_DEVICE_TABLE(parisc, hp_sdc_tbl);
 static int __init hp_sdc_init_hppa(struct parisc_device *d);
 static struct delayed_work moduleloader_work;
 
-static struct parisc_driver hp_sdc_driver = {
+static struct parisc_driver hp_sdc_driver __refdata = {
 	.name =		"hp_sdc",
 	.id_table =	hp_sdc_tbl,
 	.probe =	hp_sdc_init_hppa,
-- 
2.1.0

