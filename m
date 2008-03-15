From: rubisher <rubisher@scarlet.be>
Subject: Re: panic in iommu_is_span_boundary with 32-bit kernel on c3750
Date: Sat, 15 Mar 2008 12:01:37 +0000
Message-ID: <47DBBAA1.4020102@scarlet.be>
References: <20080314233156.E0DAB4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080314233156.E0DAB4E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> Kyle's tree (vmlinux-2.6.25-rc4-01283-gef95dd8) panics on my c3750 at
> iommu_is_span_boundary+0x28.  Looking at the code, I see the panic is
> caused by a call with r23 = 0.  The call is from sba_alloc_range.  The
> actual call appears to be from an inlined copy of sba_search_bitmap.
> It seems that boundary_size must be 0.
> 
> Should there be a check in sba_search_bitmap, or is the problem
> deeper in dma_get_seg_boundary?
> 
> Dave

Yes Kyle tree doesn't yet include the latest patch of Fujita Tomonori?

Here it was:

Really sorry about the bug. Can you try the following patch? It's on
the top of the patchset.

Thanks,

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 2f3b364..d0855a1 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -366,8 +366,8 @@ ccio_alloc_range(struct ioc *ioc, struct device *dev, size_t size)
  	** ggg sacrifices another 710 to the computer gods.
  	*/

-	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1, 1 << IOVP_SHIFT);
-	boundary_size >>= IOVP_SHIFT;
+	boundary_size = ALIGN((unsigned long long)dma_get_seg_boundary(dev) + 1,
+			      1ULL << IOVP_SHIFT) >> IOVP_SHIFT;

  	if (pages_needed <= 8) {
  		/*
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index e834127..bdbe780 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -341,8 +341,8 @@ sba_search_bitmap(struct ioc *ioc, struct device *dev,
  	unsigned long shift;
  	int ret;

-	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1, 1 << IOVP_SHIFT);
-	boundary_size >>= IOVP_SHIFT;
+	boundary_size = ALIGN((unsigned long long)dma_get_seg_boundary(dev) + 1,
+			      1ULL << IOVP_SHIFT) >> IOVP_SHIFT;

  #if defined(ZX1_SUPPORT)
  	BUG_ON(ioc->ibase & ~IOVP_MASK);
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

It works to me on c110, d380, b2k (32bit kernels) and b2k 64bit kernel.

Hth,
	r.
