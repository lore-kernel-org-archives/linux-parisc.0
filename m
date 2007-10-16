From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] [patch 2/2] backport of sba sg list management to
	ccio-dma
Date: Tue, 16 Oct 2007 16:34:08 +0000
Message-ID: <4714E800.50709__42880.8140605271$1416624645$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------060309050404030803040800"
To: parisc-linux@parisc-linux.org,
 Kyle McMartin <kyle@mcmartin.ca>,
 Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------060309050404030803040800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

And here is the main hunk:

This consist of 'backporting' to ccio of the most of Grant's work on sg list
management of sba-iommu.

According to some stress test on d380 it makes ncr driver more stable; improve
network perf on my d380 (from 110 to 430 kb/s);
(would allow in a next step merge some hunk of sba code in iommu-helper.h)

Tia,
J.

--------------060309050404030803040800
Content-Type: text/x-patch;
 name="bp-sba_sg-2-ccio-dma.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bp-sba_sg-2-ccio-dma.c.patch"

Index: linux-current/drivers/parisc/ccio-dma.c
===================================================================
--- linux-current.orig/drivers/parisc/ccio-dma.c	2007-10-15 10:48:27.000000000 +0000
+++ linux-current/drivers/parisc/ccio-dma.c	2007-10-15 14:15:03.000000000 +0000
@@ -51,6 +51,7 @@
 #include <asm/io.h>
 #include <asm/hardware.h>       /* for register_module() */
 #include <asm/parisc-device.h>
+#include <asm/delay.h>
 
 /*
 ** Choose "ccio" since that's what HP-UX calls it.
@@ -102,7 +103,11 @@
 #define DBG_RUN_SG(x...)
 #endif
 
-#define CCIO_INLINE		inline
+#undef DMA_CHUNK_SIZE
+#define DMA_CHUNK_SIZE		(BITS_PER_LONG * IOVP_SIZE)
+#define DELAYED_RESOURCE_CNT	16
+
+#define CCIO_INLINE		__inline__
 #define WRITE_U32(value, addr)	__raw_writel(value, addr)
 #define READ_U32(addr)		__raw_readl(addr)
 
@@ -134,7 +139,7 @@
 	uint32_t	io_pdir_base;	/* Offset  7 */
 	uint32_t	io_io_low_hv;	/* Offset  8 */
 	uint32_t	io_io_high_hv;	/* Offset  9 */
-        uint32_t unused4[1];
+	uint32_t unused4[1];
 	uint32_t	io_chain_id_mask;/* Offset 11 */
 	uint32_t unused5[2];
 	uint32_t	io_io_low;	/* Offset 14 */
@@ -227,16 +232,28 @@
 ** returns before issuing subsequent writes.
 */
 
+typedef unsigned long	address_t;
+
 struct ioc {
 	struct ioa_registers __iomem *ioc_regs;	/* I/O MMU base address */
 	u8		*res_map;		/* resource map, bit == pdir entry */
 	u64		*pdir_base;		/* physical base address */
 	u32		pdir_size; 		/* bytes, function of IOV Space size */
-	u32		res_hint;		/* next available IOVP -
+	address_t	*res_hint;		/* next available IOVP -
 						   circular search */
-	u32		res_size;		/* size of resource map in bytes */
 	spinlock_t	res_lock;
 
+	uint32_t	res_bitshift;		/* from the LEFT! */
+	u32		res_size;		/* size of resource map in bytes */
+
+#if DELAYED_RESOURCE_CNT > 0
+	int             saved_cnt;
+	struct ioc_dma_pair {
+		dma_addr_t      iova;
+		size_t          size;
+	} saved[DELAYED_RESOURCE_CNT];
+#endif
+
 #ifdef CCIO_SEARCH_TIME
 #define CCIO_SEARCH_SAMPLE 0x100
 	unsigned long	avg_search[CCIO_SEARCH_SAMPLE];
@@ -259,7 +276,7 @@
 	u32		chainid_shift;	/* specify bit location of chain_id */
 	struct ioc	*next;		/* Linked list of discovered iocs */
 	const char	*name;		/* device name from firmware */
-	unsigned int	hw_path;	/* the hardware path this ioc is associatd with */
+	uint32_t	hw_path;	/* the hardware path this ioc is associatd with */
 	struct pci_dev	*fake_pci_dev;	/* the fake pci_dev for non-pci devs */
 	struct resource	mmio_region[2];	/* The "routed" MMIO regions */
 };
@@ -290,45 +307,115 @@
 #define CCIO_IOVA(iovp,offset)	((iovp) | (offset))
 #define CCIO_IOVP(iova)		((iova) & IOVP_MASK)
 
+#define PDIR_ENTRY_SIZE		sizeof(u64)
 #define PDIR_INDEX(iovp)	((iovp)>>IOVP_SHIFT)
+
+#define RESMAP_MASK(n)		(~0UL << (BITS_PER_LONG - (n)))
+#define RESMAP_IDX_MASK		(sizeof(unsigned long) - 1)
+
+/**
+ * For most cases the normal get_order is sufficient, however it limits us
+ * to PAGE_SIZE being the minimum mapping alignment and TC flush granularity.
+ * It only incurs about 1 clock cycle to use this one with the static variable
+ * and makes the code more intuitive.
+ */
+static CCIO_INLINE int
+get_iovp_order(unsigned long size)
+{
+	int order;
+
+	size = (size - 1) >> (IOVP_SHIFT - 1);
+	order = -1;
+	do {
+		size >>= 1;
+		order++;
+	} while (size);
+	return order;
+}
+
 #define MKIOVP(pdir_idx)	((long)(pdir_idx) << IOVP_SHIFT)
-#define MKIOVA(iovp,offset)	(dma_addr_t)((long)iovp | (long)offset)
+#define MKIOVA(iovp, offset)	(dma_addr_t)((long)iovp | (long)offset)
+#define ROUNDUP(x, y)		((x + ((y)-1)) & ~((y)-1))
 
-/*
-** Don't worry about the 150% average search length on a miss.
-** If the search wraps around, and passes the res_hint, it will
-** cause the kernel to panic anyhow.
-*/
-#define CCIO_SEARCH_LOOP(ioc, res_idx, mask, size)  \
-       for(; res_ptr < res_end; ++res_ptr) { \
-               if(0 == (*res_ptr & mask)) { \
-                       *res_ptr |= mask; \
-                       res_idx = (unsigned int)((unsigned long)res_ptr - (unsigned long)ioc->res_map); \
-                       ioc->res_hint = res_idx + (size >> 3); \
-                       goto resource_found; \
-               } \
-       }
-
-#define CCIO_FIND_FREE_MAPPING(ioa, res_idx, mask, size) \
-       u##size *res_ptr = (u##size *)&((ioc)->res_map[ioa->res_hint & ~((size >> 3) - 1)]); \
-       u##size *res_end = (u##size *)&(ioc)->res_map[ioa->res_size]; \
-       CCIO_SEARCH_LOOP(ioc, res_idx, mask, size); \
-       res_ptr = (u##size *)&(ioc)->res_map[0]; \
-       CCIO_SEARCH_LOOP(ioa, res_idx, mask, size);
+/**
+ * ccio_search_bitmap - find free space in IO PDIR resource bitmap
+ * @ioc: IO MMU structure which owns the pdir we are interested in.
+ * @pages_wanted: number of entries we need.
+ *
+ * Find consecutive free bits in resource bitmap.
+ * Each bit represents one entry in the IO Pdir.
+ * Cool perf optimization: search for log2(size) bits at a time.
+ */
+static CCIO_INLINE address_t
+ccio_search_bitmap(struct ioc *ioc, unsigned long pages_wanted)
+{
+	address_t *res_ptr = ioc->res_hint;
+	address_t *res_end = (unsigned long *) &(ioc->res_map[ioc->res_size]);
+	address_t pide = ~0UL;
+
+	if (pages_wanted > (BITS_PER_LONG/2)) {
+		/* Search word at a time - no mask needed */
+		for(; res_ptr < res_end; ++res_ptr) {
+			if (*res_ptr == 0) {
+				*res_ptr = RESMAP_MASK(pages_wanted);
+				pide = ((address_t)res_ptr - (address_t)ioc->res_map);
+				pide <<= 3;     /* convert to bit address */
+				break;
+			}
+		}
+		/* point to the next word on next pass */
+		res_ptr++;
+		ioc->res_bitshift = 0;
+	} else {
+		/*
+		** Search the resource bit map on well-aligned values.
+		** "o" is the alignment.
+		** We need the alignment to invalidate I/O TLB using
+		** xxx HW features in the unmap path.
+		*/
+		unsigned long o = 1 << get_iovp_order(pages_wanted << IOVP_SHIFT);
+		uint bitshiftcnt = ROUNDUP(ioc->res_bitshift, o);
+		unsigned long mask;
 
-/*
-** Find available bit in this ioa's resource map.
-** Use a "circular" search:
-**   o Most IOVA's are "temporary" - avg search time should be small.
-** o keep a history of what happened for debugging
-** o KISS.
-**
-** Perf optimizations:
-** o search for log2(size) bits at a time.
-** o search for available resource bits using byte/word/whatever.
-** o use different search for "large" (eg > 4 pages) or "very large"
-**   (eg > 16 pages) mappings.
-*/
+		if (bitshiftcnt >= BITS_PER_LONG) {
+			bitshiftcnt = 0;
+			res_ptr++;
+		}
+		mask = RESMAP_MASK(pages_wanted) >> bitshiftcnt;
+
+		DBG_RES("%s() o %ld %p", __FUNCTION__, o, res_ptr);
+		while(res_ptr < res_end)
+		{
+			DBG_RES("    %p %lx %lx\n", res_ptr, mask, *res_ptr);
+			WARN_ON(mask == 0);
+			if(((*res_ptr) & mask) == 0) {
+				*res_ptr |= mask;     /* mark resources busy! */
+				pide = ((address_t)res_ptr - (address_t)ioc->res_map);
+				pide <<= 3;     /* convert to bit address */
+				pide += bitshiftcnt;
+				break;
+			}
+			mask >>= o;
+			bitshiftcnt += o;
+			if (mask == 0) {
+				mask = RESMAP_MASK(pages_wanted);
+				bitshiftcnt=0;
+				res_ptr++;
+			}
+		}
+		/* look in the same word on the next pass */
+		ioc->res_bitshift = bitshiftcnt + pages_wanted;
+	}
+
+	/* wrapped ? */
+	if (res_end <= res_ptr) {
+		ioc->res_hint = (address_t *) ioc->res_map;
+		ioc->res_bitshift = 0;
+	} else {
+		ioc->res_hint = res_ptr;
+	}
+	return (pide);
+}
 
 /**
  * ccio_alloc_range - Allocate pages in the ioc's resource map.
@@ -347,7 +434,9 @@
 #ifdef CCIO_SEARCH_TIME
 	unsigned long cr_start = mfctl(16);
 #endif
-	
+
+	unsigned long	pide;
+
 	BUG_ON(pages_needed == 0);
 	BUG_ON((pages_needed * IOVP_SIZE) > DMA_CHUNK_SIZE);
 
@@ -359,44 +448,19 @@
 	** ggg sacrifices another 710 to the computer gods.
 	*/
 
-	if (pages_needed <= 8) {
-		/*
-		 * LAN traffic will not thrash the TLB IFF the same NIC
-		 * uses 8 adjacent pages to map seperate payload data.
-		 * ie the same byte in the resource bit map.
-		 */
-#if 0
-		/* FIXME: bit search should shift it's way through
-		 * an unsigned long - not byte at a time. As it is now,
-		 * we effectively allocate this byte to this mapping.
-		 */
-		unsigned long mask = ~(~0UL >> pages_needed);
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 8);
-#else
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, 0xff, 8);
-#endif
-	} else if (pages_needed <= 16) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, 0xffff, 16);
-	} else if (pages_needed <= 32) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~(unsigned int)0, 32);
-#ifdef __LP64__
-	} else if (pages_needed <= 64) {
-		CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~0UL, 64);
-#endif
-	} else {
-		panic("%s: %s() Too many pages to map. pages_needed: %u\n",
-		       __FILE__,  __FUNCTION__, pages_needed);
+	pide = ccio_search_bitmap(ioc, pages_needed);
+	if (pide >= (ioc->res_size << 3)) {
+		pide = ccio_search_bitmap(ioc, pages_needed);
+		if (pide >= (ioc->res_size << 3))
+			panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__,
+				__FUNCTION__);
 	}
 
-	panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__,
-	      __FUNCTION__);
-	
-resource_found:
-	
 	DBG_RES("%s() res_idx %d res_hint: %d\n",
 		__FUNCTION__, res_idx, ioc->res_hint);
 
 #ifdef CCIO_SEARCH_TIME
+	udelay(100);
 	{
 		unsigned long cr_end = mfctl(16);
 		unsigned long tmp = cr_end - cr_start;
@@ -412,14 +476,9 @@
 	/*
 	** return the bit address.
 	*/
-	return res_idx << 3;
+	return (pide);
 }
 
-#define CCIO_FREE_MAPPINGS(ioc, res_idx, mask, size) \
-        u##size *res_ptr = (u##size *)&((ioc)->res_map[res_idx]); \
-        BUG_ON((*res_ptr & mask) != mask); \
-        *res_ptr &= ~(mask);
-
 /**
  * ccio_free_range - Free pages from the ioc's resource map.
  * @ioc: The I/O Controller.
@@ -430,42 +489,33 @@
  * This function frees the resouces allocated for the iova.
  */
 static void
-ccio_free_range(struct ioc *ioc, dma_addr_t iova, unsigned long pages_mapped)
+ccio_free_range(struct ioc *ioc, dma_addr_t iova, size_t size)
 {
 	unsigned long iovp = CCIO_IOVP(iova);
-	unsigned int res_idx = PDIR_INDEX(iovp) >> 3;
-
-	BUG_ON(pages_mapped == 0);
-	BUG_ON((pages_mapped * IOVP_SIZE) > DMA_CHUNK_SIZE);
-	BUG_ON(pages_mapped > BITS_PER_LONG);
 
-	DBG_RES("%s():  res_idx: %d pages_mapped %d\n",
-		__FUNCTION__, res_idx, pages_mapped);
+	unsigned int pide = PDIR_INDEX(iovp);
+	unsigned int ridx = pide >> 3;
+	unsigned long *res_ptr = (unsigned long *) &((ioc)->res_map[ridx & ~RESMAP_IDX_MASK]);
+
+	/* was: unsigned int pages_mapped = size >> IOVP_SHIFT; */
+	int bits_not_wanted = size >> IOVP_SHIFT;
+
+	/* 3-bits "bit" address plus 2 (or 3) bits for "byte" == bit in word */
+	unsigned long m = RESMAP_MASK(bits_not_wanted) >> (pide & (BITS_PER_LONG - 1));
+
+	BUG_ON(size == 0);
+	BUG_ON(size > DMA_CHUNK_SIZE);
+	BUG_ON(bits_not_wanted > BITS_PER_LONG);
+
+	DBG_RES("%s( ,%x,%x) %x/%lx %x %p %lx\n",
+		__FUNCTION__, (uint) iova, size,
+		bits_not_wanted, m, pide, res_ptr, *res_ptr);
 
 #ifdef CCIO_MAP_STATS
-	ioc->used_pages -= pages_mapped;
+	ioc->used_pages -= bits_not_wanted;
 #endif
 
-	if(pages_mapped <= 8) {
-#if 0
-		/* see matching comments in alloc_range */
-		unsigned long mask = ~(~0UL >> pages_mapped);
-		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 8);
-#else
-		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xff, 8);
-#endif
-	} else if(pages_mapped <= 16) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xffff, 16);
-	} else if(pages_mapped <= 32) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, ~(unsigned int)0, 32);
-#ifdef __LP64__
-	} else if(pages_mapped <= 64) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, ~0UL, 64);
-#endif
-	} else {
-		panic("%s:%s() Too many pages to unmap.\n", __FILE__,
-		      __FUNCTION__);
-	}
+	*res_ptr &= ~m;
 }
 
 /****************************************************************
@@ -664,32 +714,45 @@
 static CCIO_INLINE void
 ccio_mark_invalid(struct ioc *ioc, dma_addr_t iova, size_t byte_cnt)
 {
-	u32 iovp = (u32)CCIO_IOVP(iova);
+	uint32_t iovp = (uint32_t)CCIO_IOVP(iova);
+	u64 *pdir_ptr = &ioc->pdir_base[PDIR_INDEX(iovp)];
 	size_t saved_byte_cnt;
 
 	/* round up to nearest page size */
 	saved_byte_cnt = byte_cnt = ALIGN(byte_cnt, IOVP_SIZE);
 
-	while(byte_cnt > 0) {
-		/* invalidate one page at a time */
-		unsigned int idx = PDIR_INDEX(iovp);
-		char *pdir_ptr = (char *) &(ioc->pdir_base[idx]);
+	if (byte_cnt > IOVP_SIZE)
+	{
+		/* set "size" field for PCOM */
+		iovp |= get_iovp_order(byte_cnt) + IOVP_SHIFT;
 
-		BUG_ON(idx >= (ioc->pdir_size / sizeof(u64)));
-		pdir_ptr[7] = 0;	/* clear only VALID bit */
-		/*
-		** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
-		**   PCX-U/U+ do. (eg C200/C240)
-		** See PDC_MODEL/option 0/SW_CAP for "Non-coherent IO-PDIR bit".
-		**
-		** Hopefully someone figures out how to patch (NOP) the
-		** FDC/SYNC out at boot time.
-		*/
-		asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+		do {
+			/* clear I/O Pdir entry "valid" bit first */
+			((unsigned char *) pdir_ptr)[7] = 0;
+			/*
+			** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
+			**   PCX-U/U+ do. (eg C200/C240)
+			** See PDC_MODEL/option 0/SW_CAP for "Non-coherent IO-PDIR bit".
+			**
+			** Hopefully someone figures out how to patch (NOP) the
+			** FDC/SYNC out at boot time.
+			*/
+			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+
+			pdir_ptr++;
+			byte_cnt -= IOVP_SIZE;
+		} while (byte_cnt > IOVP_SIZE);
+	} else
+		iovp |= IOVP_SHIFT;     /* set "size" field for PCOM */
 
-		iovp     += IOVP_SIZE;
-		byte_cnt -= IOVP_SIZE;
-	}
+	/*
+	** clear I/O PDIR entry "valid" bit.
+	** We have to R/M/W the cacheline regardless how much of the
+	** pdir entry that we clobber.
+	** The rest of the entry would be useful for debugging if we
+	** could dump core on HPMC.
+	*/
+	((unsigned char *) pdir_ptr)[7] = 0;
 
 	asm volatile("sync");
 	ccio_clear_io_tlb(ioc, CCIO_IOVP(iova), saved_byte_cnt);
@@ -711,7 +774,7 @@
 static int
 ccio_dma_supported(struct device *dev, u64 mask)
 {
-	if(dev == NULL) {
+	if(!dev) {
 		printk(KERN_ERR MODULE_NAME ": EISA/ISA/et al not supported\n");
 		BUG();
 		return 0;
@@ -783,6 +846,9 @@
 		size -= IOVP_SIZE;
 	}
 
+	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
+	asm volatile("sync" :: );
+
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 
 	/* form complete address */
@@ -803,6 +869,9 @@
 		  enum dma_data_direction direction)
 {
 	struct ioc *ioc;
+#if DELAYED_RESOURCE_CNT > 0
+	struct ioc_dma_pair *d;
+#endif
 	unsigned long flags;
 	dma_addr_t offset = iova & ~IOVP_MASK;
 	
@@ -824,7 +893,30 @@
 #endif
 
 	ccio_mark_invalid(ioc, iova, size);
-	ccio_free_range(ioc, iova, (size >> IOVP_SHIFT));
+#if DELAYED_RESOURCE_CNT > 0
+	/* Delaying when we re-use a IO Pdir entry reduces the number
+	 * of MMIO reads needed to flush writes to the PCOM register.
+	 */
+	d = &(ioc->saved[ioc->saved_cnt]);
+	d->iova = iova;
+	d->size = size;
+	if (++(ioc->saved_cnt) >= DELAYED_RESOURCE_CNT) {
+		int cnt = ioc->saved_cnt;
+		while (cnt--) {
+			ccio_free_range(ioc, d->iova, d->size);
+			d--;
+		}
+		ioc->saved_cnt = 0;
+	}
+#else /* DELAYED_RESOURCE_CNT == 0 */
+
+	ccio_free_range(ioc, iova, size);
+
+	/* force fdc's to be visible now */
+	asm volatile("sync" :: );
+
+#endif /* DELAYED_RESOURCE_CNT == 0 */
+
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 }
 
@@ -952,6 +1044,9 @@
 	*/
 	filled = iommu_fill_pdir(ioc, sglist, nents, hint, ccio_io_pdir_entry);
 
+	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
+	asm volatile("sync" :: );
+
 	spin_unlock_irqrestore(&ioc->res_lock, flags);
 
 	BUG_ON(coalesced != filled);
@@ -993,11 +1088,12 @@
 
 	while(sg_dma_len(sglist) && nents--) {
 
-#ifdef CCIO_MAP_STATS
-		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
-#endif
 		ccio_unmap_single(dev, sg_dma_address(sglist),
 				  sg_dma_len(sglist), direction);
+#ifdef CCIO_MAP_STATS
+		ioc->usg_pages += sg_dma_len(sglist) >> IOVP_SHIFT;
+		ioc->usingle_calls--;   /* kluge since call is unmap_sg() */
+#endif
 		++sglist;
 	}
 
@@ -1025,16 +1121,12 @@
 	int len = 0;
 	struct ioc *ioc = ioc_list;
 
-	while (ioc != NULL) {
+	while (ioc) {
 		unsigned int total_pages = ioc->res_size << 3;
-		unsigned long avg = 0, min, max;
-		int j;
 
-		len += seq_printf(m, "%s\n", ioc->name);
-		
-		len += seq_printf(m, "Cujo 2.0 bug    : %s\n",
-				  (ioc->cujo20_bug ? "yes" : "no"));
-		
+		len += seq_printf(m, "%s%s\n", ioc->name,
+			(ioc->cujo20_bug ? " (Cujo 2.0 bug)" : ""));
+
 		len += seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
 			       total_pages * 8, total_pages);
 
@@ -1048,6 +1140,8 @@
 				  ioc->res_size, total_pages);
 
 #ifdef CCIO_SEARCH_TIME
+		unsigned long avg = 0, min, max;
+		int j;
 		min = max = ioc->avg_search[0];
 		for(j = 0; j < CCIO_SEARCH_SAMPLE; ++j) {
 			avg += ioc->avg_search[j];
@@ -1104,7 +1198,7 @@
 	int len = 0;
 	struct ioc *ioc = ioc_list;
 
-	while (ioc != NULL) {
+	while (ioc) {
 		u32 *res_ptr = (u32 *)ioc->res_map;
 		int j;
 
@@ -1252,9 +1346,12 @@
 static void
 ccio_ioc_init(struct ioc *ioc)
 {
-	int i;
-	unsigned int iov_order;
-	u32 iova_space_size;
+	int		i;
+	uint32_t	iov_order,
+			num_iommu_pages,
+			iova_space_size;
+
+	uint32_t	IO_ChainIdMask;
 
 	/*
 	** Determine IOVA Space size from memory size.
@@ -1267,16 +1364,15 @@
 	** Hot-Plug/Removal of PCI cards. (aka PCI OLARD).
 	*/
 
-	iova_space_size = (u32) (num_physpages / count_parisc_driver(&ccio_driver));
+	unsigned long phys_mem = num_physpages << PAGE_SHIFT;
+	iova_space_size = (u_int32_t) (phys_mem  / count_parisc_driver(&ccio_driver));
 
 	/* limit IOVA space size to 1MB-1GB */
 
-	if (iova_space_size < (1 << (20 - PAGE_SHIFT))) {
-		iova_space_size =  1 << (20 - PAGE_SHIFT);
-#ifdef __LP64__
-	} else if (iova_space_size > (1 << (30 - PAGE_SHIFT))) {
-		iova_space_size =  1 << (30 - PAGE_SHIFT);
-#endif
+	if (iova_space_size < (1 << 20)) {
+		iova_space_size =  1 << 20;
+	} else if (iova_space_size > (1 << 30)) {
+		iova_space_size =  1 << 30;
 	}
 
 	/*
@@ -1292,27 +1388,27 @@
 	**   this is the case under linux."
 	*/
 
-	iov_order = get_order(iova_space_size << PAGE_SHIFT);
+	iov_order = get_iovp_order(iova_space_size);
 
-	/* iova_space_size is now bytes, not pages */
-	iova_space_size = 1 << (iov_order + PAGE_SHIFT);
+	iova_space_size = 1 << (iov_order + IOVP_SHIFT);
 
-	ioc->pdir_size = (iova_space_size / IOVP_SIZE) * sizeof(u64);
+	num_iommu_pages = iova_space_size >> IOVP_SHIFT;
+	ioc->pdir_size = num_iommu_pages * PDIR_ENTRY_SIZE;
+
+	DBG_INIT("%s() hpa 0x%p mem %luMb IOV %uMb (%d bits)\n",
+			__FUNCTION__, ioc->ioc_regs,
+			phys_mem >> 20,
+			iova_space_size >> 20,
+			iov_order + IOVP_SHIFT);
 
 	BUG_ON(ioc->pdir_size > 8 * 1024 * 1024);   /* max pdir size <= 8MB */
 
 	/* Verify it's a power of two */
 	BUG_ON((1 << get_order(ioc->pdir_size)) != (ioc->pdir_size >> PAGE_SHIFT));
 
-	DBG_INIT("%s() hpa 0x%p mem %luMB IOV %dMB (%d bits)\n",
-			__FUNCTION__, ioc->ioc_regs,
-			(unsigned long) num_physpages >> (20 - PAGE_SHIFT),
-			iova_space_size>>20,
-			iov_order + PAGE_SHIFT);
-
 	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL,
 						 get_order(ioc->pdir_size));
-	if(NULL == ioc->pdir_base) {
+	if(!(ioc->pdir_base)) {
 		panic("%s() could not allocate I/O Page Table\n", __FUNCTION__);
 	}
 	memset(ioc->pdir_base, 0, ioc->pdir_size);
@@ -1321,27 +1417,31 @@
 	DBG_INIT(" base %p\n", ioc->pdir_base);
 
 	/* resource map size dictated by pdir_size */
- 	ioc->res_size = (ioc->pdir_size / sizeof(u64)) >> 3;
+ 	ioc->res_size = num_iommu_pages >> 3;
 	DBG_INIT("%s() res_size 0x%x\n", __FUNCTION__, ioc->res_size);
 	
 	ioc->res_map = (u8 *)__get_free_pages(GFP_KERNEL,
 					      get_order(ioc->res_size));
-	if(NULL == ioc->res_map) {
+	if(!(ioc->res_map)) {
 		panic("%s() could not allocate resource map\n", __FUNCTION__);
 	}
 	memset(ioc->res_map, 0, ioc->res_size);
 
-	/* Initialize the res_hint to 16 */
-	ioc->res_hint = 16;
+	/* next available IOVP - circular search */
+	ioc->res_hint = (unsigned long *)
+		&(ioc->res_map[L1_CACHE_BYTES]);
 
 	/* Initialize the spinlock */
 	spin_lock_init(&ioc->res_lock);
 
+	IO_ChainIdMask = READ_U32(&ioc->ioc_regs->io_chain_id_mask);
+	DBG_INIT(" Default io_chain_id_mask 0x%x\n", IO_ChainIdMask);
+
 	/*
 	** Chainid is the upper most bits of an IOVP used to determine
 	** which TLB entry an IOVP will use.
 	*/
-	ioc->chainid_shift = get_order(iova_space_size) + PAGE_SHIFT - CCIO_CHAINID_SHIFT;
+	ioc->chainid_shift = iov_order + IOVP_SHIFT - CCIO_CHAINID_SHIFT;
 	DBG_INIT(" chainid_shift 0x%x\n", ioc->chainid_shift);
 
 	/*
@@ -1485,15 +1585,15 @@
 		return 0;
 
 	if (!expand_ioc_area(parent, size, min, max, align)) {
-		__raw_writel(((parent->start)>>16) | 0xffff0000,
+		WRITE_U32(((parent->start)>>16) | 0xffff0000,
 			     &ioc->ioc_regs->io_io_low);
-		__raw_writel(((parent->end)>>16) | 0xffff0000,
+		WRITE_U32(((parent->end)>>16) | 0xffff0000,
 			     &ioc->ioc_regs->io_io_high);
 	} else if (!expand_ioc_area(parent + 1, size, min, max, align)) {
 		parent++;
-		__raw_writel(((parent->start)>>16) | 0xffff0000,
+		WRITE_U32(((parent->start)>>16) | 0xffff0000,
 			     &ioc->ioc_regs->io_io_low_hv);
-		__raw_writel(((parent->end)>>16) | 0xffff0000,
+		WRITE_U32(((parent->end)>>16) | 0xffff0000,
 			     &ioc->ioc_regs->io_io_high_hv);
 	} else {
 		return -EBUSY;
@@ -1543,8 +1643,8 @@
 	struct ioc *ioc, **ioc_p = &ioc_list;
 	struct proc_dir_entry *info_entry, *bitmap_entry;
 	
-	ioc = kzalloc(sizeof(struct ioc), GFP_KERNEL);
-	if (ioc == NULL) {
+	ioc = kzalloc(sizeof(*ioc), GFP_KERNEL);
+	if (!ioc) {
 		printk(KERN_ERR MODULE_NAME ": memory allocation failure\n");
 		return 1;
 	}
@@ -1566,7 +1666,7 @@
 	dev->dev.platform_data = kzalloc(sizeof(struct pci_hba_data), GFP_KERNEL);
 
 	/* if this fails, no I/O cards will work, so may as well bug */
-	BUG_ON(dev->dev.platform_data == NULL);
+	BUG_ON(!(dev->dev.platform_data));
 	HBA_DATA(dev->dev.platform_data)->iommu = ioc;
 	
 	if (ioc_count == 0) {

--------------060309050404030803040800
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------060309050404030803040800--
