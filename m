From: Helge Deller <deller@gmx.de>
Subject: [PATCH 9/9] parisc: Map kernel text and data on huge pages
Date: Fri, 20 Nov 2015 22:38:42 +0100
Message-ID: <1448055522-11594-10-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Adjust the linker script and map_pages() to map kernel text and data on
physical 1MB huge/large pages.

The bss section is the last section in the kernel layout and if huge
pages are enabled we may end off with unused memory which we now will
use for the bootmap tables.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/asm-offsets.c |  8 ++++++++
 arch/parisc/kernel/vmlinux.lds.S |  9 ++++++---
 arch/parisc/mm/init.c            | 42 +++++++++++++++++-----------------------
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 59001ce..d2f6257 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -290,6 +290,14 @@ int main(void)
 	DEFINE(ASM_PFN_PTE_SHIFT, PFN_PTE_SHIFT);
 	DEFINE(ASM_PT_INITIAL, PT_INITIAL);
 	BLANK();
+	/* HUGEPAGE_SIZE is only used in vmlinux.lds.S to align kernel text
+	 * and kernel data on physical huge pages */
+#ifdef CONFIG_HUGETLB_PAGE
+	DEFINE(HUGEPAGE_SIZE, 1UL << REAL_HPAGE_SHIFT);
+#else
+	DEFINE(HUGEPAGE_SIZE, PAGE_SIZE);
+#endif
+	BLANK();
 	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
 	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
 	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 0dacc5c..308f290 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -60,7 +60,7 @@ SECTIONS
 		EXIT_DATA
 	}
 	PERCPU_SECTION(8)
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(HUGEPAGE_SIZE);
 	__init_end = .;
 	/* freed after init ends here */
 
@@ -116,7 +116,7 @@ SECTIONS
 	 * that we can properly leave these
 	 * as writable
 	 */
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(HUGEPAGE_SIZE);
 	data_start = .;
 
 	EXCEPTION_TABLE(8)
@@ -135,8 +135,11 @@ SECTIONS
 	_edata = .;
 
 	/* BSS */
-	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 8)
+	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE)
+
+	/* bootmap is allocated in setup_bootmem() directly behind bss. */
 
+	. = ALIGN(HUGEPAGE_SIZE);
 	_end = . ;
 
 	STABS_DEBUG
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index c229427..976fb6e 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -265,7 +265,7 @@ static void __init setup_bootmem(void)
 	for (i = 0; i < npmem_ranges; i++)
 		bootmap_pages += bootmem_bootmap_pages(pmem_ranges[i].pages);
 
-	bootmap_start_pfn = PAGE_ALIGN(__pa((unsigned long) &_end)) >> PAGE_SHIFT;
+	bootmap_start_pfn = PAGE_ALIGN(__pa((unsigned long) &__bss_stop)) >> PAGE_SHIFT;
 
 #ifdef CONFIG_DISCONTIGMEM
 	for (i = 0; i < MAX_PHYSMEM_RANGES; i++) {
@@ -407,15 +407,11 @@ static void __init map_pages(unsigned long start_vaddr,
 	unsigned long vaddr;
 	unsigned long ro_start;
 	unsigned long ro_end;
-	unsigned long fv_addr;
-	unsigned long gw_addr;
-	extern const unsigned long fault_vector_20;
-	extern void * const linux_gateway_page;
+	unsigned long kernel_end;
 
 	ro_start = __pa((unsigned long)_text);
 	ro_end   = __pa((unsigned long)&data_start);
-	fv_addr  = __pa((unsigned long)&fault_vector_20) & PAGE_MASK;
-	gw_addr  = __pa((unsigned long)&linux_gateway_page) & PAGE_MASK;
+	kernel_end  = __pa((unsigned long)&_end);
 
 	end_paddr = start_paddr + size;
 
@@ -473,24 +469,25 @@ static void __init map_pages(unsigned long start_vaddr,
 			for (tmp2 = start_pte; tmp2 < PTRS_PER_PTE; tmp2++, pg_table++) {
 				pte_t pte;
 
-				/*
-				 * Map the fault vector writable so we can
-				 * write the HPMC checksum.
-				 */
 				if (force)
 					pte =  __mk_pte(address, pgprot);
-				else if (parisc_text_address(vaddr) &&
-					 address != fv_addr)
+				else if (parisc_text_address(vaddr)) {
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
+					if (address >= ro_start && address < kernel_end)
+						pte = pte_mkhuge(pte);
+				}
 				else
 #if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
-				if (address >= ro_start && address < ro_end
-							&& address != fv_addr
-							&& address != gw_addr)
-					pte = __mk_pte(address, PAGE_KERNEL_RO);
-				else
+				if (address >= ro_start && address < ro_end) {
+					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
+					pte = pte_mkhuge(pte);
+				} else
 #endif
+				{
 					pte = __mk_pte(address, pgprot);
+					if (address >= ro_start && address < kernel_end)
+						pte = pte_mkhuge(pte);
+				}
 
 				if (address >= end_paddr) {
 					if (force)
@@ -534,15 +531,12 @@ void free_initmem(void)
 
 	/* force the kernel to see the new TLB entries */
 	__flush_tlb_range(0, init_begin, init_end);
-	/* Attempt to catch anyone trying to execute code here
-	 * by filling the page with BRK insns.
-	 */
-	memset((void *)init_begin, 0x00, init_end - init_begin);
+
 	/* finally dump all the instructions which were cached, since the
 	 * pages are no-longer executable */
 	flush_icache_range(init_begin, init_end);
 	
-	free_initmem_default(-1);
+	free_initmem_default(POISON_FREE_INITMEM);
 
 	/* set up a new led state on systems shipped LED State panel */
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BCOMPLETE);
@@ -712,8 +706,8 @@ static void __init pagetable_init(void)
 		unsigned long size;
 
 		start_paddr = pmem_ranges[range].start_pfn << PAGE_SHIFT;
-		end_paddr = start_paddr + (pmem_ranges[range].pages << PAGE_SHIFT);
 		size = pmem_ranges[range].pages << PAGE_SHIFT;
+		end_paddr = start_paddr + size;
 
 		map_pages((unsigned long)__va(start_paddr), start_paddr,
 			  size, PAGE_KERNEL, 0);
-- 
2.1.0

