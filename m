Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B90EE49CE
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 08:28:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rKL9-0001EY-00; Wed, 10 Oct 2001 15:28:07 +0100
Date: Wed, 10 Oct 2001 15:28:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010134526.F11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010134526.F11105@linuxcare.com>; from rhirst@linuxcare.com on Wed, Oct 10, 2001 at 01:45:26PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 01:45:26PM +0100, Richard Hirst wrote:
> Looks reasonable to me, but doesn't make any difference so far as
> EISA 53c710 cards in my 715/75 are concerned.  There seem to be two
> basic problems...

OK.  I'll commit this basic support then since it works better than
the current support.

> Interrupts - I can see from the 53c710 registers that it is generating
> an interrupt, but it doesn't seem to be enabled through to the processor.
> I didn't know which irq to request, so I guessed it might be one of the
> ASP ones (which I think cover 64 to 95), and did a request_irq for all
> 32 of them.  Didn't help.

I haven't written that code yet.  Basically, I need to allocate a new IRQ
region for EISA interrupts, then on receipt of Asp irq 21 read the EISA
interrupt number from 0xfc01f000.  It seems there may be some extra gunk
needed to handle the TI chipset, but I'll have a go at getting interrupts
to work later today.

Alternatively, we could hack the 53c710 script to generate CPU interrupts
directly :-)  Let me just document how that would work (Grant, please
correct me if I misunderstood):

Instead of generating a PCI/EISA interrupt, generate a write of an
allocated value to the CPU's EIRR (External Interrupt register).
This way, the CPU jumps straight to the scsi chip's interrupt handler
rather than Asp's, which then has to decode which Asp IRQ it was;
then jump to the EISA interrupt handler, decode which EISA IRQ it was,
finally calling the scsi interrupt handler.

We might need to work out some other infrastructure to handle this,
but it's something we should look into at some point.  Clearly I need
to get EISA interrupts working anyway :-)

> Bus mastering - the 53c710 is attempting to fetch and execute scripts
> from memory, but from what I can tell, it is picking up invalid data.
> Basically the chips script pointer has moved on one instruction and it
> is trying to generate an Illegal Instruction Detected interrupt, and
> the dsps register, which I think is used in script fetching, contains
> 0xffffffff.

OK, I haven't figured out how to do this yet.  In order for a device on
the EISA bus to access host ram, I have to program the IO Map in the
adapter.  I'm not sure Linux has an interface I can slot into for this.
Maybe the pci_alloc interface is the right one...

> atm I am using eisa_in32() to check the card signature, but then
> using readb and friends on (EISA_BASE + port) to access the card.
> The driver only supports memory mapped chip access on parisc, and
> as it is using memory mapped access for the on-board 53c700, it
> makes sense to do that for EISA cards as well.  I identify the
> card from a 32 bit signature at base+0xc80, which is apparently
> correct on Compaq cards, at least - dunno if that is standard.
> I'm pretty confident that I am accessing the chips registers ok.
