From: Stoyan Gaydarov <sgayda2@uiuc.edu>
Subject: [PATCH 3/4] [parisc] fixed faulty check
Date: Thu, 30 Jul 2009 05:25:19 -0500
Message-ID: <1248949519-20858-1-git-send-email-sgayda2@uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, deller@gmx.de,
	kyle@mcmartin.ca, grundler@parisc-linux.org,
	akpm@linux-foundation.org, achiang@hp.com, bunk@kernel.org,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752790AbZG3KZh@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patche fixes a spelling error that has resulted from copy and pasting. The location of the error was found using a semantic patch but the semantic patch was not trying to find these errors. After looking things over it seemed logical that this change was needed. Please review it and then include the patch if it is in fact the correct change.

Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
---
 drivers/parisc/lba_pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index ede6146..3aeb327 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -992,7 +992,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		return;
 
 	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
-	if (!pa_pdc_cell) {
+	if (!io_pdc_cell) {
 		kfree(pa_pdc_cell);
 		return;
 	}
-- 
1.6.3.3
