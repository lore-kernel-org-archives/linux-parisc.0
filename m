From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix usage of 32bit PTE page table entries on 32bit
 kernels
Date: Sun, 18 Jan 2009 19:16:16 +0100
Message-ID: <497371F0.1040505@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes a long outstanding bug on 32bit parisc linux kernels
which prevented us from using 32bit PTE table entries (instead of 64bit
entries of which 32bit were unused).

The problem was caused by this assembler statement in the L2_ptep
macro in arch/parisc/kernel/entry.S:447:
	EXTR \va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index 
which expanded to 
	extrw,u r8,9,11,r1
and which has undefined behavior since the length value (11) extends 
beyond the leftmost bit (11-1 > 9).
Interestingly PA2.0 processors seem to don't care and just zero-extend
the value, while PA1.1 processors don't.

Fix this problem by detecting an address space overflow with ASM_BITS_PER_PGD
and adjusting it accordingly. To prevent such problems in the future, 
some compile time sanity checks in arch/parisc/mm/init.c were added.

Since the page table now only consumes half of it's old size, we can
use the freed memory to harmonize 32- and 64bit kernels and let both
map 16MB for the initial page table.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index c3941f0..7bc5125 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -36,16 +36,7 @@ void clear_user_page(void *page, unsigned long vaddr, struct page *pg);
  */
 #define STRICT_MM_TYPECHECKS
 #ifdef STRICT_MM_TYPECHECKS
-typedef struct { unsigned long pte;
-#if !defined(CONFIG_64BIT)
-                 unsigned long future_flags;
- /* XXX: it's possible to remove future_flags and change BITS_PER_PTE_ENTRY
-	 to 2, but then strangely the identical 32bit kernel boots on a
-	 c3000(pa20), but not any longer on a 715(pa11).
-	 Still investigating... HelgeD.
-  */
-#endif
-} pte_t; /* either 32 or 64bit */
+typedef struct { unsigned long pte; } pte_t; /* either 32 or 64bit */
 
 /* NOTE: even on 64 bits, these entries are __u32 because we allocate
  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
@@ -111,7 +102,7 @@ extern int npmem_ranges;
 #define BITS_PER_PMD_ENTRY	2
 #define BITS_PER_PGD_ENTRY	2
 #else
-#define BITS_PER_PTE_ENTRY	3
+#define BITS_PER_PTE_ENTRY	2
 #define BITS_PER_PMD_ENTRY	2
 #define BITS_PER_PGD_ENTRY	BITS_PER_PMD_ENTRY
 #endif
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 470a4b8..a27d2e2 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -50,11 +50,7 @@
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#ifdef CONFIG_64BIT
 #define KERNEL_INITIAL_ORDER	24	/* 0 to 1<<24 = 16MB */
-#else
-#define KERNEL_INITIAL_ORDER	23	/* 0 to 1<<23 = 8MB */
-#endif
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_PARISC_PAGE_SIZE_4KB)
@@ -91,16 +87,25 @@
 
 /* Definitions for 1st level */
 #define PGDIR_SHIFT	(PMD_SHIFT + BITS_PER_PMD)
+#if (PGDIR_SHIFT + PAGE_SHIFT + PGD_ORDER - BITS_PER_PGD_ENTRY) > BITS_PER_LONG
+#define BITS_PER_PGD	(BITS_PER_LONG - PGDIR_SHIFT)
+#else
 #define BITS_PER_PGD	(PAGE_SHIFT + PGD_ORDER - BITS_PER_PGD_ENTRY)
+#endif
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
 #define PGDIR_MASK	(~(PGDIR_SIZE-1))
 #define PTRS_PER_PGD    (1UL << BITS_PER_PGD)
 #define USER_PTRS_PER_PGD       PTRS_PER_PGD
 
+#ifdef CONFIG_64BIT
 #define MAX_ADDRBITS	(PGDIR_SHIFT + BITS_PER_PGD)
 #define MAX_ADDRESS	(1UL << MAX_ADDRBITS)
-
 #define SPACEID_SHIFT	(MAX_ADDRBITS - 32)
+#else
+#define MAX_ADDRBITS	(BITS_PER_LONG)
+#define MAX_ADDRESS	(1UL << MAX_ADDRBITS)
+#define SPACEID_SHIFT	0
+#endif
 
 /* This calculates the number of initial pages we need for the initial
  * page tables */
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 7c155c2..88b52d8 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -458,6 +458,13 @@ void __init mem_init(void)
 {
 	int codesize, reservedpages, datasize, initsize;
 
+	/* Do sanity checks on page table constants */
+	BUILD_BUG_ON(PTE_ENTRY_SIZE != sizeof(pte_t));
+	BUILD_BUG_ON(PMD_ENTRY_SIZE != sizeof(pmd_t));
+	BUILD_BUG_ON(PGD_ENTRY_SIZE != sizeof(pgd_t));
+	BUILD_BUG_ON(PAGE_SHIFT + BITS_PER_PTE + BITS_PER_PMD + BITS_PER_PGD
+			> BITS_PER_LONG);
+
 	high_memory = __va((max_pfn << PAGE_SHIFT));
 
 #ifndef CONFIG_DISCONTIGMEM
