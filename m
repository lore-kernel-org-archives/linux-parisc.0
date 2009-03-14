From: Kyle McMartin <kyle@infradead.org>
Subject: [PATCH] parisc: sba_iommu: fix build bug when CONFIG_PARISC_AGP=y
Date: Sat, 14 Mar 2009 19:40:59 -0400
Message-ID: <20090314234059.GE3167@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Kyle McMartin <kyle@mcmartin.ca>

  CC      drivers/parisc/sba_iommu.o
drivers/parisc/sba_iommu.c:1373: error: expected identifier or '('
before '}' token
make[2]: *** [drivers/parisc/sba_iommu.o] Error 1
make[1]: *** [drivers/parisc] Error 2
make: *** [drivers] Error 2

Don't know how this has gone missed for so long... clearly I need
to do builds on my C8000 more often.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 6aad854..e5999c4 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1367,9 +1367,7 @@ sba_ioc_init_pluto(struct parisc_device *sba, struct ioc *ioc, int ioc_num)
 		ioc->pdir_size /= 2;
 		ioc->pdir_base[PDIR_INDEX(iova_space_size/2)] = SBA_AGPGART_COOKIE;
 	}
-}
 #endif /*SBA_AGP_SUPPORT*/
