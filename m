From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] parisc: only make executable areas executable
Date: Thu, 14 Apr 2011 15:53:18 -0500
Message-ID: <1302814399.9800.10.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Currently parisc has the whole kernel marked as RWX, meaning any
kernel page at all is eligible to be executed.  This can cause a
theoretical problem on systems with combined I/D TLB because the act
of referencing a page causes a TLB insertion with an executable bit.
This TLB entry may be used by the CPU as the basis for speculating the
page into the I-Cache.  If this speculated page is subsequently used
for a user process, there is the possibility we will get a stale
I-cache line picked up as the binary executes.

As a point of good practise, only mark actual kernel text pages as
executable.  The same has to be done for init_text pages, but they're
converted to data pages (and the I-Cache flushed) when the init memory
is released.

James

---

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 5d7b8ce..22dadeb 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -177,7 +177,10 @@ struct vm_area_struct;
 
 #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE |  _PAGE_DIRTY | _PAGE_ACCESSED)
 #define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
-#define _PAGE_KERNEL	(_PAGE_PRESENT | _PAGE_EXEC | _PAGE_READ | _PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)
+#define _PAGE_KERNEL_RO	(_PAGE_PRESENT | _PAGE_READ | _PAGE_DIRTY | _PAGE_ACCESSED)
+#define _PAGE_KERNEL_EXEC	(_PAGE_KERNEL_RO | _PAGE_EXEC)
+#define _PAGE_KERNEL_RWX	(_PAGE_KERNEL_EXEC | _PAGE_WRITE)
+#define _PAGE_KERNEL		(_PAGE_KERNEL_RO | _PAGE_WRITE)
 
 /* The pgd/pmd contains a ptr (in phys addr space); since all pgds/pmds
  * are page-aligned, we don't care about the PAGE_OFFSET bits, except
@@ -208,7 +211,9 @@ struct vm_area_struct;
 #define PAGE_COPY       PAGE_EXECREAD
 #define PAGE_RWX        __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ | _PAGE_WRITE | _PAGE_EXEC |_PAGE_ACCESSED)
 #define PAGE_KERNEL	__pgprot(_PAGE_KERNEL)
-#define PAGE_KERNEL_RO	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
+#define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL_EXEC)
+#define PAGE_KERNEL_RWX	__pgprot(_PAGE_KERNEL_RWX)
+#define PAGE_KERNEL_RO	__pgprot(_PAGE_KERNEL_RO)
 #define PAGE_KERNEL_UNC	__pgprot(_PAGE_KERNEL | _PAGE_NO_CACHE)
 #define PAGE_GATEWAY    __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED | _PAGE_GATEWAY| _PAGE_READ)
 
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ead8d2a..6f05944 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -692,6 +692,9 @@ ENTRY(fault_vector_11)
 END(fault_vector_11)
 
 #endif
+	/* Fault vector is separately protected and *must* be on its own page */
+	.align		PAGE_SIZE
+ENTRY(end_fault_vector)
 
 	.import		handle_interruption,code
 	.import		do_cpu_irq_mask,code
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 145c5e4..37aabd7 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -106,8 +106,9 @@ $bss_loop:
 #endif
 
 
-	/* Now initialize the PTEs themselves */
-	ldo		0+_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
+	/* Now initialize the PTEs themselves.  We use RWX for
+	 * everything ... it will get remapped correctly later */
+	ldo		0+_PAGE_KERNEL_RWX(%r0),%r3 /* Hardwired 0 phys addr start */
 	ldi		(1<<(KERNEL_INITIAL_ORDER-PAGE_SHIFT)),%r11 /* PFN count */
 	load32		PA(pg0),%r1
 
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 6e81bb5..cedbbb8 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -61,8 +61,10 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/bug.h>
+#include <linux/mm.h>
 #include <linux/slab.h>
 
+#include <asm/pgtable.h>
 #include <asm/unwind.h>
 
 #if 0
@@ -214,7 +216,13 @@ void *module_alloc(unsigned long size)
 {
 	if (size == 0)
 		return NULL;
-	return vmalloc(size);
+	/* using RWX means less protection for modules, but it's
+	 * easier than trying to map the text, data, init_text and
+	 * init_data correctly */
+	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
+				    GFP_KERNEL | __GFP_HIGHMEM,
+				    PAGE_KERNEL_RWX, -1,
+				    __builtin_return_address(0));
 }
 
 #ifndef CONFIG_64BIT
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 8f1e4ef..bf6a43a 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -134,6 +134,7 @@ SECTIONS
 	. = ALIGN(16384);
 	__init_begin = .;
 	INIT_TEXT_SECTION(16384)
+	. = ALIGN(PAGE_SIZE);
 	INIT_DATA_SECTION(16)
 	/* we have to discard exit text and such at runtime, not link time */
 	.exit.text :
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index b7ed8d7..c555175 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -369,24 +369,159 @@ static void __init setup_bootmem(void)
 	request_resource(&sysram_resources[0], &pdcdata_resource);
 }
 
+static void __init map_pages(unsigned long start_vaddr,
+			     unsigned long start_paddr, unsigned long size,
+			     pgprot_t pgprot, int force)
+{
+	pgd_t *pg_dir;
+	pmd_t *pmd;
+	pte_t *pg_table;
+	unsigned long end_paddr;
+	unsigned long start_pmd;
+	unsigned long start_pte;
+	unsigned long tmp1;
+	unsigned long tmp2;
+	unsigned long address;
+	unsigned long vaddr;
+	unsigned long ro_start;
+	unsigned long ro_end;
+	unsigned long fv_addr;
+	unsigned long gw_addr;
+	extern const unsigned long fault_vector_20;
+	extern void * const linux_gateway_page;
+
+	ro_start = __pa((unsigned long)_text);
+	ro_end   = __pa((unsigned long)&data_start);
+	fv_addr  = __pa((unsigned long)&fault_vector_20) & PAGE_MASK;
+	gw_addr  = __pa((unsigned long)&linux_gateway_page) & PAGE_MASK;
+
+	end_paddr = start_paddr + size;
+
+	pg_dir = pgd_offset_k(start_vaddr);
+
+#if PTRS_PER_PMD == 1
+	start_pmd = 0;
+#else
+	start_pmd = ((start_vaddr >> PMD_SHIFT) & (PTRS_PER_PMD - 1));
+#endif
+	start_pte = ((start_vaddr >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
+
+	address = start_paddr;
+	vaddr = start_vaddr;
+	while (address < end_paddr) {
+#if PTRS_PER_PMD == 1
+		pmd = (pmd_t *)__pa(pg_dir);
+#else
+		pmd = (pmd_t *)pgd_address(*pg_dir);
+
+		/*
+		 * pmd is physical at this point
+		 */
+
+		if (!pmd) {
+			pmd = (pmd_t *) alloc_bootmem_low_pages_node(NODE_DATA(0), PAGE_SIZE << PMD_ORDER);
+			pmd = (pmd_t *) __pa(pmd);
+		}
+
+		pgd_populate(NULL, pg_dir, __va(pmd));
+#endif
+		pg_dir++;
+
+		/* now change pmd to kernel virtual addresses */
+
+		pmd = (pmd_t *)__va(pmd) + start_pmd;
+		for (tmp1 = start_pmd; tmp1 < PTRS_PER_PMD; tmp1++, pmd++) {
+
+			/*
+			 * pg_table is physical at this point
+			 */
+
+			pg_table = (pte_t *)pmd_address(*pmd);
+			if (!pg_table) {
+				pg_table = (pte_t *)
+					alloc_bootmem_low_pages_node(NODE_DATA(0), PAGE_SIZE);
+				pg_table = (pte_t *) __pa(pg_table);
+			}
+
+			pmd_populate_kernel(NULL, pmd, __va(pg_table));
+
+			/* now change pg_table to kernel virtual addresses */
+
+			pg_table = (pte_t *) __va(pg_table) + start_pte;
+			for (tmp2 = start_pte; tmp2 < PTRS_PER_PTE; tmp2++, pg_table++) {
+				pte_t pte;
+
+				/*
+				 * Map the fault vector writable so we can
+				 * write the HPMC checksum.
+				 */
+				if (force)
+					pte =  __mk_pte(address, pgprot);
+				else if (core_kernel_text(vaddr) &&
+					 address != fv_addr &&
+					 address != gw_addr)
+					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
+				else
+#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
+				if (address >= ro_start && address < ro_end
+							&& address != fv_addr
+							&& address != gw_addr)
+					pte = __mk_pte(address, PAGE_KERNEL_RO);
+				else
+#endif
+					pte = __mk_pte(address, pgprot);
+
+				if (address >= end_paddr) {
+					if (force)
+						break;
+					else
+						pte_val(pte) = 0;
+				}
+
+				set_pte(pg_table, pte);
+
+				address += PAGE_SIZE;
+				vaddr += PAGE_SIZE;
+			}
+			start_pte = 0;
+
+			if (address >= end_paddr)
+			    break;
+		}
+		start_pmd = 0;
+	}
+}
+
 void free_initmem(void)
 {
 	unsigned long addr;
 	unsigned long init_begin = (unsigned long)__init_begin;
 	unsigned long init_end = (unsigned long)__init_end;
 
-#ifdef CONFIG_DEBUG_KERNEL
+	/* The init text pages are marked R-X.  We have to
+	 * flush the icache and mark them RW-
+	 *
+	 * This is tricky, because map_pages is in the init section.
+	 * Do a dummy remap of the data section first (the data
+	 * section is already PAGE_KERNEL) to pull in the TLB entries
+	 * for map_kernel */
+	map_pages(init_begin, __pa(init_begin), init_end - init_begin,
+		  PAGE_KERNEL_RWX, 1);
+	/* now remap at PAGE_KERNEL since the TLB is pre-primed to execute
+	 * map_pages */
+	map_pages(init_begin, __pa(init_begin), init_end - init_begin,
+		  PAGE_KERNEL, 1);
+
+	/* force the kernel to see the new TLB entries */
+	__flush_tlb_range(0, init_begin, init_end);
 	/* Attempt to catch anyone trying to execute code here
 	 * by filling the page with BRK insns.
 	 */
 	memset((void *)init_begin, 0x00, init_end - init_begin);
+	/* finally dump all the instructions which were cached, since the
+	 * pages are no-longer executable */
 	flush_icache_range(init_begin, init_end);
-#endif
 	
-	/* align __init_begin and __init_end to page size,
-	   ignoring linker script where we might have tried to save RAM */
-	init_begin = PAGE_ALIGN(init_begin);
-	init_end = PAGE_ALIGN(init_end);
 	for (addr = init_begin; addr < init_end; addr += PAGE_SIZE) {
 		ClearPageReserved(virt_to_page(addr));
 		init_page_count(virt_to_page(addr));
@@ -616,114 +751,6 @@ void show_mem(unsigned int filter)
 #endif
 }
 
-
-static void __init map_pages(unsigned long start_vaddr, unsigned long start_paddr, unsigned long size, pgprot_t pgprot)
-{
-	pgd_t *pg_dir;
-	pmd_t *pmd;
-	pte_t *pg_table;
-	unsigned long end_paddr;
-	unsigned long start_pmd;
-	unsigned long start_pte;
-	unsigned long tmp1;
-	unsigned long tmp2;
-	unsigned long address;
-	unsigned long ro_start;
-	unsigned long ro_end;
-	unsigned long fv_addr;
-	unsigned long gw_addr;
-	extern const unsigned long fault_vector_20;
-	extern void * const linux_gateway_page;
-
-	ro_start = __pa((unsigned long)_text);
-	ro_end   = __pa((unsigned long)&data_start);
-	fv_addr  = __pa((unsigned long)&fault_vector_20) & PAGE_MASK;
-	gw_addr  = __pa((unsigned long)&linux_gateway_page) & PAGE_MASK;
-
-	end_paddr = start_paddr + size;
-
-	pg_dir = pgd_offset_k(start_vaddr);
-
-#if PTRS_PER_PMD == 1
-	start_pmd = 0;
-#else
-	start_pmd = ((start_vaddr >> PMD_SHIFT) & (PTRS_PER_PMD - 1));
-#endif
-	start_pte = ((start_vaddr >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
-
-	address = start_paddr;
-	while (address < end_paddr) {
-#if PTRS_PER_PMD == 1
-		pmd = (pmd_t *)__pa(pg_dir);
-#else
-		pmd = (pmd_t *)pgd_address(*pg_dir);
-
-		/*
-		 * pmd is physical at this point
-		 */
-
-		if (!pmd) {
-			pmd = (pmd_t *) alloc_bootmem_low_pages_node(NODE_DATA(0),PAGE_SIZE << PMD_ORDER);
-			pmd = (pmd_t *) __pa(pmd);
-		}
-
-		pgd_populate(NULL, pg_dir, __va(pmd));
-#endif
-		pg_dir++;
-
-		/* now change pmd to kernel virtual addresses */
-
-		pmd = (pmd_t *)__va(pmd) + start_pmd;
-		for (tmp1 = start_pmd; tmp1 < PTRS_PER_PMD; tmp1++,pmd++) {
-
-			/*
-			 * pg_table is physical at this point
-			 */
-
-			pg_table = (pte_t *)pmd_address(*pmd);
-			if (!pg_table) {
-				pg_table = (pte_t *)
-					alloc_bootmem_low_pages_node(NODE_DATA(0),PAGE_SIZE);
-				pg_table = (pte_t *) __pa(pg_table);
-			}
-
-			pmd_populate_kernel(NULL, pmd, __va(pg_table));
-
-			/* now change pg_table to kernel virtual addresses */
-
-			pg_table = (pte_t *) __va(pg_table) + start_pte;
-			for (tmp2 = start_pte; tmp2 < PTRS_PER_PTE; tmp2++,pg_table++) {
-				pte_t pte;
-
-				/*
-				 * Map the fault vector writable so we can
-				 * write the HPMC checksum.
-				 */
-#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
-				if (address >= ro_start && address < ro_end
-							&& address != fv_addr
-							&& address != gw_addr)
-				    pte = __mk_pte(address, PAGE_KERNEL_RO);
-				else
-#endif
-				    pte = __mk_pte(address, pgprot);
-
-				if (address >= end_paddr)
-					pte_val(pte) = 0;
-
-				set_pte(pg_table, pte);
-
-				address += PAGE_SIZE;
-			}
-			start_pte = 0;
-
-			if (address >= end_paddr)
-			    break;
-		}
-		start_pmd = 0;
-	}
-}
-
 /*
  * pagetable_init() sets up the page tables
  *
@@ -748,14 +775,14 @@ static void __init pagetable_init(void)
 		size = pmem_ranges[range].pages << PAGE_SHIFT;
 
 		map_pages((unsigned long)__va(start_paddr), start_paddr,
-			size, PAGE_KERNEL);
+			  size, PAGE_KERNEL, 0);
 	}
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (initrd_end && initrd_end > mem_limit) {
 		printk(KERN_INFO "initrd: mapping %08lx-%08lx\n", initrd_start, initrd_end);
 		map_pages(initrd_start, __pa(initrd_start),
-			initrd_end - initrd_start, PAGE_KERNEL);
+			  initrd_end - initrd_start, PAGE_KERNEL, 0);
 	}
 #endif
 
@@ -780,7 +807,7 @@ static void __init gateway_init(void)
 	 */
 
 	map_pages(linux_gateway_page_addr, __pa(&linux_gateway_page),
-		PAGE_SIZE, PAGE_GATEWAY);
+		  PAGE_SIZE, PAGE_GATEWAY, 1);
 }
 
 #ifdef CONFIG_HPUX


