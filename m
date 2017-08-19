From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 1/8] parisc: asp: constify parisc_device_id
Date: Sat, 19 Aug 2017 23:12:19 +0530
Message-ID: <1503164546-31433-2-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/parisc/asp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/asp.c b/drivers/parisc/asp.c
index 6a1ab25..4ad32e1 100644
--- a/drivers/parisc/asp.c
+++ b/drivers/parisc/asp.c
@@ -118,7 +118,7 @@ static int __init asp_init_chip(struct parisc_device *dev)
 	return ret;
 }
 
-static struct parisc_device_id asp_tbl[] = {
+static const struct parisc_device_id asp_tbl[] = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00070 },
 	{ 0, }
 };
-- 
2.7.4
