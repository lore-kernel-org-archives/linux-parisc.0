From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Mon, 7 Feb 2011 19:28:01 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102071924150.31804@localhost6.localdomain6>
References: <20110206204411.109238550@linutronix.de>  <1297094535.8577.3.camel@mulgrave.site>  <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6> <1297100168.8577.42.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1297100168.8577.42.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 7 Feb 2011, James Bottomley wrote:
> On Mon, 2011-02-07 at 17:53 +0100, Thomas Gleixner wrote:
> > On Mon, 7 Feb 2011, James Bottomley wrote:
> > > I can't get the last patch to apply ... it looks like there are lots of
> > > other Kconfig changes besides the one liner it does; what's missing?
> > 
> > Tested it against -next as well, had to fix up crap there and sent out
> > that queue instead the one against linus.
> 
> Actually, you'll be pleased to hear this was entirely my fault:  The irq
> branch of the parisc tree wasn't where I thought it was (it was about a
> month behind.

:)
 
> There's some problem in arch/parisc/kernel.c it's giving me undefined
> references to irq (oh and some easily fixed compile issues).  I'll see
> if I can sort it out and get back to you.

That's a bug which is already in the current tree:

--- linux-next.orig/arch/parisc/kernel/irq.c
+++ linux-next/arch/parisc/kernel/irq.c
@@ -108,7 +108,7 @@ int cpu_check_affinity(unsigned int irq,
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
-	if (CHECK_IRQ_PER_CPU(irq)) {
+	if (CHECK_IRQ_PER_CPU(irq_to_desc(irq)->status)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it */
 		cpumask_setall(irq_desc[irq].affinity);

That's looking at the wrong thing.

So after the irq_chip conversion you need:

 -- linux-next.orig/arch/parisc/kernel/irq.c
+++ linux-next/arch/parisc/kernel/irq.c
@@ -113,7 +113,7 @@ int cpu_check_affinity(struct irq_data *
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
-	if (CHECK_IRQ_PER_CPU(irq_to_desc(irq))) {
+	if (CHECK_IRQ_PER_CPU(irq_to_desc(d->irq)->status)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it. Will fix - tglx
 		 */

> Well, I'd like to be happy ... but I guess after the git cockup I'll
> have to settle for dopey.

:)

Thanks,

	tglx
