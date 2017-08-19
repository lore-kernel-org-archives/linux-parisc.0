From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 2/8] parisc: ccio: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:20 +0530
Message-ID: <1503164546-31433-3-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/ccio-rm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/ccio-rm-dma.c b/drivers/parisc/ccio-rm-dma.c
index 1bf9880..fc8fbb5 100644
--- a/drivers/parisc/ccio-rm-dma.c
+++ b/drivers/parisc/ccio-rm-dma.c
@@ -184,7 +184,7 @@ ccio_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id ccio_tbl[] = {
+static const struct parisc_device_id ccio_tbl[] = {
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, U2_BC_GSC, 0xc },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, UTURN_BC_GSC, 0xc },
 	{ 0, }
-- 
2.7.4
