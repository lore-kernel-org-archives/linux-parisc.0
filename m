From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 2/2] serial: 8250_gsc: fix printk format warning
Date: Mon, 18 May 2009 17:11:31 +0400
Message-ID: <1242652291-1868-1-git-send-email-a.beregalov@gmail.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
To: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alan@lxorguk.ukuu.org.uk
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix this build warning:
drivers/serial/8250_gsc.c:44: warning: format '%lx' expects type
'long unsigned int', but argument 2 has type 'resource_size_t'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/serial/8250_gsc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/8250_gsc.c b/drivers/serial/8250_gsc.c
index 418b4fe..a7b02a5 100644
--- a/drivers/serial/8250_gsc.c
+++ b/drivers/serial/8250_gsc.c
@@ -41,7 +41,7 @@ static int __init serial_init_chip(struct parisc_device *dev)
 			printk(KERN_INFO
 				"Serial: device 0x%lx not configured.\n"
 				"Enable support for Wax, Lasi, Asp or Dino.\n",
-				dev->hpa.start);
+				(unsigned long)dev->hpa.start);
 		return -ENODEV;
 	}
 
-- 
1.6.2.5

