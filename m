From: Helge Deller <deller@gmx.de>
Subject: [PATCH 03/14] parisc/sticore: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:50 +0200
Message-ID: <1503346981-28024-4-git-send-email-deller@gmx.de>
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
 drivers/video/console/sticore.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 7da1ad0..d1d3796 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -281,7 +281,7 @@ static void sti_rom_copy(unsigned long base, unsigned long count, void *dest)
 static char default_sti_path[21] __read_mostly;
 
 #ifndef MODULE
-static int sti_setup(char *str)
+static int __init sti_setup(char *str)
 {
 	if (str)
 		strlcpy (default_sti_path, str, sizeof (default_sti_path));
@@ -941,7 +941,7 @@ static void sticore_check_for_default_sti(struct sti_struct *sti, char *path)
  * in the additional address field addr[1] while on
  * older Systems the PDC stores it in page0->proc_sti 
  */
-static int sticore_pa_init(struct parisc_device *dev)
+static int __init sticore_pa_init(struct parisc_device *dev)
 {
 	char pa_path[21];
 	struct sti_struct *sti = NULL;
@@ -1009,7 +1009,7 @@ static int sticore_pci_init(struct pci_dev *pd, const struct pci_device_id *ent)
 }
 
 
-static void sticore_pci_remove(struct pci_dev *pd)
+static void __exit sticore_pci_remove(struct pci_dev *pd)
 {
 	BUG();
 }
@@ -1029,7 +1029,7 @@ static struct pci_driver pci_sti_driver = {
 	.name		= "sti",
 	.id_table	= sti_pci_tbl,
 	.probe		= sticore_pci_init,
-	.remove		= sticore_pci_remove,
+	.remove		= __exit_p(sticore_pci_remove),
 };
 
 static struct parisc_device_id sti_pa_tbl[] = {
@@ -1037,8 +1037,9 @@ static struct parisc_device_id sti_pa_tbl[] = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00085 },
 	{ 0, }
 };
+MODULE_DEVICE_TABLE(parisc, sti_pa_tbl);
 
-static struct parisc_driver pa_sti_driver = {
+static struct parisc_driver pa_sti_driver __refdata = {
 	.name		= "sti",
 	.id_table	= sti_pa_tbl,
 	.probe		= sticore_pa_init,
-- 
2.1.0

