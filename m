From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 14:21:58 -0600
Message-ID: <20040831202158.GB24477@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<1093974552.3643.22.camel@mulgrave>
	<20040831183415.GG20353@colo.lackof.org>
	<1093981554.5296.14.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1093981554.5296.14.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 03:44:14PM -0400, James Bottomley wrote:
> On Tue, 2004-08-31 at 14:34, Grant Grundler wrote:
> > Ok. Why?
> 
> Because the only interrupts we can control the affinity of are the true
> 32/64 CPU interrupts. Everything else is effectively hanging off one of
> these.

Yes - agreed.

>  If we try to pretend that we can change the affinity of the
> subordinate interrupts, we'll end up confusing irqbalanced

We don't need to pretend anything.
irqbalance-0.9 looks for smp_affinity entry in /proc:

        for (i = 0; i < MAX_INTERRUPTS; i++) {
                /* shortcut: if old and new cpu are identical, don't do a thing
*/
                if (interrupts[i].oldcpu == interrupts[i].cpu)
                        continue;
                if (interrupts[i].type == IRQ_INACTIVE)
                        continue;
                snprintf(filename,255,"/proc/irq/%i/smp_affinity",i);
                file = fopen(filename, "w");
                if (file==NULL)
                        continue;
                if (interrupts[i].cpu < MAX_CPU)
                        fprintf(file,"%x",1<<interrupts[i].cpu);
                else
                        fprintf(file,"ffffffff");
                fclose(file);
        }

We can just not create smp_affinity entries for anything that doesn't
talk directly to a CPU.

On a related issue:
Can we represent per CPU EIRR switch tables with this scheme?
I know we can with existing IRQ regions.
I think not with the new scheme since only one global IRQ maps to
one EIRR bit on all CPUs.

I think we need to disassociate a global IRQ table from the CPU EIRR
switch tables. I'm ok with this for a future project but want to
sketch out what needs to change in order to make it happen.
I suspect this would be a cool project for ESIEE or someone
like that. :^)

> > I'd really like one method to convert GSI to local interrupt numbers.
> > Doing away with local translations and directly indexing into a global
> > array seems the most obvious to me.
> 
> I know, but our interrupt structure isn't a flat array, it's a tree with
> the root being a given CPU interrupt.  Obviously, since we have to give
> some cookie to the devices to identify the interrupt, we end up having a
> numeric array.

Yes. A numeric array isn't a flat array?
Global IRQ #s still makes the most sense to me.

I implemented the IRQ region support thinking the existing IRQ hierarchy
required a hierarchial data structure. But that was heavily influenced
by my previous experience with HPUX which does not use global IRQ numbers
to represent IRQ sources. The arch specific IRQ support really needs to
reflect whatever "core" identifier is used and today that is the global
IRQ number.

> > But we still want dino/PCI to work. So we have to replace the
> > existing abstraction with another one...
> 
> Yes, the abstraction for dino/PCI is that we allocate extra interrupts
> to the region, but they're unequivocally tied to the give CPU interrupt
> line the dino happens to be using.

Can you expand on how PCI IRQs will be generated/decoded?
or want to whack at an implementation first?

> > A single global array can implement a hierarchy as well.
> > Entries just contain indexes into other parts of the array.
> 
> Yes, but we need to expose only the cpu interrupts to irqbalanced.

No. We only need to expose smp_affinity "property".
I still want LASI/PCI IRQs to show up in /proc/interrupts statistics.
ie, they must have a globally assigned IRQ "cookie".

>   The
> problem is that for the purposes of affinity, we can't treat the
> fictitious subordinate interrupts as being ordinary independent
> interrupts.

We can. We just can't indicate they support SMP affinity.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
