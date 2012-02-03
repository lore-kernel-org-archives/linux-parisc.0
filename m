From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: [Patch] parisc: include <linux/prefetch.h> in drivers/parisc/iommu-helpers.h
Date: Fri,  3 Feb 2012 15:34:16 +0800
Message-ID: <1328254456-15967-1-git-send-email-xiyou.wangcong@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	WANG Cong <xiyou.wangcong@gmail.com>,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

drivers/parisc/iommu-helpers.h:62: error: implicit declaration of function 'prefetchw'
make[3]: *** [drivers/parisc/sba_iommu.o] Error 1

drivers/parisc/iommu-helpers.h needs to #include <linux/prefetch.h>
where prefetchw is declared.

Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>

---
diff --git a/drivers/parisc/iommu-helpers.h b/drivers/parisc/iommu-helpers.h
index a9c46cc..460aed9 100644
--- a/drivers/parisc/iommu-helpers.h
+++ b/drivers/parisc/iommu-helpers.h
@@ -1,3 +1,5 @@
+#include <linux/prefetch.h>
+
 /**
  * iommu_fill_pdir - Insert coalesced scatter/gather chunks into the I/O Pdir.
  * @ioc: The I/O Controller.
