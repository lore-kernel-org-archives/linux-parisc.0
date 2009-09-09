From: James Bottomley <James.Bottomley@suse.de>
Subject: [PATCH 5/5] xfs: fix xfs to work with Virtually Indexed
 architectures
Date: Wed, 09 Sep 2009 03:21:58 +0000
Message-ID: <1252466518.13003.373.camel@mulgrave.site>
References: <1252434469.13003.3.camel@mulgrave.site>
	 <20090908190031.GF6538@flint.arm.linux.org.uk>
	 <1252437112.13003.39.camel@mulgrave.site>
	 <20090908201619.GG6538@flint.arm.linux.org.uk>
	 <1252442352.13003.132.camel@mulgrave.site>
	 <20090908213910.GH6538@flint.arm.linux.org.uk>
	 <1252466070.13003.365.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	Linux Filesystem Mailing List <linux-fsdevel@vger.kernel.org>,
	linux-arch@vger.kernel.org, Christoph Hellwig <hch@lst.de>
To: Russell King <rmk@arm.linux.org.uk>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1252466070.13003.365.camel@mulgrave.site>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

xfs_buf.c includes what is essentially a hand rolled version of
blk_rq_map_kern().  In order to work properly with the vmalloc buffers
that xfs uses, this hand rolled routine must also implement the flushing
API for vmap/vmalloc areas.

Signed-off-by: James Bottomley <James.Bottomley@suse.de>
---
 fs/xfs/linux-2.6/xfs_buf.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_buf.c b/fs/xfs/linux-2.6/xfs_buf.c
index 965df12..62ae977 100644
--- a/fs/xfs/linux-2.6/xfs_buf.c
+++ b/fs/xfs/linux-2.6/xfs_buf.c
@@ -1138,6 +1138,10 @@ xfs_buf_bio_end_io(
 	do {
 		struct page	*page = bvec->bv_page;
 
+		if (is_vmalloc_addr(bp->b_addr))
+			invalidate_kernel_dcache_addr(bp->b_addr +
+						      bvec->bv_offset);
+
 		ASSERT(!PagePrivate(page));
 		if (unlikely(bp->b_error)) {
 			if (bp->b_flags & XBF_READ)
@@ -1202,6 +1206,9 @@ _xfs_buf_ioapply(
 		bio->bi_end_io = xfs_buf_bio_end_io;
 		bio->bi_private = bp;
 
+		if (is_vmalloc_addr(bp->b_addr))
+			flush_kernel_dcache_addr(bp->b_addr);
+
 		bio_add_page(bio, bp->b_pages[0], PAGE_CACHE_SIZE, 0);
 		size = 0;
 
@@ -1228,6 +1235,9 @@ next_chunk:
 		if (nbytes > size)
 			nbytes = size;
 
+		if (is_vmalloc_addr(bp->b_addr))
+			flush_kernel_dcache_addr(bp->b_addr + PAGE_SIZE*map_i);
+
 		rbytes = bio_add_page(bio, bp->b_pages[map_i], nbytes, offset);
 		if (rbytes < nbytes)
 			break;
-- 
1.6.3.3
