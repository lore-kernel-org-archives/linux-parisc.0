Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA11565
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Oct 1999 19:17:32 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id VAA02428
	for <parisc-linux@thepuffingroup.com>; Sat, 16 Oct 1999 21:17:28 -0400 (EDT)
Message-Id: <199910170118.SAA25384@milano.cup.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Start sash ... 
In-reply-to: Your message of "Sat, 16 Oct 1999 22:12:53 PDT."
             <19991016221253.A1893@alpha.franken.de>
Date: Sat, 16 Oct 1999 18:17:59 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:
...
> Serial Interrupts are definitly not working. I'm now running the uart in 
> polling mode and I had to force use 16550A mode. Below is a patchset of my
> hacks.  You need a fixed posix_types.h and bitops.h, too. I haven't tested 
> the cvs version, yet.

...
> Index: drivers/gecko/lasi.c
> ===================================================================
> RCS file: /home/cvs/parisc/linux/drivers/gecko/lasi.c,v
> retrieving revision 1.13
> diff -u -r1.13 lasi.c
> --- drivers/gecko/lasi.c	1999/10/15 19:30:30	1.13
> +++ drivers/gecko/lasi.c	1999/10/16 20:06:44
> @@ -263,7 +263,9 @@
>          serial->type = PORT_UNKNOWN; // else: PORT_16550A;
>          serial->line = 0;
 	serial->port = ((unsigned int) d->hpa) + 0x800;
> -        serial->irq = 256 + 5;	// FIXME: lasi->region->data.irqbase + 
>   5
> +	serial->iomem_base = ((unsigned int) d->hpa) + 0x800;
> +        // serial->irq = 256 + 5;	// FIXME: lasi->region->data.irqbase + 
>   5
> +        serial->irq = 0;

The code here could use lasi_alloc_irq() to get the "right" irq number.
I added this to support lasi7xx.c (c710 SCSI macrocell Lasi).
I coded this function based on some research I did (ie not guaranteed
to be right). My conclusion was the lasi serial was on bit 26 (not 5).
I may have bits numbered from the wrong end. Either way, might be
easier to support in the long run if serial device setup used this
interface as well.

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
