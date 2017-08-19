From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 6/8] parisc: lba_pci: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:24 +0530
Message-ID: <1503164546-31433-7-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/lba_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index bc286cb..9d6179e 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1613,7 +1613,7 @@ lba_driver_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id lba_tbl[] = {
+static const struct parisc_device_id lba_tbl[] = {
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, ELROY_HVERS, 0xa },
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, MERCURY_HVERS, 0xa },
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, QUICKSILVER_HVERS, 0xa },
-- 
2.7.4
