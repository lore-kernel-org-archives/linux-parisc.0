From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] kobject: Read buffer overflow
Date: Sun, 02 Aug 2009 10:02:28 +0200
Message-ID: <4A754814.50506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Check whether index is within bounds before testing the element.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
This also removes the likely, should it be kept?

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index f9f9a5f..13a64bc 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -370,7 +370,7 @@ pdcspath_layer_read(struct pdcspath_entry *entry, char *buf)
 	if (!i)	/* entry is not ready */
 		return -ENODATA;
 	
-	for (i = 0; devpath->layers[i] && (likely(i < 6)); i++)
+	for (i = 0; i < 6 && devpath->layers[i]; i++)
 		out += sprintf(out, "%u ", devpath->layers[i]);
 
 	out += sprintf(out, "\n");
