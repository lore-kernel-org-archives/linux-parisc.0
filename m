From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: rename parisc's vmalloc_start to parisc_vmalloc_start
Date: Sun, 27 Sep 2009 23:30:39 +0200
Message-ID: <4ABFD97F.7020004@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

building kernel 2.6.32(pre), gives this compiler warning:
/linus-linux-2.6/mm/vmalloc.c: In function 'pcpu_get_vm_areas':
/linus-linux-2.6/mm/vmalloc.c:2104: warning: 'vmalloc_start' is used uninitialized in this function

The reason is, that the code in mm/vmalloc defines a local variable called
vmalloc_start, which is already defined as global variable in parisc's code.

To avoid this kind of problems in future, I suggest to rename the parisc variable
to parisc_vmalloc_start.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fixmap.h
index de3fe3a..6fec4d4 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -21,9 +21,9 @@
  #define KERNEL_MAP_END		(TMPALIAS_MAP_START)
  
  #ifndef __ASSEMBLY__
-extern void *vmalloc_start;
+extern void *parisc_vmalloc_start;
  #define PCXL_DMA_MAP_SIZE	(8*1024*1024)
-#define VMALLOC_START		((unsigned long)vmalloc_start)
+#define VMALLOC_START		((unsigned long)parisc_vmalloc_start)
  #define VMALLOC_END		(KERNEL_MAP_END)
  #endif /*__ASSEMBLY__*/
  
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index d5aca31..13b6e3e 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -434,8 +434,8 @@ void mark_rodata_ro(void)
  #define SET_MAP_OFFSET(x) ((void *)(((unsigned long)(x) + VM_MAP_OFFSET) \
  				     & ~(VM_MAP_OFFSET-1)))
  
-void *vmalloc_start __read_mostly;
-EXPORT_SYMBOL(vmalloc_start);
+void *parisc_vmalloc_start __read_mostly;
+EXPORT_SYMBOL(parisc_vmalloc_start);
  
  #ifdef CONFIG_PA11
  unsigned long pcxl_dma_start __read_mostly;
@@ -496,13 +496,14 @@ void __init mem_init(void)
  #ifdef CONFIG_PA11
  	if (hppa_dma_ops == &pcxl_dma_ops) {
  		pcxl_dma_start = (unsigned long)SET_MAP_OFFSET(MAP_START);
-		vmalloc_start = SET_MAP_OFFSET(pcxl_dma_start + PCXL_DMA_MAP_SIZE);
+		parisc_vmalloc_start = SET_MAP_OFFSET(pcxl_dma_start
+						+ PCXL_DMA_MAP_SIZE);
  	} else {
  		pcxl_dma_start = 0;
-		vmalloc_start = SET_MAP_OFFSET(MAP_START);
+		parisc_vmalloc_start = SET_MAP_OFFSET(MAP_START);
  	}
  #else
-	vmalloc_start = SET_MAP_OFFSET(MAP_START);
+	parisc_vmalloc_start = SET_MAP_OFFSET(MAP_START);
  #endif
  
  	printk(KERN_INFO "Memory: %luk/%luk available (%dk kernel code, %dk reserved, %dk data, %dk init)\n",
