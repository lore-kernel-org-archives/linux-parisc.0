From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] [patch 1/2] whitescape cleanup in ccio-dma.c
Date: Tue, 16 Oct 2007 16:33:44 +0000
Message-ID: <4714E7E8.301__38228.2019513243$1416624645$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------090708090909020603090108"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@parisc-linux.org
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
--------------090708090909020603090108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I reach to get some time to attempt to finalize this
<http://lists.parisc-linux.org/pipermail/parisc-linux/2007-January/031129.html>

This first hunk just do some white space cleanup:

Hth,
J.

--------------090708090909020603090108
Content-Type: text/x-patch;
 name="wp-cleanup-ccio-dma.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wp-cleanup-ccio-dma.c.patch"

Index: linux-current/drivers/parisc/ccio-dma.c
===================================================================
--- linux-current.orig/drivers/parisc/ccio-dma.c	2007-10-15 08:04:13.000000000 +0000
+++ linux-current/drivers/parisc/ccio-dma.c	2007-10-15 08:46:02.000000000 +0000
@@ -52,7 +52,7 @@
 #include <asm/hardware.h>       /* for register_module() */
 #include <asm/parisc-device.h>
 
-/* 
+/*
 ** Choose "ccio" since that's what HP-UX calls it.
 ** Make it easier for folks to migrate from one to the other :^)
 */
@@ -102,43 +102,43 @@
 #define DBG_RUN_SG(x...)
 #endif
 
-#define CCIO_INLINE	inline
-#define WRITE_U32(value, addr) __raw_writel(value, addr)
-#define READ_U32(addr) __raw_readl(addr)
-
-#define U2_IOA_RUNWAY 0x580
-#define U2_BC_GSC     0x501
-#define UTURN_IOA_RUNWAY 0x581
-#define UTURN_BC_GSC     0x502
-
-#define IOA_NORMAL_MODE      0x00020080 /* IO_CONTROL to turn on CCIO        */
-#define CMD_TLB_DIRECT_WRITE 35         /* IO_COMMAND for I/O TLB Writes     */
-#define CMD_TLB_PURGE        33         /* IO_COMMAND to Purge I/O TLB entry */
+#define CCIO_INLINE		inline
+#define WRITE_U32(value, addr)	__raw_writel(value, addr)
+#define READ_U32(addr)		__raw_readl(addr)
+
+#define U2_IOA_RUNWAY		0x580
+#define U2_BC_GSC		0x501
+#define UTURN_IOA_RUNWAY	0x581
+#define UTURN_BC_GSC		0x502
+
+#define IOA_NORMAL_MODE		0x00020080	/* IO_CONTROL to turn on CCIO        */
+#define CMD_TLB_DIRECT_WRITE	35		/* IO_COMMAND for I/O TLB Writes     */
+#define CMD_TLB_PURGE		33		/* IO_COMMAND to Purge I/O TLB entry */
 
 struct ioa_registers {
-        /* Runway Supervisory Set */
-        int32_t    unused1[12];
-        uint32_t   io_command;             /* Offset 12 */
-        uint32_t   io_status;              /* Offset 13 */
-        uint32_t   io_control;             /* Offset 14 */
-        int32_t    unused2[1];
-
-        /* Runway Auxiliary Register Set */
-        uint32_t   io_err_resp;            /* Offset  0 */
-        uint32_t   io_err_info;            /* Offset  1 */
-        uint32_t   io_err_req;             /* Offset  2 */
-        uint32_t   io_err_resp_hi;         /* Offset  3 */
-        uint32_t   io_tlb_entry_m;         /* Offset  4 */
-        uint32_t   io_tlb_entry_l;         /* Offset  5 */
-        uint32_t   unused3[1];
-        uint32_t   io_pdir_base;           /* Offset  7 */
-        uint32_t   io_io_low_hv;           /* Offset  8 */
-        uint32_t   io_io_high_hv;          /* Offset  9 */
-        uint32_t   unused4[1];
-        uint32_t   io_chain_id_mask;       /* Offset 11 */
-        uint32_t   unused5[2];
-        uint32_t   io_io_low;              /* Offset 14 */
-        uint32_t   io_io_high;             /* Offset 15 */
+	/* Runway Supervisory Set */
+	int32_t unused1[12];
+	uint32_t	io_command;	/* Offset 12 */
+	uint32_t	io_status;	/* Offset 13 */
+	uint32_t	io_control;	/* Offset 14 */
+	int32_t unused2[1];
+
+	/* Runway Auxiliary Register Set */
+	uint32_t	io_err_resp;	/* Offset  0 */
+	uint32_t	io_err_info;	/* Offset  1 */
+	uint32_t	io_err_req;	/* Offset  2 */
+	uint32_t	io_err_resp_hi;	/* Offset  3 */
+	uint32_t	io_tlb_entry_m;	/* Offset  4 */
+	uint32_t	io_tlb_entry_l;	/* Offset  5 */
+	uint32_t unused3[1];
+	uint32_t	io_pdir_base;	/* Offset  7 */
+	uint32_t	io_io_low_hv;	/* Offset  8 */
+	uint32_t	io_io_high_hv;	/* Offset  9 */
+        uint32_t unused4[1];
+	uint32_t	io_chain_id_mask;/* Offset 11 */
+	uint32_t unused5[2];
+	uint32_t	io_io_low;	/* Offset 14 */
+	uint32_t	io_io_high;	/* Offset 15 */
 };
 
 /*
@@ -146,7 +146,7 @@
 ** -------------
 **
 ** Runway IO_CONTROL Register (+0x38)
-** 
+**
 ** The Runway IO_CONTROL register controls the forwarding of transactions.
 **
 ** | 0  ...  13  |  14 15 | 16 ... 21 | 22 | 23 24 |  25 ... 31 |
@@ -173,7 +173,7 @@
 **
 ** o TLB field affects transactions which are forwarded from GSC+ to Runway.
 **   "Real" mode is the poweron default.
-** 
+**
 **   TLB Mode  Value  Description
 **   Real        0    No TLB translation. Address is directly mapped and the
 **                    virtual address is composed of selected physical bits.
@@ -218,7 +218,7 @@
 ** modify the architectural IO_IO_LOW and IO_IO_HIGH registers following
 ** the PDC initialization.  However, the hardware version dependent IO_IO_LOW
 ** and IO_IO_HIGH registers should not be subsequently altered by the OS.
-** 
+**
 ** Writes to both sets of registers will take effect immediately, bypassing
 ** the queues, which ensures that subsequent Runway transactions are checked
 ** against the updated bounds values. However reads are queued, introducing
@@ -228,40 +228,40 @@
 */
 
 struct ioc {
-	struct ioa_registers __iomem *ioc_regs;  /* I/O MMU base address */
-	u8  *res_map;	                /* resource map, bit == pdir entry */
-	u64 *pdir_base;	                /* physical base address */
-	u32 pdir_size; 			/* bytes, function of IOV Space size */
-	u32 res_hint;	                /* next available IOVP - 
-					   circular search */
-	u32 res_size;		    	/* size of resource map in bytes */
-	spinlock_t res_lock;
+	struct ioa_registers __iomem *ioc_regs;	/* I/O MMU base address */
+	u8		*res_map;		/* resource map, bit == pdir entry */
+	u64		*pdir_base;		/* physical base address */
+	u32		pdir_size; 		/* bytes, function of IOV Space size */
+	u32		res_hint;		/* next available IOVP -
+						   circular search */
+	u32		res_size;		/* size of resource map in bytes */
+	spinlock_t	res_lock;
 
 #ifdef CCIO_SEARCH_TIME
 #define CCIO_SEARCH_SAMPLE 0x100
-	unsigned long avg_search[CCIO_SEARCH_SAMPLE];
-	unsigned long avg_idx;		  /* current index into avg_search */
+	unsigned long	avg_search[CCIO_SEARCH_SAMPLE];
+	unsigned long	avg_idx;		/* current index into avg_search */
 #endif
 #ifdef CCIO_MAP_STATS
-	unsigned long used_pages;
-	unsigned long msingle_calls;
-	unsigned long msingle_pages;
-	unsigned long msg_calls;
-	unsigned long msg_pages;
-	unsigned long usingle_calls;
-	unsigned long usingle_pages;
-	unsigned long usg_calls;
-	unsigned long usg_pages;
+	unsigned long	used_pages;
+	unsigned long	msingle_calls;
+	unsigned long	msingle_pages;
+	unsigned long	msg_calls;
+	unsigned long	msg_pages;
+	unsigned long	usingle_calls;
+	unsigned long	usingle_pages;
+	unsigned long	usg_calls;
+	unsigned long	usg_pages;
 #endif
-	unsigned short cujo20_bug;
+	unsigned short	cujo20_bug;
 
 	/* STUFF We don't need in performance path */
-	u32 chainid_shift; 		/* specify bit location of chain_id */
-	struct ioc *next;		/* Linked list of discovered iocs */
-	const char *name;		/* device name from firmware */
-	unsigned int hw_path;           /* the hardware path this ioc is associatd with */
-	struct pci_dev *fake_pci_dev;   /* the fake pci_dev for non-pci devs */
-	struct resource mmio_region[2]; /* The "routed" MMIO regions */
+	u32		chainid_shift;	/* specify bit location of chain_id */
+	struct ioc	*next;		/* Linked list of discovered iocs */
+	const char	*name;		/* device name from firmware */
+	unsigned int	hw_path;	/* the hardware path this ioc is associatd with */
+	struct pci_dev	*fake_pci_dev;	/* the fake pci_dev for non-pci devs */
+	struct resource	mmio_region[2];	/* The "routed" MMIO regions */
 };
 
 static struct ioc *ioc_list;
@@ -282,17 +282,17 @@
 *   match the I/O TLB replacement policy.
 *
 ***************************************************************/
-#define IOVP_SIZE PAGE_SIZE
-#define IOVP_SHIFT PAGE_SHIFT
-#define IOVP_MASK PAGE_MASK
+#define IOVP_SIZE	PAGE_SIZE
+#define IOVP_SHIFT	PAGE_SHIFT
+#define IOVP_MASK	PAGE_MASK
 
 /* Convert from IOVP to IOVA and vice versa. */
-#define CCIO_IOVA(iovp,offset) ((iovp) | (offset))
-#define CCIO_IOVP(iova) ((iova) & IOVP_MASK)
+#define CCIO_IOVA(iovp,offset)	((iovp) | (offset))
+#define CCIO_IOVP(iova)		((iova) & IOVP_MASK)
 
-#define PDIR_INDEX(iovp)    ((iovp)>>IOVP_SHIFT)
-#define MKIOVP(pdir_idx)    ((long)(pdir_idx) << IOVP_SHIFT)
-#define MKIOVA(iovp,offset) (dma_addr_t)((long)iovp | (long)offset)
+#define PDIR_INDEX(iovp)	((iovp)>>IOVP_SHIFT)
+#define MKIOVP(pdir_idx)	((long)(pdir_idx) << IOVP_SHIFT)
+#define MKIOVA(iovp,offset)	(dma_addr_t)((long)iovp | (long)offset)
 
 /*
 ** Don't worry about the 150% average search length on a miss.
@@ -350,8 +350,8 @@
 	
 	BUG_ON(pages_needed == 0);
 	BUG_ON((pages_needed * IOVP_SIZE) > DMA_CHUNK_SIZE);
-     
-	DBG_RES("%s() size: %d pages_needed %d\n", 
+
+	DBG_RES("%s() size: %d pages_needed %d\n",
 		__FUNCTION__, size, pages_needed);
 
 	/*
@@ -409,7 +409,7 @@
 #ifdef CCIO_MAP_STATS
 	ioc->used_pages += pages_needed;
 #endif
-	/* 
+	/*
 	** return the bit address.
 	*/
 	return res_idx << 3;
@@ -439,7 +439,7 @@
 	BUG_ON((pages_mapped * IOVP_SIZE) > DMA_CHUNK_SIZE);
 	BUG_ON(pages_mapped > BITS_PER_LONG);
 
-	DBG_RES("%s():  res_idx: %d pages_mapped %d\n", 
+	DBG_RES("%s():  res_idx: %d pages_mapped %d\n",
 		__FUNCTION__, res_idx, pages_mapped);
 
 #ifdef CCIO_MAP_STATS
@@ -478,7 +478,7 @@
 #define KERNEL_SPACE 0
 
 /*
-** DMA "Page Type" and Hints 
+** DMA "Page Type" and Hints
 ** o if SAFE_DMA isn't set, mapping is for FAST_DMA. SAFE_DMA should be
 **   set for subcacheline DMA transfers since we don't want to damage the
 **   other part of a cacheline.
@@ -497,7 +497,7 @@
 **   and Invalidation of Prefetch Entries".
 **
 ** FIXME: the default hints need to be per GSC device - not global.
-** 
+**
 ** HP-UX dorks: linux device driver programming model is totally different
 **    than HP-UX's. HP-UX always sets HINT_PREFETCH since it's drivers
 **    do special things to work on non-coherent platforms...linux has to
@@ -553,7 +553,7 @@
  * The virtual index field is filled with the results of the LCI
  * (Load Coherence Index) instruction.  The 8 bits used for the virtual
  * index are bits 12:19 of the value returned by LCI.
- */ 
+ */
 void CCIO_INLINE
 ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
 		   unsigned long hints)
@@ -660,7 +660,7 @@
  *        (We do need to maker I/O PDIR entries invalid regardless).
  *
  * FIXME: Can we change byte_cnt to pages_mapped?
- */ 
+ */
 static CCIO_INLINE void
 ccio_mark_invalid(struct ioc *ioc, dma_addr_t iova, size_t byte_cnt)
 {
@@ -676,7 +676,7 @@
 		char *pdir_ptr = (char *) &(ioc->pdir_base[idx]);
 
 		BUG_ON(idx >= (ioc->pdir_size / sizeof(u64)));
-		pdir_ptr[7] = 0;	/* clear only VALID bit */ 
+		pdir_ptr[7] = 0;	/* clear only VALID bit */
 		/*
 		** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
 		**   PCX-U/U+ do. (eg C200/C240)
@@ -708,7 +708,7 @@
  *
  * This function implements the pci_dma_supported function.
  */
-static int 
+static int
 ccio_dma_supported(struct device *dev, u64 mask)
 {
 	if(dev == NULL) {
@@ -730,7 +730,7 @@
  *
  * This function implements the pci_map_single function.
  */
-static dma_addr_t 
+static dma_addr_t
 ccio_map_single(struct device *dev, void *addr, size_t size,
 		enum dma_data_direction direction)
 {
@@ -798,12 +798,12 @@
  *
  * This function implements the pci_unmap_single function.
  */
-static void 
-ccio_unmap_single(struct device *dev, dma_addr_t iova, size_t size, 
+static void
+ccio_unmap_single(struct device *dev, dma_addr_t iova, size_t size,
 		  enum dma_data_direction direction)
 {
 	struct ioc *ioc;
-	unsigned long flags; 
+	unsigned long flags;
 	dma_addr_t offset = iova & ~IOVP_MASK;
 	
 	BUG_ON(!dev);
@@ -836,7 +836,7 @@
  *
  * This function implements the pci_alloc_consistent function.
  */
-static void * 
+static void *
 ccio_alloc_consistent(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag)
 {
       void *ret;
@@ -869,8 +869,8 @@
  *
  * This function implements the pci_free_consistent function.
  */
-static void 
-ccio_free_consistent(struct device *dev, size_t size, void *cpu_addr, 
+static void
+ccio_free_consistent(struct device *dev, size_t size, void *cpu_addr,
 		     dma_addr_t dma_handle)
 {
 	ccio_unmap_single(dev, dma_handle, size, 0);
@@ -899,7 +899,7 @@
  * This function implements the pci_map_sg function.
  */
 static int
-ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents, 
+ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	    enum dma_data_direction direction)
 {
 	struct ioc *ioc;
@@ -947,7 +947,7 @@
 	**
 	** map the virtual addresses to the I/O Pdir
 	** o dma_address will contain the pdir index
-	** o dma_len will contain the number of bytes to map 
+	** o dma_len will contain the number of bytes to map
 	** o page/offset contain the virtual address.
 	*/
 	filled = iommu_fill_pdir(ioc, sglist, nents, hint, ccio_io_pdir_entry);
@@ -975,8 +975,8 @@
  *
  * This function implements the pci_unmap_sg function.
  */
-static void 
-ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents, 
+static void
+ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	      enum dma_data_direction direction)
 {
 	struct ioc *ioc;
@@ -1016,7 +1016,7 @@
 	.dma_sync_single_for_cpu =	NULL,	/* NOP for U2/Uturn */
 	.dma_sync_single_for_device =	NULL,	/* NOP for U2/Uturn */
 	.dma_sync_sg_for_cpu =		NULL,	/* ditto */
-	.dma_sync_sg_for_device =		NULL,	/* ditto */
+	.dma_sync_sg_for_device =	NULL,	/* ditto */
 };
 
 #ifdef CONFIG_PROC_FS
@@ -1044,16 +1044,16 @@
 				  (int)(ioc->used_pages * 100 / total_pages));
 #endif
 
-		len += seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n", 
+		len += seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n",
 				  ioc->res_size, total_pages);
 
 #ifdef CCIO_SEARCH_TIME
 		min = max = ioc->avg_search[0];
 		for(j = 0; j < CCIO_SEARCH_SAMPLE; ++j) {
 			avg += ioc->avg_search[j];
-			if(ioc->avg_search[j] > max) 
+			if(ioc->avg_search[j] > max)
 				max = ioc->avg_search[j];
-			if(ioc->avg_search[j] < min) 
+			if(ioc->avg_search[j] < min)
 				min = ioc->avg_search[j];
 		}
 		avg /= CCIO_SEARCH_SAMPLE;
@@ -1070,7 +1070,7 @@
 		max = ioc->usingle_pages - ioc->usg_pages;
 		len += seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
 				  min, max, (int)((max * 1000)/min));
- 
+
 		len += seq_printf(m, "pci_map_sg()    : %8ld calls  %8ld pages (avg %d/1000)\n",
 				  ioc->msg_calls, ioc->msg_pages,
 				  (int)((ioc->msg_pages * 1000)/ioc->msg_calls));
@@ -1310,7 +1310,7 @@
 			iova_space_size>>20,
 			iov_order + PAGE_SHIFT);
 
-	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL, 
+	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL,
 						 get_order(ioc->pdir_size));
 	if(NULL == ioc->pdir_base) {
 		panic("%s() could not allocate I/O Page Table\n", __FUNCTION__);
@@ -1324,7 +1324,7 @@
  	ioc->res_size = (ioc->pdir_size / sizeof(u64)) >> 3;
 	DBG_INIT("%s() res_size 0x%x\n", __FUNCTION__, ioc->res_size);
 	
-	ioc->res_map = (u8 *)__get_free_pages(GFP_KERNEL, 
+	ioc->res_map = (u8 *)__get_free_pages(GFP_KERNEL,
 					      get_order(ioc->res_size));
 	if(NULL == ioc->res_map) {
 		panic("%s() could not allocate resource map\n", __FUNCTION__);
@@ -1347,10 +1347,10 @@
 	/*
 	** Initialize IOA hardware
 	*/
-	WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift, 
+	WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift,
 		  &ioc->ioc_regs->io_chain_id_mask);
 
-	WRITE_U32(virt_to_phys(ioc->pdir_base), 
+	WRITE_U32(virt_to_phys(ioc->pdir_base),
 		  &ioc->ioc_regs->io_pdir_base);
 
 	/*
@@ -1398,7 +1398,7 @@
 	 */
 	result = insert_resource(&iomem_resource, res);
 	if (result < 0) {
-		printk(KERN_ERR "%s() failed to claim CCIO bus address space (%08lx,%08lx)\n", 
+		printk(KERN_ERR "%s() failed to claim CCIO bus address space (%08lx,%08lx)\n",
 	 		__FUNCTION__, res->start, res->end);
 	}
 }

--------------090708090909020603090108
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------090708090909020603090108--
