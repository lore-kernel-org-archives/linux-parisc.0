From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: pdc_stable.c: Avoid potential stack overflows
Date: Mon, 22 Sep 2014 20:27:23 +0200
Message-ID: <20140922182723.GA1248@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index e4b73c2..3651c38 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -278,7 +278,7 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
 {
 	struct hardware_path hwpath;
 	unsigned short i;
-	char in[count+1], *temp;
+	char in[64], *temp;
 	struct device *dev;
 	int ret;
 
@@ -286,8 +286,9 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
 		return -EINVAL;
 
 	/* We'll use a local copy of buf */
-	memset(in, 0, count+1);
+	count = min_t(size_t, count, sizeof(in)-1);
 	strncpy(in, buf, count);
+	in[count] = '\0';
 	
 	/* Let's clean up the target. 0xff is a blank pattern */
 	memset(&hwpath, 0xff, sizeof(hwpath));
@@ -393,14 +394,15 @@ pdcspath_layer_write(struct pdcspath_entry *entry, const char *buf, size_t count
 {
 	unsigned int layers[6]; /* device-specific info (ctlr#, unit#, ...) */
 	unsigned short i;
-	char in[count+1], *temp;
+	char in[64], *temp;
 
 	if (!entry || !buf || !count)
 		return -EINVAL;
 
 	/* We'll use a local copy of buf */
-	memset(in, 0, count+1);
+	count = min_t(size_t, count, sizeof(in)-1);
 	strncpy(in, buf, count);
+	in[count] = '\0';
 	
 	/* Let's clean up the target. 0 is a blank pattern */
 	memset(&layers, 0, sizeof(layers));
@@ -765,7 +767,7 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
 		return -EINVAL;
 
 	/* We'll use a local copy of buf */
-	count = min_t(size_t, count, 7);
+	count = min_t(size_t, count, sizeof(in)-1);
 	strncpy(in, buf, count);
 	in[count] = '\0';
 
