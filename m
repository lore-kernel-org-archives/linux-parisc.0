From: Helge Deller <deller@gmx.de>
Subject: [PATCH 11/14] parisc/net/lasi_82596: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:58 +0200
Message-ID: <1503346981-28024-12-git-send-email-deller@gmx.de>
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
 drivers/net/ethernet/i825xx/lasi_82596.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethernet/i825xx/lasi_82596.c
index d787fdd..68a2af2 100644
--- a/drivers/net/ethernet/i825xx/lasi_82596.c
+++ b/drivers/net/ethernet/i825xx/lasi_82596.c
@@ -149,7 +149,7 @@ static void mpu_port(struct net_device *dev, int c, dma_addr_t x)
 
 #define LAN_PROM_ADDR	0xF0810000
 
-static int
+static int __init
 lan_init_chip(struct parisc_device *dev)
 {
 	struct	net_device *netdevice;
@@ -194,7 +194,7 @@ lan_init_chip(struct parisc_device *dev)
 	return retval;
 }
 
-static int lan_remove_chip(struct parisc_device *pdev)
+static int __exit lan_remove_chip(struct parisc_device *pdev)
 {
 	struct net_device *dev = parisc_get_drvdata(pdev);
 	struct i596_private *lp = netdev_priv(dev);
@@ -206,7 +206,7 @@ static int lan_remove_chip(struct parisc_device *pdev)
 	return 0;
 }
 
-static struct parisc_device_id lan_tbl[] = {
+static struct parisc_device_id lan_tbl[] __initconst = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008a },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00072 },
 	{ 0, }
@@ -214,11 +214,11 @@ static struct parisc_device_id lan_tbl[] = {
 
 MODULE_DEVICE_TABLE(parisc, lan_tbl);
 
-static struct parisc_driver lan_driver = {
+static struct parisc_driver lan_driver __refdata = {
 	.name		= "lasi_82596",
 	.id_table	= lan_tbl,
 	.probe		= lan_init_chip,
-	.remove         = lan_remove_chip,
+	.remove         = __exit_p(lan_remove_chip),
 };
 
 static int lasi_82596_init(void)
-- 
2.1.0

