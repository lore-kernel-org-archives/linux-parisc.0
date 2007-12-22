From: rubisher <rubisher@scarlet.be>
Subject: iommu-helpers.h patch
Date: Sat, 22 Dec 2007 13:45:45 +0000
Message-ID: <476D1509.1070601@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello *,

This seems to be missed a while ago ;-)

--- drivers-parisc-iommu-helpers.h-git20071218	2007-12-21 19:02:38.000000000 +0000
+++ drivers-parisc-iommu-helpers.h-git20071218.new	2007-12-22 13:39:04.000000000 +0000
@@ -29,7 +29,7 @@
  		long size;

  		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
-			   (unsigned long)sg_dma_address(startsg), cnt,
+			   (unsigned long)sg_dma_address(startsg), size,
  			   sg_virt_addr(startsg), startsg->length
  		);
=== <> ===

Cheers,
	r.
