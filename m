From: Helge Deller <deller@gmx.de>
Subject: agp: parisc-agp.c - use correct page_mask function
Date: Sun, 27 Sep 2009 23:13:04 +0200
Message-ID: <4ABFD560.9080302@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: David Woodhouse <David.Woodhouse@intel.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	David Airlie <airlied@linux.ie>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This commit:

Commit 2a4ceb6d3e6a566cb4a9dc8f974177f031d27cd7
Author: David Woodhouse <David.Woodhouse@intel.com>
Date:   Mon Jul 27 10:27:29 2009 +0100
     agp: Switch mask_memory() method to take address argument again, not page

broke the parisc AGP driver (again). This patch fixes it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index 60ab751..1c12921 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -217,7 +217,7 @@ static const struct agp_bridge_driver parisc_agp_driver = {
  	.configure		= parisc_agp_configure,
  	.fetch_size		= parisc_agp_fetch_size,
  	.tlb_flush		= parisc_agp_tlbflush,
-	.mask_memory		= parisc_agp_page_mask_memory,
+	.mask_memory		= parisc_agp_mask_memory,
  	.masks			= parisc_agp_masks,
  	.agp_enable		= parisc_agp_enable,
  	.cache_flush		= global_cache_flush,
