Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51E6A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 15:27:25 -0600 (MDT)
Message-Id: <200106032119.PAA06092@puffin.external.hp.com>
To: =?iso-8859-1?Q?Cl=E9ment_MOYROUD?= <moyroudc@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Patch for dino serial port on B-class workstations 
In-Reply-To: Your message of "Sun, 03 Jun 2001 21:20:50 +0200."
             <004701c0ec62$4db91820$1d0fe4d5@fr>
Date: Sun, 03 Jun 2001 15:19:24 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Clement MOYROUD wrote:
...
> I think (as well as the other members of the ESIEE team) that the dino
> driver has not been written in order to "comply" with some sort of a GSC
> driver standard - i.e. it could make use of the register_busdevice instead
> of requiring it's own irq region (e.g. lasi).

You are right. IIRC, bus_devices didn't exist when I wrote the *second*
version of dino support. Technically, Alan Cox wrote the first one.

> I have started to do this, but
> it would require some modifications of the busdevice structure to add some
> support for the pci-specific part of dino. With this modification of the
> busdevice struct (and some other functions), I would be much more clean.....

hmmm...ok.

> But if you think it's clear enough, I've got other things to do :)

*I* think it's ok. more on this below.


...
> As I wrote, it's something that works on a b132/180, and I didn't check in
> the hardware database to see if it is in use in other workstations. But I
> know I'll have to make some tests to find which irq return....

No you won't. THe IRQ is hardwired in dino. It's in the ERS someplace.
You just need to verify the address for that device really
belongs to the RS232 port and isn't the PS/2 port.

...
> I agree it might not be that clear. In fact, my future plans are to use only
> one struct (bye-bye  struct dino_device !), and I didn't take care of the
> clarity of this....

ah ok. If dino_device is that similar to bus_device then the direction you
are taking makes sense.

...
> As I wrote before, it looks ugly to me because I think the driver would look
> much better if dino.c was rewritten. But again, if you don't feel like it
> is, I won't complain !

If you (or the team) feel strongly about rewriting dino, then I'd like
to encourage you to do it.  Just don't break what currently works.

...
> So, are you happy with the actual look of the driver or do you think it is
> worth rewriting it ?

PCI suport mostly works. That's what mattered to me before.
Rewriting dino.c to use bus_device instead of dino_device is probably
the "right thing" (tm) since some people will want PS/2 and RS232 to work.
I don't care to test/debug problems with dino code anymore though. I don't
mind helping someone do it.  In other words, whoever wants to rewrite dino.c
welcome to and I'll help some when needed.

> Clement MOYROUD
> Puffin ESIEE Team

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
