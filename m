Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03762
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 13:13:49 -0700
Message-Id: <200012262018.MAA22169@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Tue, 26 Dec 2000 10:53:50 PST."
             <20001226105350.A29860@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 26 Dec 2000 12:18:08 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Mon, Dec 25, 2000 at 11:16:24PM -0800, Grant Grundler wrote:
> > INTERRUPT_PIN is zero for function 0 and 1. And according to PCI spec,
> > suckyio function 0 and 1 can't won't generate interrupts regardless
> > of what's in INTERRUPT_LINE.
> > I don't want to write/modify/support code that implies otherwise.
> 
> I thought it was understood that this device was not PCI-conforming?

Absolutely correct.

> That it did generate interrupts for functions 0 and 1.

Not directly. AFAICT, subdevices can only generate interrupts via 8259
which lives on function 1. And it looks like *none* of the functions
under suckyio implement INTERRUPT_PIN register. *sigh*

The INTERRUPT_LINE cfg register just happens to live under function 2
but could live in any of the three functions. Suckyio provides this
register merely as a convience to the BIOS/OS programmers.

> Could we nail
> down exactly _how_ this device generates interrupts for the serial & ide
> ports?
...

IRQs for all devices we care about are routed through the on-chip 8259's.
Master 8259 output is routed to INTERRUPT_LINE 0 of the parent IOSAPIC.
I can't tell if that's through CPUINT or INT[A-D] or what.

BTW, I suggest suckyio get it's own IRQ region to manage the 8259's.
Here are more notes:

 *      Most interrupt sources can be routed (or mapped) to interrupt pins on
 *      the 8259.  The available pins are (15-14, 12-9, 7-3, 1).  The following
 *      pins are dedicated.
 *
 *              Timer Out0        Channel 0
 *              8259 cascade      Channel 2
 *              Real-Time Clock   Channel 8
 *              Coprocessor Error Channel 13
 *
 *
 *      There are only 6 interrupt sources supported at this time.  These
 *      take up all the available interrupt sources on the master 8259.  The
 *      slave mode code has not been tested completely because we do not use
 *      it.  Note that the interrupt sources are given fixed interrupt routing.


FYI - The 8259 "fixed" routing used by HPUX is below.
Though I have the impression PNP code could be used to assign
IRQ lines if one doesn't want another LASI-like IRQ scheme.

   switch (obj->suio_device_id) {
      case SUPERIO_ID_UART1:
        obj->suio_irq = 3;
        break;

      case SUPERIO_ID_UART2:
        obj->suio_irq = 4;
        break;

      case SUPERIO_ID_FDC:
        obj->suio_irq = 6;
        break;

      case SUPERIO_ID_PARALLEL:
        obj->suio_irq = 5;
        break;

      case SUPERIO_ID_USB:
        obj->suio_irq = 1;
        break;

      case SUPERIO_ID_IDE:
        obj->suio_irq = 7;       /* XXX IDE has two channels? */
        break;

      default:
        VASSERT(0 == 1);
    }


> > We'll end duplicating much of what's in the generic PCI code basically.
> > You can understand why I might be less than enthusiastic about this idea.
> 
> Yes.  OK, better idea: we can do the quirk fixup in the PCI_FIXUP_FINAL
> pass instead of the PCI_FIXUP_HEADER pass.  This is called after the bus
> fixup code has set ->irq.  Of course, this might be completely the wrong
> thing to do... I really need to know the answer to the above question.

This does sound better given suckyio doesn't support INTERRUPT_PIN.

The fixup code could use Function 2 INTERRUPT_LINE to determine which
iosapic input line is being used (instead of assuming line 0). I'm thinking
we need to add another iosapic_fixup()-like interface so PCI quirks code
will correctly register suckyio's INTERRUPT_LINE. I'm trying to keep the
method iosapic virtualizes IRQs with private to iosapic.c.

thanks,
grant
