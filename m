From: Helge Deller <deller@gmx.de>
Subject: [PATCH 05/14] parisc/8250_gsc: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:52 +0200
Message-ID: <1503346981-28024-6-git-send-email-deller@gmx.de>
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
 drivers/tty/serial/8250/8250_gsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_gsc.c b/drivers/tty/serial/8250/8250_gsc.c
index 63306de..e142ab2 100644
--- a/drivers/tty/serial/8250/8250_gsc.c
+++ b/drivers/tty/serial/8250/8250_gsc.c
@@ -80,7 +80,7 @@ static int __init serial_init_chip(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id serial_tbl[] = {
+static struct parisc_device_id serial_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00075 },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008c },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008d },
@@ -94,7 +94,7 @@ static struct parisc_device_id serial_tbl[] = {
  * which only knows about Lasi and then a second which will find all the
  * other serial ports.  HPUX ignores this problem.
  */
-static struct parisc_device_id lasi_tbl[] = {
+static struct parisc_device_id lasi_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03B, 0x0008C }, /* C1xx/C1xxL */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03C, 0x0008C }, /* B132L */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, 0x03D, 0x0008C }, /* B160L */
@@ -110,13 +110,13 @@ static struct parisc_device_id lasi_tbl[] = {
 
 MODULE_DEVICE_TABLE(parisc, serial_tbl);
 
-static struct parisc_driver lasi_driver = {
+static struct parisc_driver lasi_driver __refdata = {
 	.name		= "serial_1",
 	.id_table	= lasi_tbl,
 	.probe		= serial_init_chip,
 };
 
-static struct parisc_driver serial_driver = {
+static struct parisc_driver serial_driver __refdata = {
 	.name		= "serial",
 	.id_table	= serial_tbl,
 	.probe		= serial_init_chip,
-- 
2.1.0

