From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] parisc: parport_gsc: constify parisc_device_id
Date: Sat, 19 Aug 2017 22:38:41 +0530
Message-ID: <208280b55a359db78eecee720799955f2043fb49.1503162439.git.arvind.yadav.cs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de, sudipm.mukherjee@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc_device_id are not supposed to change at runtime. All functions
working with parisc_device_id provided by <asm/parisc-device.h> work
with
const parisc_device_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parport/parport_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 3858b87..8be1a0c 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -403,7 +403,7 @@ static int parport_remove_chip(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id parport_tbl[] = {
+static const struct parisc_device_id parport_tbl[] = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x74 },
 	{ 0, }
 };
-- 
2.7.4

