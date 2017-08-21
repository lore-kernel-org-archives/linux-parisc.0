From: Helge Deller <deller@gmx.de>
Subject: [PATCH 04/14] parisc/mux: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:51 +0200
Message-ID: <1503346981-28024-5-git-send-email-deller@gmx.de>
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
 drivers/tty/serial/mux.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index 8a4be4b..80c8105 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -503,7 +503,7 @@ static int __init mux_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static int mux_remove(struct parisc_device *dev)
+static int __exit mux_remove(struct parisc_device *dev)
 {
 	int i, j;
 	int port_count = (long)dev_get_drvdata(&dev->dev);
@@ -536,13 +536,13 @@ static int mux_remove(struct parisc_device *dev)
  * This table only contains the parisc_device_id of known builtin mux
  * devices.  All other mux cards will be detected by the generic mux_tbl.
  */
-static struct parisc_device_id builtin_mux_tbl[] = {
+static struct parisc_device_id builtin_mux_tbl[] __initconst = {
 	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, 0x15, 0x0000D }, /* All K-class */
 	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, 0x44, 0x0000D }, /* E35, E45, and E55 */
 	{ 0, }
 };
 
-static struct parisc_device_id mux_tbl[] = {
+static struct parisc_device_id mux_tbl[] __initconst = {
 	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0000D },
 	{ 0, }
 };
@@ -550,18 +550,18 @@ static struct parisc_device_id mux_tbl[] = {
 MODULE_DEVICE_TABLE(parisc, builtin_mux_tbl);
 MODULE_DEVICE_TABLE(parisc, mux_tbl);
 
-static struct parisc_driver builtin_serial_mux_driver = {
+static struct parisc_driver builtin_serial_mux_driver __refdata = {
 	.name =		"builtin_serial_mux",
 	.id_table =	builtin_mux_tbl,
 	.probe =	mux_probe,
-	.remove =       mux_remove,
+	.remove =       __exit_p(mux_remove),
 };
 
-static struct parisc_driver serial_mux_driver = {
+static struct parisc_driver serial_mux_driver __refdata = {
 	.name =		"serial_mux",
 	.id_table =	mux_tbl,
 	.probe =	mux_probe,
-	.remove =       mux_remove,
+	.remove =       __exit_p(mux_remove),
 };
 
 /**
-- 
2.1.0

