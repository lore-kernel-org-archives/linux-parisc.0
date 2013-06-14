From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Fri, 14 Jun 2013 09:11:42 +0200
Message-ID: <20130614071142.GB10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

The LMMIO length reported by PAT and the length given by the LBA MASK
register are not consistent. This leads e.g. to a non-working ATI FireGL
card with the radeon DRM driver since the memory can't be mapped.

Fix this by correctly adjusting the resource sizes.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 1f05913..7dc0e40 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -994,6 +994,15 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		case PAT_LMMIO:
 			/* used to fix up pre-initialized MEM BARs */
 			if (!lba_dev->hba.lmmio_space.flags) {
+				unsigned long lba_len;
+				lba_len = ~READ_REG32(lba_dev->hba.base_addr
+						+ LBA_LMMIO_MASK);
+				if ((p->end - p->start) != lba_len) {
+					pr_warn("PCI%02x LMMIO mismatch between PAT length (0x%lx) and MASK register (0x%lx), fixing.\n",
+					  (int)lba_dev->hba.bus_num.start,
+						p->end - p->start, lba_len);
+					p->end = p->start + lba_len;
+				}
 				sprintf(lba_dev->hba.lmmio_name,
 						"PCI%02x LMMIO",
 						(int)lba_dev->hba.bus_num.start);
