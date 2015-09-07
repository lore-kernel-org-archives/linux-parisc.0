From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the parisc-hd tree with Linus' tree
Date: Tue, 8 Sep 2015 09:01:37 +1000
Message-ID: <20150908090137.1b93713a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jiang Liu <jiang.liu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
To: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

Today's linux-next merge of the parisc-hd tree got a conflict in:

  arch/parisc/kernel/irq.c

between commit:

  d2109a12198e ("parisc/irq: Use access helper irq_data_get_affinity_mask()")

from Linus' tree and commit:

  b15e2f939727 ("parisc: Filter out spurious interrupts in PA-RISC irq handler")

from the parisc-hd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/parisc/kernel/irq.c
index 413ec3c3f9cc,c0eab24f6a9e..000000000000
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@@ -507,8 -507,8 +507,8 @@@ void do_cpu_irq_mask(struct pt_regs *re
  	struct pt_regs *old_regs;
  	unsigned long eirr_val;
  	int irq, cpu = smp_processor_id();
- #ifdef CONFIG_SMP
 -	struct irq_desc *desc;
 +	struct irq_data *irq_data;
+ #ifdef CONFIG_SMP
  	cpumask_t dest;
  #endif
  
@@@ -521,10 -521,14 +521,14 @@@
  		goto set_out;
  	irq = eirr_to_irq(eirr_val);
  
- #ifdef CONFIG_SMP
 +	irq_data = irq_get_irq_data(irq);
+ 	/* Filter out spurious interrupts, mostly from serial port at bootup */
 -	desc = irq_to_desc(irq);
 -	if (unlikely(!desc->action))
++	if (unlikely(!irq_data))
+ 		goto set_out;
+ 
+ #ifdef CONFIG_SMP
 -	cpumask_copy(&dest, desc->irq_data.affinity);
 -	if (irqd_is_per_cpu(&desc->irq_data) &&
 +	cpumask_copy(&dest, irq_data_get_affinity_mask(irq_data));
 +	if (irqd_is_per_cpu(irq_data) &&
  	    !cpumask_test_cpu(smp_processor_id(), &dest)) {
  		int cpu = cpumask_first(&dest);
  
