From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 15/16] drivers/parisc/pdc_stable.c: use WARN
Date: Sat,  3 Nov 2012 11:58:36 +0100
Message-ID: <1351940317-14812-16-git-send-email-Julia.Lawall@lip6.fr>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/parisc/pdc_stable.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 246a92f..0f54ab6 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -212,12 +212,10 @@ pdcspath_store(struct pdcspath_entry *entry)
 			entry, devpath, entry->addr);
 
 	/* addr, devpath and count must be word aligned */
-	if (pdc_stable_write(entry->addr, devpath, sizeof(*devpath)) != PDC_OK) {
-		printk(KERN_ERR "%s: an error occurred when writing to PDC.\n"
+	if (pdc_stable_write(entry->addr, devpath, sizeof(*devpath)) != PDC_OK)
+		WARN(1, KERN_ERR "%s: an error occurred when writing to PDC.\n"
 				"It is likely that the Stable Storage data has been corrupted.\n"
 				"Please check it carefully upon next reboot.\n", __func__);
-		WARN_ON(1);
-	}
 		
 	/* kobject is already registered */
 	entry->ready = 2;

