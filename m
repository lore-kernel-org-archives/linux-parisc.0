From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 7/8] parisc: sba_iommu: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:25 +0530
Message-ID: <1503164546-31433-8-git-send-email-arvind.yadav.cs@gmail.com>
References: <1503164546-31433-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503164546-31433-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc_device_id are not supposed to change at runtime. All functions
working with parisc_device_id provided by <asm/parisc-device.h> work
with const parisc_device_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parisc/sba_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 4086f79..1bad85c 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1905,7 +1905,7 @@ static const struct file_operations sba_proc_bitmap_fops = {
 };
 #endif /* CONFIG_PROC_FS */
 
-static struct parisc_device_id sba_tbl[] = {
+static const struct parisc_device_id sba_tbl[] = {
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, ASTRO_RUNWAY_PORT, 0xb },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, IKE_MERCED_PORT, 0xc },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, REO_MERCED_PORT, 0xc },
-- 
2.7.4
