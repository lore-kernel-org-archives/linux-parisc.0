From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 5/8] parisc: lasi: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:23 +0530
Message-ID: <1503164546-31433-6-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/lasi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/lasi.c b/drivers/parisc/lasi.c
index e65727c..b77cf1e 100644
--- a/drivers/parisc/lasi.c
+++ b/drivers/parisc/lasi.c
@@ -227,7 +227,7 @@ static int __init lasi_init_chip(struct parisc_device *dev)
 	return ret;
 }
 
-static struct parisc_device_id lasi_tbl[] = {
+static const struct parisc_device_id lasi_tbl[] = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00081 },
 	{ 0, }
 };
-- 
2.7.4
