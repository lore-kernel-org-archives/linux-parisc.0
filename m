From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH] Remove spinlock_t from cpu_data (and thus
	from processor.h)
Date: Sat, 25 Nov 2006 11:53:44 -0500
Message-ID: <20061125165344.GA29949@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This should enable us to clean up our header files nicely.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index fb81e56..0af1fad 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -153,8 +153,6 @@ #endif
 	p->cpuid = cpuid;	/* save CPU id */
 	p->txn_addr = txn_addr;	/* save CPU IRQ address */
 #ifdef CONFIG_SMP
-	spin_lock_init(&p->lock);
-
 	/*
 	** FIXME: review if any other initialization is clobbered
 	**	for boot_cpu by the above memset().
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 4a23a97..5301600 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -76,6 +76,9 @@ cpumask_t cpu_possible_map __read_mostly
 EXPORT_SYMBOL(cpu_online_map);
 EXPORT_SYMBOL(cpu_possible_map);
 
+spinlock_t fencepost[NR_CPUS] = {
+	[0 ... NR_CPUS-1] = SPIN_LOCK_UNLOCKED
+};
 
 struct smp_call_struct {
 	void (*func) (void *info);
@@ -167,10 +170,11 @@ ipi_interrupt(int irq, void *dev_id) 
 	mb();	/* Order interrupt and bit testing. */
 
 	for (;;) {
-		spin_lock_irqsave(&(p->lock),flags);
+		spinlock_t *lock = &fencepost[this_cpu];
+		spin_lock_irqsave(lock, flags);
 		ops = p->pending_ipi;
 		p->pending_ipi = 0;
-		spin_unlock_irqrestore(&(p->lock),flags);
+		spin_unlock_irqrestore(lock, flags);
 
 		mb(); /* Order bit clearing and data access. */
 
@@ -275,12 +279,13 @@ static inline void
 ipi_send(int cpu, enum ipi_message_type op)
 {
 	struct cpuinfo_parisc *p = &cpu_data[cpu];
+	spinlock_t *lock = &fencepost[cpu];
 	unsigned long flags;
 
-	spin_lock_irqsave(&(p->lock),flags);
+	spin_lock_irqsave(lock, flags);
 	p->pending_ipi |= 1 << op;
 	gsc_writel(IPI_IRQ - CPU_IRQ_BASE, cpu_data[cpu].hpa);
-	spin_unlock_irqrestore(&(p->lock),flags);
+	spin_unlock_irqrestore(lock, flags);
 }
 
 
diff --git a/include/asm-parisc/processor.h b/include/asm-parisc/processor.h
index fd7866d..435afe5 100644
--- a/include/asm-parisc/processor.h
+++ b/include/asm-parisc/processor.h
@@ -87,7 +87,6 @@ struct cpuinfo_parisc {
 	unsigned long hpa;          /* Host Physical address */
 	unsigned long txn_addr;     /* MMIO addr of EIR or id_eid */
 #ifdef CONFIG_SMP
-	spinlock_t lock;            /* synchronization for ipi's */
 	unsigned long pending_ipi;  /* bitmap of type ipi_message_type */
 	unsigned long ipi_count;    /* number ipi Interrupts */
 #endif
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
