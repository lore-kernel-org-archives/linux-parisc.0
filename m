From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 11:14:21 -0600
Message-ID: <20040831171421.GC20353@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1093923097.3870.18.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 30, 2004 at 11:31:30PM -0400, James Bottomley wrote:
> IRQ affinity really only applies to SMP systems.  However, this proposal
> will alter the interrupt layout even on UP systems, so if you care about
> that sort of thing, read on. 

*sigh*...that's me, written in big letters on my forehead. :^)

> External interrupts on parisc processors are triggered by writing to the
> memory mapped control register EIRR (cr23).

I don't think this is techinically accurate. The data value written to
the CPU's memory mapped register is transmitted across the bus as is.
This external facing register then converts the (5 or 6 bits for PARISC)
value to a bit mask before it reaches CR23 (EIRR).
IIRC, the PA2.0 I/O ACD defines how the CPU MMIO space is laid out.

> EIRR into memory is per processor, and usually programmed into external
> devices, the upshot is that each external device usually sents an
> interrupt to a specific processor.  The implementation of IRQ affinity
> would allow us to redesignate a given interrupt to go to a different CPU
> (this would mean, for instance, that we could run the user daemon
> irqbalanced to balance out all our interrupts among all the processors).

Thibaut and I started on this last year but didn't get to finish it.
The net result is we have to dump the struct irq_region everywhere 
and replace it with a global IRQ array.

> There is, however, a bus based complication: not all parisc busses allow
> an arbitrary device to send and interrupt to a CPU directly.  In
> general, the older bus controllers: dino, cujo, etc cannot do this,

AFAIK, this is only true for HP V-class.
And only because of some deficiency in the EPAC (CPU to X-bar chip?).
It's not true for every other parisc platform I'm aware of.

PCI and GSC devices can master their own Transaction Based Interrupt (TBI).
GSC device's EIM register are programmed directly with the target address
and vector. PCI devices can master their own TBI if they can be told
which address/data pair to use. E.g. clever scripting for NCR/SYM
scsi chips would allow this and in fact HPUX 10.x c720 SCSI driver does.
Otherwise PCI 2.2 (and later) devices can use MSI or MSI-X to
the same effect. We just need to write the support glue
to make it work for parisc.

>  with
> the result that processing interrupts in these busses is two-phase. 
> When a device interrupts, the irq is fielded by the dino controller,
> which has an interrupt register to interrogate the dino specific lines
> and see which actual device interrupted and execute the appropriate irq
> handling routine. The newer iosapic interrupt controllers don't require
> this because every device attached to the iosapic can be programmed
> directly with a CPU EIRR address and bit number. 

Only one nit: s/every device/every IRQ line/

In all cases, the interrupt controller is a surrogate which converts
the line based interrupt into a TBI.

> The current parisc scheme involves IRQ regions.  Each region is tied to
> a particular EIRR bit (CPU irq number)

Not exactly. An IRQ region groups a bunch of IRQ sources which are managed
by one instance of the interrupt controller driver.

Simple examples to look are the CPU, dino, or lasi IRQ support.
In those cases, a single register maps bits to "downstream" interrupt
sources. We read the register and call the Interrupt Service Routines (ISR)
which correspond to specific bits.

SAPIC is a more complicated since it involves multiple parents.
But the same idea applies: each interrupt source was one entry
in the "region". 

> and also contains all the
> interrupt designations for the older bus multiplexing as components of
> the irq_region.  This is ideal for the older busses, but a bit wasteful
> in the iosapic which doesn't need the intermediate interruption
> information. 

Well, as long as the IRQ line isn't shared, that's true...

> The new proposal is to sweep away irq regions completely and instead use
> the generic struct hw_interrupt_type from linux/irq.h 
>
> The way this would work is that we'd designate a new cpu_irq array
> statically for 32 or 64 of these structures (one per bit in the EIRR). 
> 
> The iosapic would be allowed simply to allocate a free one of these
> (according to the usual IRQ sharing rules) for any device that needed an
> interrupt. 
> 
> An older bus would allocate a single one, but would then register a
> separate vector of interrupts (also a vector of struct
> hw_interrupt_type) along with a callback to select the correct vector
> for subsequent execution. 

I'd rather see one global array (at least 256 entries) with the CPU
(and similar devices) getting a fixed number of consecutive entries.
We should probably reserve the first 16 entries for EISA/ISA support
like we did before.

> The hw_interrupt_type structure contains an affinity setting callback
> (set_affinity) which can be used to adjust the affinity either
> internally or via the /proc interface.  We would expose only the CPU
> interrupts (first 32 or 64) as capable of having altered affinity (the
> remaining older bus interrupts, being effectively slaved to the affinity
> of the corresponding CPU interrupts would have a NULL set_affinity
> callback). 

Sounds good. That will work.

> This scheme should move us entirely over to the use of generic interrupt
> descriptors and allow the affinity setting of those interrupts which are
> susceptible to it (namely only the directly accessible EIRR interrupts).
> Any comments before I actually try this?

It's alot of work. I think that's why thibaut and I ran out of steam
before we finished it. I expect much of the work we did before would
still apply.

Thibaut, you still have a diff or source laying around from that effort?
I might but can't find it right now.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
