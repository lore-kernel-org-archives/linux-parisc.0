Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CAE7482A
	for <parisc-linux@parisc-linux.org>; Mon,  3 Sep 2001 00:41:59 -0600 (MDT)
Message-Id: <200109030639.AAA10825@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Port space on Elroy 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 01 Sep 2001 08:21:00 BST." <20010901082100.J5126@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 03 Sep 2001 00:39:06 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> I just took a look at /proc/ioports on my j7k (running 2.4.9-pa1) and
> I'm a little confused by what I see:
> 
> willy@jagu:~$ cat /proc/ioports 
> 00000000-00001ffe : LBA PCI I/O Ports
>   00000020-0000003e : pic1
>   000000a0-000000be : pic2
>   000002f8-000002ff : serial(auto)
>   00000378-0000037a : parport0
>   000003f8-000003ff : serial(auto)
>   00000800-000008ff : sym53c8xx
>   00001000-0000107f : tulip

All the built-ins. so far so good.

> 00004000-00004007 : serial(auto)
> 00004100-00004107 : serial(auto)
> 00004200-00004207 : serial(auto)
> 00004300-00004307 : serial(auto)

These are most likely under HBA 2 and they are being registered
w/o using the virtualized IO port space address.

> 00012000-00013ffe : LBA PCI I/O Ports
> 00024000-00025ffe : LBA PCI I/O Ports
> 00038000-00039ffe : LBA PCI I/O Ports
> 0004c000-0004dffe : LBA PCI I/O Ports

These are "virtualized" I/O port space addresses.

> (the only pci card i have in there is a quad-serial card).
> 
> First, why do all the ioport ranges go to ffe?  Surely it should be fff?

Yes.

> If so, we should make this change:
> 
> @@ -1189,8 +1193,7 @@ lba_legacy_resources(struct parisc_devic
>         r->name  = "LBA PCI I/O Ports";
>         r->flags = IORESOURCE_IO;
>         r->start = READ_REG32(pa_dev->hpa + LBA_IOS_BASE) & ~1L;
> -       r->end   = r->start +
> -           (READ_REG32(pa_dev->hpa + LBA_IOS_MASK) ^ (HBA_PORT_SPACE_SIZE - 
>   1)) - 1;
> +       r->end   = r->start + (READ_REG32(pa_dev->hpa + LBA_IOS_MASK) ^ (HBA_
>   PORT_SPACE_SIZE - 1));
>  
>         /* Virtualize the I/O Port space ranges */
>         lba_num = HBA_PORT_BASE(lba_dev->hba.hba_num);

Urgh. please commit.

> And then, what are the four serial entries doing off by themselves?
> Surely these should be underneath one of the elroys?  /proc/pci says
> they're on bus2, so I guess they should be under the 00024000-00025ffe
> range (25fff?  :-).

Yes - as noted above.

>   I think the problem is that the start/end pair
> aren't getting updated in the bus fixup.  In which case, the patch looks
> like this:
> 
> @@ -707,6 +707,7 @@ lba_fixup_bus(struct pci_bus *bus)
>         u16 status;
>  #endif
>         struct lba_device *ldev = LBA_DEV(bus->sysdata);
> +       int lba_portbase = HBA_PORT_BASE(ldev->hba.hba_num);
>  #ifdef __LP64__
>         int i;
>  #endif
> @@ -805,6 +806,9 @@ lba_fixup_bus(struct pci_bus *bus)
>                                 /* "Globalize" PCI address */
>                                 res->start |= ldev->lmmio_base;
>                                 res->end   |= ldev->lmmio_base;
> +                       } else if (res->flags & IORESOURCE_IO) {
> +                               res->start |= lba_portbase;
> +                               res->end   |= lba_portbase;
>                         }
>                 }
>  #endif

I'm wondering how this worked before....
peer-to-peer from elroy 0 to elroy 2?
(ie we are poking elroy 0 to generate the IO cycle and elroy 2 is
picking it up somehow and passin it down it's bus.)

ah..willy just pointed out I used LBA_ASTRO_PORT_BASE (non-postable
IO port space in LMMIO) and that's routed by Astro to the right Elroy.

> comments, please.

I think this change is safe to commit too.
On PAT PDC boxes it will be redundant but harmless.

Trying A500 w/4-port serial card w/ and w/o this change
would be prudent and interesting respectively.

thanks willy!
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
