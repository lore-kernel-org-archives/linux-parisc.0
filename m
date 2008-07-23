From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: drivers/parisc/ccio-dma.c: Removed duplicated include
Date: Wed, 23 Jul 2008 22:45:11 +0800
Message-ID: <20080723222729.943A.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Removed duplicated include file <linux/proc_fs.h> in 
drivers/parisc/ccio-dma.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b30e38f..fc1dd6d 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -77,7 +77,6 @@
 #undef CCIO_MAP_STATS
 #endif

-#include <linux/proc_fs.h>
 #include <asm/runway.h>                /* for proc_runway_root */

 #ifdef DEBUG_CCIO_INIT


