From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: 31 Aug 2004 13:49:07 -0400
Message-ID: <1093974552.3643.22.camel@mulgrave>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831171421.GC20353@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-08-31 at 13:14, Grant Grundler wrote:
> I don't think this is techinically accurate. The data value written to
> the CPU's memory mapped register is transmitted across the bus as is.
> This external facing register then converts the (5 or 6 bits for PARISC)
> value to a bit mask before it reaches CR23 (EIRR).
> IIRC, the PA2.0 I/O ACD defines how the CPU MMIO space is laid out.

Yes, already apologised to Bjorn for that one.

> Thibaut and I started on this last year but didn't get to finish it.
> The net result is we have to dump the struct irq_region everywhere 
> and replace it with a global IRQ array.

Yes, I looked at your code.  what I'd like to do is slightly different
because I would have a static array of the actual CPU interrupts.

> > There is, however, a bus based complication: not all parisc busses allow
> > an arbitrary device to send and interrupt to a CPU directly.  In
> > general, the older bus controllers: dino, cujo, etc cannot do this,
> 
> AFAIK, this is only true for HP V-class.
> And only because of some deficiency in the EPAC (CPU to X-bar chip?).
> It's not true for every other parisc platform I'm aware of.

Actually, I meant the way the dino works: My dino device interrupts, the
dino hits the cpu interrupt, but the interrupt has to be routed back
into generic dino code to find out who actually interrupted and then
call their interrupt routine.

> PCI and GSC devices can master their own Transaction Based Interrupt (TBI).
> GSC device's EIM register are programmed directly with the target address
> and vector. PCI devices can master their own TBI if they can be told
> which address/data pair to use. E.g. clever scripting for NCR/SYM
> scsi chips would allow this and in fact HPUX 10.x c720 SCSI driver does.
> Otherwise PCI 2.2 (and later) devices can use MSI or MSI-X to
> the same effect. We just need to write the support glue
> to make it work for parisc.

Yes, I was basing the above on how we currently work rather than how we
could work.

> >  with
> > the result that processing interrupts in these busses is two-phase. 
> > When a device interrupts, the irq is fielded by the dino controller,
> > which has an interrupt register to interrogate the dino specific lines
> > and see which actual device interrupted and execute the appropriate irq
> > handling routine. The newer iosapic interrupt controllers don't require
> > this because every device attached to the iosapic can be programmed
> > directly with a CPU EIRR address and bit number. 
> 
> Only one nit: s/every device/every IRQ line/
> 
> In all cases, the interrupt controller is a surrogate which converts
> the line based interrupt into a TBI.
> 
> > The current parisc scheme involves IRQ regions.  Each region is tied to
> > a particular EIRR bit (CPU irq number)
> 
> Not exactly. An IRQ region groups a bunch of IRQ sources which are managed
> by one instance of the interrupt controller driver.
> 
> Simple examples to look are the CPU, dino, or lasi IRQ support.
> In those cases, a single register maps bits to "downstream" interrupt
> sources. We read the register and call the Interrupt Service Routines (ISR)
> which correspond to specific bits.
> 
> SAPIC is a more complicated since it involves multiple parents.
> But the same idea applies: each interrupt source was one entry
> in the "region". 

Yes, I was oversimplifying.  Basically the abstraction is unnecessary
for the SAPIC, which is why it looks slightly odd there.

> I'd rather see one global array (at least 256 entries) with the CPU
> (and similar devices) getting a fixed number of consecutive entries.
> We should probably reserve the first 16 entries for EISA/ISA support
> like we did before.

Well, I'd really rather see an IRQ hierarchy.  Currently our irq list is
a total fiction ... if we display what we actually have (namely the 32
or 64 interrupt lines with everything else hanging off them) it's more
intuitively obvious what's going on.

> It's alot of work. I think that's why thibaut and I ran out of steam
> before we finished it. I expect much of the work we did before would
> still apply.
> 
> Thibaut, you still have a diff or source laying around from that effort?
> I might but can't find it right now.

Well, moving to a single 32/64 global array and treating the older
busses as special cases hopefully simplifies this ... I 'll see though
as I get into it.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
