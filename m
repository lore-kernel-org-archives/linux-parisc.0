From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] PATCH/RFC: discontig mem support for hppa
Date: Sun, 4 Jul 2004 11:14:23 -0700
Message-ID: <20040704181423.GG18628@tausq.org>
References: <20040703180852.GD18628@tausq.org> <40E7028A.7060905@tiscali.be>
	<20040703195349.GE18628@tausq.org>
	<40E71BF2.2040601@tiscali.be> <40E71D38.8010000@tiscali.be>
	<40E71F91.2030001@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40E71F91.2030001@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Joel Soete wrote:
> >Sorry for self reply but with "#include <asm/mmzone.h>" that works 
> >better but still failled:
> >arch/parisc/mm/init.c: In function `paging_init':
> >arch/parisc/mm/init.c:793: warning: implicit declaration of function 
> >`node_start_pfn'
> >arch/parisc/mm/init.c:793: error: `PFNNID_SHIFT' undeclared (first use 

sorry about that. try this one instead.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


Index: arch/parisc/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/Kconfig,v
retrieving revision 1.19
diff -u -p -r1.19 Kconfig
--- arch/parisc/Kconfig	1 Jul 2004 18:30:36 -0000	1.19
+++ arch/parisc/Kconfig	3 Jul 2004 06:55:49 -0000
@@ -136,6 +136,15 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config DISCONTIGMEM
+	bool "Discontiguous memory support (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	help
+	  Say Y to support efficient handling of discontiguous physical memory,
+	  for architectures which are either NUMA (Non-Uniform Memory Access)
+	  or have huge holes in the physical address space for other reasons.
+	  See <file:Documentation/vm/numa> for more.
+
 config PREEMPT
 	bool
 #	bool "Preemptible Kernel"
Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.17
diff -u -p -r1.17 cache.c
--- arch/parisc/kernel/cache.c	30 May 2004 18:57:23 -0000	1.17
+++ arch/parisc/kernel/cache.c	3 Jul 2004 06:55:49 -0000
@@ -69,7 +69,7 @@ update_mmu_cache(struct vm_area_struct *
 {
 	struct page *page = pte_page(pte);
 
-	if (VALID_PAGE(page) && page_mapping(page) &&
+	if (pfn_valid(page_to_pfn(page)) && page_mapping(page) &&
 	    test_bit(PG_dcache_dirty, &page->flags)) {
 
 		flush_kernel_dcache_page(page_address(page));
Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/inventory.c,v
retrieving revision 1.5
diff -u -p -r1.5 inventory.c
--- arch/parisc/kernel/inventory.c	4 Jun 2004 19:36:53 -0000	1.5
+++ arch/parisc/kernel/inventory.c	4 Jul 2004 17:46:52 -0000
@@ -25,6 +25,7 @@
 #include <linux/mm.h>
 #include <asm/hardware.h>
 #include <asm/io.h>
+#include <asm/mmzone.h>
 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
 #include <asm/processor.h>
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/init.c,v
retrieving revision 1.6
diff -u -p -r1.6 init.c
--- arch/parisc/mm/init.c	24 May 2004 00:58:49 -0000	1.6
+++ arch/parisc/mm/init.c	4 Jul 2004 17:45:03 -0000
@@ -5,6 +5,7 @@
  *  Copyright 1999 SuSE GmbH
  *    changed by Philipp Rumpf
  *  Copyright 1999 Philipp Rumpf (prumpf@tux.org)
+ *  Copyright 2004 Randolph Chung (tausq@debian.org)
  *
  */
 
@@ -23,6 +24,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/pdc_chassis.h>
+#include <asm/mmzone.h>
 
 DEFINE_PER_CPU(struct mmu_gather, mmu_gathers);
 
@@ -32,10 +34,11 @@ extern char _end;	/* end of BSS, defined
 extern char __init_begin, __init_end;
 
 #ifdef CONFIG_DISCONTIGMEM
-struct node_map_data node_data[MAX_PHYSMEM_RANGES];
-bootmem_data_t bmem_data[MAX_PHYSMEM_RANGES];
-unsigned char *chunkmap;
-unsigned int maxchunkmap;
+struct node_map_data node_data[MAX_NUMNODES];
+bootmem_data_t bmem_data[MAX_NUMNODES];
+
+/* Support up to 512GB of physical address space */
+unsigned char pfnnid_map[512];
 #endif
 
 static struct resource data_resource = {
@@ -119,21 +122,6 @@ static void __init setup_bootmem(void)
 
 	disable_sr_hashing(); /* Turn off space register hashing */
 
-#ifdef CONFIG_DISCONTIGMEM
-	/*
-	 * The below is still true as of 2.4.2. If this is ever fixed,
-	 * we can remove this warning!
-	 */
-
-	printk(KERN_WARNING "\n\n");
-	printk(KERN_WARNING "CONFIG_DISCONTIGMEM is enabled, which is probably a mistake. This\n");
-	printk(KERN_WARNING "option can lead to heavy swapping, even when there are gigabytes\n");
-	printk(KERN_WARNING "of free memory.\n\n");
-#endif
-
-#ifdef __LP64__
-
-#ifndef CONFIG_DISCONTIGMEM
 	/*
 	 * Sort the ranges. Since the number of ranges is typically
 	 * small, and performance is not an issue here, just do
@@ -160,11 +148,10 @@ static void __init setup_bootmem(void)
 		}
 	}
 
+#ifndef CONFIG_DISCONTIGMEM
 	/*
 	 * Throw out ranges that are too far apart (controlled by
-	 * MAX_GAP). If CONFIG_DISCONTIGMEM wasn't implemented so
-	 * poorly, we would recommend enabling that option, but,
-	 * until it is fixed, this is the best way to go.
+	 * MAX_GAP).
 	 */
 
 	for (i = 1; i < npmem_ranges; i++) {
@@ -172,6 +159,11 @@ static void __init setup_bootmem(void)
 			(pmem_ranges[i-1].start_pfn +
 			 pmem_ranges[i-1].pages) > MAX_GAP) {
 			npmem_ranges = i;
+			printk("Large gap in memory detected (%ld pages). "
+			       "Consider turning on CONFIG_DISCONTIGMEM\n",
+			       pmem_ranges[i].start_pfn -
+			       (pmem_ranges[i-1].start_pfn +
+			        pmem_ranges[i-1].pages));
 			break;
 		}
 	}
@@ -194,8 +186,6 @@ static void __init setup_bootmem(void)
 		}
 	}
 
-#endif /* __LP64__ */
-
 	sysram_resource_count = npmem_ranges;
 	for (i = 0; i < sysram_resource_count; i++) {
 		struct resource *res = &sysram_resources[i];
@@ -218,6 +208,7 @@ static void __init setup_bootmem(void)
 	mem_limit_func();       /* check for "mem=" argument */
 
 	mem_max = 0;
+	num_physpages = 0;
 	for (i = 0; i < npmem_ranges; i++) {
 		unsigned long rsize;
 
@@ -232,8 +223,10 @@ static void __init setup_bootmem(void)
 				npmem_ranges = i + 1;
 				mem_max = mem_limit;
 			}
+	        num_physpages += pmem_ranges[i].pages;
 			break;
 		}
+	    num_physpages += pmem_ranges[i].pages;
 		mem_max += rsize;
 	}
 
@@ -272,9 +265,13 @@ static void __init setup_bootmem(void)
 	bootmap_start_pfn = PAGE_ALIGN(__pa((unsigned long) &_end)) >> PAGE_SHIFT;
 
 #ifdef CONFIG_DISCONTIGMEM
-	for (i = 0; i < npmem_ranges; i++)
-		node_data[i].pg_data.bdata = &bmem_data[i];
+	for (i = 0; i < MAX_PHYSMEM_RANGES; i++) {
+		memset(NODE_DATA(i), 0, sizeof(pg_data_t));
+		NODE_DATA(i)->bdata = &bmem_data[i];
+	}
+    memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
 #endif
+
 	/*
 	 * Initialize and free the full range of memory in each range.
 	 * Note that the only writing these routines do are to the bootmap,
@@ -443,16 +440,20 @@ unsigned long pcxl_dma_start;
 
 void __init mem_init(void)
 {
-	int i;
-
 	high_memory = __va((max_pfn << PAGE_SHIFT));
-	max_mapnr = (virt_to_page(high_memory - 1) - mem_map) + 1;
 
-	num_physpages = 0;
-	mem_map = zone_table[0]->zone_mem_map;
-	for (i = 0; i < npmem_ranges; i++)
-		num_physpages += free_all_bootmem_node(NODE_DATA(i));
-	totalram_pages = num_physpages;
+#ifndef CONFIG_DISCONTIGMEM
+	max_mapnr = page_to_pfn(virt_to_page(high_memory - 1)) + 1;
+	mem_map = zone_table[ZONE_DMA]->zone_mem_map;
+#endif
+
+#ifndef CONFIG_DISCONTIGMEM
+	free_all_bootmem();
+#else
+	free_all_bootmem_node(NODE_DATA(0));
+#endif
+
+    totalram_pages = num_physpages;
 
 	printk(KERN_INFO "Memory: %luk available\n", num_physpages << (PAGE_SHIFT-10));
 
@@ -485,6 +486,7 @@ void show_mem(void)
 	printk(KERN_INFO "Mem-info:\n");
 	show_free_areas();
 	printk(KERN_INFO "Free swap:	 %6dkB\n",nr_swap_pages<<(PAGE_SHIFT-10));
+#ifndef CONFIG_DISCONTIGMEM
 	i = max_mapnr;
 	while (i-- > 0) {
 		total++;
@@ -497,6 +499,27 @@ void show_mem(void)
 		else
 			shared += page_count(&mem_map[i]) - 1;
 	}
+#else
+    for (i = 0; i < npmem_ranges; i++) {
+        int j;
+
+        for (j = node_start_pfn(i); j < node_end_pfn(i); j++) {
+            struct page *p;
+
+            p = node_mem_map(i) + j - node_start_pfn(i);
+
+			total++;
+			if (PageReserved(p))
+				reserved++;
+			else if (PageSwapCache(p))
+				cached++;
+			else if (!page_count(p))
+				free++;
+			else
+				shared += page_count(p) - 1;
+        }
+    }
+#endif
 	printk(KERN_INFO "%d pages of RAM\n", total);
 	printk(KERN_INFO "%d reserved pages\n", reserved);
 	printk(KERN_INFO "%d pages shared\n", shared);
@@ -757,61 +780,27 @@ void __init paging_init(void)
 	flush_tlb_all_local();
 
 	for (i = 0; i < npmem_ranges; i++) {
-		unsigned long zones_size[MAX_NR_ZONES] = { 0, 0, 0, };
+		unsigned long zones_size[MAX_NR_ZONES] = { 0, 0, 0 };
+
+		/* We have an IOMMU, so all memory can go into a single
+		   ZONE_DMA zone. */
 
 		zones_size[ZONE_DMA] = pmem_ranges[i].pages;
+
 		free_area_init_node(i,NODE_DATA(i),NULL,zones_size,
-				(pmem_ranges[i].start_pfn << PAGE_SHIFT),0);
-	}
+				pmem_ranges[i].start_pfn, 0);
 
 #ifdef CONFIG_DISCONTIGMEM
-	/*
-	 * Initialize support for virt_to_page() macro.
-	 *
-	 * Note that MAX_ADDRESS is the largest virtual address that
-	 * we can map. However, since we map all physical memory into
-	 * the kernel address space, it also has an effect on the maximum
-	 * physical address we can map (MAX_ADDRESS - PAGE_OFFSET).
-	 */
-
-	maxchunkmap = MAX_ADDRESS >> CHUNKSHIFT;
-	chunkmap = (unsigned char *)alloc_bootmem(maxchunkmap);
-
-	for (i = 0; i < maxchunkmap; i++)
-	    chunkmap[i] = BADCHUNK;
-
-	for (i = 0; i < npmem_ranges; i++) {
-
-		ADJ_NODE_MEM_MAP(i) = NODE_MEM_MAP(i) - pmem_ranges[i].start_pfn;
 		{
-			unsigned long chunk_paddr;
-			unsigned long end_paddr;
-			int chunknum;
-
-			chunk_paddr = (pmem_ranges[i].start_pfn << PAGE_SHIFT);
-			end_paddr = chunk_paddr + (pmem_ranges[i].pages << PAGE_SHIFT);
-			chunk_paddr &= CHUNKMASK;
-
-			chunknum = (int)CHUNKNUM(chunk_paddr);
-			while (chunk_paddr < end_paddr) {
-				if (chunknum >= maxchunkmap)
-					goto badchunkmap1;
-				if (chunkmap[chunknum] != BADCHUNK)
-					goto badchunkmap2;
-				chunkmap[chunknum] = (unsigned char)i;
-				chunk_paddr += CHUNKSZ;
-				chunknum++;
-			}
+		    int j;
+		    for (j = (node_start_pfn(i) >> PFNNID_SHIFT);
+			 j < (node_end_pfn(i) >> PFNNID_SHIFT);
+			 j++) {
+			pfnnid_map[j] = i;
+		    }
 		}
-	}
-
-	return;
-
-badchunkmap1:
-	panic("paging_init: Physical address exceeds maximum address space!\n");
-badchunkmap2:
-	panic("paging_init: Collision in chunk map array. CHUNKSZ needs to be smaller\n");
 #endif
+	}
 }
 
 #ifdef CONFIG_PA20
Index: fs/bio.c
===================================================================
RCS file: /var/cvs/linux-2.6/fs/bio.c,v
retrieving revision 1.9
diff -u -p -r1.9 bio.c
--- fs/bio.c	23 May 2004 23:52:39 -0000	1.9
+++ fs/bio.c	3 Jul 2004 06:55:49 -0000
@@ -345,8 +345,8 @@ static int __bio_add_page(request_queue_
 	}
 
 	/* If we may be able to merge these biovecs, force a recount */
-	if(BIOVEC_PHYS_MERGEABLE(bvec-1, bvec) ||
-	   BIOVEC_VIRT_MERGEABLE(bvec-1, bvec))
+	if (bio->bi_vcnt && (BIOVEC_PHYS_MERGEABLE(bvec-1, bvec) ||
+	    BIOVEC_VIRT_MERGEABLE(bvec-1, bvec)))
 		bio->bi_flags &= ~(1 << BIO_SEG_VALID);
 
 	bio->bi_vcnt++;
Index: include/asm-parisc/io.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/io.h,v
retrieving revision 1.7
diff -u -p -r1.7 io.h
--- include/asm-parisc/io.h	10 Mar 2004 19:24:49 -0000	1.7
+++ include/asm-parisc/io.h	3 Jul 2004 06:55:49 -0000
@@ -24,11 +24,6 @@ extern unsigned long parisc_vmerge_max_s
 #define virt_to_bus virt_to_phys
 #define bus_to_virt phys_to_virt
 
-/*
- * Change "struct page" to physical address.
- */
-#define page_to_phys(page)	((page - mem_map) << PAGE_SHIFT)
-
 /* Memory mapped IO */
 
 extern void * __ioremap(unsigned long offset, unsigned long size, unsigned long flags);
Index: include/asm-parisc/mmzone.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/mmzone.h,v
retrieving revision 1.1
diff -u -p -r1.1 mmzone.h
--- include/asm-parisc/mmzone.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/mmzone.h	3 Jul 2004 17:48:26 -0000
@@ -1,31 +1,89 @@
 #ifndef _PARISC_MMZONE_H
 #define _PARISC_MMZONE_H
 
+#ifdef CONFIG_DISCONTIGMEM
+
+#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
+extern int npmem_ranges;
+
 struct node_map_data {
     pg_data_t pg_data;
-    struct page *adj_node_mem_map;
 };
 
 extern struct node_map_data node_data[];
-extern unsigned char *chunkmap;
-
-#define BADCHUNK                ((unsigned char)0xff)
-#define CHUNKSZ                 (256*1024*1024)
-#define CHUNKSHIFT              28
-#define CHUNKMASK               (~(CHUNKSZ - 1))
-#define CHUNKNUM(paddr)         ((paddr) >> CHUNKSHIFT)
 
 #define NODE_DATA(nid)          (&node_data[nid].pg_data)
-#define NODE_MEM_MAP(nid)       (NODE_DATA(nid)->node_mem_map)
-#define ADJ_NODE_MEM_MAP(nid)   (node_data[nid].adj_node_mem_map)
-
-#define phys_to_page(paddr) \
-	(ADJ_NODE_MEM_MAP(chunkmap[CHUNKNUM((paddr))]) \
-	+ ((paddr) >> PAGE_SHIFT))
-
-#define virt_to_page(kvaddr) phys_to_page(__pa(kvaddr))
-
-/* This is kind of bogus, need to investigate performance of doing it right */
-#define VALID_PAGE(page)	((page - mem_map) < max_mapnr)
 
-#endif /* !_PARISC_MMZONE_H */
+/*
+ * Given a kernel address, find the home node of the underlying memory.
+ */
+#define kvaddr_to_nid(kaddr)	pfn_to_nid(__pa(kaddr) >> PAGE_SHIFT)
+
+#define node_mem_map(nid)	(NODE_DATA(nid)->node_mem_map)
+#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
+#define node_end_pfn(nid)						\
+({									\
+	pg_data_t *__pgdat = NODE_DATA(nid);				\
+	__pgdat->node_start_pfn + __pgdat->node_spanned_pages;		\
+})
+#define node_localnr(pfn, nid)		((pfn) - node_start_pfn(nid))
+
+#define local_mapnr(kvaddr)						\
+({									\
+	unsigned long __pfn = __pa(kvaddr) >> PAGE_SHIFT;		\
+	(__pfn - node_start_pfn(pfn_to_nid(__pfn)));			\
+})
+
+#define pfn_to_page(pfn)						\
+({									\
+	unsigned long __pfn = (pfn);					\
+	int __node  = pfn_to_nid(__pfn);				\
+	&node_mem_map(__node)[node_localnr(__pfn,__node)];		\
+})
+
+#define page_to_pfn(pg)							\
+({									\
+	struct page *__page = pg;					\
+	struct zone *__zone = page_zone(__page);			\
+	BUG_ON(__zone == NULL);						\
+	(unsigned long)(__page - __zone->zone_mem_map)			\
+		+ __zone->zone_start_pfn;				\
+})
+
+/* We have these possible memory map layouts:
+ * Astro: 0-3.75, 67.75-68, 4-64
+ * zx1: 0-1, 257-260, 4-256
+ * Stretch (N-class): 0-2, 4-32, 34-xxx
+ */
+
+/* Since all the boundaries are on a 1GB-boundary, we can create
+ * an index table for pfn to nid lookup; each entry in pfnnid_map 
+ * represents 1GB, and contains the node that the memory belongs to. */
+
+#define PFNNID_SHIFT (30 - PAGE_SHIFT)
+extern unsigned char pfnnid_map[];
+
+static inline int pfn_to_nid(unsigned long pfn)
+{
+	unsigned int i;
+    unsigned char r;
+    i = pfn >> PFNNID_SHIFT;
+    r = pfnnid_map[i];
+    BUG_ON(r == 0xff);
+
+    return (int)r;
+}
+
+static inline int pfn_valid(int pfn)
+{
+	int nid = pfn_to_nid(pfn);
+
+	if (nid >= 0)
+		return (pfn < node_end_pfn(nid));
+	return 0;
+}
+
+#else /* !CONFIG_DISCONTIGMEM */
+#define MAX_PHYSMEM_RANGES 	1 
+#endif
+#endif /* _PARISC_MMZONE_H */
Index: include/asm-parisc/page.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/page.h,v
retrieving revision 1.9
diff -u -p -r1.9 page.h
--- include/asm-parisc/page.h	5 May 2004 23:02:47 -0000	1.9
+++ include/asm-parisc/page.h	3 Jul 2004 06:55:49 -0000
@@ -83,12 +83,6 @@ extern __inline__ int get_order(unsigned
 	return order;
 }
 
-#ifdef __LP64__
-#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
-#else
-#define MAX_PHYSMEM_RANGES 1 /* First range is only range that fits in 32 bits */
-#endif
-
 typedef struct __physmem_range {
 	unsigned long start_pfn;
 	unsigned long pages;       /* PAGE_SIZE pages */
@@ -144,15 +138,16 @@ extern int npmem_ranges;
 #define __pa(x)			((unsigned long)(x)-PAGE_OFFSET)
 #define __va(x)			((void *)((unsigned long)(x)+PAGE_OFFSET))
 
+#ifndef CONFIG_DISCONTIGMEM
 #define pfn_to_page(pfn)	(mem_map + (pfn))
 #define page_to_pfn(page)	((unsigned long)((page) - mem_map))
 #define pfn_valid(pfn)		((pfn) < max_mapnr)
+#endif /* CONFIG_DISCONTIGMEM */
+
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 
-#ifndef CONFIG_DISCONTIGMEM
-#define virt_to_page(kaddr)     (mem_map + (__pa(kaddr) >> PAGE_SHIFT))
-#define VALID_PAGE(page)	((page - mem_map) < max_mapnr)
-#endif  /* !CONFIG_DISCONTIGMEM */
+#define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
+#define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.13
diff -u -p -r1.13 pgtable.h
--- include/asm-parisc/pgtable.h	1 Jul 2004 20:24:38 -0000	1.13
+++ include/asm-parisc/pgtable.h	3 Jul 2004 06:55:49 -0000
@@ -353,11 +353,7 @@ extern inline pte_t pte_modify(pte_t pte
 
 #define pte_pfn(x) (pte_val(x) >> PAGE_SHIFT)
 
-#ifdef CONFIG_DISCONTIGMEM
-#define pte_page(x) (phys_to_page(pte_val(x)))
-#else
-#define pte_page(x) (mem_map+(pte_val(x) >> PAGE_SHIFT))
-#endif
+#define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
 #define pmd_page_kernel(pmd)	((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
 
--- include/asm-parisc/numnodes.h	Sat Jul  3 00:55:49 2004
+++ include/asm-parisc/numnodes.h	Sat Jul  3 00:55:49 2004
@@ -0,0 +1,9 @@
+#ifndef _ASM_MAX_NUMNODES_H
+#define _ASM_MAX_NUMNODES_H
+
+#include <linux/config.h>
+
+/* Max 8 Nodes */
+#define NODES_SHIFT	3
+
+#endif /* _ASM_MAX_NUMNODES_H */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
