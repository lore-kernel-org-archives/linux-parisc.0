From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Collected parisc patches for 2.6.30.1
Date: Sat, 4 Jul 2009 16:05:28 -0400 (EDT)
Message-ID: <20090704200530.516795149@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I've collected a bunch of parisc bug fixes and other changes that
apply against 2.6.30.1.  Sorry about the loss of attribution.

I really wish we had a set of stable git trees (e.g., parisc-2.6.30.y)
against which safe parisc changes are applied.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index ada3e53..7d5ebf1 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -222,13 +222,13 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
 
 #define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
 
-#define atomic_add(i,v)	((void)(__atomic_add_return( ((int)(i)),(v))))
-#define atomic_sub(i,v)	((void)(__atomic_add_return(-((int)(i)),(v))))
+#define atomic_add(i,v)	((void)(__atomic_add_return( (i),(v))))
+#define atomic_sub(i,v)	((void)(__atomic_add_return(-(i),(v))))
 #define atomic_inc(v)	((void)(__atomic_add_return(   1,(v))))
 #define atomic_dec(v)	((void)(__atomic_add_return(  -1,(v))))
 
-#define atomic_add_return(i,v)	(__atomic_add_return( ((int)(i)),(v)))
-#define atomic_sub_return(i,v)	(__atomic_add_return(-((int)(i)),(v)))
+#define atomic_add_return(i,v)	(__atomic_add_return( (i),(v)))
+#define atomic_sub_return(i,v)	(__atomic_add_return(-(i),(v)))
 #define atomic_inc_return(v)	(__atomic_add_return(   1,(v)))
 #define atomic_dec_return(v)	(__atomic_add_return(  -1,(v)))
 
diff --git a/arch/parisc/include/asm/dma.h b/arch/parisc/include/asm/dma.h
index 31ad0f0..f7a18f9 100644
--- a/arch/parisc/include/asm/dma.h
+++ b/arch/parisc/include/asm/dma.h
@@ -1,5 +1,4 @@
-/* $Id: dma.h,v 1.2 1999/04/27 00:46:18 deller Exp $
- * linux/include/asm/dma.h: Defines for using and allocating dma channels.
+/* asm/dma.h: Defines for using and allocating dma channels.
  * Written by Hennus Bergman, 1992.
  * High DMA channel support & info by Hannu Savolainen
  * and John Boyd, Nov. 1992.
diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
index ee80c92..d91357b 100644
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -168,8 +168,8 @@ static inline void set_eiem(unsigned long val)
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
 #define __ldcw(a) ({						\
 	unsigned __ret;						\
-	__asm__ __volatile__(__LDCW " 0(%1),%0"			\
-		: "=r" (__ret) : "r" (a));			\
+	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
+		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
 	__ret;							\
 })
 
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
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index ef26b00..a3c3419 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -807,8 +807,10 @@
 #define __NR_dup3		(__NR_Linux + 312)
 #define __NR_pipe2		(__NR_Linux + 313)
 #define __NR_inotify_init1	(__NR_Linux + 314)
+#define __NR_preadv		(__NR_Linux + 315)
+#define __NR_pwritev		(__NR_Linux + 316)
 
-#define __NR_Linux_syscalls	(__NR_inotify_init1 + 1)
+#define __NR_Linux_syscalls	(__NR_pwritev + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 837530e..57b3908 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -1,5 +1,4 @@
-/* $Id: cache.c,v 1.4 2000/01/25 00:11:38 prumpf Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
@@ -400,10 +399,11 @@ void clear_user_page_asm(void *page, unsigned long vaddr)
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
@@ -444,20 +444,22 @@ extern void clear_user_page_asm(void *page, unsigned long vaddr);
 
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
 
@@ -490,8 +492,9 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
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
@@ -504,7 +507,7 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
 				start += PAGE_SIZE;
 			}
 		}
-		purge_tlb_end();
+		purge_tlb_end(flags);
 	}
 }
 
diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index bd1f7f1..bb3195b 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -170,23 +170,27 @@ static void __init pagezero_memconfig(void)
 static int __init 
 pat_query_module(ulong pcell_loc, ulong mod_index)
 {
-	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+	pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;
 	unsigned long bytecnt;
 	unsigned long temp;	/* 64-bit scratch value */
 	long status;		/* PDC return value status */
 	struct parisc_device *dev;
 
+	pa_pdc_cell = kmalloc(sizeof (*pa_pdc_cell), GFP_KERNEL);
+	if (!pa_pdc_cell)
+		panic("couldn't allocate memory for PDC_PAT_CELL!");
+
 	/* return cell module (PA or Processor view) */
 	status = pdc_pat_cell_module(&bytecnt, pcell_loc, mod_index,
-				     PA_VIEW, &pa_pdc_cell);
+				     PA_VIEW, pa_pdc_cell);
 
 	if (status != PDC_OK) {
 		/* no more cell modules or error */
 		return status;
 	}
 
-	temp = pa_pdc_cell.cba;
-	dev = alloc_pa_dev(PAT_GET_CBA(temp), &pa_pdc_cell.mod_path);
+	temp = pa_pdc_cell->cba;
+	dev = alloc_pa_dev(PAT_GET_CBA(temp), &(pa_pdc_cell->mod_path));
 	if (!dev) {
 		return PDC_OK;
 	}
@@ -203,8 +207,8 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 
 	/* save generic info returned from the call */
 	/* REVISIT: who is the consumer of this? not sure yet... */
-	dev->mod_info = pa_pdc_cell.mod_info;	/* pass to PAT_GET_ENTITY() */
-	dev->pmod_loc = pa_pdc_cell.mod_location;
+	dev->mod_info = pa_pdc_cell->mod_info;	/* pass to PAT_GET_ENTITY() */
+	dev->pmod_loc = pa_pdc_cell->mod_location;
 
 	register_parisc_device(dev);	/* advertise device */
 
@@ -216,14 +220,14 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
 
 	case PAT_ENTITY_PROC:
 		printk(KERN_DEBUG "PAT_ENTITY_PROC: id_eid 0x%lx\n",
-			pa_pdc_cell.mod[0]);
+			pa_pdc_cell->mod[0]);
 		break;
 
 	case PAT_ENTITY_MEM:
 		printk(KERN_DEBUG 
 			"PAT_ENTITY_MEM: amount 0x%lx min_gni_base 0x%lx min_gni_len 0x%lx\n",
-			pa_pdc_cell.mod[0], pa_pdc_cell.mod[1], 
-			pa_pdc_cell.mod[2]);
+			pa_pdc_cell->mod[0], pa_pdc_cell->mod[1], 
+			pa_pdc_cell->mod[2]);
 		break;
 	case PAT_ENTITY_CA:
 		printk(KERN_DEBUG "PAT_ENTITY_CA: %ld\n", pcell_loc);
@@ -243,23 +247,26 @@ pat_query_module(ulong pcell_loc, ulong mod_index)
  print_ranges:
 		pdc_pat_cell_module(&bytecnt, pcell_loc, mod_index,
 				    IO_VIEW, &io_pdc_cell);
-		printk(KERN_DEBUG "ranges %ld\n", pa_pdc_cell.mod[1]);
-		for (i = 0; i < pa_pdc_cell.mod[1]; i++) {
+		printk(KERN_DEBUG "ranges %ld\n", pa_pdc_cell->mod[1]);
+		for (i = 0; i < pa_pdc_cell->mod[1]; i++) {
 			printk(KERN_DEBUG 
 				"  PA_VIEW %ld: 0x%016lx 0x%016lx 0x%016lx\n", 
-				i, pa_pdc_cell.mod[2 + i * 3],	/* type */
-				pa_pdc_cell.mod[3 + i * 3],	/* start */
-				pa_pdc_cell.mod[4 + i * 3]);	/* finish (ie end) */
+				i, pa_pdc_cell->mod[2 + i * 3],	/* type */
+				pa_pdc_cell->mod[3 + i * 3],	/* start */
+				pa_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
 			printk(KERN_DEBUG 
 				"  IO_VIEW %ld: 0x%016lx 0x%016lx 0x%016lx\n", 
-				i, io_pdc_cell.mod[2 + i * 3],	/* type */
-				io_pdc_cell.mod[3 + i * 3],	/* start */
-				io_pdc_cell.mod[4 + i * 3]);	/* finish (ie end) */
+				i, io_pdc_cell->mod[2 + i * 3],	/* type */
+				io_pdc_cell->mod[3 + i * 3],	/* start */
+				io_pdc_cell->mod[4 + i * 3]);	/* finish (ie end) */
 		}
 		printk(KERN_DEBUG "\n");
 		break;
 	}
 #endif /* DEBUG_PAT */
+
+	kfree(pa_pdc_cell);
+
 	return PDC_OK;
 }
 
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 4ea4229..5dc6cc1 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -120,7 +120,7 @@ int cpu_check_affinity(unsigned int irq, const struct cpumask *dest)
 	if (CHECK_IRQ_PER_CPU(irq)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it */
-		cpumask_setall(&irq_desc[irq].affinity);
+		cpumask_setall(irq_desc[irq].affinity);
 		return -EINVAL;
 	}
 
@@ -138,11 +138,11 @@ static void cpu_set_affinity_irq(unsigned int irq, const struct cpumask *dest)
 	if (cpu_dest < 0)
 		return;
 
-	cpumask_copy(&irq_desc[irq].affinity, dest);
+	cpumask_copy(irq_desc[irq].affinity, dest);
 }
 #endif
 
-static struct hw_interrupt_type cpu_interrupt_type = {
+static struct irq_chip cpu_interrupt_type = {
 	.typename	= "CPU",
 	.startup	= cpu_startup_irq,
 	.shutdown	= cpu_disable_irq,
@@ -297,7 +297,7 @@ int txn_alloc_irq(unsigned int bits_wide)
 unsigned long txn_affinity_addr(unsigned int irq, int cpu)
 {
 #ifdef CONFIG_SMP
-	cpumask_copy(&irq_desc[irq].affinity, cpumask_of(cpu));
+	cpumask_copy(irq_desc[irq].affinity, cpumask_of(cpu));
 #endif
 
 	return per_cpu(cpu_data, cpu).txn_addr;
@@ -354,7 +354,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	irq = eirr_to_irq(eirr_val);
 
 #ifdef CONFIG_SMP
-	cpumask_copy(&dest, &irq_desc[irq].affinity);
+	cpumask_copy(&dest, irq_desc[irq].affinity);
 	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status) &&
 	    !cpu_isset(smp_processor_id(), dest)) {
 		int cpu = first_cpu(dest);
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
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 6936386..f7064ab 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -1,5 +1,4 @@
-/* $Id: pci.c,v 1.6 2000/01/29 00:12:05 grundler Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index e09d0f7..c8fb61e 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -1,5 +1,4 @@
-/*    $Id: processor.c,v 1.1 2002/07/20 16:27:06 rhirst Exp $
- *
+/*
  *    Initial setup-routines for HP 9000 based hardware.
  *
  *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
@@ -121,22 +120,28 @@ static int __cpuinit processor_probe(struct parisc_device *dev)
 	if (is_pdc_pat()) {
 		ulong status;
 		unsigned long bytecnt;
-	        pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+	        pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;
 #undef USE_PAT_CPUID
 #ifdef USE_PAT_CPUID
 		struct pdc_pat_cpu_num cpu_info;
 #endif
 
+		pa_pdc_cell = kmalloc(sizeof (*pa_pdc_cell), GFP_KERNEL);
+		if (!pa_pdc_cell)
+			panic("couldn't allocate memory for PDC_PAT_CELL!");
+
 		status = pdc_pat_cell_module(&bytecnt, dev->pcell_loc,
-			dev->mod_index, PA_VIEW, &pa_pdc_cell);
+			dev->mod_index, PA_VIEW, pa_pdc_cell);
 
 		BUG_ON(PDC_OK != status);
 
 		/* verify it's the same as what do_pat_inventory() found */
-		BUG_ON(dev->mod_info != pa_pdc_cell.mod_info);
-		BUG_ON(dev->pmod_loc != pa_pdc_cell.mod_location);
+		BUG_ON(dev->mod_info != pa_pdc_cell->mod_info);
+		BUG_ON(dev->pmod_loc != pa_pdc_cell->mod_location);
+
+		txn_addr = pa_pdc_cell->mod[0];   /* id_eid for IO sapic */
 
-		txn_addr = pa_pdc_cell.mod[0];   /* id_eid for IO sapic */
+		kfree(pa_pdc_cell);
 
 #ifdef USE_PAT_CPUID
 /* We need contiguous numbers for cpuid. Firmware's notion
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 82131ca..cb71f3d 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -1,5 +1,4 @@
-/*    $Id: setup.c,v 1.8 2000/02/02 04:42:38 prumpf Exp $
- *
+/*
  *    Initial setup-routines for HP 9000 based hardware.
  *
  *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index 0838155..7488cfd 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -179,68 +179,6 @@ asmlinkage long sys32_sched_rr_get_interval(pid_t pid,
 	return ret;
 }
 
-/*** copied from mips64 ***/
-/*
- * Ooo, nasty.  We need here to frob 32-bit unsigned longs to
- * 64-bit unsigned longs.
- */
-
-static inline int
-get_fd_set32(unsigned long n, u32 *ufdset, unsigned long *fdset)
-{
-	n = (n + 8*sizeof(u32) - 1) / (8*sizeof(u32));
-	if (ufdset) {
-		unsigned long odd;
-
-		if (!access_ok(VERIFY_WRITE, ufdset, n*sizeof(u32)))
-			return -EFAULT;
-
-		odd = n & 1UL;
-		n &= ~1UL;
-		while (n) {
-			unsigned long h, l;
-			__get_user(l, ufdset);
-			__get_user(h, ufdset+1);
-			ufdset += 2;
-			*fdset++ = h << 32 | l;
-			n -= 2;
-		}
-		if (odd)
-			__get_user(*fdset, ufdset);
-	} else {
-		/* Tricky, must clear full unsigned long in the
-		 * kernel fdset at the end, this makes sure that
-		 * actually happens.
-		 */
-		memset(fdset, 0, ((n + 1) & ~1)*sizeof(u32));
-	}
-	return 0;
-}
-
-static inline void
-set_fd_set32(unsigned long n, u32 *ufdset, unsigned long *fdset)
-{
-	unsigned long odd;
-	n = (n + 8*sizeof(u32) - 1) / (8*sizeof(u32));
-
-	if (!ufdset)
-		return;
-
-	odd = n & 1UL;
-	n &= ~1UL;
-	while (n) {
-		unsigned long h, l;
-		l = *fdset++;
-		h = l >> 32;
-		__put_user(l, ufdset);
-		__put_user(h, ufdset+1);
-		ufdset += 2;
-		n -= 2;
-	}
-	if (odd)
-		__put_user(*fdset, ufdset);
-}
-
 struct msgbuf32 {
     int mtype;
     char mtext[1];
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 03b9a01..6a62961 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -413,6 +413,8 @@
 	ENTRY_SAME(dup3)
 	ENTRY_SAME(pipe2)
 	ENTRY_SAME(inotify_init1)
+	ENTRY_COMP(preadv)
+	ENTRY_COMP(pwritev)
 
 	/* Nothing yet */
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index d4dd056..a79c6f9 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -56,9 +56,9 @@ static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
  */
 irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
-	unsigned long now;
+	unsigned long now, now2;
 	unsigned long next_tick;
-	unsigned long cycles_elapsed, ticks_elapsed;
+	unsigned long cycles_elapsed, ticks_elapsed = 1;
 	unsigned long cycles_remainder;
 	unsigned int cpu = smp_processor_id();
 	struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
@@ -71,44 +71,24 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	/* Initialize next_tick to the expected tick time. */
 	next_tick = cpuinfo->it_value;
 
-	/* Get current interval timer.
-	 * CR16 reads as 64 bits in CPU wide mode.
-	 * CR16 reads as 32 bits in CPU narrow mode.
-	 */
+	/* Get current cycle counter (Control Register 16). */
 	now = mfctl(16);
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 5) < cpt) {
+	if ((cycles_elapsed >> 6) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
 		cycles_remainder = cycles_elapsed;
-		ticks_elapsed = 1;
 		while (cycles_remainder > cpt) {
 			cycles_remainder -= cpt;
 			ticks_elapsed++;
 		}
 	} else {
+		/* TODO: Reduce this to one fdiv op */
 		cycles_remainder = cycles_elapsed % cpt;
-		ticks_elapsed = 1 + cycles_elapsed / cpt;
-	}
-
-	/* Can we differentiate between "early CR16" (aka Scenario 1) and
-	 * "long delay" (aka Scenario 3)? I don't think so.
-	 *
-	 * We expected timer_interrupt to be delivered at least a few hundred
-	 * cycles after the IT fires. But it's arbitrary how much time passes
-	 * before we call it "late". I've picked one second.
-	 */
-	if (unlikely(ticks_elapsed > HZ)) {
-		/* Scenario 3: very long delay?  bad in any case */
-		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
-			" cycles %lX rem %lX "
-			" next/now %lX/%lX\n",
-			cpu,
-			cycles_elapsed, cycles_remainder,
-			next_tick, now );
+		ticks_elapsed += cycles_elapsed / cpt;
 	}
 
 	/* convert from "division remainder" to "remainder of clock tick" */
@@ -122,18 +102,56 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cpuinfo->it_value = next_tick;
 
-	/* Skip one clocktick on purpose if we are likely to miss next_tick.
-	 * We want to avoid the new next_tick being less than CR16.
-	 * If that happened, itimer wouldn't fire until CR16 wrapped.
-	 * We'll catch the tick we missed on the tick after that.
+	/* Program the IT when to deliver the next interrupt.
+	 * Only bottom 32-bits of next_tick are writable in CR16!
 	 */
-	if (!(cycles_remainder >> 13))
-		next_tick += cpt;
-
-	/* Program the IT when to deliver the next interrupt. */
-	/* Only bottom 32-bits of next_tick are written to cr16.  */
 	mtctl(next_tick, 16);
 
+	/* Skip one clocktick on purpose if we missed next_tick.
+	 * The new CR16 must be "later" than current CR16 otherwise
+	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
+	 * later on a 1Ghz processor. We'll account for the missed
+	 * tick on the next timer interrupt.
+	 *
+	 * "next_tick - now" will always give the difference regardless
+	 * if one or the other wrapped. If "now" is "bigger" we'll end up
+	 * with a very large unsigned number.
+	 */
+	now2 = mfctl(16);
+	if (next_tick - now2 > cpt)
+		mtctl(next_tick+cpt, 16);
+
+#if 1
+/*
+ * GGG: DEBUG code for how many cycles programming CR16 used.
+ */
+	if (unlikely(now2 - now > 0x3000)) 	/* 12K cycles */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): SLOW! 0x%lx cycles!"
+			" cyc %lX rem %lX "
+			" next/now %lX/%lX\n",
+			cpu, now2 - now, cycles_elapsed, cycles_remainder,
+			next_tick, now );
+#endif
+
+	/* Can we differentiate between "early CR16" (aka Scenario 1) and
+	 * "long delay" (aka Scenario 3)? I don't think so.
+	 *
+	 * Timer_interrupt will be delivered at least a few hundred cycles
+	 * after the IT fires. But it's arbitrary how much time passes
+	 * before we call it "late". I've picked one second.
+	 *
+	 * It's important NO printk's are between reading CR16 and
+	 * setting up the next value. May introduce huge variance.
+	 */
+	if (unlikely(ticks_elapsed > HZ)) {
+		/* Scenario 3: very long delay?  bad in any case */
+		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
+			" cycles %lX rem %lX "
+			" next/now %lX/%lX\n",
+			cpu,
+			cycles_elapsed, cycles_remainder,
+			next_tick, now );
+	}
 
 	/* Done mucking with unreliable delivery of interrupts.
 	 * Go do system house keeping.
@@ -173,7 +191,7 @@ EXPORT_SYMBOL(profile_pc);
 
 /* clock source code */
 
-static cycle_t read_cr16(void)
+static cycle_t read_cr16(struct clocksource *cs)
 {
 	return get_cycles();
 }
diff --git a/arch/parisc/lib/checksum.c b/arch/parisc/lib/checksum.c
index 462696d..ae66d31 100644
--- a/arch/parisc/lib/checksum.c
+++ b/arch/parisc/lib/checksum.c
@@ -13,8 +13,6 @@
  *		modify it under the terms of the GNU General Public License
  *		as published by the Free Software Foundation; either version
  *		2 of the License, or (at your option) any later version.
- *
- * $Id: checksum.c,v 1.3 1997/12/01 17:57:34 ralf Exp $
  */
 #include <linux/module.h>
 #include <linux/types.h>
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index bbda909..abf41f4 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -405,7 +405,7 @@ byte_copy:
 
 unaligned_copy:
 	/* possibly we are aligned on a word, but not on a double... */
-	if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
+	if (likely((t1 & (sizeof(unsigned int)-1)) == 0)) {
 		t2 = src & (sizeof(unsigned int) - 1);
 
 		if (unlikely(t2 != 0)) {
diff --git a/arch/parisc/math-emu/decode_exc.c b/arch/parisc/math-emu/decode_exc.c
index 66c8a9f..3ca1c61 100644
--- a/arch/parisc/math-emu/decode_exc.c
+++ b/arch/parisc/math-emu/decode_exc.c
@@ -40,7 +40,7 @@
  * END_DESC
 */
 
-
+#include <linux/kernel.h>
 #include "float.h"
 #include "sgl_float.h"
 #include "dbl_float.h"
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 92c7fa4..d617e79 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -1,5 +1,4 @@
-/* $Id: fault.c,v 1.5 2000/01/26 16:20:29 jsm Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 4356ceb..b0831d9 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -370,34 +370,22 @@ static void __init setup_bootmem(void)
 
 void free_initmem(void)
 {
-	unsigned long addr, init_begin, init_end;
-
-	printk(KERN_INFO "Freeing unused kernel memory: ");
+	unsigned long addr;
+	unsigned long init_begin = (unsigned long)__init_begin;
+	unsigned long init_end = (unsigned long)__init_end;
 
 #ifdef CONFIG_DEBUG_KERNEL
 	/* Attempt to catch anyone trying to execute code here
 	 * by filling the page with BRK insns.
-	 * 
-	 * If we disable interrupts for all CPUs, then IPI stops working.
-	 * Kinda breaks the global cache flushing.
 	 */
-	local_irq_disable();
-
-	memset(__init_begin, 0x00,
-		(unsigned long)__init_end - (unsigned long)__init_begin);
-
-	flush_data_cache();
-	asm volatile("sync" : : );
-	flush_icache_range((unsigned long)__init_begin, (unsigned long)__init_end);
-	asm volatile("sync" : : );
-
-	local_irq_enable();
+	memset((void *)init_begin, 0x00, init_end - init_begin);
+	flush_icache_range(init_begin, init_end);
 #endif
 	
 	/* align __init_begin and __init_end to page size,
 	   ignoring linker script where we might have tried to save RAM */
-	init_begin = PAGE_ALIGN((unsigned long)(__init_begin));
-	init_end   = PAGE_ALIGN((unsigned long)(__init_end));
+	init_begin = PAGE_ALIGN(init_begin);
+	init_end = PAGE_ALIGN(init_end);
 	for (addr = init_begin; addr < init_end; addr += PAGE_SIZE) {
 		ClearPageReserved(virt_to_page(addr));
 		init_page_count(virt_to_page(addr));
@@ -409,7 +397,8 @@ void free_initmem(void)
 	/* set up a new led state on systems shipped LED State panel */
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BCOMPLETE);
 	
-	printk("%luk freed\n", (init_end - init_begin) >> 10);
+	printk(KERN_INFO "Freeing unused kernel memory: %luk freed\n",
+		(init_end - init_begin) >> 10);
 }
 
 
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 5d610cb..0f0e0b9 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1134,7 +1134,7 @@ static const struct file_operations ccio_proc_bitmap_fops = {
 	.llseek = seq_lseek,
 	.release = single_release,
 };
-#endif
+#endif /* CONFIG_PROC_FS */
 
 /**
  * ccio_find_ioc - Find the ioc in the ioc_list
@@ -1568,14 +1568,15 @@ static int __init ccio_probe(struct parisc_device *dev)
 	/* if this fails, no I/O cards will work, so may as well bug */
 	BUG_ON(dev->dev.platform_data == NULL);
 	HBA_DATA(dev->dev.platform_data)->iommu = ioc;
-	
+
+#ifdef CONFIG_PROC_FS
 	if (ioc_count == 0) {
 		proc_create(MODULE_NAME, 0, proc_runway_root,
 			    &ccio_proc_info_fops);
 		proc_create(MODULE_NAME"-bitmap", 0, proc_runway_root,
 			    &ccio_proc_bitmap_fops);
 	}
-
+#endif
 	ioc_count++;
 
 	parisc_has_iommu();
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 52ae0b1..c590974 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -353,7 +353,7 @@ static unsigned int dino_startup_irq(unsigned int irq)
 	return 0;
 }
 
-static struct hw_interrupt_type dino_interrupt_type = {
+static struct irq_chip dino_interrupt_type = {
 	.typename	= "GSC-PCI",
 	.startup	= dino_startup_irq,
 	.shutdown	= dino_disable_irq,
@@ -1019,22 +1019,22 @@ static int __init dino_probe(struct parisc_device *dev)
 	** It's not used to avoid chicken/egg problems
 	** with configuration accessor functions.
 	*/
-	bus = pci_scan_bus_parented(&dev->dev, dino_current_bus,
-				    &dino_cfg_ops, NULL);
+	dino_dev->hba.hba_bus = bus = pci_scan_bus_parented(&dev->dev,
+			 dino_current_bus, &dino_cfg_ops, NULL);
+
 	if(bus) {
-		pci_bus_add_devices(bus);
 		/* This code *depends* on scanning being single threaded
 		 * if it isn't, this global bus number count will fail
 		 */
 		dino_current_bus = bus->subordinate + 1;
 		pci_bus_assign_resources(bus);
+		pci_bus_add_devices(bus);
 	} else {
-		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n",
+		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (duplicate bus number %d?)\n",
 		       dev_name(&dev->dev), dino_current_bus);
 		/* increment the bus number in case of duplicates */
 		dino_current_bus++;
 	}
-	dino_dev->hba.hba_bus = bus;
 	return 0;
 }
 
diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index f415fdd..eb079d6 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -188,7 +188,7 @@ static unsigned int eisa_startup_irq(unsigned int irq)
 	return 0;
 }
 
-static struct hw_interrupt_type eisa_interrupt_type = {
+static struct irq_chip eisa_interrupt_type = {
 	.typename =	"EISA",
 	.startup =	eisa_startup_irq,
 	.shutdown =	eisa_disable_irq,
diff --git a/drivers/parisc/gsc.c b/drivers/parisc/gsc.c
index d336329..647adc9 100644
--- a/drivers/parisc/gsc.c
+++ b/drivers/parisc/gsc.c
@@ -148,7 +148,7 @@ static unsigned int gsc_asic_startup_irq(unsigned int irq)
 	return 0;
 }
 
-static struct hw_interrupt_type gsc_asic_interrupt_type = {
+static struct irq_chip gsc_asic_interrupt_type = {
 	.typename =	"GSC-ASIC",
 	.startup =	gsc_asic_startup_irq,
 	.shutdown =	gsc_asic_disable_irq,
@@ -158,7 +158,7 @@ static struct hw_interrupt_type gsc_asic_interrupt_type = {
 	.end =		no_end_irq,
 };
 
-int gsc_assign_irq(struct hw_interrupt_type *type, void *data)
+int gsc_assign_irq(struct irq_chip *type, void *data)
 {
 	static int irq = GSC_IRQ_BASE;
 	struct irq_desc *desc;
diff --git a/drivers/parisc/gsc.h b/drivers/parisc/gsc.h
index 762a1ba..b9d7bfb 100644
--- a/drivers/parisc/gsc.h
+++ b/drivers/parisc/gsc.h
@@ -38,7 +38,7 @@ struct gsc_asic {
 int gsc_common_setup(struct parisc_device *parent, struct gsc_asic *gsc_asic);
 int gsc_alloc_irq(struct gsc_irq *dev);			/* dev needs an irq */
 int gsc_claim_irq(struct gsc_irq *dev, int irq);	/* dev needs this irq */
-int gsc_assign_irq(struct hw_interrupt_type *type, void *data);
+int gsc_assign_irq(struct irq_chip *type, void *data);
 int gsc_find_local_irq(unsigned int irq, int *global_irq, int limit);
 void gsc_fixup_irqs(struct parisc_device *parent, void *ctrl,
 		void (*choose)(struct parisc_device *child, void *ctrl));
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 73348c4..230a5a4 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -727,7 +727,7 @@ static void iosapic_set_affinity_irq(unsigned int irq,
 }
 #endif
 
-static struct hw_interrupt_type iosapic_interrupt_type = {
+static struct irq_chip iosapic_interrupt_type = {
 	.typename =	"IO-SAPIC-level",
 	.startup =	iosapic_startup_irq,
 	.shutdown =	iosapic_disable_irq,
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 59fbbf1..1aebc1f 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -980,28 +980,38 @@ static void
 lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 {
 	unsigned long bytecnt;
-	pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;	/* PA_VIEW */
-	pdc_pat_cell_mod_maddr_block_t io_pdc_cell;	/* IO_VIEW */
 	long io_count;
 	long status;	/* PDC return status */
 	long pa_count;
+	pdc_pat_cell_mod_maddr_block_t *pa_pdc_cell;    /* PA_VIEW */
+	pdc_pat_cell_mod_maddr_block_t *io_pdc_cell;    /* IO_VIEW */
 	int i;
 
+	pa_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
+	if (!pa_pdc_cell)
+		return;
+
+	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
+	if (!pa_pdc_cell) {
+		kfree(pa_pdc_cell);
+		return;
+	}
+
 	/* return cell module (IO view) */
 	status = pdc_pat_cell_module(&bytecnt, pa_dev->pcell_loc, pa_dev->mod_index,
-				PA_VIEW, & pa_pdc_cell);
-	pa_count = pa_pdc_cell.mod[1];
+				PA_VIEW, pa_pdc_cell);
+	pa_count = pa_pdc_cell->mod[1];
 
 	status |= pdc_pat_cell_module(&bytecnt, pa_dev->pcell_loc, pa_dev->mod_index,
-				IO_VIEW, &io_pdc_cell);
-	io_count = io_pdc_cell.mod[1];
+				IO_VIEW, io_pdc_cell);
+	io_count = io_pdc_cell->mod[1];
 
 	/* We've already done this once for device discovery...*/
 	if (status != PDC_OK) {
 		panic("pdc_pat_cell_module() call failed for LBA!\n");
 	}
 
-	if (PAT_GET_ENTITY(pa_pdc_cell.mod_info) != PAT_ENTITY_LBA) {
+	if (PAT_GET_ENTITY(pa_pdc_cell->mod_info) != PAT_ENTITY_LBA) {
 		panic("pdc_pat_cell_module() entity returned != PAT_ENTITY_LBA!\n");
 	}
 
@@ -1016,8 +1026,8 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		} *p, *io;
 		struct resource *r;
 
-		p = (void *) &(pa_pdc_cell.mod[2+i*3]);
-		io = (void *) &(io_pdc_cell.mod[2+i*3]);
+		p = (void *) &(pa_pdc_cell->mod[2+i*3]);
+		io = (void *) &(io_pdc_cell->mod[2+i*3]);
 
 		/* Convert the PAT range data to PCI "struct resource" */
 		switch(p->type & 0xff) {
@@ -1096,6 +1106,9 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 			break;
 		}
 	}
+
+	kfree(pa_pdc_cell);
+	kfree(io_pdc_cell);
 }
 #else
 /* keep compiler from complaining about missing declarations */
@@ -1509,10 +1522,6 @@ lba_driver_probe(struct parisc_device *dev)
 	lba_bus = lba_dev->hba.hba_bus =
 		pci_scan_bus_parented(&dev->dev, lba_dev->hba.bus_num.start,
 				cfg_ops, NULL);
-	if (lba_bus) {
-		lba_next_bus = lba_bus->subordinate + 1;
-		pci_bus_add_devices(lba_bus);
-	}
 
 	/* This is in lieu of calling pci_assign_unassigned_resources() */
 	if (is_pdc_pat()) {
@@ -1533,7 +1542,6 @@ lba_driver_probe(struct parisc_device *dev)
 	}
 	pci_enable_bridges(lba_bus);
 
-
 	/*
 	** Once PCI register ops has walked the bus, access to config
 	** space is restricted. Avoids master aborts on config cycles.
@@ -1543,6 +1551,11 @@ lba_driver_probe(struct parisc_device *dev)
 		lba_dev->flags |= LBA_FLAG_SKIP_PROBE;
 	}
 
+	if (lba_bus) {
+		lba_next_bus = lba_bus->subordinate + 1;
+		pci_bus_add_devices(lba_bus);
+	}
+
 	/* Whew! Finally done! Tell services we got this one covered. */
 	return 0;
 }
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index e5999c4..4b62b89 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -2057,6 +2057,7 @@ void sba_directed_lmmio(struct parisc_device *pci_hba, struct resource *r)
 		r->start = (base & ~1UL) | PCI_F_EXTEND;
 		size = ~ READ_REG32(reg + LMMIO_DIRECT0_MASK);
 		r->end = r->start + size;
+		r->flags = IORESOURCE_MEM;
 	}
 }
 
@@ -2093,4 +2094,5 @@ void sba_distributed_lmmio(struct parisc_device *pci_hba, struct resource *r )
 	size = (~READ_REG32(sba->sba_hpa + LMMIO_DIST_MASK)) / ROPES_PER_IOC;
 	r->start += rope * (size + 1);	/* adjust base for this rope */
 	r->end = r->start + size;
+	r->flags = IORESOURCE_MEM;
 }
diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index 33e5ade..675f04e 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -325,7 +325,7 @@ static unsigned int superio_startup_irq(unsigned int irq)
 	return 0;
 }
 
-static struct hw_interrupt_type superio_interrupt_type = {
+static struct irq_chip superio_interrupt_type = {
 	.typename =	SUPERIO,
 	.startup =	superio_startup_irq,
 	.shutdown =	superio_disable_irq,
@@ -434,8 +434,8 @@ static void __init superio_parport_init(void)
 			0 /*base_hi*/,
 			PAR_IRQ, 
 			PARPORT_DMA_NONE /* dma */,
-			NULL /*struct pci_dev* */),
-			0 /* shared irq flags */ )
+			NULL /*struct pci_dev* */,
+			0 /* shared irq flags */))
 
 		printk(KERN_WARNING PFX "Probing parallel port failed.\n");
 #endif	/* CONFIG_PARPORT_PC */
diff --git a/drivers/scsi/zalon.c b/drivers/scsi/zalon.c
index 97f3158..27e84e4 100644
--- a/drivers/scsi/zalon.c
+++ b/drivers/scsi/zalon.c
@@ -134,7 +134,7 @@ zalon_probe(struct parisc_device *dev)
 
 	host = ncr_attach(&zalon7xx_template, unit, &device);
 	if (!host)
-		goto fail;
+		return -ENODEV;
 
 	if (request_irq(dev->irq, ncr53c8xx_intr, IRQF_SHARED, "zalon", host)) {
 	  dev_printk(KERN_ERR, &dev->dev, "irq problem with %d, detaching\n ",
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 0048f11..9eecbc0 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -616,6 +616,8 @@ config FB_STI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select STI_CONSOLE
+	select VT
 	default y
 	---help---
 	  STI refers to the HP "Standard Text Interface" which is a set of
