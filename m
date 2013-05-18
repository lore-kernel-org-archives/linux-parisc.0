From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use arch_spinlock_t instead of raw_spinlock_t in
 irqstacks
Date: Sun, 19 May 2013 00:21:13 +0200
Message-ID: <20130518222113.GA4317@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We need to use arch_spinlock_t spinlocks instead of raw_spinlock_t
spinlocks for irqstack protection else we will hit the "trylock failure
on UP" error message with CONFIG_SMP=n and CONFIG_DEBUG_SPINLOCK=y.

Since we can be called recursive here even on UP (we are in the irq
handler which handles even irq bh) this spinlock error message is just
wrong.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index cfbc439..b2dca96 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -69,7 +69,7 @@
 
 union irq_stack_union {
 	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
-	raw_spinlock_t lock;
+	arch_spinlock_t lock;
 };
 
 DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 55237a7..9ba8e5a 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -443,14 +451,14 @@ panic_check:
 
 #ifdef CONFIG_IRQSTACKS
 DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
-		.lock = __RAW_SPIN_LOCK_UNLOCKED((irq_stack_union).lock)
+		.lock = __ARCH_SPIN_LOCK_UNLOCKED,
 	};
 
 static void execute_on_irq_stack(void *func, unsigned long param1)
 {
 	union irq_stack_union *union_ptr;
 	unsigned long irq_stack;
-	raw_spinlock_t *irq_stack_in_use;
+	arch_spinlock_t *irq_stack_in_use;
 
 	union_ptr = &per_cpu(irq_stack_union, smp_processor_id());
 	irq_stack = (unsigned long) &union_ptr->stack;
@@ -462,7 +470,7 @@ static void execute_on_irq_stack(void *func, unsigned long param1)
 	 * the irq stack usage.
 	 */
 	irq_stack_in_use = &union_ptr->lock;
-	if (!raw_spin_trylock(irq_stack_in_use)) {
+	if (!arch_spin_trylock(irq_stack_in_use)) {
 		void (*direct_call)(unsigned long p1) = func;
 
 		/* We are using the IRQ stack already.
@@ -477,7 +485,7 @@ static void execute_on_irq_stack(void *func, unsigned long param1)
 	__inc_irq_stat(irq_stack_counter);
 
 	/* free up irq stack usage. */
-	do_raw_spin_unlock(irq_stack_in_use);
+	arch_spin_unlock(irq_stack_in_use);
 }
 
 asmlinkage void do_softirq(void)
