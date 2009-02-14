From: Kyle McMartin <kyle@infradead.org>
Subject: [PATCH] parisc: fixup cpu_check_affinity for const cpumask *dest
Date: Sat, 14 Feb 2009 03:22:19 -0500
Message-ID: <20090214082219.GA17304@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler@parisc-linux.org, rusty@rustcorp.com.au
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Noticed a new build warning... poking at it a bit, and lo' and behold
it was a patch that never hit the list or my email...

Anyway, this preserves the intent of the original code, which was for
the first cpu set in the mask to be saved in *dest, so it could be
used to program the IRT entry.

Personally, I find the idea of changing irq_desc directly in the iosapic
code fairly distasteful, but there's not really a choice.

diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 399c819..dfa26b6 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -49,7 +49,7 @@ extern unsigned long txn_alloc_addr(unsigned int);
 extern unsigned long txn_affinity_addr(unsigned int irq, int cpu);
 
 extern int cpu_claim_irq(unsigned int irq, struct irq_chip *, void *);
-extern int cpu_check_affinity(unsigned int irq, cpumask_t *dest);
+extern int cpu_check_affinity(unsigned int irq, const struct cpumask *dest);
 
 /* soft power switch support (power.c) */
 extern struct tasklet_struct power_tasklet;
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index ac2c822..0454080 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -112,7 +112,7 @@ void cpu_end_irq(unsigned int irq)
 }
 
 #ifdef CONFIG_SMP
-int cpu_check_affinity(unsigned int irq, cpumask_t *dest)
+int cpu_check_affinity(unsigned int irq, const struct cpumask *dest)
 {
 	int cpu_dest;
 
@@ -126,17 +126,19 @@ int cpu_check_affinity(unsigned int irq, cpumask_t *dest)
 
 	/* whatever mask they set, we just allow one CPU */
 	cpu_dest = first_cpu(*dest);
-	*dest = cpumask_of_cpu(cpu_dest);
 
-	return 0;
+	return cpu_dest;
 }
 
 static void cpu_set_affinity_irq(unsigned int irq, const struct cpumask *dest)
 {
-	if (cpu_check_affinity(irq, dest))
+	int cpu_dest;
+
+	cpu_dest = cpu_check_affinity(irq, dest);
+	if (cpu_dest < 0)
 		return;
 
-	irq_desc[irq].affinity = *dest;
+	irq_desc[irq].affinity = cpumask_of_cpu(cpu_dest);
 }
 #endif
 
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 1cdfdea..501aaf1 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -708,11 +708,14 @@ static void iosapic_set_affinity_irq(unsigned int irq,
 	struct vector_info *vi = iosapic_get_vector(irq);
 	u32 d0, d1, dummy_d0;
 	unsigned long flags;
+	int dest_cpu;
 
-	if (cpu_check_affinity(irq, dest))
+	dest_cpu = cpu_check_affinity(irq, dest);
+	if (dest_cpu < 0)
 		return;
 
-	vi->txn_addr = txn_affinity_addr(irq, cpumask_first(dest));
+	irq_desc[irq].affinity = cpumask_of_cpu(dest_cpu);
+	vi->txn_addr = txn_affinity_addr(irq, dest_cpu);
 
 	spin_lock_irqsave(&iosapic_lock, flags);
 	/* d1 contains the destination CPU, so only want to set that
