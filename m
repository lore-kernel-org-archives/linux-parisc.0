From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fix parisc runtime hangs wrt pa_tlb_lock
Date: Tue, 16 Jun 2009 22:51:48 +0200
Message-ID: <4A3805E4.4080305@gmx.de>
References: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca> <4A2ADEC9.2090403@gmx.de> <4A35741F.6000107@gmx.de> <20090614232046.GA14028@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090614232046.GA14028@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/15/2009 01:20 AM, John David Anglin wrote:
> I am convinced that interrupts need to be disabled on SMP kernels to
> prevent deadlock.  On UP kernels, I am not convinced that anything bad
> happens if we do a tlb purge while handling an interrupt since we don't
> have to worry about preventing bus conflicts.  The UP code can't
> deadlock.  I'm thinking that we can stay with disabling preemption.

Dave is right and it took me long to understand his point...
I continued testing and we can simply just disable preemption for UP
kernels and use an irq-safe spinlock for SMP kernels.

Below is the latest and greatest patch which fixes this bug.
Run-tested onUP kernels and compile-tested on SMP kernels.

Kyle, it would be nice if you could apply it as soon as possible.
The bug is existing since a long time, so it might make sense to backport
it to older kernels as well...

-----------

Patch: [parisc] fix system hangs due to unsafe locking of the TLB-protection spinlock
Importance: high, fixes complete kernel stalls

The TLB flushing functions on hppa, which causes PxTLB broadcasts on the system
bus, needs to be protected by irq-safe spinlocks to avoid irq handlers to deadlock
the kernel. The deadlocks only happened during I/O intensive loads and triggered
pretty seldom, which is why this bug went so long unnoticed.

Fix this bug by using spin_lock_irqsafe() for SMP kernels and preempt_disable()
for UP kernels.

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 1f6fd4f..3d82fc8 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -10,16 +10,21 @@
  
  /* This is for the serialisation of PxTLB broadcasts.  At least on the
   * N class systems, only one PxTLB inter processor broadcast can be
- * active at any one time on the Merced bus.  This tlb purge
- * synchronisation is fairly lightweight and harmless so we activate
- * it on all SMP systems not just the N class.  We also need to have
- * preemption disabled on uniprocessor machines, and spin_lock does that
- * nicely.
+ * active at any one time on the Merced bus. To be on the safe side, we
+ * unconditionally protect those broadcasts for all SMP kernels with a
+ * spinlock.
+ * On uniprocessor machines we save this overhead by just disabling
+ * preemption.
   */
-extern spinlock_t pa_tlb_lock;
  
-#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
-#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
+#ifdef CONFIG_SMP
+extern spinlock_t pa_tlb_lock;
+# define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_lock, flags)
+# define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_lock, flags)
+#else
+# define purge_tlb_start(flags)	preempt_disable()
+# define purge_tlb_end(flags)	preempt_enable()
+#endif
  
  extern void flush_tlb_all(void);
  extern void flush_tlb_all_local(void *);
@@ -64,13 +69,14 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
  	unsigned long addr)
  {
  	/* For one page, it's not worth testing the split_tlb variable */
+	unsigned long flags __maybe_unused;
  
  	mb();
  	mtsp(vma->vm_mm->context,1);
-	purge_tlb_start();
+	purge_tlb_start(flags);
  	pdtlb(addr);
  	pitlb(addr);
-	purge_tlb_end();
+	purge_tlb_end(flags);
  }
  
  void __flush_tlb_range(unsigned long sid,
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 837530e..9c85e4f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -35,12 +35,14 @@ int icache_stride __read_mostly;
  EXPORT_SYMBOL(dcache_stride);
  
  
+#ifdef CONFIG_SMP
  /* On some machines (e.g. ones with the Merced bus), there can be
   * only a single PxTLB broadcast at a time; this must be guaranteed
- * by software.  We put a spinlock around all TLB flushes  to
- * ensure this.
+ * by software.  We put a spinlock around all TLB flushes on SMP
+ * kernels to ensure this.
   */
  DEFINE_SPINLOCK(pa_tlb_lock);
+#endif
  
  struct pdc_cache_info cache_info __read_mostly;
  #ifndef CONFIG_PA20
@@ -400,10 +402,11 @@ void clear_user_page_asm(void *page, unsigned long vaddr)
  {
  	/* This function is implemented in assembly in pacache.S */
  	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
+	unsigned long flags __maybe_unused;
  
-	purge_tlb_start();
+	purge_tlb_start(flags);
  	__clear_user_page_asm(page, vaddr);
-	purge_tlb_end();
+	purge_tlb_end(flags);
  }
  
  #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -444,20 +447,22 @@ extern void clear_user_page_asm(void *page, unsigned long vaddr);
  
  void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
  {
+	unsigned long flags __maybe_unused;
  	purge_kernel_dcache_page((unsigned long)page);
-	purge_tlb_start();
+	purge_tlb_start(flags);
  	pdtlb_kernel(page);
-	purge_tlb_end();
+	purge_tlb_end(flags);
  	clear_user_page_asm(page, vaddr);
  }
  EXPORT_SYMBOL(clear_user_page);
  
  void flush_kernel_dcache_page_addr(void *addr)
  {
+	unsigned long flags __maybe_unused;
  	flush_kernel_dcache_page_asm(addr);
-	purge_tlb_start();
+	purge_tlb_start(flags);
  	pdtlb_kernel(addr);
-	purge_tlb_end();
+	purge_tlb_end(flags);
  }
  EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
  
@@ -490,8 +495,9 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
  	if (npages >= 512)  /* 2MB of space: arbitrary, should be tuned */
  		flush_tlb_all();
  	else {
+		unsigned long flags __maybe_unused;
  		mtsp(sid, 1);
-		purge_tlb_start();
+		purge_tlb_start(flags);
  		if (split_tlb) {
  			while (npages--) {
  				pdtlb(start);
@@ -504,7 +510,7 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
  				start += PAGE_SIZE;
  			}
  		}
-		purge_tlb_end();
+		purge_tlb_end(flags);
  	}
  }
  
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 7d927ea..dbe6c8e 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -90,12 +90,13 @@ static inline int map_pte_uncached(pte_t * pte,
  	if (end > PMD_SIZE)
  		end = PMD_SIZE;
  	do {
+		unsigned long flags __maybe_unused;
  		if (!pte_none(*pte))
  			printk(KERN_ERR "map_pte_uncached: page already exists\n");
  		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
-		purge_tlb_start();
+		purge_tlb_start(flags);
  		pdtlb_kernel(orig_vaddr);
-		purge_tlb_end();
+		purge_tlb_end(flags);
  		vaddr += PAGE_SIZE;
  		orig_vaddr += PAGE_SIZE;
  		(*paddr_ptr) += PAGE_SIZE;
@@ -168,11 +169,12 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
  	if (end > PMD_SIZE)
  		end = PMD_SIZE;
  	do {
+		unsigned long flags __maybe_unused;
  		pte_t page = *pte;
  		pte_clear(&init_mm, vaddr, pte);
-		purge_tlb_start();
+		purge_tlb_start(flags);
  		pdtlb_kernel(orig_vaddr);
-		purge_tlb_end();
+		purge_tlb_end(flags);
  		vaddr += PAGE_SIZE;
  		orig_vaddr += PAGE_SIZE;
  		pte++;
