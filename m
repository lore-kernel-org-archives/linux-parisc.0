Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postfix2-2.free.fr (postfix2-2.free.fr [213.228.0.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19BF7482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 13:20:41 -0600 (MDT)
Message-ID: <004701c0ec62$4db91820$1d0fe4d5@fr>
From: =?iso-8859-1?Q?Cl=E9ment_MOYROUD?= <moyroudc@esiee.fr>
To: "Grant Grundler" <grundler@puffin.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <200106030721.BAA02755@puffin.external.hp.com>
Subject: Re: [parisc-linux] Patch for dino serial port on B-class workstations 
Date: Sun, 3 Jun 2001 21:20:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> Clement MOYROUD wrote:
> > Hi all !
> >
> > I have made a patch for dino. It's a bit ugly, but before going on with
> > a rewrite of the dino driver, I would like to have some feedback.
>
> Clement! This is great!
>
> Could you explain why you think yuo need to rewrite the dino driver?
> This is basically how I expected it to work.
>

I think (as well as the other members of the ESIEE team) that the dino
driver has not been written in order to "comply" with some sort of a GSC
driver standard - i.e. it could make use of the register_busdevice instead
of requiring it's own irq region (e.g. lasi). I have started to do this, but
it would require some modifications of the busdevice structure to add some
support for the pci-specific part of dino. With this modification of the
busdevice struct (and some other functions), I would be much more clean.....
But if you think it's clear enough, I've got other things to do :)

> >  So
> > feel free to apply it on your kernel tree and give me some remarks about
it.
>
> I've neither applied nor tested it.
>
> > diff -Nru linux.old/drivers/gsc/dino.c linux/drivers/gsc/dino.c
> > --- linux.old/drivers/gsc/dino.c Thu May 31 16:56:20 2001
> > +++ linux/drivers/gsc/dino.c Thu May 31 16:55:07 2001
> > @@ -66,6 +66,7 @@
> >  #include <asm/irq.h> /* for "gsc" irq functions */
> >  #include <asm/gsc.h>
> >
> > +#include "busdevice.h"
> >
> >  #undef DINO_DEBUG
> >
> > @@ -542,6 +543,14 @@
> >  }
> >  }
> >
> > +/* Here is where the dino's serial port gets its irq on B-class
workstations
> >    */
> > +
> > +static int
> > +dino_find_irq(struct busdevice *dino_dev, struct hp_device *dev)
> > +{
>
> Some upper portion of the address bits are already validated
> but the code in bus_device.c.  Need to valid some of the lower
> address bits here.
>
> Want to make sure it's really the serial device that we want
> to talk to and not the PS/2 port or "fire extinguisher" (only
> used on 743 or Hitachi box, I forgot).
>
>

As I wrote, it's something that works on a b132/180, and I didn't check in
the hardware database to see if it is in use in other workstations. But I
know I'll have to make some tests to find which irq return....

> > + return 10;
> > +}
> > +
> >  static void __init
> >  dino_bios_init(void)
> >  {
> > @@ -804,18 +813,33 @@
> >  }
> >
> >  static int __init
> > -dino_common_init(struct dino_device *dino_dev)
> > +dino_common_init(struct hp_device *d, struct dino_device *dino_dev)
> >  {
> >  int status;
> >  u32 eim;
> >  struct gsc_irq gsc_irq;
> >  struct resource *res;
> >
> > + struct busdevice *dino;
>
> Please call this dino_busdev or something like that to differentiate
> it from the other "dino" data structures.
>

I agree it might not be that clear. In fact, my future plans are to use only
one struct (bye-bye  struct dino_device !), and I didn't take care of the
clarity of this....

> > + int ret;
> > +
> >  pcibios_register_hba((struct pci_hba_data *) dino_dev);
> >
> >  pci_bios = &dino_bios_ops;   /* used by pci_scan_bus() */
> >  pci_port = &dino_port_ops;
> >
> > +
> > +        /* Needed for the serial port to work. Quite ugly for now */
> > +
> > + dino = kmalloc(sizeof(struct busdevice), GFP_KERNEL);
> > + if(!dino)
> > + return -ENOMEM;
> > +
> > + dino->name = "Dino";
> > + dino->hpa = d->hpa;
> > + dino->find_irq = dino_find_irq;
>
> I don't think this in an ugly hack.
> Overall, this is how I expected it to work.
> Might not even need to fill in the rest of the functions
> in the bus_device jump table.
>

As I wrote before, it looks ugly to me because I think the driver would look
much better if dino.c was rewritten. But again, if you don't feel like it
is, I won't complain !

> > +
> > +
> >  /*
> >  ** Note: SMP systems can make use of IRR1/IAR1 registers
> >  **   But it won't buy much performance except in very
>
> offhand, the rest looks ok.
>

ok

> grant
>

So, are you happy with the actual look of the driver or do you think it is
worth rewriting it ?

Clement MOYROUD
Puffin ESIEE Team
