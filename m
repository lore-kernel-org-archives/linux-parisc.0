From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 12:34:15 -0600
Message-ID: <20040831183415.GG20353@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<1093974552.3643.22.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1093974552.3643.22.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 01:49:07PM -0400, James Bottomley wrote:
> > Thibaut and I started on this last year but didn't get to finish it.
> > The net result is we have to dump the struct irq_region everywhere 
> > and replace it with a global IRQ array.
> 
> Yes, I looked at your code.

Ah good.

> what I'd like to do is slightly different
> because I would have a static array of the actual CPU interrupts.

Ok. Why?
I'd really like one method to convert GSI to local interrupt numbers.
Doing away with local translations and directly indexing into a global
array seems the most obvious to me.

> > AFAIK, this is only true for HP V-class.
> > And only because of some deficiency in the EPAC (CPU to X-bar chip?).
> > It's not true for every other parisc platform I'm aware of.
> 
> Actually, I meant the way the dino works: My dino device interrupts, the
> dino hits the cpu interrupt, but the interrupt has to be routed back
> into generic dino code to find out who actually interrupted and then
> call their interrupt routine.

Yes , that's correct. Sorry, I wasn't clear. I was quibbling over this bit:
| not all parisc busses allow
| an arbitrary device to send and interrupt to a CPU directly.

The "AFAIK" comment I wrote above really only applies to this statment.
MSI capable PCI devices can master it's own interrupt transaction
below dino.  That does not mean *every* PCI is MSI capable.
In contrast, every GSC device *must* master it's TBI.
And LASI sub devices are neither.

Does that make more sense?

> > SAPIC is a more complicated since it involves multiple parents.
> > But the same idea applies: each interrupt source was one entry
> > in the "region". 
> 
> Yes, I was oversimplifying.  Basically the abstraction is unnecessary
> for the SAPIC, which is why it looks slightly odd there.

But we still want dino/PCI to work. So we have to replace the
existing abstraction with another one...

> 
> > I'd rather see one global array (at least 256 entries) with the CPU
> > (and similar devices) getting a fixed number of consecutive entries.
> > We should probably reserve the first 16 entries for EISA/ISA support
> > like we did before.
> 
> Well, I'd really rather see an IRQ hierarchy.

A single global array can implement a hierarchy as well.
Entries just contain indexes into other parts of the array.

>   Currently our irq list is
> a total fiction ... if we display what we actually have (namely the 32
> or 64 interrupt lines with everything else hanging off them) it's more
> intuitively obvious what's going on.

*nod*

> > It's alot of work. I think that's why thibaut and I ran out of steam
> > before we finished it. I expect much of the work we did before would
> > still apply.
> > 
> > Thibaut, you still have a diff or source laying around from that effort?
> > I might but can't find it right now.
> 
> Well, moving to a single 32/64 global array and treating the older
> busses as special cases hopefully simplifies this ... I 'll see though
> as I get into it.

Ok. Pushing everything into a global array would make the /proc/irq support
alot easier IMHO.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
