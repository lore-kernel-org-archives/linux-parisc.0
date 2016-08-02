From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0815/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:49:08 +0800
Message-ID: <20160802114908.4299-1-baolex.ni@intel.com>
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
 drivers/parisc/sba_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 42ec460..416fa51 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -113,7 +113,7 @@ static unsigned long piranha_bad_128k = 0;
 
 #ifdef SBA_AGP_SUPPORT
 static int sba_reserve_agpgart = 1;
-module_param(sba_reserve_agpgart, int, 0444);
+module_param(sba_reserve_agpgart, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(sba_reserve_agpgart, "Reserve half of IO pdir as AGPGART");
 #endif
 
-- 
2.9.2

