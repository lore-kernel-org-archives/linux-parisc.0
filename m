From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 4/8] parisc: hppb: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:22 +0530
Message-ID: <1503164546-31433-5-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/hppb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/hppb.c b/drivers/parisc/hppb.c
index 898208e..261f826 100644
--- a/drivers/parisc/hppb.c
+++ b/drivers/parisc/hppb.c
@@ -81,7 +81,7 @@ static int hppb_probe(struct parisc_device *dev)
         return 0;
 }
 
-static struct parisc_device_id hppb_tbl[] = {
+static const struct parisc_device_id hppb_tbl[] = {
         { HPHW_BCPORT, HVERSION_REV_ANY_ID, 0x500, 0xc }, /* E25 and K */
         { HPHW_BCPORT, 0x0, 0x501, 0xc }, /* E35 */
         { HPHW_BCPORT, 0x0, 0x502, 0xc }, /* E45 */
-- 
2.7.4
