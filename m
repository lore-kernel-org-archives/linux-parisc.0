From: Helge Deller <deller@gmx.de>
Subject: [PATCH 13/14] parisc/ipmi_si_intf: Fix section mismatches on parisc platform
Date: Mon, 21 Aug 2017 22:23:00 +0200
Message-ID: <1503346981-28024-14-git-send-email-deller@gmx.de>
References: <1503346981-28024-1-git-send-email-deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1503346981-28024-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Additionally add a MODULE_DEVICE_TABLE entry so that udev
can load the driver automatically.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/char/ipmi/ipmi_si_intf.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 9859738..36f47e8 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2812,7 +2812,7 @@ static struct platform_driver ipmi_driver = {
 };
 
 #ifdef CONFIG_PARISC
-static int ipmi_parisc_probe(struct parisc_device *dev)
+static int __init ipmi_parisc_probe(struct parisc_device *dev)
 {
 	struct smi_info *info;
 	int rv;
@@ -2850,22 +2850,24 @@ static int ipmi_parisc_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static int ipmi_parisc_remove(struct parisc_device *dev)
+static int __exit ipmi_parisc_remove(struct parisc_device *dev)
 {
 	cleanup_one_si(dev_get_drvdata(&dev->dev));
 	return 0;
 }
 
-static const struct parisc_device_id ipmi_parisc_tbl[] = {
+static const struct parisc_device_id ipmi_parisc_tbl[] __initconst = {
 	{ HPHW_MC, HVERSION_REV_ANY_ID, 0x004, 0xC0 },
 	{ 0, }
 };
 
-static struct parisc_driver ipmi_parisc_driver = {
+MODULE_DEVICE_TABLE(parisc, ipmi_parisc_tbl);
+
+static struct parisc_driver ipmi_parisc_driver __refdata = {
 	.name =		"ipmi",
 	.id_table =	ipmi_parisc_tbl,
 	.probe =	ipmi_parisc_probe,
-	.remove =	ipmi_parisc_remove,
+	.remove =	__exit_p(ipmi_parisc_remove),
 };
 #endif /* CONFIG_PARISC */
 
-- 
2.1.0

