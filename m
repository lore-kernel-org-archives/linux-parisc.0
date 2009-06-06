From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 06 Jun 2009 23:25:29 +0200
Message-ID: <4A2ADEC9.2090403@gmx.de>
References: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090528015037.3417E4FEA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> Since many kernel versions I regularly faced reproducibly kernel hangs when
>> compiling some bigger files. The machine suddenly just seemed to hang.
>>
>> With spinlock debugging turned on I found this:
>>
>> BUG: spinlock recursion on CPU#0, tool/7263
>>  lock: 10644000, .magic: dead4ead, .owner: tool/7263, .owner_cpu: 0
>> Backtrace:
>>  [<10113a94>] show_stack+0x18/0x28
>>
>> BUG: spinlock lockup on CPU#0, tool/7263, 10644000
>> Backtrace:
>>  [<10113a94>] show_stack+0x18/0x28
>>
>> BUG: soft lockup - CPU#0 stuck for 61s! [tool:7263]
>> IASQ: 00000000 00000000 IAOQ: 102d55dc 102d557c
>>  IIR: 03c008b3    ISR: 00000000  IOR: 00000000
>>  CPU:        0   CR30: 7d1a4000 CR31: 11111111
>>  ORIG_R28: 00000000
>>  IAOQ[0]: _raw_spin_lock+0x15c/0x1c0
>>  IAOQ[1]: _raw_spin_lock+0xfc/0x1c0
>>  RP(r2): _raw_spin_lock+0x18c/0x1c0
>> Backtrace:
>>  [<102d560c>] _raw_spin_lock+0x18c/0x1c0
>>
>> Kernel panic - not syncing: softlockup: hung tasks
>> Backtrace:
>>  [<10113a94>] show_stack+0x18/0x28
> 
> I have tested the proposed change using 2.6.30-rc6 and a modified version
> of 2.6.22.10.  I tested using SMP kernels running on a rp3440 and UP
> kernels on a c3750.  I also tested changing the macros to just use
> preempt_disable/preempt_enable.
> 
> The patch doesn't cause any new problems as far as I can tell.  

That's good. Thanks for testing !

> However,
> it doesn't fix any of the problems that I currently see on these two
> machines.  In particular, I see the occasional gcc testsuite timeout
> using SMP kernels.  Programs that usually take a few seconds to run
> timeout after three minutes.  These timeouts don't occur with UP kernels.

Ok, it fixes at least a kernel hang I faced regularily with my compilations...

> On the rp3440, the spinlock is definitely needed.  With just
> preempt_disable/preempt_enable, a crash occurs during bootstrap
> at the point unused memory is recovered.  Thus, the tlb purge
> issue referred to in the preceeding comment affects more than
> just N class.
> 
> On the otherhand, it doesn't seem necessary to disable interrupts
> during the purge with UP kernels.  

My kernel crashes happened with UP-kernels on a B2000 (1 CPU).
So, I still have the feeling that it's necessary to disable interrupts 
on UP kernels as well.

The new cleaned-up attached patch below shows, that arch/parisc/kernel/pci-dma.c
is affected. My kernel crashes always happened when the machine was pretty 
much loaded, during memory pressure when the system still wanted to load
something from disk.
In pci-dma.c the TLB flushing code is called from the DMA handlers, so
it does indicate that IRQ would need to be disabled.
One example I could imagine (with a UP-kernel):
- Process A runs some code, gets into kernel and executes clear_user_page() and locks
  the pa_tlb_lock spinlock (inside the critical section).
- Suddenly Process B gets data from disk via DMA handlers in pci-dma.c
- DMA-Interrupt kicks in, the DMA handler tries to get the pa_tlb_lock and fails
  since process A still holds the lock
-> machine deadlocks and kernel starts reporting about "hung tasks after 61seconds".
  (just search the mailing list for such reports..)

So, even a UP-kernel is affected.

> With SMP kernels, it would be nice
> to know if the lockup was caused by an interruption during the tlb
> purge, or a preemption issue.
> 
> I have the sense that disabling interrupts is wrong.  That is any
> given CPU can only generate one PxTLB inter processor broadcast
> at a time.  Disabling interrupts could cause a deadlock if a TLB
> purge was needed while the purge code was executing.
> 
> The other alternative is to allow the processor that holds the lock
> to enter the flush code.  This would fix the deadlock.  Don't know how
> to code this (atomic compare and exchange?).
> 
> The preempt_disable/preempt_enable crash on the rp3440 made me wonder
> if all tlb purge operations are properly protected with the tlb spinlock.
> I think we need to look at flush_tlb_all_local and copy_user_page_asm.
> They don't seem protected.

New patch attached.

Helge

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 1f6fd4f..217588e 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -18,8 +18,8 @@
  */
 extern spinlock_t pa_tlb_lock;
 
-#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
-#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
+#define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_lock, flags)
+#define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_lock, flags)
 
 extern void flush_tlb_all(void);
 extern void flush_tlb_all_local(void *);
@@ -64,13 +64,14 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 	unsigned long addr)
 {
 	/* For one page, it's not worth testing the split_tlb variable */
+	unsigned long flags;
 
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
index 837530e..e3c55f7 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -400,10 +400,11 @@ void clear_user_page_asm(void *page, unsigned long vaddr)
 {
 	/* This function is implemented in assembly in pacache.S */
 	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
+	unsigned long flags;
 
-	purge_tlb_start();
+	purge_tlb_start(flags);
 	__clear_user_page_asm(page, vaddr);
-	purge_tlb_end();
+	purge_tlb_end(flags);
 }
 
 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -444,20 +445,22 @@ extern void clear_user_page_asm(void *page, unsigned long vaddr);
 
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
+	unsigned long flags;
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
+	unsigned long flags;
 	flush_kernel_dcache_page_asm(addr);
-	purge_tlb_start();
+	purge_tlb_start(flags);
 	pdtlb_kernel(addr);
-	purge_tlb_end();
+	purge_tlb_end(flags);
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 
@@ -490,8 +493,9 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
 	if (npages >= 512)  /* 2MB of space: arbitrary, should be tuned */
 		flush_tlb_all();
 	else {
+		unsigned long flags;
 		mtsp(sid, 1);
-		purge_tlb_start();
+		purge_tlb_start(flags);
 		if (split_tlb) {
 			while (npages--) {
 				pdtlb(start);
@@ -504,7 +508,7 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
 				start += PAGE_SIZE;
 			}
 		}
-		purge_tlb_end();
+		purge_tlb_end(flags);
 	}
 }
 
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 7d927ea..b8ec5a0 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -90,12 +90,13 @@ static inline int map_pte_uncached(pte_t * pte,
 	if (end > PMD_SIZE)
 		end = PMD_SIZE;
 	do {
+		unsigned long flags;
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
+		unsigned long flags;
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

