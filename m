From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] PATCH 2.6.22-rc2 remove globab_ack_eiem
Date: Sun, 10 Jun 2007 16:31:41 -0600
Message-ID: <20070610223141.GA25432__47072.4618564875$1416624395$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
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


Kudos to Thibaut Varene for spotting the (mis)use of appropriately named 
gloabl_ack_eiem. This took a long time to figure out and both insight
>from myself, Kyle McMartin, and James Bottomley were required to narrow
down which bit of code could have this race condition.

The symptom was interrupts stopped getting delivered while some workload
was generating IO interrupts on two different CPUs. One of the interrupt
sources would get masked off and stay unmasked. Problem was global_ack_eiem
was accessed with read/modified/write sequence and not protected by
a spinlock.

PA-RISC doesn't need a global ack flag though. External Interrupts
are _always_ delivered to a single CPU (except for "global broadcast
interrupt" which AFAIK currently is not used.) So we don't have to worry
about any given IRQ vector getting delivered to more than one CPU.

Tested on a500 and rp34xx boxen. rsync to/from gsyprf11 (a500)
would lock up the box since NIC (tg3) interrupt and SCSI (sym2)
were on "opposite" CPUs (2 CPU system). Put them on the same CPU
or apply this patch and 10GB of data would rsync completely.

Please apply the following critical patch.
Can you let us know if this gets into 2.6.22 before final RC is cut?

thanks,
grant

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
Acked-by: Thibaut VARENE <T-Bone@parisc-linux.org>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index c5c9125..76ce5e3 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -46,14 +46,10 @@ extern irqreturn_t ipi_interrupt(int, void *);
 static volatile unsigned long cpu_eiem = 0;
 
 /*
-** ack bitmap ... habitually set to 1, but reset to zero
+** local ACK bitmap ... habitually set to 1, but reset to zero
 ** between ->ack() and ->end() of the interrupt to prevent
 ** re-interruption of a processing interrupt.
 */
-static volatile unsigned long global_ack_eiem = ~0UL;
-/*
-** Local bitmap, same as above but for per-cpu interrupts
-*/
 static DEFINE_PER_CPU(unsigned long, local_ack_eiem) = ~0UL;
 
 static void cpu_disable_irq(unsigned int irq)
@@ -94,13 +90,11 @@ void cpu_ack_irq(unsigned int irq)
 	int cpu = smp_processor_id();
 
 	/* Clear in EIEM so we can no longer process */
-	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status))
-		per_cpu(local_ack_eiem, cpu) &= ~mask;
-	else
-		global_ack_eiem &= ~mask;
+	per_cpu(local_ack_eiem, cpu) &= ~mask;
 
 	/* disable the interrupt */
-	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+	set_eiem(cpu_eiem & per_cpu(local_ack_eiem, cpu));
+
 	/* and now ack it */
 	mtctl(mask, 23);
 }
@@ -111,13 +105,10 @@ void cpu_end_irq(unsigned int irq)
 	int cpu = smp_processor_id();
 
 	/* set it in the eiems---it's no longer in process */
-	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status))
-		per_cpu(local_ack_eiem, cpu) |= mask;
-	else
-		global_ack_eiem |= mask;
+	per_cpu(local_ack_eiem, cpu) |= mask;
 
 	/* enable the interrupt */
-	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+	set_eiem(cpu_eiem & per_cpu(local_ack_eiem, cpu));
 }
 
 #ifdef CONFIG_SMP
@@ -354,8 +345,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	local_irq_disable();
 	irq_enter();
 
-	eirr_val = mfctl(23) & cpu_eiem & global_ack_eiem &
-		per_cpu(local_ack_eiem, cpu);
+	eirr_val = mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
 	if (!eirr_val)
 		goto set_out;
 	irq = eirr_to_irq(eirr_val);
@@ -381,7 +371,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	return;
 
  set_out:
-	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+	set_eiem(cpu_eiem & per_cpu(local_ack_eiem, cpu));
 	goto out;
 }
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
