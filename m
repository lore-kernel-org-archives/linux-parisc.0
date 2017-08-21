From: Helge Deller <deller@gmx.de>
Subject: [PATCH 02/14] parisc/harmony: Fix section mismatches
Date: Mon, 21 Aug 2017 22:22:49 +0200
Message-ID: <1503346981-28024-3-git-send-email-deller@gmx.de>
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
 sound/parisc/harmony.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index 5911eb3..fc68c1c 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -66,7 +66,7 @@ module_param(id, charp, 0444);
 MODULE_PARM_DESC(id, "ID string for Harmony driver.");
 
 
-static struct parisc_device_id snd_harmony_devtable[] = {
+static struct parisc_device_id snd_harmony_devtable[] __initconst = {
 	/* bushmaster / flounder */
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007A }, 
 	/* 712 / 715 */
@@ -960,7 +960,7 @@ snd_harmony_create(struct snd_card *card,
 	return err;
 }
 
-static int
+static int __init
 snd_harmony_probe(struct parisc_device *padev)
 {
 	int err;
@@ -1000,18 +1000,18 @@ snd_harmony_probe(struct parisc_device *padev)
 	return err;
 }
 
-static int
+static int __exit
 snd_harmony_remove(struct parisc_device *padev)
 {
 	snd_card_free(parisc_get_drvdata(padev));
 	return 0;
 }
 
-static struct parisc_driver snd_harmony_driver = {
+static struct parisc_driver snd_harmony_driver __refdata = {
 	.name = "harmony",
 	.id_table = snd_harmony_devtable,
 	.probe = snd_harmony_probe,
-	.remove = snd_harmony_remove,
+	.remove = __exit_p(snd_harmony_remove),
 };
 
 static int __init 
-- 
2.1.0

