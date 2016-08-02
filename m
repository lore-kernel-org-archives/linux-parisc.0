From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0814/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:49:03 +0800
Message-ID: <20160802114904.4233-1-baolex.ni@intel.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, baolex.ni@intel.com, arnd@arndb.de
To: jejb@parisc-linux.org, deller@gmx.de, Allen.Hubbe@emc.com,
	rjui@broadcom.com, sbranden@broadcom.com, m.chehab@samsung.com,
	pawel@osciak.com, m.szyprowski@samsung.com,
	kyungmin.park@samsung.com, k.kozlowski@samsung.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/parisc/pdc_stable.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 3651c38..0cb008f 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -487,8 +487,8 @@ static const struct sysfs_ops pdcspath_attr_ops = {
 };
 
 /* These are the two attributes of any PDC path. */
-static PATHS_ATTR(hwpath, 0644, pdcspath_hwpath_read, pdcspath_hwpath_write);
-static PATHS_ATTR(layer, 0644, pdcspath_layer_read, pdcspath_layer_write);
+static PATHS_ATTR(hwpath, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, pdcspath_hwpath_read, pdcspath_hwpath_write);
+static PATHS_ATTR(layer, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, pdcspath_layer_read, pdcspath_layer_write);
 
 static struct attribute *paths_subsys_attrs[] = {
 	&paths_attr_hwpath.attr,
@@ -931,15 +931,15 @@ static ssize_t pdcs_osdep2_write(struct kobject *kobj,
 }
 
 /* The remaining attributes. */
-static PDCS_ATTR(size, 0444, pdcs_size_read, NULL);
-static PDCS_ATTR(autoboot, 0644, pdcs_autoboot_read, pdcs_autoboot_write);
-static PDCS_ATTR(autosearch, 0644, pdcs_autosearch_read, pdcs_autosearch_write);
-static PDCS_ATTR(timer, 0444, pdcs_timer_read, NULL);
-static PDCS_ATTR(osid, 0444, pdcs_osid_read, NULL);
-static PDCS_ATTR(osdep1, 0600, pdcs_osdep1_read, pdcs_osdep1_write);
-static PDCS_ATTR(diagnostic, 0400, pdcs_diagnostic_read, NULL);
-static PDCS_ATTR(fastsize, 0400, pdcs_fastsize_read, NULL);
-static PDCS_ATTR(osdep2, 0600, pdcs_osdep2_read, pdcs_osdep2_write);
+static PDCS_ATTR(size, S_IRUSR | S_IRGRP | S_IROTH, pdcs_size_read, NULL);
+static PDCS_ATTR(autoboot, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, pdcs_autoboot_read, pdcs_autoboot_write);
+static PDCS_ATTR(autosearch, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, pdcs_autosearch_read, pdcs_autosearch_write);
+static PDCS_ATTR(timer, S_IRUSR | S_IRGRP | S_IROTH, pdcs_timer_read, NULL);
+static PDCS_ATTR(osid, S_IRUSR | S_IRGRP | S_IROTH, pdcs_osid_read, NULL);
+static PDCS_ATTR(osdep1, S_IRUSR | S_IWUSR, pdcs_osdep1_read, pdcs_osdep1_write);
+static PDCS_ATTR(diagnostic, S_IRUSR, pdcs_diagnostic_read, NULL);
+static PDCS_ATTR(fastsize, S_IRUSR, pdcs_fastsize_read, NULL);
+static PDCS_ATTR(osdep2, S_IRUSR | S_IWUSR, pdcs_osdep2_read, pdcs_osdep2_write);
 
 static struct attribute *pdcs_subsys_attrs[] = {
 	&pdcs_attr_size.attr,
-- 
2.9.2

