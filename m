From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Tue, 8 Feb 2011 15:37:10 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102081536080.31804@localhost6.localdomain6>
References: <20110206204411.109238550@linutronix.de>  <1297094535.8577.3.camel@mulgrave.site>  <alpine.LFD.2.00.1102071744590.31804@localhost6.localdomain6>  <1297100168.8577.42.camel@mulgrave.site>  <alpine.LFD.2.00.1102071924150.31804@localhost6.localdomain6>
  <1297113986.8577.92.camel@mulgrave.site> <1297125136.8577.113.camel@mulgrave.site> <alpine.LFD.2.00.1102081518420.31804@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1102081518420.31804@localhost6.localdomain6>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 8 Feb 2011, Thomas Gleixner wrote:

> On Mon, 7 Feb 2011, James Bottomley wrote:
> 
> > On Mon, 2011-02-07 at 15:26 -0600, James Bottomley wrote:
> > > Unfortunately, it's panicing on boot in txn_alloc (that's a CPU
> > > interrupt allocation in the iosapic), so I'm going to debug further.
> > 
> > Following up with Thomas over IRC, the attached is the finally final
> > patch he came up with to fix the panic and sort out the compile issues.
> > I've verified this on an iosapic system (pa8800) and on dino/gsc (C360)
> > could someone try it on an astro system?
> > 
> > Thanks,
> > 
> > James
> > 
> > diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
> > index 9eea164..cb450e1 100644
> > --- a/arch/parisc/kernel/irq.c
> > +++ b/arch/parisc/kernel/irq.c
> > @@ -113,7 +113,7 @@ int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest)
> >  	int cpu_dest;
> >  
> >  	/* timer and ipi have to always be received on all CPUs */
> > -	if (CHECK_IRQ_PER_CPU(irq)) {
> > +	if (CHECK_IRQ_PER_CPU(irq_to_desc(d->irq)->status)) {
> 
> For extended fun I just noticed, that nothing ever sets IRQ_PER_CPU in
> desc->status for all of parisc.
> 
> This check (using irq) never evaluated to true due to:
> 
>    #define IRQ_PER_CPU         0x00010000      /* IRQ is per CPU */
> 
> I doubt that irq can be that large on parisc :)
> 
> The other place evaluates to false as well, because nothing ever sets
> the damn flag.
> 
> If you want to set it please use: set_irq_status_flags(irq, IRQ_PER_CPU);
> otherwise just kill that PER_CPU thingy :)

Gah. You set it indirect via IRQF_PERCPU with setup/request_irq.

Staring too long into that code makes my brain fuzzy.

Thanks,

	tglx
