Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AC8B4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 11:44:55 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i22Ij8a01694 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 2 Mar 2004 13:45:08 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 02 Mar 2004 12:44:51 -0600
Message-Id: <1078253092.1804.58.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] experimental patch to Fix CCIO virtual merging
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

The algorithm the ccio currently uses to do virtual merging is rather
non-optimal.  The attached patch fixes it to merge virtually whenever
the adjacent I/O pieces begin and end on a page boundary, which produces
much better merging.

This code also found a bug in the ccio pdir allocation which trips when
the number of pages requested == BITS_PER_LONG.  I've put in a temporary
work around, but Grant should be doing a better fix.

Just a warning:  This patch affects the I/O mapping stream.  If you find
a bug in it, it will likely be *after* it has trashed your root drive...

I've also left in all the debug tests and printks.

James

===== drivers/parisc/ccio-dma.c 1.15 vs edited =====
--- 1.15/drivers/parisc/ccio-dma.c	Tue Feb  3 23:42:34 2004
+++ edited/drivers/parisc/ccio-dma.c	Tue Mar  2 12:01:09 2004
@@ -41,6 +41,7 @@
 #define PCI_DEBUG
 #include <linux/pci.h>
 #undef PCI_DEBUG
+#include <linux/reboot.h>
 
 #include <asm/byteorder.h>
 #include <asm/cache.h>		/* for L1_CACHE_BYTES */
@@ -343,7 +344,10 @@
 	ASSERT((pages_needed * IOVP_SIZE) <= DMA_CHUNK_SIZE);
 	ASSERT(pages_needed <= BITS_PER_LONG);
 
-	mask = ~(~0UL >> pages_needed);
+	if(pages_needed == BITS_PER_LONG)
+		mask = ~0UL;
+	else
+		mask = ~(~0UL >> pages_needed);
      
 	DBG_RES("%s() size: %d pages_needed %d mask 0x%08lx\n", 
 		__FUNCTION__, size, pages_needed, mask);
@@ -877,12 +881,13 @@
 {
 	struct scatterlist *dma_sg = startsg;	/* pointer to current DMA */
 	int n_mappings = 0;
-	u64 *pdirp = 0;
 	unsigned long dma_offset = 0;
+	u64 *pdirp = NULL;
 
-	dma_sg--;
 	while (nents-- > 0) {
-		int cnt = sg_dma_len(startsg);
+		unsigned long vaddr;
+		long size;
+
 		sg_dma_len(startsg) = 0;
 
 		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
@@ -890,44 +895,46 @@
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
 			dma_offset = (unsigned long) pide & ~IOVP_MASK;
-			sg_dma_address(startsg) = 0;
-			dma_sg++;
+			if (pdirp)
+				dma_sg++;
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
+		
+		if (unlikely(pdirp == NULL)) {
+			printk("NULL PDIRP AT OFFSET %d\n",
+			       n_mappings);
+			dump_stack();
+			machine_restart(NULL);
+		}
+		
+		vaddr = sg_virt_addr(startsg);
+		sg_dma_len(dma_sg) += startsg->length;
+		size = startsg->length + dma_offset;
+		if (unlikely(size > IOVP_SIZE)) {
+			printk("VIRTUAL CHUNK has size 0x%lx\n",
+			       size);
+		}
 #ifdef CONFIG_PROC_FS
-			ioc->msg_pages += cnt >> IOVP_SHIFT;
+		ioc->msg_pages += startsg->length >> IOVP_SHIFT;
 #endif
-			do {
-				ccio_io_pdir_entry(pdirp, KERNEL_SPACE, 
-						   (void *)vaddr, hint);
-				vaddr += IOVP_SIZE;
-				cnt -= IOVP_SIZE;
-				pdirp++;
-			} while (cnt > 0);
-		}
+		do {
+			ccio_io_pdir_entry(pdirp, KERNEL_SPACE, 
+					   (void *)vaddr, hint);
+			vaddr += IOVP_SIZE;
+			size -= IOVP_SIZE;
+			pdirp++;
+		} while(size > 0);
 		startsg++;
 	}
 	return(n_mappings);
@@ -946,10 +953,7 @@
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
 
@@ -958,9 +962,8 @@
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
@@ -972,7 +975,10 @@
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
@@ -992,31 +998,15 @@
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
+			if ((prevstartsg_end & ~PAGE_MASK) != (sg_virt_addr(startsg) & ~PAGE_MASK)) {
+				printk("IOMMU FORBIDDING MERGE OF 0x%lx and 0x%lx\n", prevstartsg_end, sg_virt_addr(startsg));
+				break;
 			}
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
+			
+			dma_len     += startsg->length;
 		}
 
 		/*
@@ -1024,9 +1014,9 @@
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
@@ -1053,6 +1043,8 @@
 	int coalesced, filled = 0;
 	unsigned long flags;
 	unsigned long hint = hint_lookup[(int)direction];
+	unsigned long prev_len = 0, current_len = 0;
+	int i;
 	
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
@@ -1067,6 +1059,9 @@
 		sg_dma_len(sglist) = sglist->length;
 		return 1;
 	}
+
+	for(i = 0; i < nents; i++)
+		prev_len += sglist[i].length;
 	
 	spin_lock_irqsave(&ioc->res_lock, flags);
 
@@ -1096,8 +1091,31 @@
 
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 
-	ASSERT(coalesced == filled);
+	if (unlikely(coalesced != filled)) {
+		printk("OOPS coalesced = %d, filled = %d\n", coalesced,
+		       filled);
+		BUG();
+	}
 	DBG_RUN_SG("%s() DONE %d mappings\n", __FUNCTION__, filled);
+
+	for (i = 0; i < filled; i++)
+		current_len += sg_dma_len(sglist + i);
+
+	if (unlikely(current_len != prev_len)) {
+		printk("OOPS current len = %ld, prev len = %ld\n", current_len,
+		       prev_len);
+		BUG();
+	}
+
+	if (unlikely(filled != 1)) {
+		printk("IOMMU merge length %ld, segments %d\n",
+		       current_len, filled);
+		for(i = 0; i < filled; i++) {
+			printk(" %d: addr 0x%lx, len 0x%x\n", i,
+			       (unsigned long)sg_dma_address(sglist + i),
+			       (unsigned int)sg_dma_len(sglist + i));
+		}
+	}
 
 	return filled;
 }
