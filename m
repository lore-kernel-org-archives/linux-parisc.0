From: Helge Deller <deller@gmx.de>
Subject: [PATCH 12/14] parisc/input/hilkbd: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:59 +0200
Message-ID: <1503346981-28024-13-git-send-email-deller@gmx.de>
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
 drivers/input/keyboard/hilkbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
index 198dc07..9ea3a10 100644
--- a/drivers/input/keyboard/hilkbd.c
+++ b/drivers/input/keyboard/hilkbd.c
@@ -299,7 +299,7 @@ static void hil_keyb_exit(void)
 }
 
 #if defined(CONFIG_PARISC)
-static int hil_probe_chip(struct parisc_device *dev)
+static int __init hil_probe_chip(struct parisc_device *dev)
 {
 	/* Only allow one HIL keyboard */
 	if (hil_dev.dev)
@@ -320,14 +320,14 @@ static int hil_probe_chip(struct parisc_device *dev)
 	return hil_keyb_init();
 }
 
-static int hil_remove_chip(struct parisc_device *dev)
+static int __exit hil_remove_chip(struct parisc_device *dev)
 {
 	hil_keyb_exit();
 
 	return 0;
 }
 
-static struct parisc_device_id hil_tbl[] = {
+static struct parisc_device_id hil_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00073 },
 	{ 0, }
 };
@@ -337,11 +337,11 @@ static struct parisc_device_id hil_tbl[] = {
 MODULE_DEVICE_TABLE(parisc, hil_tbl);
 #endif
 
-static struct parisc_driver hil_driver = {
+static struct parisc_driver hil_driver __refdata = {
 	.name		= "hil",
 	.id_table	= hil_tbl,
 	.probe		= hil_probe_chip,
-	.remove		= hil_remove_chip,
+	.remove		= __exit_p(hil_remove_chip),
 };
 
 static int __init hil_init(void)
-- 
2.1.0

