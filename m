Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id E80C94857
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 23:36:14 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i236aQa04396; Wed, 3 Mar 2004 01:36:26 -0500
Subject: Re: [parisc-linux] experimental patch to Fix CCIO virtual merging
From: James Bottomley <James.Bottomley@steeleye.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
In-Reply-To: <1078253092.1804.58.camel@mulgrave>
References: <1078253092.1804.58.camel@mulgrave>
Content-Type: text/plain
Date: 03 Mar 2004 00:36:09 -0600
Message-Id: <1078295770.1889.164.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-03-02 at 12:44, James Bottomley wrote:
> The algorithm the ccio currently uses to do virtual merging is rather
> non-optimal.  The attached patch fixes it to merge virtually whenever
> the adjacent I/O pieces begin and end on a page boundary, which produces
> much better merging.

This is cut two.  It actually seems to survive the BK test and build
it's own kernel, so it may be slightly safer than the bug ridden
previous version.

It also contains Grant's fix for the ccio resource management (and some
stats cleanups).

James

===== drivers/parisc/ccio-dma.c 1.15 vs edited =====
--- 1.15/drivers/parisc/ccio-dma.c	Tue Feb  3 23:42:34 2004
+++ edited/drivers/parisc/ccio-dma.c	Tue Mar  2 22:04:23 2004
@@ -41,6 +41,7 @@
 #define PCI_DEBUG
 #include <linux/pci.h>
 #undef PCI_DEBUG
+#include <linux/reboot.h>
 
 #include <asm/byteorder.h>
 #include <asm/cache.h>		/* for L1_CACHE_BYTES */
@@ -63,6 +64,18 @@
 #undef DEBUG_CCIO_INIT
 #undef DEBUG_CCIO_RUN_SG
 
+#ifdef CONFIG_PROC_FS
+/*
+ * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
+ * impacts performance though - ditch it if you don't use it.
+ */
+#define CCIO_SEARCH_TIME
+#undef CCIO_MAP_STATS
+#else
+#undef CCIO_SEARCH_TIME
+#undef CCIO_MAP_STATS
+#endif
+
 #include <linux/proc_fs.h>
 #include <asm/runway.h>		/* for proc_runway_root */
 
@@ -219,15 +232,18 @@
 	struct ioa_registers *ioc_hpa;  /* I/O MMU base address */
 	u8  *res_map;	                /* resource map, bit == pdir entry */
 	u64 *pdir_base;	                /* physical base address */
+	u32 pdir_size; 			/* bytes, function of IOV Space size */
 	u32 res_hint;	                /* next available IOVP - 
 					   circular search */
 	u32 res_size;		    	/* size of resource map in bytes */
 	spinlock_t res_lock;
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_SEARCH_TIME
 #define CCIO_SEARCH_SAMPLE 0x100
 	unsigned long avg_search[CCIO_SEARCH_SAMPLE];
 	unsigned long avg_idx;		  /* current index into avg_search */
+#endif
+#ifdef CCIO_MAP_STATS
 	unsigned long used_pages;
 	unsigned long msingle_calls;
 	unsigned long msingle_pages;
@@ -237,12 +253,10 @@
 	unsigned long usingle_pages;
 	unsigned long usg_calls;
 	unsigned long usg_pages;
-
-	unsigned short cujo20_bug;
 #endif
+	unsigned short cujo20_bug;
 
 	/* STUFF We don't need in performance path */
-	u32 pdir_size; 			/* in bytes, determined by IOV Space size */
 	u32 chainid_shift; 		/* specify bit location of chain_id */
 	struct ioc *next;		/* Linked list of discovered iocs */
 	const char *name;		/* device name from firmware */
@@ -289,11 +303,11 @@
 ** If the search wraps around, and passes the res_hint, it will
 ** cause the kernel to panic anyhow.
 */
-#define CCIO_SEARCH_LOOP(ioc, res_idx, mask_ptr, size)  \
+#define CCIO_SEARCH_LOOP(ioc, res_idx, mask, size)  \
        for(; res_ptr < res_end; ++res_ptr) { \
-               if(0 == (*res_ptr & *mask_ptr)) { \
-                       *res_ptr |= *mask_ptr; \
-                       res_idx = (int)((unsigned long)res_ptr - (unsigned long)ioc->res_map); \
+               if(0 == (*res_ptr & mask)) { \
+                       *res_ptr |= mask; \
+                       res_idx = (unsigned int)((unsigned long)res_ptr - (unsigned long)ioc->res_map); \
                        ioc->res_hint = res_idx + (size >> 3); \
                        goto resource_found; \
                } \
@@ -302,10 +316,9 @@
 #define CCIO_FIND_FREE_MAPPING(ioa, res_idx, mask, size) \
        u##size *res_ptr = (u##size *)&((ioc)->res_map[ioa->res_hint & ~((size >> 3) - 1)]); \
        u##size *res_end = (u##size *)&(ioc)->res_map[ioa->res_size]; \
-       u##size *mask_ptr = (u##size *)&mask; \
-       CCIO_SEARCH_LOOP(ioc, res_idx, mask_ptr, size); \
+       CCIO_SEARCH_LOOP(ioc, res_idx, mask, size); \
        res_ptr = (u##size *)&(ioc)->res_map[0]; \
-       CCIO_SEARCH_LOOP(ioa, res_idx, mask_ptr, size);
+       CCIO_SEARCH_LOOP(ioa, res_idx, mask, size);
 
 /*
 ** Find available bit in this ioa's resource map.
@@ -333,35 +346,45 @@
 static int
 ccio_alloc_range(struct ioc *ioc, unsigned long pages_needed)
 {
-	int res_idx;
-	unsigned long mask;
-#ifdef CONFIG_PROC_FS
+	unsigned int res_idx;
+#ifdef CCIO_SEARCH_TIME
 	unsigned long cr_start = mfctl(16);
 #endif
 	
 	ASSERT(pages_needed);
 	ASSERT((pages_needed * IOVP_SIZE) <= DMA_CHUNK_SIZE);
-	ASSERT(pages_needed <= BITS_PER_LONG);
-
-	mask = ~(~0UL >> pages_needed);
      
-	DBG_RES("%s() size: %d pages_needed %d mask 0x%08lx\n", 
-		__FUNCTION__, size, pages_needed, mask);
+	DBG_RES("%s() size: %d pages_needed %d\n", 
+		__FUNCTION__, size, pages_needed);
 
 	/*
 	** "seek and ye shall find"...praying never hurts either...
 	** ggg sacrifices another 710 to the computer gods.
 	*/
 
-	if(pages_needed <= 8) {
+	if (pages_needed <= 8) {
+		/*
+		 * LAN traffic will not thrash the TLB IFF the same NIC
+		 * uses 8 adjacent pages to map seperate payload data.
+		 * ie the same byte in the resource bit map.
+		 */
+#if 0
+		/* FIXME: bit search should shift it's way through
+		 * an unsigned long - not byte at a time. As it is now,
+		 * we effectively allocate this byte to this mapping.
+		 */
+		unsigned long mask = ~(~0UL >> pages_needed);
 		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 8);
-	} else if(pages_needed <= 16) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 16);
-	} else if(pages_needed <= 32) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 32);
+#else
+		CCIO_FIND_FREE_MAPPING(ioc, res_idx, 0xff, 8);
+#endif
+	} else if (pages_needed <= 16) {
+		CCIO_FIND_FREE_MAPPING(ioc, res_idx, 0xffff, 16);
+	} else if (pages_needed <= 32) {
+		CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~(unsigned int)0, 32);
 #ifdef __LP64__
-	} else if(pages_needed <= 64) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 64);
+	} else if (pages_needed <= 64) {
+		CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~0UL, 64);
 #endif
 	} else {
 		panic("%s: %s() Too many pages to map. pages_needed: %ld\n",
@@ -373,10 +396,10 @@
 	
 resource_found:
 	
-	DBG_RES("%s() res_idx %d mask 0x%08lx res_hint: %d\n",
-		__FUNCTION__, res_idx, mask, ioc->res_hint);
+	DBG_RES("%s() res_idx %d res_hint: %d\n",
+		__FUNCTION__, res_idx, ioc->res_hint);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_SEARCH_TIME
 	{
 		unsigned long cr_end = mfctl(16);
 		unsigned long tmp = cr_end - cr_start;
@@ -385,10 +408,10 @@
 	}
 	ioc->avg_search[ioc->avg_idx++] = cr_start;
 	ioc->avg_idx &= CCIO_SEARCH_SAMPLE - 1;
-
+#endif
+#ifdef CCIO_MAP_STATS
 	ioc->used_pages += pages_needed;
 #endif
-
 	/* 
 	** return the bit address.
 	*/
@@ -397,9 +420,8 @@
 
 #define CCIO_FREE_MAPPINGS(ioc, res_idx, mask, size) \
         u##size *res_ptr = (u##size *)&((ioc)->res_map[res_idx]); \
-	u##size *mask_ptr = (u##size *)&mask; \
-        ASSERT((*res_ptr & *mask_ptr) == *mask_ptr); \
-        *res_ptr &= ~(*mask_ptr);
+        ASSERT((*res_ptr & mask) == mask); \
+        *res_ptr &= ~(mask);
 
 /**
  * ccio_free_range - Free pages from the ioc's resource map.
@@ -413,7 +435,6 @@
 static void
 ccio_free_range(struct ioc *ioc, dma_addr_t iova, unsigned long pages_mapped)
 {
-	unsigned long mask;
 	unsigned long iovp = CCIO_IOVP(iova);
 	unsigned int res_idx = PDIR_INDEX(iovp) >> 3;
 
@@ -421,24 +442,28 @@
 	ASSERT((pages_mapped * IOVP_SIZE) <= DMA_CHUNK_SIZE);
 	ASSERT(pages_mapped <= BITS_PER_LONG);
 
-	mask = ~(~0UL >> pages_mapped);
-
-	DBG_RES("%s():  res_idx: %d pages_mapped %d mask 0x%08lx\n", 
-		__FUNCTION__, res_idx, pages_mapped, mask);
+	DBG_RES("%s():  res_idx: %d pages_mapped %d\n", 
+		__FUNCTION__, res_idx, pages_mapped);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 	ioc->used_pages -= pages_mapped;
 #endif
 
 	if(pages_mapped <= 8) {
+#if 0
+		/* see matching comments in alloc_range */
+		unsigned long mask = ~(~0UL >> pages_mapped);
 		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 8);
+#else
+		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xff, 8);
+#endif
 	} else if(pages_mapped <= 16) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 16);
+		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xffff, 16);
 	} else if(pages_mapped <= 32) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 32);
+		CCIO_FREE_MAPPINGS(ioc, res_idx, ~(unsigned int)0, 32);
 #ifdef __LP64__
 	} else if(pages_mapped <= 64) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 64);
+		CCIO_FREE_MAPPINGS(ioc, res_idx, ~0UL, 64);
 #endif
 	} else {
 		panic("%s:%s() Too many pages to unmap.\n", __FILE__,
@@ -731,7 +756,7 @@
 	size = ROUNDUP(size + offset, IOVP_SIZE);
 	spin_lock_irqsave(&ioc->res_lock, flags);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 	ioc->msingle_calls++;
 	ioc->msingle_pages += size >> IOVP_SHIFT;
 #endif
@@ -795,7 +820,7 @@
 
 	spin_lock_irqsave(&ioc->res_lock, flags);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 	ioc->usingle_calls++;
 	ioc->usingle_pages += size >> IOVP_SHIFT;
 #endif
@@ -877,57 +902,58 @@
 {
 	struct scatterlist *dma_sg = startsg;	/* pointer to current DMA */
 	int n_mappings = 0;
-	u64 *pdirp = 0;
-	unsigned long dma_offset = 0;
+	unsigned long dma_offset = 0, dma_len = 0;
+	u64 *pdirp = NULL;
 
-	dma_sg--;
 	while (nents-- > 0) {
-		int cnt = sg_dma_len(startsg);
-		sg_dma_len(startsg) = 0;
+		unsigned long vaddr;
+		long size;
 
 		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
 			   (unsigned long)sg_dma_address(startsg), cnt,
 			   sg_virt_addr(startsg), startsg->length
 		);
 
+
 		/*
 		** Look for the start of a new DMA stream
 		*/
-		if(sg_dma_address(startsg) & PIDE_FLAG) {
+		
+		if (sg_dma_address(startsg) & PIDE_FLAG) {
 			u32 pide = sg_dma_address(startsg) & ~PIDE_FLAG;
+
+			if (pdirp) {
+				BUG_ON(dma_len != sg_dma_len(dma_sg));
+				dma_sg++;
+			}
+			dma_len = sg_dma_len(startsg);
 			dma_offset = (unsigned long) pide & ~IOVP_MASK;
-			sg_dma_address(startsg) = 0;
-			dma_sg++;
+			n_mappings++;
 			sg_dma_address(dma_sg) = pide;
 			pdirp = &(ioc->pdir_base[pide >> IOVP_SHIFT]);
-			n_mappings++;
 		}
-
-		/*
-		** Look for a VCONTIG chunk
-		*/
-		if (cnt) {
-			unsigned long vaddr = sg_virt_addr(startsg);
-			ASSERT(pdirp);
-
-			/* Since multiple Vcontig blocks could make up
-			** one DMA stream, *add* cnt to dma_len.
-			*/
-			sg_dma_len(dma_sg) += cnt;
-			cnt += dma_offset;
-			dma_offset=0;	/* only want offset on first chunk */
-			cnt = ROUNDUP(cnt, IOVP_SIZE);
-#ifdef CONFIG_PROC_FS
-			ioc->msg_pages += cnt >> IOVP_SHIFT;
-#endif
-			do {
-				ccio_io_pdir_entry(pdirp, KERNEL_SPACE, 
-						   (void *)vaddr, hint);
-				vaddr += IOVP_SIZE;
-				cnt -= IOVP_SIZE;
-				pdirp++;
-			} while (cnt > 0);
+		
+		BUG_ON(pdirp == NULL);
+		
+		sg_dma_len(startsg) = 0;
+		vaddr = sg_virt_addr(startsg);
+		sg_dma_len(dma_sg) += startsg->length;
+		size = startsg->length + dma_offset;
+		dma_offset = 0;
+		if (unlikely(size > IOVP_SIZE)) {
+			printk("VIRTUAL CHUNK has size 0x%lx\n",
+			       size);
 		}
+#ifdef CCIO_MAP_STATS
+		ioc->msg_pages += startsg->length >> IOVP_SHIFT;
+#endif
+		do {
+			ccio_io_pdir_entry(pdirp, KERNEL_SPACE, 
+					   (void *)vaddr, hint);
+			vaddr += IOVP_SIZE;
+			size -= IOVP_SIZE;
+			pdirp++;
+		} while(unlikely(size > 0));
 		startsg++;
 	}
 	return(n_mappings);
@@ -946,10 +972,7 @@
 static CCIO_INLINE int
 ccio_coalesce_chunks(struct ioc *ioc, struct scatterlist *startsg, int nents)
 {
-	struct scatterlist *vcontig_sg;    /* VCONTIG chunk head */
-	unsigned long vcontig_len;         /* len of VCONTIG chunk */
-	unsigned long vcontig_end;
-	struct scatterlist *dma_sg;        /* next DMA stream head */
+	struct scatterlist *contig_sg;	   /* contig chunk head */
 	unsigned long dma_offset, dma_len; /* start/len of DMA stream */
 	int n_mappings = 0;
 
@@ -958,9 +981,8 @@
 		/*
 		** Prepare for first/next DMA stream
 		*/
-		dma_sg = vcontig_sg = startsg;
-		dma_len = vcontig_len = vcontig_end = startsg->length;
-		vcontig_end += sg_virt_addr(startsg);
+		contig_sg = startsg;
+		dma_len = startsg->length;
 		dma_offset = sg_virt_addr(startsg) & ~IOVP_MASK;
 
 		/* PARANOID: clear entries */
@@ -972,7 +994,10 @@
 		** it's always looking one "ahead".
 		*/
 		while(--nents > 0) {
-			unsigned long startsg_end;
+			unsigned long prevstartsg_end, startsg_end;
+
+			prevstartsg_end = sg_virt_addr(startsg) +
+				startsg->length;
 
 			startsg++;
 			startsg_end = sg_virt_addr(startsg) + 
@@ -987,36 +1012,18 @@
 			** exceed DMA_CHUNK_SIZE if we coalesce the
 			** next entry.
 			*/   
-			if(ROUNDUP(dma_len + dma_offset + startsg->length,
-				   IOVP_SIZE) > DMA_CHUNK_SIZE)
+			if(unlikely(ROUNDUP(dma_len + dma_offset + startsg->length,
+					    IOVP_SIZE) > DMA_CHUNK_SIZE))
 				break;
 
 			/*
-			** Append the next transaction?
+			** Next see if we can append the next chunk (i.e.
+			** it must end on one page and begin on another
 			*/
-			if (vcontig_end == sg_virt_addr(startsg)) {
-				vcontig_len += startsg->length;
-				vcontig_end += startsg->length;
-				dma_len     += startsg->length;
-				continue;
-			}
-
-			/*
-			** Not virtually contigous.
-			** Terminate prev chunk.
-			** Start a new chunk.
-			**
-			** Once we start a new VCONTIG chunk, dma_offset
-			** can't change. And we need the offset from the first
-			** chunk - not the last one. Ergo Successive chunks
-			** must start on page boundaries and dove tail
-			** with its predecessor.
-			*/
-			sg_dma_len(vcontig_sg) = vcontig_len;
-
-			vcontig_sg = startsg;
-			vcontig_len = startsg->length;
-			break;
+			if (unlikely(((prevstartsg_end | sg_virt_addr(startsg)) & ~PAGE_MASK) != 0))
+				break;
+			
+			dma_len += startsg->length;
 		}
 
 		/*
@@ -1024,9 +1031,9 @@
 		** Terminate last VCONTIG block.
 		** Allocate space for DMA stream.
 		*/
-		sg_dma_len(vcontig_sg) = vcontig_len;
+		sg_dma_len(contig_sg) = dma_len;
 		dma_len = ROUNDUP(dma_len + dma_offset, IOVP_SIZE);
-		sg_dma_address(dma_sg) =
+		sg_dma_address(contig_sg) =
 			PIDE_FLAG 
 			| (ccio_alloc_range(ioc, (dma_len >> IOVP_SHIFT)) << IOVP_SHIFT)
 			| dma_offset;
@@ -1053,6 +1060,8 @@
 	int coalesced, filled = 0;
 	unsigned long flags;
 	unsigned long hint = hint_lookup[(int)direction];
+	unsigned long prev_len = 0, current_len = 0;
+	int i;
 	
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
@@ -1067,10 +1076,13 @@
 		sg_dma_len(sglist) = sglist->length;
 		return 1;
 	}
+
+	for(i = 0; i < nents; i++)
+		prev_len += sglist[i].length;
 	
 	spin_lock_irqsave(&ioc->res_lock, flags);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 	ioc->msg_calls++;
 #endif
 
@@ -1096,9 +1108,15 @@
 
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 
-	ASSERT(coalesced == filled);
+	BUG_ON(coalesced != filled);
+
 	DBG_RUN_SG("%s() DONE %d mappings\n", __FUNCTION__, filled);
 
+	for (i = 0; i < filled; i++)
+		current_len += sg_dma_len(sglist + i);
+
+	BUG_ON(current_len != prev_len);
+
 	return filled;
 }
 
@@ -1123,13 +1141,13 @@
 	DBG_RUN_SG("%s() START %d entries,  %08lx,%x\n",
 		__FUNCTION__, nents, sg_virt_addr(sglist), sglist->length);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 	ioc->usg_calls++;
 #endif
 
 	while(sg_dma_len(sglist) && nents--) {
 
-#ifdef CONFIG_PROC_FS
+#ifdef CCIO_MAP_STATS
 		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
 #endif
 		ccio_unmap_single(dev, sg_dma_address(sglist),
@@ -1199,18 +1217,18 @@
 			      total_pages * 8, total_pages);
 		if (proc_append(tmp, len, &buf, &offset, &count))
 			break;
-		
+#ifdef CCIO_MAP_STATS
 		len = sprintf(tmp, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
 			      total_pages - ioc->used_pages, ioc->used_pages,
 			      (int)(ioc->used_pages * 100 / total_pages));
 		if (proc_append(tmp, len, &buf, &offset, &count))
 			break;
-		
+#endif
 		len = sprintf(tmp, "Resource bitmap : %d bytes (%d pages)\n", 
 			ioc->res_size, total_pages);
 		if (proc_append(tmp, len, &buf, &offset, &count))
 			break;
-		
+#ifdef CCIO_SEARCH_TIME
 		min = max = ioc->avg_search[0];
 		for(j = 0; j < CCIO_SEARCH_SAMPLE; ++j) {
 			avg += ioc->avg_search[j];
@@ -1224,7 +1242,8 @@
 			      min, avg, max);
 		if (proc_append(tmp, len, &buf, &offset, &count))
 			break;
-
+#endif
+#ifdef CCIO_MAP_STATS
 		len = sprintf(tmp, "pci_map_single(): %8ld calls  %8ld pages (avg %d/1000)\n",
 			      ioc->msingle_calls, ioc->msingle_pages,
 			      (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
@@ -1250,7 +1269,7 @@
 			      (int)((ioc->usg_pages * 1000)/ioc->usg_calls));
 		if (proc_append(tmp, len, &buf, &offset, &count))
 			break;
-
+#endif	/* CCIO_MAP_STATS */
 		ioc = ioc->next;
 	}
 
@@ -1336,9 +1355,7 @@
 	struct ioc *ioc = ccio_get_iommu(dev);
 	u8 *res_ptr;
 
-#ifdef CONFIG_PROC_FS
 	ioc->cujo20_bug = 1;
-#endif
 	res_ptr = ioc->res_map;
 	idx = PDIR_INDEX(iovp) >> 3;
 
@@ -1684,7 +1701,7 @@
 	
 
 	if (ioc_count == 0) {
-		/* XXX: Create separate entries for each ioc */
+		/* FIXME: Create separate entries for each ioc */
 		create_proc_read_entry(MODULE_NAME, S_IRWXU, proc_runway_root,
 				       ccio_proc_info, NULL);
 		create_proc_read_entry(MODULE_NAME"-bitmap", S_IRWXU,
