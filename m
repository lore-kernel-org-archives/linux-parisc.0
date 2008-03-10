From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] make ptr_to_pide() static
Date: Mon, 10 Mar 2008 20:43:24 +0900
Message-ID: <20080310204320Z.tomof@acm.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: kyle@parisc-linux.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sorry, I should have made ptr_to_pide() static.

=
From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH] make ptr_to_pide() static

Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
---
 drivers/parisc/sba_iommu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index e834127..a8b7699 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -314,8 +314,8 @@ sba_dump_sg( struct ioc *ioc, struct scatterlist *startsg, int nents)
 #define RESMAP_MASK(n)    (~0UL << (BITS_PER_LONG - (n)))
 #define RESMAP_IDX_MASK   (sizeof(unsigned long) - 1)
 
-unsigned long ptr_to_pide(struct ioc *ioc, unsigned long *res_ptr,
-			  unsigned int bitshiftcnt)
+static unsigned long ptr_to_pide(struct ioc *ioc, unsigned long *res_ptr,
+				 unsigned int bitshiftcnt)
 {
 	return (((unsigned long)res_ptr - (unsigned long)ioc->res_map) << 3)
 		+ bitshiftcnt;
-- 
1.5.3.7

