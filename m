From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] Proposal for implementing IRQ affinity
Date: 30 Aug 2004 23:31:30 -0400
Message-ID: <1093923097.3870.18.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain
To: PARISC list <parisc-linux@lists.parisc-linux.org>
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

IRQ affinity really only applies to SMP systems.  However, this proposal
will alter the interrupt layout even on UP systems, so if you care about
that sort of thing, read on. 

Introduction 
============ 

External interrupts on parisc processors are triggered by writing to the
memory mapped control register EIRR (cr23).  Since the mapping of the
EIRR into memory is per processor, and usually programmed into external
devices, the upshot is that each external device usually sents an
interrupt to a specific processor.  The implementation of IRQ affinity
would allow us to redesignate a given interrupt to go to a different CPU
(this would mean, for instance, that we could run the user daemon
irqbalanced to balance out all our interrupts among all the processors).

This arrangement means that parisc has 32 distinct interrupts for a 32
bit kernel and 64 on a 64 bit kernel. 

There is, however, a bus based complication: not all parisc busses allow
an arbitrary device to send and interrupt to a CPU directly.  In
general, the older bus controllers: dino, cujo, etc cannot do this, with
the result that processing interrupts in these busses is two-phase. 
When a device interrupts, the irq is fielded by the dino controller,
which has an interrupt register to interrogate the dino specific lines
and see which actual device interrupted and execute the appropriate irq
handling routine.  The newer iosapic interrupt controllers don't require
this because every device attached to the iosapic can be programmed
directly with a CPU EIRR address and bit number. 

The current parisc scheme involves IRQ regions.  Each region is tied to
a particular EIRR bit (CPU irq number) and also contains all the
interrupt designations for the older bus multiplexing as components of
the irq_region.  This is ideal for the older busses, but a bit wasteful
in the iosapic which doesn't need the intermediate interruption
information. 

The new proposal is to sweep away irq regions completely and instead use
the generic struct hw_interrupt_type from linux/irq.h 

The way this would work is that we'd designate a new cpu_irq array
statically for 32 or 64 of these structures (one per bit in the EIRR). 

The iosapic would be allowed simply to allocate a free one of these
(according to the usual IRQ sharing rules) for any device that needed an
interrupt. 

An older bus would allocate a single one, but would then register a
separate vector of interrupts (also a vector of struct
hw_interrupt_type) along with a callback to select the correct vector
for subsequent execution. 

The hw_interrupt_type structure contains an affinity setting callback
(set_affinity) which can be used to adjust the affinity either
internally or via the /proc interface.  We would expose only the CPU
interrupts (first 32 or 64) as capable of having altered affinity (the
remaining older bus interrupts, being effectively slaved to the affinity
of the corresponding CPU interrupts would have a NULL set_affinity
callback). 

This scheme should move us entirely over to the use of generic interrupt
descriptors and allow the affinity setting of those interrupts which are
susceptible to it (namely only the directly accessible EIRR interrupts).
Any comments before I actually try this?

James 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
