From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] CONFIG_DISCONTIGMEM, try 2
Date: Fri, 9 Jul 2004 01:03:41 -0700
Message-ID: <20040709080341.GG546@tausq.org>
References: <20040706071459.GA567@tausq.org>
	<1089136958.1767.534.camel@mulgrave>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1089136958.1767.534.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> We could save space by shifting the pointers before dereferencing. 
> Since the PTE/PMD pages are page aligned, we don't actually need the
> lower 12 bits of the pointer.  Although we currently use those bits for
> page flags, all we're really interested in are valid and present bits so
> with a bit of shifting, we could make these short pointers address up to
> 42 bits, which is over the range of even the pa8800's physical memory
> capabilities (40 bits).

Thanks for the idea :) After that and a bit more debugging I am now able
to actually allocate all 32GB of memory by userspace applications on the
n4k (I ran 15 copies of a program that allocated 2GB, and wrote one byte
to each page). [1]

The new patch is attached. It shifts the phys address by 8 bits, and
uses 4 bits for flags (only 3 bits are being used now). This gives us
the capability to address 1TB of physical memory, which is probably
sufficient for now (FLW? :)

This needs some more testing on 32-bit... especially Joel's early kernel
crash problem :( but if there are other comments please let me know,
otherwise I will commit this soon (after the crash problem is fixed, of
course). The fault handler is especially rather ugly. Perhaps some asm
experts can help optimize that a bit.

thanks
randolph

[1] Interestingly, but perhaps obviously, when you kill 15 
applications that each have mapped 2GB, it takes quite a long time for
the processes to go away :)
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
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.14
diff -u -p -r1.14 entry.S
--- arch/parisc/kernel/entry.S	2 May 2004 16:16:01 -0000	1.14
+++ arch/parisc/kernel/entry.S	9 Jul 2004 07:46:24 -0000
@@ -455,20 +455,28 @@
 	/* Look up a PTE in a 2-Level scheme (faulting at each
 	 * level if the entry isn't present 
 	 *
-	 * NOTE: we use ldw even for LP64 because our pte
-	 * and pmd are allocated <4GB */
+	 * NOTE: we use ldw even for LP64, since the short pointers
+	 * can address up to 1TB
+	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if PT_NLEVELS == 3
 	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
 	EXTR		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
-	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
+	DEP             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	copy		%r0,\pte
 	ldw,s		\index(\pmd),\pmd
+	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
+	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
+	copy		\pmd,%r9
+#ifdef __LP64__
+	shld		%r9,PxD_VALUE_SHIFT,\pmd
+#else
+	shlw		%r9,PxD_VALUE_SHIFT,\pmd
+#endif
 	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
-	bb,>=,n		\pmd,_PAGE_PRESENT_BIT,\fault
-	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
+	DEP		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
 	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
@@ -489,10 +497,16 @@
 	copy		%r0,\pte
 	extrd,u,*=	\va,31,32,%r0
 	ldw,s		\index(\pgd),\pgd
+	extrd,u,*=	\va,31,32,%r0
+	bb,>=,n		\pgd,_PxD_PRESENT_BIT,\fault
+	extrd,u,*=	\va,31,32,%r0
+	depd		%r0,63,PxD_FLAG_SHIFT,\pgd
+	extrd,u,*=	\va,31,32,%r0
+	shld		\pgd,PxD_VALUE_SHIFT,\index
+	extrd,u,*=	\va,31,32,%r0
+	copy		\index,\pgd
 	extrd,u,*<>	\va,31,32,%r0
 	ldo		ASM_PGD_PMD_OFFSET(\pgd),\pgd
-	extrd,u,*=	\va,31,32,%r0
-	bb,>=,n		\pgd,_PAGE_PRESENT_BIT,\fault
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
 
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.6
diff -u -p -r1.6 head.S
--- arch/parisc/kernel/head.S	8 May 2004 14:12:45 -0000	1.6
+++ arch/parisc/kernel/head.S	9 Jul 2004 07:44:31 -0000
@@ -76,7 +76,8 @@ $bss_loop:
 	/* Initialize startup VM. Just map first 8 MB of memory */
 	ldil		L%PA(pg0),%r1
 	ldo		R%PA(pg0)(%r1),%r1
-	ldo		_PAGE_TABLE(%r1),%r3
+	shr		%r1,PxD_VALUE_SHIFT,%r3
+	ldo		(PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3
 
 	ldil		L%PA(swapper_pg_dir),%r4
 	ldo		R%PA(swapper_pg_dir)(%r4),%r4
@@ -86,7 +87,7 @@ $bss_loop:
 	ldo		ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4),%r4
 1:
 	stw             %r3,0(%r4)
-	ldo		ASM_PAGE_SIZE(%r3),%r3
+	ldo		(ASM_PAGE_SIZE >> PxD_VALUE_SHIFT)(%r3),%r3
 	addib,>		-1,%r1,1b
 	ldo		ASM_PGD_ENTRY_SIZE(%r4),%r4
 
Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.9
diff -u -p -r1.9 head64.S
--- arch/parisc/kernel/head64.S	8 May 2004 14:12:45 -0000	1.9
+++ arch/parisc/kernel/head64.S	7 Jul 2004 05:41:57 -0000
@@ -80,7 +80,8 @@ $bss_loop:
 
 	ldil		L%PA(pmd0),%r5
 	ldo		R%PA(pmd0)(%r5),%r5
-	ldo		_PAGE_TABLE(%r5),%r3
+	shrd		%r5,PxD_VALUE_SHIFT,%r3
+	ldo		(PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3
 
 	ldil		L%PA(swapper_pg_dir),%r4
 	ldo		R%PA(swapper_pg_dir)(%r4),%r4
@@ -90,16 +91,17 @@ $bss_loop:
 
 	stw             %r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
 
-	ldo		_PAGE_TABLE(%r1),%r3
+	shrd		%r1,PxD_VALUE_SHIFT,%r3
+	ldo		(PxD_FLAG_PRESENT+PxD_FLAG_VALID)(%r3),%r3
 	ldo		ASM_PMD_ENTRY*ASM_PMD_ENTRY_SIZE(%r5),%r5
 	ldi		ASM_PT_INITIAL,%r1
 1:
 	stw		%r3,0(%r5)
-	ldo		ASM_PAGE_SIZE(%r3),%r3
+	ldo		(ASM_PAGE_SIZE >> PxD_VALUE_SHIFT)(%r3),%r3
 	addib,>		-1,%r1,1b
 	ldo		ASM_PMD_ENTRY_SIZE(%r5),%r5
 
-	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
+	ldo             _PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 	ldil		L%PA(pg0),%r1
 	ldo		R%PA(pg0)(%r1),%r1
 
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
Index: arch/parisc/kernel/parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.16
diff -u -p -r1.16 parisc_ksyms.c
--- arch/parisc/kernel/parisc_ksyms.c	6 Mar 2004 14:43:46 -0000	1.16
+++ arch/parisc/kernel/parisc_ksyms.c	5 Jul 2004 21:53:23 -0000
@@ -173,3 +173,9 @@ EXPORT_SYMBOL(__moddi3);
 extern void $$dyncall(void);
 EXPORT_SYMBOL($$dyncall);
 #endif
+
+#ifdef CONFIG_DISCONTIGMEM
+#include <asm/mmzone.h>
+EXPORT_SYMBOL(node_data);
+EXPORT_SYMBOL(pfnnid_map);
+#endif
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.6
diff -u -p -r1.6 pdc_cons.c
--- arch/parisc/kernel/pdc_cons.c	19 Jan 2004 05:15:47 -0000	1.6
+++ arch/parisc/kernel/pdc_cons.c	7 Jul 2004 01:38:17 -0000
@@ -41,7 +41,7 @@
 
 /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
  * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#undef EARLY_BOOTUP_DEBUG
+#define EARLY_BOOTUP_DEBUG 1
 
 
 #include <linux/config.h>
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/init.c,v
retrieving revision 1.6
diff -u -p -r1.6 init.c
--- arch/parisc/mm/init.c	24 May 2004 00:58:49 -0000	1.6
+++ arch/parisc/mm/init.c	9 Jul 2004 07:36:34 -0000
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
 
@@ -232,15 +223,16 @@ static void __init setup_bootmem(void)
 				npmem_ranges = i + 1;
 				mem_max = mem_limit;
 			}
+	        num_physpages += pmem_ranges[i].pages;
 			break;
 		}
+	    num_physpages += pmem_ranges[i].pages;
 		mem_max += rsize;
 	}
 
 	printk(KERN_INFO "Total Memory: %ld Mb\n",mem_max >> 20);
 
 #ifndef CONFIG_DISCONTIGMEM
-
 	/* Merge the ranges, keeping track of the holes */
 
 	{
@@ -272,9 +264,18 @@ static void __init setup_bootmem(void)
 	bootmap_start_pfn = PAGE_ALIGN(__pa((unsigned long) &_end)) >> PAGE_SHIFT;
 
 #ifdef CONFIG_DISCONTIGMEM
+	for (i = 0; i < MAX_PHYSMEM_RANGES; i++) {
+		memset(NODE_DATA(i), 0, sizeof(pg_data_t));
+		NODE_DATA(i)->bdata = &bmem_data[i];
+	}
+	memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
+
+	numnodes = npmem_ranges;
+
 	for (i = 0; i < npmem_ranges; i++)
-		node_data[i].pg_data.bdata = &bmem_data[i];
+		node_set_online(i);
 #endif
+
 	/*
 	 * Initialize and free the full range of memory in each range.
 	 * Note that the only writing these routines do are to the bootmap,
@@ -443,16 +444,20 @@ unsigned long pcxl_dma_start;
 
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
+	totalram_pages += free_all_bootmem();
+#else
+	{
+		int i;
+
+		for (i = 0; i < npmem_ranges; i++)
+			totalram_pages += free_all_bootmem_node(NODE_DATA(i));
+	}
+#endif
 
 	printk(KERN_INFO "Memory: %luk available\n", num_physpages << (PAGE_SHIFT-10));
 
@@ -485,6 +490,7 @@ void show_mem(void)
 	printk(KERN_INFO "Mem-info:\n");
 	show_free_areas();
 	printk(KERN_INFO "Free swap:	 %6dkB\n",nr_swap_pages<<(PAGE_SHIFT-10));
+#ifndef CONFIG_DISCONTIGMEM
 	i = max_mapnr;
 	while (i-- > 0) {
 		total++;
@@ -497,10 +503,50 @@ void show_mem(void)
 		else
 			shared += page_count(&mem_map[i]) - 1;
 	}
+#else
+	for (i = 0; i < npmem_ranges; i++) {
+		int j;
+
+		for (j = node_start_pfn(i); j < node_end_pfn(i); j++) {
+			struct page *p;
+
+			p = node_mem_map(i) + j - node_start_pfn(i);
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
+        	}
+	}
+#endif
 	printk(KERN_INFO "%d pages of RAM\n", total);
 	printk(KERN_INFO "%d reserved pages\n", reserved);
 	printk(KERN_INFO "%d pages shared\n", shared);
 	printk(KERN_INFO "%d pages swap cached\n", cached);
+
+
+#ifdef CONFIG_DISCONTIGMEM
+	{
+		struct zonelist *zl;
+		int i, j, k;
+
+		for (i = 0; i < npmem_ranges; i++) {
+			for (j = 0; j < MAX_NR_ZONES; j++) {
+				zl = NODE_DATA(i)->node_zonelists + j;
+
+				printk("Zone list for zone %d on node %d: ", j, i);
+				for (k = 0; zl->zones[k] != NULL; k++) 
+					printk("[%d/%s] ", zl->zones[k]->zone_pgdat->node_id, zl->zones[k]->name);
+				printk("\n");
+			}
+		}
+	}
+#endif
 }
 
 
@@ -543,7 +589,7 @@ static void __init map_pages(unsigned lo
 #if PTRS_PER_PMD == 1
 		pmd = (pmd_t *)__pa(pg_dir);
 #else
-		pmd = (pmd_t *) (PAGE_MASK & pgd_val(*pg_dir));
+		pmd = (pmd_t *)pgd_address(*pg_dir);
 
 		/*
 		 * pmd is physical at this point
@@ -554,7 +600,7 @@ static void __init map_pages(unsigned lo
 			pmd = (pmd_t *) __pa(pmd);
 		}
 
-		pgd_val(*pg_dir) = _PAGE_TABLE | (unsigned long) pmd;
+		pgd_populate(NULL, pg_dir, __va(pmd));
 #endif
 		pg_dir++;
 
@@ -567,15 +613,14 @@ static void __init map_pages(unsigned lo
 			 * pg_table is physical at this point
 			 */
 
-			pg_table = (pte_t *) (PAGE_MASK & pmd_val(*pmd));
+			pg_table = (pte_t *)pmd_address(*pmd);
 			if (!pg_table) {
 				pg_table = (pte_t *)
 					alloc_bootmem_low_pages_node(NODE_DATA(0),PAGE_SIZE);
 				pg_table = (pte_t *) __pa(pg_table);
 			}
 
-			pmd_val(*pmd) = _PAGE_TABLE |
-					   (unsigned long) pg_table;
+			pmd_populate_kernel(NULL, pmd, __va(pg_table));
 
 			/* now change pg_table to kernel virtual addresses */
 
@@ -757,61 +802,26 @@ void __init paging_init(void)
 	flush_tlb_all_local();
 
 	for (i = 0; i < npmem_ranges; i++) {
-		unsigned long zones_size[MAX_NR_ZONES] = { 0, 0, 0, };
+		unsigned long zones_size[MAX_NR_ZONES] = { 0, 0, 0 };
 
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
Index: include/asm-parisc/assembly.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/assembly.h,v
retrieving revision 1.1
diff -u -p -r1.1 assembly.h
--- include/asm-parisc/assembly.h	29 Jul 2003 17:02:03 -0000	1.1
+++ include/asm-parisc/assembly.h	7 Jul 2004 04:53:16 -0000
@@ -110,6 +110,16 @@
 	depd,z	\r, 63-\sa, 64-\sa, \t
 	.endm
 
+	/* Shift Right - note the r and t can NOT be the same! */
+	.macro shr r, sa, t
+	extru \r, 31-\sa, 32-\sa, \t
+	.endm
+
+	/* pa20w version of shift right */
+	.macro shrd r, sa, t
+	extrd,u \r, 63-\sa, 64-\sa, \t
+	.endm
+
 	/* load 32-bit 'value' into 'reg' compensating for the ldil
 	 * sign-extension when running in wide mode.
 	 * WARNING!! neither 'value' nor 'reg' can be expressions
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
+++ include/asm-parisc/mmzone.h	6 Jul 2004 03:24:57 -0000
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
+/* Since each 1GB can only belong to one region (node), we can create
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
+++ include/asm-parisc/page.h	9 Jul 2004 04:05:27 -0000
@@ -60,10 +60,15 @@ typedef struct { unsigned long pgprot; }
 #else
 #define pte_flags(x)	((x).flags)
 #endif
-#define pmd_val(x)	((x).pmd)
-#define pgd_val(x)	((x).pgd)
+
+/* These do not work lvalues, so make sure we don't use them as such. */
+#define pmd_val(x)	((x).pmd + 0)
+#define pgd_val(x)	((x).pgd + 0)
 #define pgprot_val(x)	((x).pgprot)
 
+#define __pmd_val_set(x,n) (x).pmd = (n)
+#define __pgd_val_set(x,n) (x).pgd = (n)
+
 #define __pte(x)	((pte_t) { (x) } )
 #define __pmd(x)	((pmd_t) { (x) } )
 #define __pgd(x)	((pgd_t) { (x) } )
@@ -83,12 +88,6 @@ extern __inline__ int get_order(unsigned
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
@@ -144,15 +143,16 @@ extern int npmem_ranges;
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
Index: include/asm-parisc/pgalloc.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgalloc.h,v
retrieving revision 1.5
diff -u -p -r1.5 pgalloc.h
--- include/asm-parisc/pgalloc.h	2 May 2004 16:16:01 -0000	1.5
+++ include/asm-parisc/pgalloc.h	9 Jul 2004 07:51:18 -0000
@@ -21,7 +21,7 @@
  * kernel for machines with under 4GB of memory) */
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL|GFP_DMA,
+	pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
 					       PGD_ALLOC_ORDER);
 	pgd_t *actual_pgd = pgd;
 
@@ -30,13 +30,15 @@ static inline pgd_t *pgd_alloc(struct mm
 #ifdef __LP64__
 		actual_pgd += PTRS_PER_PGD;
 		/* Populate first pmd with allocated memory.  We mark it
-		 * with _PAGE_GATEWAY as a signal to the system that this
+		 * with PxD_FLAG_ATTACHED as a signal to the system that this
 		 * pmd entry may not be cleared. */
-		pgd_val(*actual_pgd) = (_PAGE_TABLE | _PAGE_GATEWAY) + 
-			(__u32)__pa((unsigned long)pgd);
+		__pgd_val_set(*actual_pgd, (PxD_FLAG_PRESENT | 
+				        PxD_FLAG_VALID | 
+					PxD_FLAG_ATTACHED) 
+			+ (__u32)(__pa((unsigned long)pgd) >> PxD_VALUE_SHIFT));
 		/* The first pmd entry also is marked with _PAGE_GATEWAY as
 		 * a signal that this pmd may not be freed */
-		pgd_val(*pgd) = _PAGE_GATEWAY;
+		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
 #endif
 	}
 	return actual_pgd;
@@ -56,14 +58,13 @@ static inline void pgd_free(pgd_t *pgd)
 
 static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmd)
 {
-	pgd_val(*pgd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pmd);
+	__pgd_val_set(*pgd, (PxD_FLAG_PRESENT | PxD_FLAG_VALID) +
+		        (__u32)(__pa((unsigned long)pmd) >> PxD_VALUE_SHIFT));
 }
 
-/* NOTE: pmd must be in ZONE_DMA (<4GB) so the pgd pointer can be
- * housed in 32 bits */
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT|GFP_DMA,
+	pmd_t *pmd = (pmd_t *)__get_free_pages(GFP_KERNEL|__GFP_REPEAT,
 					       PMD_ORDER);
 	if (pmd)
 		memset(pmd, 0, PAGE_SIZE<<PMD_ORDER);
@@ -73,7 +74,7 @@ static inline pmd_t *pmd_alloc_one(struc
 static inline void pmd_free(pmd_t *pmd)
 {
 #ifdef __LP64__
-	if(pmd_val(*pmd) & _PAGE_GATEWAY)
+	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
 		/* This is the permanent pmd attached to the pgd;
 		 * cannot free it */
 		return;
@@ -102,23 +103,24 @@ pmd_populate_kernel(struct mm_struct *mm
 #ifdef __LP64__
 	/* preserve the gateway marker if this is the beginning of
 	 * the permanent pmd */
-	if(pmd_val(*pmd) & _PAGE_GATEWAY)
-		pmd_val(*pmd) = (_PAGE_TABLE | _PAGE_GATEWAY)
-			+ (__u32)__pa((unsigned long)pte);
+	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
+		__pmd_val_set(*pmd, (PxD_FLAG_PRESENT |
+				 PxD_FLAG_VALID |
+				 PxD_FLAG_ATTACHED) 
+			+ (__u32)(__pa((unsigned long)pte) >> PxD_VALUE_SHIFT));
 	else
 #endif
-		pmd_val(*pmd) = _PAGE_TABLE + (__u32)__pa((unsigned long)pte);
+		__pmd_val_set(*pmd, (PxD_FLAG_PRESENT | PxD_FLAG_VALID) 
+			+ (__u32)(__pa((unsigned long)pte) >> PxD_VALUE_SHIFT));
 }
 
 #define pmd_populate(mm, pmd, pte_page) \
 	pmd_populate_kernel(mm, pmd, page_address(pte_page))
 
-/* NOTE: pte must be in ZONE_DMA (<4GB) so that the pmd pointer
- * can be housed in 32 bits */
 static inline struct page *
 pte_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT|GFP_DMA);
+	struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT);
 	if (likely(page != NULL))
 		clear_page(page_address(page));
 	return page;
@@ -127,7 +129,7 @@ pte_alloc_one(struct mm_struct *mm, unsi
 static inline pte_t *
 pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr)
 {
-	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT|GFP_DMA);
+	pte_t *pte = (pte_t *)__get_free_page(GFP_KERNEL|__GFP_REPEAT);
 	if (likely(pte != NULL))
 		clear_page(pte);
 	return pte;
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.13
diff -u -p -r1.13 pgtable.h
--- include/asm-parisc/pgtable.h	1 Jul 2004 20:24:38 -0000	1.13
+++ include/asm-parisc/pgtable.h	7 Jul 2004 04:06:30 -0000
@@ -177,6 +177,21 @@ extern  void *vmalloc_start;
 #define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
 #define _PAGE_KERNEL	(_PAGE_PRESENT | _PAGE_EXEC | _PAGE_READ | _PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)
 
+/* The pgd/pmd contains a ptr (in phys addr space); since all pgds/pmds
+ * are page-aligned, we don't care about the PAGE_OFFSET bits, except
+ * for a few meta-information bits, so we shift the address to be
+ * able to effectively address 40-bits of physical address space. */
+#define _PxD_PRESENT_BIT   31
+#define _PxD_ATTACHED_BIT  30
+#define _PxD_VALID_BIT     29
+
+#define PxD_FLAG_PRESENT  (1 << xlate_pabit(_PxD_PRESENT_BIT))
+#define PxD_FLAG_ATTACHED (1 << xlate_pabit(_PxD_ATTACHED_BIT))
+#define PxD_FLAG_VALID    (1 << xlate_pabit(_PxD_VALID_BIT))
+#define PxD_FLAG_MASK     (0xf)
+#define PxD_FLAG_SHIFT    (4)
+#define PxD_VALUE_SHIFT   (8)
+
 #ifndef __ASSEMBLY__
 
 #define PAGE_NONE	__pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
@@ -244,49 +259,49 @@ extern unsigned long *empty_zero_page;
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(xp)	do { pte_val(*(xp)) = 0; } while (0)
 
+#define pmd_flag(x)	(pmd_val(x) & PxD_FLAG_MASK)
+#define pmd_address(x)	((unsigned long)(pmd_val(x) &~ PxD_FLAG_MASK) << PxD_VALUE_SHIFT)
+#define pgd_flag(x)	(pgd_val(x) & PxD_FLAG_MASK)
+#define pgd_address(x)	((unsigned long)(pgd_val(x) &~ PxD_FLAG_MASK) << PxD_VALUE_SHIFT)
+
 #ifdef __LP64__
 /* The first entry of the permanent pmd is not there if it contains
  * the gateway marker */
-#define pmd_none(x)	(!pmd_val(x) || pmd_val(x) == _PAGE_GATEWAY)
-#define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE && (pmd_val(x) & ~PAGE_MASK) != (_PAGE_TABLE | _PAGE_GATEWAY))
+#define pmd_none(x)	(!pmd_val(x) || pmd_flag(x) == PxD_FLAG_ATTACHED)
 #else
 #define pmd_none(x)	(!pmd_val(x))
-#define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
 #endif
-#define pmd_present(x)	(pmd_val(x) & _PAGE_PRESENT)
+#define pmd_bad(x)	(!(pmd_flag(x) & PxD_FLAG_VALID))
+#define pmd_present(x)	(pmd_flag(x) & PxD_FLAG_PRESENT)
 static inline void pmd_clear(pmd_t *pmd) {
 #ifdef __LP64__
-	if(pmd_val(*pmd) & _PAGE_GATEWAY)
+	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
 		/* This is the entry pointing to the permanent pmd
 		 * attached to the pgd; cannot clear it */
-		pmd_val(*pmd) = _PAGE_GATEWAY;
+		__pmd_val_set(*pmd, PxD_FLAG_ATTACHED);
 	else
 #endif
-		pmd_val(*pmd) = 0;
+		__pmd_val_set(*pmd,  0);
 }
 
 
 
 #if PT_NLEVELS == 3
-#define pgd_page(pgd) ((unsigned long) __va(pgd_val(pgd) & PAGE_MASK))
+#define pgd_page(pgd) ((unsigned long) __va(pgd_address(pgd)))
 
 /* For 64 bit we have three level tables */
 
 #define pgd_none(x)     (!pgd_val(x))
-#ifdef __LP64__
-#define pgd_bad(x)      ((pgd_val(x) & ~PAGE_MASK) != _PAGE_TABLE && (pgd_val(x) & ~PAGE_MASK) != (_PAGE_TABLE | _PAGE_GATEWAY))
-#else
-#define pgd_bad(x)      ((pgd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
-#endif
-#define pgd_present(x)  (pgd_val(x) & _PAGE_PRESENT)
+#define pgd_bad(x)      (!(pgd_flag(x) & PxD_FLAG_VALID))
+#define pgd_present(x)  (pgd_flag(x) & PxD_FLAG_PRESENT)
 static inline void pgd_clear(pgd_t *pgd) {
 #ifdef __LP64__
-	if(pgd_val(*pgd) & _PAGE_GATEWAY)
+	if(pgd_flag(*pgd) & PxD_FLAG_ATTACHED)
 		/* This is the permanent pmd attached to the pgd; cannot
 		 * free it */
 		return;
 #endif
-	pgd_val(*pgd) = 0;
+	__pgd_val_set(*pgd, 0);
 }
 #else
 /*
@@ -353,15 +368,11 @@ extern inline pte_t pte_modify(pte_t pte
 
 #define pte_pfn(x) (pte_val(x) >> PAGE_SHIFT)
 
-#ifdef CONFIG_DISCONTIGMEM
-#define pte_page(x) (phys_to_page(pte_val(x)))
-#else
-#define pte_page(x) (mem_map+(pte_val(x) >> PAGE_SHIFT))
-#endif
+#define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
-#define pmd_page_kernel(pmd)	((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
+#define pmd_page_kernel(pmd)	((unsigned long) __va(pmd_address(pmd)))
 
-#define __pmd_page(pmd) ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
+#define __pmd_page(pmd) ((unsigned long) __va(pmd_address(pmd)))
 #define pmd_page(pmd)	virt_to_page((void *)__pmd_page(pmd))
 
 #define pgd_index(address) ((address) >> PGDIR_SHIFT)
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
