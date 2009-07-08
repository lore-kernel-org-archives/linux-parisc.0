From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: [PATCH 26/44] includecheck fix: drivers/parisc, ccio-dma.c
Date: Wed, 08 Jul 2009 20:57:20 +0530
Message-ID: <1247066840.4382.74.camel@ht.satnam>
References: <1247063308.4382.12.camel@ht.satnam>
Mime-Version: 1.0
Content-Type: text/plain
To: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org,
	Sam Ravnborg <sam@ravnborg.org>,
	LKML <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1247063308.4382.12.camel@ht.satnam>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


fix the following 'make includecheck' warning:

  drivers/parisc/ccio-dma.c: linux/proc_fs.h is included more than once.

Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
---
 drivers/parisc/ccio-dma.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 0f0e0b9..a45b0c0 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -70,7 +70,6 @@
 #undef CCIO_COLLECT_STATS
 #endif
 
-#include <linux/proc_fs.h>
 #include <asm/runway.h>		/* for proc_runway_root */
 
 #ifdef DEBUG_CCIO_INIT
-- 
1.6.0.6



