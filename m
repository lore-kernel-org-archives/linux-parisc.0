From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix cache flushing in kmap/kunmap API implementation
 for aio
Date: Sun, 1 Dec 2013 22:18:32 +0100
Message-ID: <20131201211832.GA15998@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is now the next try to fix the aio bug in our kmap/kunmap
implementation. It's basically stuff from 

@James: Does this looks better? Can we get a signed-off or Acked-by from
you on this patch?
The old mail thread was named "aio: fix D-cache aliasing issues"..

Dave & James: You can see my current patch description below. I would
be happy if one of you could come up with a better one...

Tested on my C8000 and works OK.

Helge

-------------------
From: John David Anglin <dave.anglin@bell.net>

The aio-stress testcase revealed the problems in our kmap/kunmap API, that we
didn't flushed the dcache page during kmap() on PA8800/PA8900 CPUs, and always
needed to flush the kernel dcache at kunmap(), even if the CPU doesn't require
conherency (< PA8800).

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # 3.9+

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index f0e2784..8ddab5e 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -125,42 +125,44 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 void mark_rodata_ro(void);
 #endif
 
-#ifdef CONFIG_PA8X00
-/* Only pa8800, pa8900 needs this */
-
 #include <asm/kmap_types.h>
 
 #define ARCH_HAS_KMAP
 
-void kunmap_parisc(void *addr);
-
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
+	/* Flush dcache page on CPUs that require coherency. */
+	if (parisc_requires_coherency())
+		flush_dcache_page(page);
 	return page_address(page);
 }
 
 static inline void kunmap(struct page *page)
 {
-	kunmap_parisc(page_address(page));
+	/* Always flush kernel dcache, even if CPU doesn't require conherency.
+	 * Needed on CPUs < PA8800/PA8900 for AIO support. */
+	flush_kernel_dcache_page_addr(page_address(page));
 }
 
 static inline void *kmap_atomic(struct page *page)
 {
 	pagefault_disable();
+	/* Flush dcache page on CPUs that require coherency. */
+	if (parisc_requires_coherency())
+		flush_dcache_page(page);
 	return page_address(page);
 }
 
 static inline void __kunmap_atomic(void *addr)
 {
-	kunmap_parisc(addr);
+	flush_kernel_dcache_page_addr(addr);
 	pagefault_enable();
 }
 
 #define kmap_atomic_prot(page, prot)	kmap_atomic(page)
 #define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
-#endif
 
 #endif /* _PARISC_CACHEFLUSH_H */
 
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index cc2290a..9cbee39 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -106,6 +106,7 @@ struct cpuinfo_parisc {
 };
 
 extern struct system_cpuinfo_parisc boot_cpu_data;
+extern int parisc_coherent_cpu;
 DECLARE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
 #define CPU_HVERSION ((boot_cpu_data.hversion >> 4) & 0x0FFF)
@@ -338,8 +339,7 @@ extern unsigned long get_wchan(struct task_struct *p);
 static inline int parisc_requires_coherency(void)
 {
 #ifdef CONFIG_PA8X00
-	return (boot_cpu_data.cpu_type == mako) ||
-		(boot_cpu_data.cpu_type == mako2);
+	return parisc_coherent_cpu;
 #else
 	return 0;
 #endif
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c035673..3c6899f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -391,8 +391,6 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 void clear_user_page(void *vto, unsigned long vaddr, struct page *page)
 {
 	clear_page_asm(vto);
-	if (!parisc_requires_coherency())
-		flush_kernel_dcache_page_asm(vto);
 }
 EXPORT_SYMBOL(clear_user_page);
 
@@ -401,28 +399,18 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 {
 	/* Copy using kernel mapping.  No coherency is needed
 	   (all in kmap/kunmap) on machines that don't support
-	   non-equivalent aliasing.  However, the `from' page
-	   needs to be flushed before it can be accessed through
-	   the kernel mapping. */
-	preempt_disable();
-	flush_dcache_page_asm(__pa(vfrom), vaddr);
-	preempt_enable();
+	   non-equivalent aliasing.  On other machines, the
+	   `from' page needs to be flushed before it can be
+	   accessed through the kernel mapping. */
+	if (!parisc_requires_coherency()) {
+		preempt_disable();
+		flush_dcache_page_asm(__pa(vfrom), vaddr);
+		preempt_enable();
+	}
 	copy_page_asm(vto, vfrom);
-	if (!parisc_requires_coherency())
-		flush_kernel_dcache_page_asm(vto);
 }
 EXPORT_SYMBOL(copy_user_page);
 
-#ifdef CONFIG_PA8X00
-
-void kunmap_parisc(void *addr)
-{
-	if (parisc_requires_coherency())
-		flush_kernel_dcache_page_addr(addr);
-}
-EXPORT_SYMBOL(kunmap_parisc);
-#endif
-
 void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 {
 	unsigned long flags;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index b68d977..f1b8c48 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -45,6 +45,11 @@
 struct system_cpuinfo_parisc boot_cpu_data __read_mostly;
 EXPORT_SYMBOL(boot_cpu_data);
 
+#ifdef CONFIG_PA8X00
+int parisc_coherent_cpu __read_mostly;
+EXPORT_SYMBOL(parisc_coherent_cpu);
+#endif
+
 DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
 extern int update_cr16_clocksource(void);	/* from time.c */
@@ -271,6 +276,11 @@ void __init collect_boot_cpu_data(void)
 		printk(KERN_INFO "model %s\n",
 			boot_cpu_data.pdc.sys_model_name);
 
+#ifdef CONFIG_PA8X00
+	parisc_coherent_cpu = (boot_cpu_data.cpu_type == mako) ||
+			      (boot_cpu_data.cpu_type == mako2);
+#endif
+
 	boot_cpu_data.hversion =  boot_cpu_data.pdc.model.hversion;
 	boot_cpu_data.sversion =  boot_cpu_data.pdc.model.sversion;
 
