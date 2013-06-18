From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Tue, 18 Jun 2013 23:21:25 +0200
Message-ID: <20130618212125.GA20423@p100.box>
References: <20130614071142.GB10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130614071142.GB10443@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Helge Deller <deller@gmx.de>:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> The LMMIO length reported by PAT and the length given by the LBA MASK
> register are not consistent. This leads e.g. to a non-working ATI FireGL
> card with the radeon DRM driver since the memory can't be mapped.
> 
> Fix this by correctly adjusting the resource sizes.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

This is an updated/cleaner approach to this problem.
Still I want some more testing on it with various machines.

Basically we now extend the LMMIO range up to 256MB above the initial
start of the region if the value of the MASK register seems to allow it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 1f05913..acc3fe8 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -613,6 +613,46 @@ truncate_pat_collision(struct resource *root, struct resource *new)
 	return 0;	/* truncation successful */
 }
 
+/*
+ * extend_lmmio_len: extend lmmio range to maximum length
+ */
+static unsigned long
+extend_lmmio_len(unsigned long start, unsigned long end, unsigned long lba_len)
+{
+	struct resource *tmp;
+
+	pr_debug("LMMIO mismatch: PAT length = 0x%lx, MASK register = 0x%lx\n",
+		end - start, lba_len);
+
+	lba_len = min(lba_len+1, 256UL*1024*1024); /* limit to 256 MB */
+
+	pr_info("LBA: lmmio_space [0x%lx-0x%lx] - original\n", start, end);
+
+	end += lba_len;
+	if (end < start) /* fix overflow */
+		end = -1ULL;
+
+	pr_debug("LBA: lmmio_space [0x%lx-0x%lx] - current\n", start, end);
+
+	/* first overlap */
+	for (tmp = iomem_resource.child; tmp; tmp = tmp->sibling) {
+		pr_debug("LBA: testing %pR\n", tmp);
+		if (tmp->start == start)
+			continue; /* ignore ourself */
+		if (tmp->end < start)
+			continue;
+		if (tmp->start > end)
+			continue;
+		if (end >= tmp->start)
+			end = tmp->start - 1;
+	}
+
+	pr_info("LBA: lmmio_space [0x%lx-0x%lx] - new\n", start, end);
+
+	/* return new end */
+	return end;
+}
+
 #else
 #define truncate_pat_collision(r,n)  (0)
 #endif
@@ -994,6 +1034,14 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		case PAT_LMMIO:
 			/* used to fix up pre-initialized MEM BARs */
 			if (!lba_dev->hba.lmmio_space.flags) {
+				unsigned long lba_len;
+
+				lba_len = ~READ_REG32(lba_dev->hba.base_addr
+						+ LBA_LMMIO_MASK);
+				if ((p->end - p->start) != lba_len)
+					p->end = extend_lmmio_len(p->start,
+						p->end, lba_len);
+
 				sprintf(lba_dev->hba.lmmio_name,
 						"PCI%02x LMMIO",
 						(int)lba_dev->hba.bus_num.start);
