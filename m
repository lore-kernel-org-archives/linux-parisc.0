Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 808A24855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 27 Dec 2003 10:45:17 -0700 (MST)
Message-ID: <3FEDC568.30006@tiscali.be>
Date: Sat, 27 Dec 2003 17:46:16 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed; boundary="------------000306000706000404010004"
Subject: [parisc-linux] printk cleanup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000306000706000404010004
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

May I sugest following printk changes:
=========><=========
diff -Naur linux-2.6.0-pa5/arch/parisc/kernel/pci-dma.c linux-2.6.0-pa5.new/arch/parisc/kernel/pci-dma.c
--- linux-2.6.0-pa5/arch/parisc/kernel/pci-dma.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/arch/parisc/kernel/pci-dma.c	2003-12-27 17:51:39.000000000 +0100
@@ -261,11 +261,13 @@
  	} else if(pages_needed <= 32) {
  		PCXL_FIND_FREE_MAPPING(res_idx, mask, 32);
  	} else {
-		panic(__FILE__ ": pcxl_alloc_range() Too many pages to map.\n");
+		panic("%s: pcxl_alloc_range() Too many pages to map.\n",
+		      __FILE__);
  	}

  	dump_resmap();
-	panic(__FILE__ ": pcxl_alloc_range() out of dma mapping resources\n");
+	panic("%s: pcxl_alloc_range() out of dma mapping resources\n",
+	      __FILE__);
  	
  resource_found:
  	
@@ -319,7 +321,8 @@
  	} else if(pages_mapped <= 32) {
  		PCXL_FREE_MAPPINGS(res_idx, mask, 32);
  	} else {
-		panic(__FILE__ ": pcxl_free_range() Too many pages to unmap.\n");
+		panic("%s: pcxl_free_range() Too many pages to unmap.\n",
+		      __FILE__);
  	}
  	
  	pcxl_used_pages -= (pages_mapped ? pages_mapped : 1);
diff -Naur linux-2.6.0-pa5/arch/parisc/math-emu/decode_exc.c linux-2.6.0-pa5.new/arch/parisc/math-emu/decode_exc.c
--- linux-2.6.0-pa5/arch/parisc/math-emu/decode_exc.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/arch/parisc/math-emu/decode_exc.c	2003-12-27 16:47:42.000000000 +0100
@@ -347,7 +347,7 @@
  		return SIGNALCODE(SIGFPE, FPE_FLTRES);
  	  default:
  		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
-		printk(__FILE__ "(%d) Unknown FPU exception 0x%x\n",
+		printk("%s(%d) Unknown FPU exception 0x%x\n", __FILE__,
  			__LINE__, Excp_type(exception_index));
  		return SIGNALCODE(SIGILL, ILL_COPROC);
  	  case NOEXCEPTION:	/* no exception */
diff -Naur linux-2.6.0-pa5/drivers/parisc/ccio-dma.c linux-2.6.0-pa5.new/drivers/parisc/ccio-dma.c
--- linux-2.6.0-pa5/drivers/parisc/ccio-dma.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/drivers/parisc/ccio-dma.c	2003-12-27 16:55:57.000000000 +0100
@@ -364,11 +364,11 @@
  		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 64);
  #endif
  	} else {
-		panic(__FILE__ ": %s() Too many pages to map. pages_needed: %ld\n",
-		      __FUNCTION__, pages_needed);
+		panic("%s: %s() Too many pages to map. pages_needed: %ld\n",
+		       __FILE__,  __FUNCTION__, pages_needed);
  	}

-	panic(__FILE__ ": %s() I/O MMU is out of mapping resources.\n",
+	panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__,
  	      __FUNCTION__);
  	
  resource_found:
@@ -441,7 +441,7 @@
  		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 64);
  #endif
  	} else {
-		panic(__FILE__ ":%s() Too many pages to unmap.\n",
+		panic("%s:%s() Too many pages to unmap.\n", __FILE__,
  		      __FUNCTION__);
  	}
  }
@@ -1447,7 +1447,8 @@
  	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL,
  						 get_order(ioc->pdir_size));
  	if(NULL == ioc->pdir_base) {
-		panic(__FILE__ ":%s() could not allocate I/O Page Table\n", __FUNCTION__);
+		panic("%s:%s() could not allocate I/O Page Table\n", __FILE__,
+		      __FUNCTION__);
  	}
  	memset(ioc->pdir_base, 0, ioc->pdir_size);

@@ -1461,7 +1462,8 @@
  	ioc->res_map = (u8 *)__get_free_pages(GFP_KERNEL,
  					      get_order(ioc->res_size));
  	if(NULL == ioc->res_map) {
-		panic(__FILE__ ":%s() could not allocate resource map\n", __FUNCTION__);
+		panic("%s:%s() could not allocate resource map\n", __FILE__,
+		      __FUNCTION__);
  	}
  	memset(ioc->res_map, 0, ioc->res_size);

diff -Naur linux-2.6.0-pa5/drivers/parisc/sba_iommu.c linux-2.6.0-pa5.new/drivers/parisc/sba_iommu.c
--- linux-2.6.0-pa5/drivers/parisc/sba_iommu.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/drivers/parisc/sba_iommu.c	2003-12-27 16:57:40.000000000 +0100
@@ -579,7 +579,8 @@
  	if (pide >= (ioc->res_size << 3)) {
  		pide = sba_search_bitmap(ioc, pages_needed);
  		if (pide >= (ioc->res_size << 3))
-			panic(__FILE__ ": I/O MMU @ %lx is out of mapping resources\n", ioc->ioc_hpa);
+			panic("%s: I/O MMU @ %lx is out of mapping resources\n",
+			      __FILE__, ioc->ioc_hpa);
  	}

  #ifdef ASSERT_PDIR_SANITY
@@ -1781,7 +1782,8 @@

  		if (NULL == sba_dev->ioc[i].res_map)
  		{
-			panic(__FILE__ ":%s() could not allocate resource map\n", __FUNCTION__ );
+			panic("%s:%s() could not allocate resource map\n",
+			      __FILE__, __FUNCTION__ );
  		}

  		memset(sba_dev->ioc[i].res_map, 0, res_size);
diff -Naur linux-2.6.0-pa5/include/asm-parisc/pci.h linux-2.6.0-pa5.new/include/asm-parisc/pci.h
--- linux-2.6.0-pa5/include/asm-parisc/pci.h	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/include/asm-parisc/pci.h	2003-12-27 18:12:53.303140000 +0100
@@ -29,7 +29,8 @@
  #ifdef PCI_DEBUG
  #define ASSERT(expr) \
  	if(!(expr)) { \
-		printk( "\n" __FILE__ ":%d: Assertion " #expr " failed!\n",__LINE__); \
+		printk("\n%s:%d: Assertion " #expr " failed!\n", __FILE__,
+		       __LINE__); \
  		panic(#expr); \
  	}
  #else
=========><=========

hth,
	Joel

PS: I also notice some printk("\n" KERNEL_... "...");
would it not be better to change in printk(KERNEL_... "\n...");

--------------000306000706000404010004
Content-Type: text/plain;
 name="PrintK.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="PrintK.diff"

diff -Naur linux-2.6.0-pa5/arch/parisc/kernel/pci-dma.c linux-2.6.0-pa5.new/arch/parisc/kernel/pci-dma.c
--- linux-2.6.0-pa5/arch/parisc/kernel/pci-dma.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/arch/parisc/kernel/pci-dma.c	2003-12-27 17:51:39.000000000 +0100
@@ -261,11 +261,13 @@
 	} else if(pages_needed <= 32) {
 		PCXL_FIND_FREE_MAPPING(res_idx, mask, 32);
 	} else {
-		panic(__FILE__ ": pcxl_alloc_range() Too many pages to map.\n");
+		panic("%s: pcxl_alloc_range() Too many pages to map.\n",
+		      __FILE__);
 	}
 
 	dump_resmap();
-	panic(__FILE__ ": pcxl_alloc_range() out of dma mapping resources\n");
+	panic("%s: pcxl_alloc_range() out of dma mapping resources\n",
+	      __FILE__);
 	
 resource_found:
 	
@@ -319,7 +321,8 @@
 	} else if(pages_mapped <= 32) {
 		PCXL_FREE_MAPPINGS(res_idx, mask, 32);
 	} else {
-		panic(__FILE__ ": pcxl_free_range() Too many pages to unmap.\n");
+		panic("%s: pcxl_free_range() Too many pages to unmap.\n",
+		      __FILE__);
 	}
 	
 	pcxl_used_pages -= (pages_mapped ? pages_mapped : 1);
diff -Naur linux-2.6.0-pa5/arch/parisc/math-emu/decode_exc.c linux-2.6.0-pa5.new/arch/parisc/math-emu/decode_exc.c
--- linux-2.6.0-pa5/arch/parisc/math-emu/decode_exc.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/arch/parisc/math-emu/decode_exc.c	2003-12-27 16:47:42.000000000 +0100
@@ -347,7 +347,7 @@
 		return SIGNALCODE(SIGFPE, FPE_FLTRES);
 	  default:
 		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
-		printk(__FILE__ "(%d) Unknown FPU exception 0x%x\n",
+		printk("%s(%d) Unknown FPU exception 0x%x\n", __FILE__,
 			__LINE__, Excp_type(exception_index));
 		return SIGNALCODE(SIGILL, ILL_COPROC);
 	  case NOEXCEPTION:	/* no exception */
diff -Naur linux-2.6.0-pa5/drivers/parisc/ccio-dma.c linux-2.6.0-pa5.new/drivers/parisc/ccio-dma.c
--- linux-2.6.0-pa5/drivers/parisc/ccio-dma.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/drivers/parisc/ccio-dma.c	2003-12-27 16:55:57.000000000 +0100
@@ -364,11 +364,11 @@
 		CCIO_FIND_FREE_MAPPING(ioc, res_idx, mask, 64);
 #endif
 	} else {
-		panic(__FILE__ ": %s() Too many pages to map. pages_needed: %ld\n", 
-		      __FUNCTION__, pages_needed);
+		panic("%s: %s() Too many pages to map. pages_needed: %ld\n",
+		       __FILE__,  __FUNCTION__, pages_needed);
 	}
 
-	panic(__FILE__ ": %s() I/O MMU is out of mapping resources.\n", 
+	panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__,
 	      __FUNCTION__);
 	
 resource_found:
@@ -441,7 +441,7 @@
 		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 64);
 #endif
 	} else {
-		panic(__FILE__ ":%s() Too many pages to unmap.\n", 
+		panic("%s:%s() Too many pages to unmap.\n", __FILE__,
 		      __FUNCTION__);
 	}
 }
@@ -1447,7 +1447,8 @@
 	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL, 
 						 get_order(ioc->pdir_size));
 	if(NULL == ioc->pdir_base) {
-		panic(__FILE__ ":%s() could not allocate I/O Page Table\n", __FUNCTION__);
+		panic("%s:%s() could not allocate I/O Page Table\n", __FILE__,
+		      __FUNCTION__);
 	}
 	memset(ioc->pdir_base, 0, ioc->pdir_size);
 
@@ -1461,7 +1462,8 @@
 	ioc->res_map = (u8 *)__get_free_pages(GFP_KERNEL, 
 					      get_order(ioc->res_size));
 	if(NULL == ioc->res_map) {
-		panic(__FILE__ ":%s() could not allocate resource map\n", __FUNCTION__);
+		panic("%s:%s() could not allocate resource map\n", __FILE__,
+		      __FUNCTION__);
 	}
 	memset(ioc->res_map, 0, ioc->res_size);
 
diff -Naur linux-2.6.0-pa5/drivers/parisc/sba_iommu.c linux-2.6.0-pa5.new/drivers/parisc/sba_iommu.c
--- linux-2.6.0-pa5/drivers/parisc/sba_iommu.c	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/drivers/parisc/sba_iommu.c	2003-12-27 16:57:40.000000000 +0100
@@ -579,7 +579,8 @@
 	if (pide >= (ioc->res_size << 3)) {
 		pide = sba_search_bitmap(ioc, pages_needed);
 		if (pide >= (ioc->res_size << 3))
-			panic(__FILE__ ": I/O MMU @ %lx is out of mapping resources\n", ioc->ioc_hpa);
+			panic("%s: I/O MMU @ %lx is out of mapping resources\n",
+			      __FILE__, ioc->ioc_hpa);
 	}
 
 #ifdef ASSERT_PDIR_SANITY
@@ -1781,7 +1782,8 @@
 
 		if (NULL == sba_dev->ioc[i].res_map)
 		{
-			panic(__FILE__ ":%s() could not allocate resource map\n", __FUNCTION__ );
+			panic("%s:%s() could not allocate resource map\n",
+			      __FILE__, __FUNCTION__ );
 		}
 
 		memset(sba_dev->ioc[i].res_map, 0, res_size);
diff -Naur linux-2.6.0-pa5/include/asm-parisc/pci.h linux-2.6.0-pa5.new/include/asm-parisc/pci.h
--- linux-2.6.0-pa5/include/asm-parisc/pci.h	2003-12-27 16:36:55.000000000 +0100
+++ linux-2.6.0-pa5.new/include/asm-parisc/pci.h	2003-12-27 18:12:53.303140000 +0100
@@ -29,7 +29,8 @@
 #ifdef PCI_DEBUG
 #define ASSERT(expr) \
 	if(!(expr)) { \
-		printk( "\n" __FILE__ ":%d: Assertion " #expr " failed!\n",__LINE__); \
+		printk("\n%s:%d: Assertion " #expr " failed!\n", __FILE__,
+		       __LINE__); \
 		panic(#expr); \
 	}
 #else

--------------000306000706000404010004--
