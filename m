From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 3/8] parisc: dino: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:21 +0530
Message-ID: <1503164546-31433-4-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/dino.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 5c63b92..19c5c9a 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -1022,7 +1022,7 @@ static int __init dino_probe(struct parisc_device *dev)
  * and 725 firmware misreport it as 0x08080 for no adequately explained
  * reason.
  */
-static struct parisc_device_id dino_tbl[] = {
+static const struct parisc_device_id dino_tbl[] = {
 	{ HPHW_A_DMA, HVERSION_REV_ANY_ID, 0x004, 0x0009D },/* Card-mode Dino */
 	{ HPHW_A_DMA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x08080 }, /* XXX */
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, 0x680, 0xa }, /* Bridge-mode Dino */
-- 
2.7.4
