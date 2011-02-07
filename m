From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Mon, 07 Feb 2011 15:26:26 -0600
Message-ID: <1297113986.8577.92.camel@mulgrave.site>
References: <20110206204411.109238550@linutronix.de>
	 <1297094535.8577.3.camel@mulgrave.site>
	 <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6>
	 <1297100168.8577.42.camel@mulgrave.site>
	 <alpine.LFD.2.00.1102071924150.31804@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1102071924150.31804@localhost6.localdomain6>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2011-02-07 at 19:28 +0100, Thomas Gleixner wrote:
> On Mon, 7 Feb 2011, James Bottomley wrote:
>  
> > There's some problem in arch/parisc/kernel.c it's giving me undefined
> > references to irq (oh and some easily fixed compile issues).  I'll see
> > if I can sort it out and get back to you.
> 
> That's a bug which is already in the current tree:

[...]

Actually, it's more than this.  Just to get it to compile, I needed the
patch below (I folded in your fix for our longstanding affinity bug).

Unfortunately, it's panicing on boot in txn_alloc (that's a CPU
interrupt allocation in the iosapic), so I'm going to debug further.

James

---

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 9eea164..f2e7154 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -113,7 +113,7 @@ int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest)
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
-	if (CHECK_IRQ_PER_CPU(irq)) {
+	if (CHECK_IRQ_PER_CPU(irq_to_desc(d->irq)->status)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it. Will fix - tglx
 		 */
@@ -128,11 +128,11 @@ int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest)
 }
 
 static int cpu_set_affinity_irq(struct irq_data *d, const struct cpumask *dest,
-				bool force))
+				bool force)
 {
 	int cpu_dest;
 
-	cpu_dest = cpu_check_affinity(d->irq, dest);
+	cpu_dest = cpu_check_affinity(d, dest);
 	if (cpu_dest < 0)
 		return -1;
 
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index a015c12..95930d0 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -693,7 +693,7 @@ static int iosapic_set_affinity_irq(struct irq_data *d,
 		return -1;
 
 	cpumask_copy(d->affinity, cpumask_of(dest_cpu));
-	vi->txn_addr = txn_affinity_addr(irq, dest_cpu);
+	vi->txn_addr = txn_affinity_addr(d->irq, dest_cpu);
 
 	spin_lock_irqsave(&iosapic_lock, flags);
 	/* d1 contains the destination CPU, so only want to set that


