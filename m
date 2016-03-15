From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Protect some variables with __ro_after_init
Date: Tue, 15 Mar 2016 22:38:50 +0100
Message-ID: <20160315213850.GA29583@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit c74ba8b (arch: Introduce post-init read-only memory) introduced
the __ro_after_init tag to mark variables read-only after bootup.

This patch converts some variables over to the new secure method.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index df0f52b..3d0e17b 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -22,9 +22,6 @@
 
 #define __read_mostly __attribute__((__section__(".data..read_mostly")))
 
-/* Read-only memory is marked before mark_rodata_ro() is called. */
-#define __ro_after_init	__read_mostly
-
 void parisc_cache_init(void);	/* initializes cache-flushing */
 void disable_sr_hashing_asm(int); /* low level support for above */
 void disable_sr_hashing(void);   /* turns off space register hashing */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 91c2a39..4654a77 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -28,9 +28,9 @@
 #include <asm/sections.h>
 #include <asm/shmparam.h>
 
-int split_tlb __read_mostly;
-int dcache_stride __read_mostly;
-int icache_stride __read_mostly;
+int split_tlb __ro_after_init;
+int dcache_stride __ro_after_init;
+int icache_stride __ro_after_init;
 EXPORT_SYMBOL(dcache_stride);
 
 void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
@@ -45,9 +45,9 @@ void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);
  */
 DEFINE_SPINLOCK(pa_tlb_lock);
 
-struct pdc_cache_info cache_info __read_mostly;
+struct pdc_cache_info cache_info __ro_after_init;
 #ifndef CONFIG_PA20
-static struct pdc_btlb_info btlb_info __read_mostly;
+static struct pdc_btlb_info btlb_info __ro_after_init;
 #endif
 
 #ifdef CONFIG_SMP
@@ -360,10 +360,10 @@ EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);
 
 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
-static unsigned long parisc_cache_flush_threshold __read_mostly = FLUSH_THRESHOLD;
+static unsigned long parisc_cache_flush_threshold __ro_after_init = FLUSH_THRESHOLD;
 
 #define FLUSH_TLB_THRESHOLD (2*1024*1024) /* 2MB initial TLB threshold */
-static unsigned long parisc_tlb_flush_threshold __read_mostly = FLUSH_TLB_THRESHOLD;
+static unsigned long parisc_tlb_flush_threshold __ro_after_init = FLUSH_TLB_THRESHOLD;
 
 void __init parisc_setup_cache_timing(void)
 {
diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index f815066..462e19d 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -40,7 +40,7 @@
 #include <asm/parisc-device.h>
 
 /* See comments in include/asm-parisc/pci.h */
-struct dma_map_ops *hppa_dma_ops __read_mostly;
+struct dma_map_ops *hppa_dma_ops __ro_after_init;
 EXPORT_SYMBOL(hppa_dma_ops);
 
 static struct device root = {
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 2239590..34222dd 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -79,7 +79,7 @@ extern unsigned long pdc_result2[NUM_PDC_RESULT];
 
 /* Firmware needs to be initially set to narrow to determine the 
  * actual firmware width. */
-int parisc_narrow_firmware __read_mostly = 1;
+int parisc_narrow_firmware __ro_after_init = 1;
 #endif
 
 /* On most currently-supported platforms, IODC I/O calls are 32-bit calls
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 75aa0db..c4f323e 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -348,7 +348,7 @@ smp_slave_stext:
 ENDPROC(parisc_kernel_start)
 
 #ifndef CONFIG_64BIT
-	.section .data..read_mostly
+	.section .data..ro_after_init
 
 	.align	4
 	.export	$global$,data
diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index f0b6722..e618641 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -38,7 +38,7 @@
 */
 #undef DEBUG_PAT
 
-int pdc_type __read_mostly = PDC_TYPE_ILLEGAL;
+int pdc_type __ro_after_init = PDC_TYPE_ILLEGAL;
 
 void __init setup_pdc(void)
 {
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index a27e492..25edf2e 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -36,9 +36,9 @@
 #include <asm/uaccess.h>
 #include <asm/tlbflush.h>	/* for purge_tlb_*() macros */
 
-static struct proc_dir_entry * proc_gsc_root __read_mostly = NULL;
-static unsigned long pcxl_used_bytes __read_mostly = 0;
-static unsigned long pcxl_used_pages __read_mostly = 0;
+static struct proc_dir_entry * proc_gsc_root __ro_after_init;
+static unsigned long pcxl_used_bytes;
+static unsigned long pcxl_used_pages;
 
 extern unsigned long pcxl_dma_start; /* Start of pcxl dma mapping area */
 static spinlock_t   pcxl_res_lock;
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 0903c6a..dcc2da3 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -45,14 +45,14 @@
  * #define pci_post_reset_delay 50
  */
 
-struct pci_port_ops *pci_port __read_mostly;
-struct pci_bios_ops *pci_bios __read_mostly;
+struct pci_port_ops *pci_port __ro_after_init;
+struct pci_bios_ops *pci_bios __ro_after_init;
 
-static int pci_hba_count __read_mostly;
+static int pci_hba_count __ro_after_init;
 
 /* parisc_pci_hba used by pci_port->in/out() ops to lookup bus data.  */
 #define PCI_HBA_MAX 32
-static struct pci_hba_data *parisc_pci_hba[PCI_HBA_MAX] __read_mostly;
+static struct pci_hba_data *parisc_pci_hba[PCI_HBA_MAX] __ro_after_init;
 
 
 /********************************************************************
diff --git a/arch/parisc/kernel/pdc_chassis.c b/arch/parisc/kernel/pdc_chassis.c
index 3e04242..513e6e9 100644
--- a/arch/parisc/kernel/pdc_chassis.c
+++ b/arch/parisc/kernel/pdc_chassis.c
@@ -46,7 +46,7 @@
 #define PDC_CHASSIS_VER	"0.05"
 
 #ifdef CONFIG_PDC_CHASSIS
-static unsigned int pdc_chassis_enabled __read_mostly = 1;
+static unsigned int pdc_chassis_enabled __ro_after_init = 1;
 
 
 /**
diff --git a/arch/parisc/kernel/perf_images.h b/arch/parisc/kernel/perf_images.h
index 7fef964..c108fee 100644
--- a/arch/parisc/kernel/perf_images.h
+++ b/arch/parisc/kernel/perf_images.h
@@ -25,7 +25,7 @@
 
 #define PCXU_IMAGE_SIZE 584
 
-static uint32_t onyx_images[][PCXU_IMAGE_SIZE/sizeof(uint32_t)] __read_mostly = {
+static uint32_t onyx_images[][PCXU_IMAGE_SIZE/sizeof(uint32_t)] __ro_after_init = {
 /*
  * CPI:
  *
@@ -2093,7 +2093,7 @@ static uint32_t onyx_images[][PCXU_IMAGE_SIZE/sizeof(uint32_t)] __read_mostly =
 };
 #define PCXW_IMAGE_SIZE 576
 
-static uint32_t cuda_images[][PCXW_IMAGE_SIZE/sizeof(uint32_t)] __read_mostly = {
+static uint32_t cuda_images[][PCXW_IMAGE_SIZE/sizeof(uint32_t)] __ro_after_init = {
 /*
  * CPI:     FROM CPI.IDF (Image 0)
  *
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index e81ccf1..b475d95 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -42,10 +42,10 @@
 #include <asm/irq.h>		/* for struct irq_region */
 #include <asm/parisc-device.h>
 
-struct system_cpuinfo_parisc boot_cpu_data __read_mostly;
+struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
 EXPORT_SYMBOL(boot_cpu_data);
 #ifdef CONFIG_PA8X00
-int _parisc_requires_coherency __read_mostly;
+int _parisc_requires_coherency __ro_after_init;
 EXPORT_SYMBOL(_parisc_requires_coherency);
 #endif
 
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index f7ea626..9e14d80 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -49,12 +49,12 @@
 static char __initdata command_line[COMMAND_LINE_SIZE];
 
 /* Intended for ccio/sba/cpu statistics under /proc/bus/{runway|gsc} */
-struct proc_dir_entry * proc_runway_root __read_mostly = NULL;
-struct proc_dir_entry * proc_gsc_root __read_mostly = NULL;
-struct proc_dir_entry * proc_mckinley_root __read_mostly = NULL;
+struct proc_dir_entry * proc_runway_root __ro_after_init;
+struct proc_dir_entry * proc_gsc_root __ro_after_init;
+struct proc_dir_entry * proc_mckinley_root __ro_after_init;
 
 #if !defined(CONFIG_PA20) && (defined(CONFIG_IOMMU_CCIO) || defined(CONFIG_IOMMU_SBA))
-int parisc_bus_is_phys __read_mostly = 1;	/* Assume no IOMMU is present */
+int parisc_bus_is_phys __ro_after_init = 1;	/* Assume no IOMMU is present */
 EXPORT_SYMBOL(parisc_bus_is_phys);
 #endif
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 400acac0..623382f 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -36,7 +36,7 @@
 
 #include <linux/timex.h>
 
-static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
+static unsigned long clocktick __ro_after_init;	/* timer cycles per tick */
 
 /*
  * We keep time on PA-RISC Linux by using the Interval Timer which is
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 553b098..2cc3148 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -340,7 +340,7 @@ static void default_trap(int code, struct pt_regs *regs)
 	show_regs(regs);
 }
 
-void (*cpu_lpmc) (int code, struct pt_regs *regs) __read_mostly = default_trap;
+void (*cpu_lpmc) (int code, struct pt_regs *regs) __ro_after_init = default_trap;
 
 
 void transfer_pim_to_trap_frame(struct pt_regs *regs)
diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index ddd988b..c7b160b 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -40,7 +40,7 @@ static spinlock_t unwind_lock;
  * we can call unwind_init as early in the bootup process as 
  * possible (before the slab allocator is initialized)
  */
-static struct unwind_table kernel_unwind_table __read_mostly;
+static struct unwind_table kernel_unwind_table __ro_after_init;
 static LIST_HEAD(unwind_tables);
 
 static inline const struct unwind_table_entry *
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3c07d6b..c357414 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -49,8 +49,8 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((__section__ (".data..vm0.pgd"
 pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((__section__ (".data..vm0.pte"), aligned(PAGE_SIZE)));
 
 #ifdef CONFIG_DISCONTIGMEM
-struct node_map_data node_data[MAX_NUMNODES] __read_mostly;
-signed char pfnnid_map[PFNNID_MAP_MAX] __read_mostly;
+struct node_map_data node_data[MAX_NUMNODES] __ro_after_init;
+signed char pfnnid_map[PFNNID_MAP_MAX] __ro_after_init;
 #endif
 
 static struct resource data_resource = {
@@ -70,14 +70,14 @@ static struct resource pdcdata_resource = {
 	.flags	= IORESOURCE_BUSY | IORESOURCE_MEM,
 };
 
-static struct resource sysram_resources[MAX_PHYSMEM_RANGES] __read_mostly;
+static struct resource sysram_resources[MAX_PHYSMEM_RANGES] __ro_after_init;
 
 /* The following array is initialized from the firmware specific
  * information retrieved in kernel/inventory.c.
  */
 
-physmem_range_t pmem_ranges[MAX_PHYSMEM_RANGES] __read_mostly;
-int npmem_ranges __read_mostly;
+physmem_range_t pmem_ranges[MAX_PHYSMEM_RANGES] __ro_after_init;
+int npmem_ranges __ro_after_init;
 
 #ifdef CONFIG_64BIT
 #define MAX_MEM         (~0UL)
@@ -85,7 +85,7 @@ int npmem_ranges __read_mostly;
 #define MAX_MEM         (3584U*1024U*1024U)
 #endif /* !CONFIG_64BIT */
 
-static unsigned long mem_limit __read_mostly = MAX_MEM;
+static unsigned long mem_limit __ro_after_init = MAX_MEM;
 
 static void __init mem_limit_func(void)
 {
@@ -577,11 +577,11 @@ void mark_rodata_ro(void)
 #define SET_MAP_OFFSET(x) ((void *)(((unsigned long)(x) + VM_MAP_OFFSET) \
 				     & ~(VM_MAP_OFFSET-1)))
 
-void *parisc_vmalloc_start __read_mostly;
+void *parisc_vmalloc_start __ro_after_init;
 EXPORT_SYMBOL(parisc_vmalloc_start);
 
 #ifdef CONFIG_PA11
-unsigned long pcxl_dma_start __read_mostly;
+unsigned long pcxl_dma_start __ro_after_init;
 #endif
 
 void __init mem_init(void)
@@ -650,7 +650,7 @@ void __init mem_init(void)
 #endif
 }
 
-unsigned long *empty_zero_page __read_mostly;
+unsigned long *empty_zero_page __ro_after_init;
 EXPORT_SYMBOL(empty_zero_page);
 
 void show_mem(unsigned int filter)
diff --git a/drivers/parisc/lasi.c b/drivers/parisc/lasi.c
index e65727c..212f740 100644
--- a/drivers/parisc/lasi.c
+++ b/drivers/parisc/lasi.c
@@ -150,7 +150,7 @@ static void __init lasi_led_init(unsigned long lasi_hpa)
  * 
  */
 
-static unsigned long lasi_power_off_hpa __read_mostly;
+static unsigned long lasi_power_off_hpa __ro_after_init;
 
 static void lasi_power_off(void)
 {
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 2ec2aef..684c7c0 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -100,7 +100,7 @@
 
 /* non-postable I/O port space, densely packed */
 #define LBA_PORT_BASE	(PCI_F_EXTEND | 0xfee00000UL)
-static void __iomem *astro_iop_base __read_mostly;
+static void __iomem *astro_iop_base __ro_after_init;
 
 static u32 lba_t32;
 
diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index b482431..d589d1c 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -57,14 +57,14 @@
    relatively large amount of CPU time, some of the calculations can be 
    turned off with the following variables (controlled via procfs) */
 
-static int led_type __read_mostly = -1;
+static int led_type __ro_after_init = -1;
 static unsigned char lastleds;	/* LED state from most recent update */
 static unsigned int led_heartbeat __read_mostly = 1;
 static unsigned int led_diskio    __read_mostly = 1;
 static unsigned int led_lanrxtx   __read_mostly = 1;
 static char lcd_text[32]          __read_mostly;
 static char lcd_text_default[32]  __read_mostly;
-static int  lcd_no_led_support    __read_mostly = 0; /* KittyHawk doesn't support LED on its LCD */
+static int  lcd_no_led_support    __ro_after_init; /* KittyHawk doesn't support LED on its LCD */
 
 
 static struct workqueue_struct *led_wq;
@@ -149,7 +149,7 @@ static int start_task(void)
 device_initcall(start_task);
 
 /* ptr to LCD/LED-specific function */
-static void (*led_func_ptr) (unsigned char) __read_mostly;
+static void (*led_func_ptr) (unsigned char) __ro_after_init;
 
 #ifdef CONFIG_PROC_FS
 static int led_proc_show(struct seq_file *m, void *v)
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 3651c38..84d81e3 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -90,10 +90,10 @@ MODULE_LICENSE("GPL");
 MODULE_VERSION(PDCS_VERSION);
 
 /* holds Stable Storage size. Initialized once and for all, no lock needed */
-static unsigned long pdcs_size __read_mostly;
+static unsigned long pdcs_size __ro_after_init;
 
 /* holds OS ID. Initialized once and for all, hopefully to 0x0006 */
-static u16 pdcs_osid __read_mostly;
+static u16 pdcs_osid __ro_after_init;
 
 /* This struct defines what we need to deal with a parisc pdc path entry */
 struct pdcspath_entry {
