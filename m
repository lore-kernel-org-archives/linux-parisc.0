From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add kernel stack overflow check
Date: Tue, 7 May 2013 21:28:52 +0200
Message-ID: <20130507192852.GA20482@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add the CONFIG_DEBUG_STACKOVERFLOW config option to enable checks to
detect kernel stack overflows.

Stack overflows can not be detected reliable since we do not want to
introduce too much overhead.

Instead, during irq processing in do_cpu_irq_mask() we check kernel
stack usage of the interrupted kernel process. Kernel threads can be
easily detected by checking the value of space register 7 (sr7) which
is zero when running inside the kernel.

Since THREAD_SIZE is 16k and PAGE_SIZE is 4k, reduce the alignment of
the init thread to the lower value (PAGE_SIZE) in the kernel
vmlinux.ld.S linker script.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index bc989e5..fa6c322 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -13,3 +13,15 @@ config DEBUG_RODATA
          If in doubt, say "N".
 
 endmenu
+
+config DEBUG_STACKOVERFLOW
+	bool "Check for stack overflows"
+	default y
+	depends on DEBUG_KERNEL
+	---help---
+	  Say Y here if you want to check the overflows of kernel, IRQ
+	  and exception stacks. This option will cause messages of the
+	  stacks in detail when free stack space drops below a certain
+	  limit.
+	  If in doubt, say "N".
+
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index 6182832..540c88f 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -40,7 +40,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_SIZE_ORDER            2
+#define THREAD_SIZE_ORDER	2 /* PA-RISC requires at least 16k stack */
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 8094d3e..61e51ac 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -330,6 +330,34 @@ static inline int eirr_to_irq(unsigned long eirr)
 	return (BITS_PER_LONG - bit) + TIMER_IRQ;
 }
 
+int sysctl_panic_on_stackoverflow = 1;
+
+static inline void stack_overflow_check(struct pt_regs *regs)
+{
+#ifdef CONFIG_DEBUG_STACKOVERFLOW
+	#define STACK_MARGIN	(256*6)
+
+	/* Our stack starts directly behind the thread_info struct. */
+	unsigned long stack_start = (unsigned long) current_thread_info();
+	unsigned long sp = regs->gr[30];
+
+	/* if sr7 != 0, we interrupted a userspace process which we do not want
+	 * to check for stack overflow. We will only check the kernel stack. */
+	if (regs->sr[7])
+		return;
+
+	if (likely((sp - stack_start) < (THREAD_SIZE - STACK_MARGIN)))
+		return;
+
+	pr_emerg("stackcheck: %s will most likely overflow kernel stack "
+		 "(sp:%lx, stk bottom-top:%lx-%lx)\n",
+		current->comm, sp, stack_start, stack_start + THREAD_SIZE);
+
+	if (sysctl_panic_on_stackoverflow)
+		panic("low stack detected by irq handler - check messages\n");
+#endif
+}
+
 /* ONLY called from entry.S:intr_extint() */
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
@@ -364,6 +392,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 		goto set_out;
 	}
 #endif
+	stack_overflow_check(regs);
 	generic_handle_irq(irq);
 
  out:
@@ -420,6 +449,4 @@ void __init init_IRQ(void)
 	cpu_eiem = EIEM_MASK(TIMER_IRQ);
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
-
 }
