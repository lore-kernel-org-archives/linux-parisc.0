From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop bootmem and switch to memblock
Date: Fri, 7 Oct 2016 16:50:21 +0200
Message-ID: <20161007145021.GA8317@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Memblock is the standard kernel boot-time memory tracker/allocator. Use it
instead of the bootmem allocator. This allows using kmemleak, CMA and
other features.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 689eb74..2a0339a 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,6 +10,8 @@ config PARISC
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
+	select HAVE_MEMBLOCK
+	select NO_BOOTMEM
 	select BUG
 	select BUILDTIME_EXTABLE_SORT
 	select HAVE_PERF_EVENTS
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index f3ead0b..5b8fae8 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -138,8 +138,6 @@ SECTIONS
 	/* BSS */
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE)
 
-	/* bootmap is allocated in setup_bootmem() directly behind bss. */
-
 	. = ALIGN(HUGEPAGE_SIZE);
 	_end = . ;
 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 6b3e7c6..356f384 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/bootmem.h>
+#include <linux/memblock.h>
 #include <linux/gfp.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -79,6 +80,34 @@ static struct resource sysram_resources[MAX_PHYSMEM_RANGES] __read_mostly;
 physmem_range_t pmem_ranges[MAX_PHYSMEM_RANGES] __read_mostly;
 int npmem_ranges __read_mostly;
 
+/*
+ * get_memblock() allocates pages via memblock.
+ * We can't use memblock_find_in_range(0, KERNEL_INITIAL_SIZE) here since it
+ * doesn't allocate from bottom to top which is needed because we only created
+ * the initial mapping up to KERNEL_INITIAL_SIZE in the assembly bootup code.
+ */
+static void * __init get_memblock(unsigned long size)
+{
+	static phys_addr_t search_addr __initdata;
+	phys_addr_t phys;
+
+	if (!search_addr)
+		search_addr = PAGE_ALIGN(__pa((unsigned long) &_end));
+	search_addr = ALIGN(search_addr, size);
+	while (!memblock_is_region_memory(search_addr, size) ||
+		memblock_is_region_reserved(search_addr, size)) {
+		search_addr += size;
+	}
+	phys = search_addr;
+
+	if (phys)
+		memblock_reserve(phys, size);
+	else
+		panic("get_memblock() failed.\n");
+
+	return __va(phys);
+}
+
 #ifdef CONFIG_64BIT
 #define MAX_MEM         (~0UL)
 #else /* !CONFIG_64BIT */
@@ -118,11 +147,7 @@ static void __init mem_limit_func(void)
 
 static void __init setup_bootmem(void)
 {
-	unsigned long bootmap_size;
 	unsigned long mem_max;
-	unsigned long bootmap_pages;
-	unsigned long bootmap_start_pfn;
-	unsigned long bootmap_pfn;
 #ifndef CONFIG_DISCONTIGMEM
 	physmem_range_t pmem_holes[MAX_PHYSMEM_RANGES - 1];
 	int npmem_holes;
@@ -178,33 +203,29 @@ static void __init setup_bootmem(void)
 	}
 #endif
 
-	if (npmem_ranges > 1) {
-
-		/* Print the memory ranges */
+	/* Print the memory ranges */
+	pr_info("Memory Ranges:\n");
 
-		printk(KERN_INFO "Memory Ranges:\n");
+	for (i = 0; i < npmem_ranges; i++) {
+		struct resource *res = &sysram_resources[i];
+		unsigned long start;
+		unsigned long size;
 
-		for (i = 0; i < npmem_ranges; i++) {
-			unsigned long start;
-			unsigned long size;
+		size = (pmem_ranges[i].pages << PAGE_SHIFT);
+		start = (pmem_ranges[i].start_pfn << PAGE_SHIFT);
+		pr_info("%2d) Start 0x%016lx End 0x%016lx Size %6ld MB\n",
+			i, start, start + (size - 1), size >> 20);
 
-			size = (pmem_ranges[i].pages << PAGE_SHIFT);
-			start = (pmem_ranges[i].start_pfn << PAGE_SHIFT);
-			printk(KERN_INFO "%2d) Start 0x%016lx End 0x%016lx Size %6ld MB\n",
-				i,start, start + (size - 1), size >> 20);
-		}
-	}
-
-	sysram_resource_count = npmem_ranges;
-	for (i = 0; i < sysram_resource_count; i++) {
-		struct resource *res = &sysram_resources[i];
+		/* request memory resource */
 		res->name = "System RAM";
-		res->start = pmem_ranges[i].start_pfn << PAGE_SHIFT;
-		res->end = res->start + (pmem_ranges[i].pages << PAGE_SHIFT)-1;
+		res->start = start;
+		res->end = start + size - 1;
 		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 		request_resource(&iomem_resource, res);
 	}
 
+	sysram_resource_count = npmem_ranges;
+
 	/*
 	 * For 32 bit kernels we limit the amount of memory we can
 	 * support, in order to preserve enough kernel address space
@@ -263,16 +284,9 @@ static void __init setup_bootmem(void)
 	}
 #endif
 
-	bootmap_pages = 0;
-	for (i = 0; i < npmem_ranges; i++)
-		bootmap_pages += bootmem_bootmap_pages(pmem_ranges[i].pages);
-
-	bootmap_start_pfn = PAGE_ALIGN(__pa((unsigned long) &_end)) >> PAGE_SHIFT;
-
 #ifdef CONFIG_DISCONTIGMEM
 	for (i = 0; i < MAX_PHYSMEM_RANGES; i++) {
 		memset(NODE_DATA(i), 0, sizeof(pg_data_t));
-		NODE_DATA(i)->bdata = &bootmem_node_data[i];
 	}
 	memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
 
@@ -284,28 +298,24 @@ static void __init setup_bootmem(void)
 
 	/*
 	 * Initialize and free the full range of memory in each range.
-	 * Note that the only writing these routines do are to the bootmap,
-	 * and we've made sure to locate the bootmap properly so that they
-	 * won't be writing over anything important.
 	 */
 
-	bootmap_pfn = bootmap_start_pfn;
 	max_pfn = 0;
 	for (i = 0; i < npmem_ranges; i++) {
 		unsigned long start_pfn;
 		unsigned long npages;
+		unsigned long start;
+		unsigned long size;
 
 		start_pfn = pmem_ranges[i].start_pfn;
 		npages = pmem_ranges[i].pages;
 
-		bootmap_size = init_bootmem_node(NODE_DATA(i),
-						bootmap_pfn,
-						start_pfn,
-						(start_pfn + npages) );
-		free_bootmem_node(NODE_DATA(i),
-				  (start_pfn << PAGE_SHIFT),
-				  (npages << PAGE_SHIFT) );
-		bootmap_pfn += (bootmap_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+		start = start_pfn << PAGE_SHIFT;
+		size = npages << PAGE_SHIFT;
+
+		/* add system RAM memblock */
+		memblock_add(start, size);
+
 		if ((start_pfn + npages) > max_pfn)
 			max_pfn = start_pfn + npages;
 	}
@@ -317,32 +327,22 @@ static void __init setup_bootmem(void)
 	 */
 	max_low_pfn = max_pfn;
 
-	/* bootmap sizing messed up? */
-	BUG_ON((bootmap_pfn - bootmap_start_pfn) != bootmap_pages);
-
 	/* reserve PAGE0 pdc memory, kernel text/data/bss & bootmap */
 
 #define PDC_CONSOLE_IO_IODC_SIZE 32768
 
-	reserve_bootmem_node(NODE_DATA(0), 0UL,
-			(unsigned long)(PAGE0->mem_free +
-				PDC_CONSOLE_IO_IODC_SIZE), BOOTMEM_DEFAULT);
-	reserve_bootmem_node(NODE_DATA(0), __pa(KERNEL_BINARY_TEXT_START),
-			(unsigned long)(_end - KERNEL_BINARY_TEXT_START),
-			BOOTMEM_DEFAULT);
-	reserve_bootmem_node(NODE_DATA(0), (bootmap_start_pfn << PAGE_SHIFT),
-			((bootmap_pfn - bootmap_start_pfn) << PAGE_SHIFT),
-			BOOTMEM_DEFAULT);
+	memblock_reserve(0UL, (unsigned long)(PAGE0->mem_free +
+				PDC_CONSOLE_IO_IODC_SIZE));
+	memblock_reserve(__pa(KERNEL_BINARY_TEXT_START),
+			(unsigned long)(_end - KERNEL_BINARY_TEXT_START));
 
 #ifndef CONFIG_DISCONTIGMEM
 
 	/* reserve the holes */
 
 	for (i = 0; i < npmem_holes; i++) {
-		reserve_bootmem_node(NODE_DATA(0),
-				(pmem_holes[i].start_pfn << PAGE_SHIFT),
-				(pmem_holes[i].pages << PAGE_SHIFT),
-				BOOTMEM_DEFAULT);
+		memblock_reserve((pmem_holes[i].start_pfn << PAGE_SHIFT),
+				(pmem_holes[i].pages << PAGE_SHIFT));
 	}
 #endif
 
@@ -360,8 +360,7 @@ static void __init setup_bootmem(void)
 			initrd_below_start_ok = 1;
 			printk(KERN_INFO "initrd: reserving %08lx-%08lx (mem_max %08lx)\n", __pa(initrd_start), __pa(initrd_start) + initrd_reserve, mem_max);
 
-			reserve_bootmem_node(NODE_DATA(0), __pa(initrd_start),
-					initrd_reserve, BOOTMEM_DEFAULT);
+			memblock_reserve(__pa(initrd_start), initrd_reserve);
 		}
 	}
 #endif
@@ -439,7 +438,7 @@ static void __init map_pages(unsigned long start_vaddr,
 		 */
 
 		if (!pmd) {
-			pmd = (pmd_t *) alloc_bootmem_low_pages_node(NODE_DATA(0), PAGE_SIZE << PMD_ORDER);
+			pmd = (pmd_t *) get_memblock(PAGE_SIZE << PMD_ORDER);
 			pmd = (pmd_t *) __pa(pmd);
 		}
 
@@ -458,8 +457,7 @@ static void __init map_pages(unsigned long start_vaddr,
 
 			pg_table = (pte_t *)pmd_address(*pmd);
 			if (!pg_table) {
-				pg_table = (pte_t *)
-					alloc_bootmem_low_pages_node(NODE_DATA(0), PAGE_SIZE);
+				pg_table = (pte_t *) get_memblock(PAGE_SIZE);
 				pg_table = (pte_t *) __pa(pg_table);
 			}
 
@@ -737,7 +735,7 @@ static void __init pagetable_init(void)
 	}
 #endif
 
-	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
+	empty_zero_page = get_memblock(PAGE_SIZE);
 }
 
 static void __init gateway_init(void)
