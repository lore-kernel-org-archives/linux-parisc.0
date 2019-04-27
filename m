Return-Path: <SRS0=TiJ5=S5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FD6C43218
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 19:49:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EED08206C1
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 19:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfD0TtE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 27 Apr 2019 15:49:04 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:39578 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725947AbfD0TtE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Apr 2019 15:49:04 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190427194902.CYJF4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 27 Apr 2019 15:49:02 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190427194902.RZDR30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 27 Apr 2019 15:49:02 -0400
Subject: Re: [PATCH] parisc: Update huge TLB page support to use per-pagetable
 spinlock
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Mikulas Patocka <mpatocka@redhat.com>
References: <c14ef878-b942-af8e-5eea-3e04c80a33dd@bell.net>
 <1556390401.5648.2.camel@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <ffee3ba7-1317-d298-5c16-b5fa39c69a5c@bell.net>
Date:   Sat, 27 Apr 2019 15:49:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556390401.5648.2.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=KFqPZa80wh56Ws6LVEoA:9 a=Qt_1sukS2VTpTJHk:21 a=-G0pkFK9CYqkrNd3:21 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfLpdRozbY8IBNwFiJkL9D+RJVG1IbTQ0/UCR1aFzJ08zegQSZKFLieIQpGQ0n31CebrfM7xrNHAYhyJl4IzO2wuNJFx0R5LeiiApvWXcJf7yndUZA/ZJ 8jALdoG3h2mbxYLFP8HHBFYKnSyOB805J2TJI9Lrd7aeZaocwmwM9G1/IzhJsE0VqKnwe+Rxiz/bFw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-27 2:40 p.m., James Bottomley wrote:
> On Sat, 2019-04-27 at 14:15 -0400, John David Anglin wrote:
>> This patch updates the parisc huge TLB page support to use per-
>> pagetable spinlocks.
>>
>> This patch requires Mikulas' per-pagetable spinlock patch and the
>> revised TLB serialization patch from Helge and myself.  With Mikulas'
>> patch, we need to use the per-pagetable spinlock for page table
>> updates.  The TLB lock is only used to serialize TLB flushes on
>> machines with the Merced bus.
>>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> ---
>>
>> diff --git a/arch/parisc/mm/hugetlbpage.c
>> b/arch/parisc/mm/hugetlbpage.c
>> index d77479ae3af2..d578809e55cf 100644
>> --- a/arch/parisc/mm/hugetlbpage.c
>> +++ b/arch/parisc/mm/hugetlbpage.c
>> @@ -139,9 +139,9 @@ void set_huge_pte_at(struct mm_struct *mm,
>> unsigned long addr,
>>  {
>>  	unsigned long flags;
>>
>> -	purge_tlb_start(flags);
>> +	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
>>  	__set_huge_pte_at(mm, addr, ptep, entry);
>> -	purge_tlb_end(flags);
>> +	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
> You can't do stuff like this on the problem systems: we can only have
> one outstanding purge at once on the inter-cpu bus.  For them,
> therefore, we also need a global spinlock.
>
> Pulling the tlb purge lock down to the lowest level, so inside
> purge_tlb_entries() might address a lot of the performance issues while
> keeping the purges correct on merced class.
The above was done in this change which I posted before.  The TLB flushes are serialized
using purge_tlb_start() and purge_tlb_end().  As can be seen below, the inner TLB lock is taken
when pa_serialize_tlb_flushes is true (Merced bus system).  Even when lock is not taken, we
need to disable interrupts to protect %sr0 from being clobbered by an interrupt for the purge
instruction.  Note the modification to purge_tlb_entries().  It is used for most TLB purges.

I'm waiting to hear from Helge that the patch below works on rp5470 with the Merced bus.
I know the change works on rp3440 and c8000.  The performance improvement is huge when
all CPUs are being used.  There doesn't appear to be any impact on stability.

Dave

diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include/asm/hardware.h
index d6e1ed145031..9d3d7737c58b 100644
--- a/arch/parisc/include/asm/hardware.h
+++ b/arch/parisc/include/asm/hardware.h
@@ -120,7 +120,7 @@ extern void get_pci_node_path(struct pci_dev *dev, struct hardware_path *path);
 extern void init_parisc_bus(void);
 extern struct device *hwpath_to_device(struct hardware_path *modpath);
 extern void device_to_hwpath(struct device *dev, struct hardware_path *path);
-
+extern int machine_has_merced_bus(void);
 
 /* inventory.c: */
 extern void do_memory_inventory(void);
diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index d05c678c77c4..ea75cc966dae 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -41,6 +41,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
         __pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
 #endif
     }
+    spin_lock_init(pgd_spinlock(actual_pgd));
     return actual_pgd;
 }
 
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index c7bb74e22436..be13b1bf0345 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -17,7 +17,7 @@
 #include <asm/processor.h>
 #include <asm/cache.h>
 
-extern spinlock_t pa_tlb_lock;
+static inline spinlock_t *pgd_spinlock(pgd_t *);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -34,16 +34,43 @@ extern spinlock_t pa_tlb_lock;
  */
 #define kern_addr_valid(addr)    (1)
 
-/* Purge data and instruction TLB entries.  Must be called holding
- * the pa_tlb_lock.  The TLB purge instructions are slow on SMP
- * machines since the purge must be broadcast to all CPUs.
+/* This is for the serialisation of PxTLB broadcasts.  At least on the
+ * N class systems, only one PxTLB inter processor broadcast can be
+ * active at any one time on the Merced bus.
+
+ * PTE updates are protected by locks in the PMD.
+ */
+extern spinlock_t pa_tlb_flush_lock;
+#ifdef CONFIG_64BIT
+extern int pa_serialize_tlb_flushes;
+#else
+#define pa_serialize_tlb_flushes        (0)
+#endif
+
+#define purge_tlb_start(flags)  \
+        if (pa_serialize_tlb_flushes)   \
+                spin_lock_irqsave(&pa_tlb_flush_lock, flags); \
+        else \
+                local_irq_save(flags)
+#define purge_tlb_end(flags)    \
+        if (pa_serialize_tlb_flushes)   \
+                spin_unlock_irqrestore(&pa_tlb_flush_lock, flags); \
+        else \
+                local_irq_restore(flags)
+
+/* Purge data and instruction TLB entries. The TLB purge instructions
+ * are slow on SMP machines since the purge must be broadcast to all CPUs.
  */
 
 static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 {
+    unsigned long flags;
+
+    purge_tlb_start(flags);
     mtsp(mm->context, 1);
     pdtlb(addr);
     pitlb(addr);
+    purge_tlb_end(flags);
 }
 
 /* Certain architectures need to do special things when PTEs
@@ -59,11 +86,11 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
     do {                            \
         pte_t old_pte;                    \
         unsigned long flags;                \
-        spin_lock_irqsave(&pa_tlb_lock, flags);        \
+        spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
         old_pte = *ptep;                \
         set_pte(ptep, pteval);                \
         purge_tlb_entries(mm, addr);            \
-        spin_unlock_irqrestore(&pa_tlb_lock, flags);    \
+        spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
     } while (0)
 
 #endif /* !__ASSEMBLY__ */
@@ -88,10 +115,10 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 #if CONFIG_PGTABLE_LEVELS == 3
 #define PGD_ORDER    1 /* Number of pages per pgd */
 #define PMD_ORDER    1 /* Number of pages per pmd */
-#define PGD_ALLOC_ORDER    2 /* first pgd contains pmd */
+#define PGD_ALLOC_ORDER    (2 + 1) /* first pgd contains pmd */
 #else
 #define PGD_ORDER    1 /* Number of pages per pgd */
-#define PGD_ALLOC_ORDER    PGD_ORDER
+#define PGD_ALLOC_ORDER    (PGD_ORDER + 1)
 #endif
 
 /* Definitions for 3rd level (we use PLD here for Page Lower directory
@@ -459,6 +486,17 @@ extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t *);
 #define __pte_to_swp_entry(pte)        ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
 
+
+static inline spinlock_t *pgd_spinlock(pgd_t *pgd)
+{
+    extern spinlock_t pa_swapper_pg_lock;
+
+    if (unlikely(pgd == swapper_pg_dir))
+        return &pa_swapper_pg_lock;
+    return (spinlock_t *)((char *)pgd + (PAGE_SIZE << (PGD_ALLOC_ORDER - 1)));
+}
+
+
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
     pte_t pte;
@@ -467,15 +505,15 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned
     if (!pte_young(*ptep))
         return 0;
 
-    spin_lock_irqsave(&pa_tlb_lock, flags);
+    spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
     pte = *ptep;
     if (!pte_young(pte)) {
-        spin_unlock_irqrestore(&pa_tlb_lock, flags);
+        spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
         return 0;
     }
     set_pte(ptep, pte_mkold(pte));
     purge_tlb_entries(vma->vm_mm, addr);
-    spin_unlock_irqrestore(&pa_tlb_lock, flags);
+    spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
     return 1;
 }
 
@@ -485,11 +523,11 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
     pte_t old_pte;
     unsigned long flags;
 
-    spin_lock_irqsave(&pa_tlb_lock, flags);
+    spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
     old_pte = *ptep;
     set_pte(ptep, __pte(0));
     purge_tlb_entries(mm, addr);
-    spin_unlock_irqrestore(&pa_tlb_lock, flags);
+    spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
 
     return old_pte;
 }
@@ -497,10 +535,10 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
     unsigned long flags;
-    spin_lock_irqsave(&pa_tlb_lock, flags);
+    spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
     set_pte(ptep, pte_wrprotect(*ptep));
     purge_tlb_entries(mm, addr);
-    spin_unlock_irqrestore(&pa_tlb_lock, flags);
+    spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
 }
 
 #define pte_same(A,B)    (pte_val(A) == pte_val(B))
diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 6804374efa66..c5ded01d45be 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -8,21 +8,6 @@
 #include <linux/sched.h>
 #include <asm/mmu_context.h>
 
-
-/* This is for the serialisation of PxTLB broadcasts.  At least on the
- * N class systems, only one PxTLB inter processor broadcast can be
- * active at any one time on the Merced bus.  This tlb purge
- * synchronisation is fairly lightweight and harmless so we activate
- * it on all systems not just the N class.
-
- * It is also used to ensure PTE updates are atomic and consistent
- * with the TLB.
- */
-extern spinlock_t pa_tlb_lock;
-
-#define purge_tlb_start(flags)    spin_lock_irqsave(&pa_tlb_lock, flags)
-#define purge_tlb_end(flags)    spin_unlock_irqrestore(&pa_tlb_lock, flags)
-
 extern void flush_tlb_all(void);
 extern void flush_tlb_all_local(void *);
 
@@ -79,13 +64,6 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 static inline void flush_tlb_page(struct vm_area_struct *vma,
     unsigned long addr)
 {
-    unsigned long flags, sid;
-
-    sid = vma->vm_mm->context;
-    purge_tlb_start(flags);
-    mtsp(sid, 1);
-    pdtlb(addr);
-    pitlb(addr);
-    purge_tlb_end(flags);
+    purge_tlb_entries(vma->vm_mm, addr);
 }
 #endif
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 804880efa11e..848020f0a85e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -40,13 +40,20 @@ void purge_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 
 
-/* On some machines (e.g. ones with the Merced bus), there can be
+/* On some machines (i.e., ones with the Merced bus), there can be
  * only a single PxTLB broadcast at a time; this must be guaranteed
- * by software.  We put a spinlock around all TLB flushes  to
- * ensure this.
+ * by software. We need a spinlock around all TLB flushes to ensure
+ * this.
  */
-DEFINE_SPINLOCK(pa_tlb_lock);
+DEFINE_SPINLOCK(pa_tlb_flush_lock);
 
+/* Swapper page setup lock. */
+DEFINE_SPINLOCK(pa_swapper_pg_lock);
+
+#ifdef CONFIG_64BIT
+int pa_serialize_tlb_flushes __read_mostly;
+#endif
+
 struct pdc_cache_info cache_info __read_mostly;
 #ifndef CONFIG_PA20
 static struct pdc_btlb_info btlb_info __read_mostly;
diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 5eb979d04b90..b26b1d2a2ea9 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -38,6 +38,7 @@
 #include <asm/io.h>
 #include <asm/pdc.h>
 #include <asm/parisc-device.h>
+#include <asm/ropes.h>
 
 /* See comments in include/asm-parisc/pci.h */
 const struct dma_map_ops *hppa_dma_ops __read_mostly;
@@ -257,6 +258,30 @@ static struct parisc_device *find_device_by_addr(unsigned long hpa)
     return ret ? d.dev : NULL;
 }
 
+static int is_IKE_device(struct device *dev, void *data)
+{
+    struct parisc_device * pdev = to_parisc_device(dev);
+
+    if (!check_dev(dev))
+        return 0;
+    if (pdev->id.hw_type != HPHW_BCPORT)
+        return 0;
+    if (IS_IKE(pdev) ||
+        (pdev->id.hversion == REO_MERCED_PORT) ||
+        (pdev->id.hversion == REOG_MERCED_PORT)) {
+            return 1;
+    }
+    return 0;
+}
+
+int __init machine_has_merced_bus(void)
+{
+    int ret;
+
+    ret = for_each_padev(is_IKE_device, NULL);
+    return ret ? 1 : 0;
+}
+
 /**
  * find_pa_parent_type - Find a parent of a specific type
  * @dev: The device to start searching from
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index d5eb19efa65b..a1fc04570ade 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -50,12 +50,8 @@
 
     .import        pa_tlb_lock,data
     .macro  load_pa_tlb_lock reg
-#if __PA_LDCW_ALIGNMENT > 4
-    load32    PA(pa_tlb_lock) + __PA_LDCW_ALIGNMENT-1, \reg
-    depi    0,31,__PA_LDCW_ALIGN_ORDER, \reg
-#else
-    load32    PA(pa_tlb_lock), \reg
-#endif
+    mfctl        %cr25,\reg
+    addil        L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
     .endm
 
     /* space_to_prot macro creates a prot id from a space id */
diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index 35d05fdd7483..1a86220539d9 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -31,6 +31,7 @@
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/parisc-device.h>
+#include <asm/tlbflush.h>
 
 /*
 ** Debug options
@@ -638,4 +639,12 @@ void __init do_device_inventory(void)
     }
     printk(KERN_INFO "Found devices:\n");
     print_parisc_devices();
+
+#ifdef CONFIG_64BIT
+    pa_serialize_tlb_flushes = machine_has_merced_bus();
+    if (pa_serialize_tlb_flushes)
+        printk(KERN_INFO "Enabled slow TLB syncronization for Merced bus.\n");
+    else
+        printk(KERN_INFO "No Merced bus found: Enabled fast TLB flushes.\n");
+#endif
 }

-- 
John David Anglin  dave.anglin@bell.net

