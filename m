From: Jeff Liu <jeff.liu@oracle.com>
Subject: [PATCH 12/24] drivers/parisc: return actual error on pdc_stable_init
Date: Tue, 17 Jun 2014 22:30:57 +0800
Message-ID: <53A05121.1040100@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: JBottomley@parallels.com, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Jie Liu <jeff.liu@oracle.com>

Return the actual error code than ENOMEM if call kset_create_and_add()
failed at pdc_stable_init().

Cc: James E.J. Bottomley <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Jie Liu <jeff.liu@oracle.com>
---
 drivers/parisc/pdc_stable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 0f54ab6..3daca50 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -1065,8 +1065,8 @@ pdc_stable_init(void)
 
 	/* register the paths kset as a child of the stable kset */
 	paths_kset = kset_create_and_add("paths", NULL, stable_kobj);
-	if (!paths_kset) {
-		rc = -ENOMEM;
+	if (IS_ERR(paths_kset)) {
+		rc = PTR_ERR(paths_kset);
 		goto fail_ksetreg;
 	}
 
-- 
1.8.3.2
