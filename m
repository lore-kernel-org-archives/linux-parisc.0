From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 81/86] input/serio: drop pci_ids dependency
Date: Sun, 29 Mar 2015 15:43:18 +0200
Message-ID: <1427635734-24786-82-git-send-email-mst@redhat.com>
References: <1427635734-24786-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-parisc@vger.kernel.org, linux-input@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1427635734-24786-1-git-send-email-mst@redhat.com>
List-ID: <linux-input.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This driver does not use any PCI IDs, don't include
the pci_ids.h header.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/input/serio/gscps2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index b7d0854..ecba666 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -31,7 +31,6 @@
 #include <linux/spinlock.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
-#include <uapi/linux/pci_ids.h>
 
 #include <asm/irq.h>
 #include <asm/io.h>
-- 
MST

