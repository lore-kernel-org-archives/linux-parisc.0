Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85F734837
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 11:31:55 -0600 (MDT)
Message-Id: <200109261729.LAA16546@puffin.external.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] First Draft of the help for the kernel options 
In-Reply-To: Message from Thomas Marteau <marteaut@esiee.fr>
   of "Wed, 26 Sep 2001 00:42:01 +0200." <3BB10839.D23F2ED6@esiee.fr>
Date: Wed, 26 Sep 2001 11:29:04 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> Hi all,
> 
> 	As you know, PA/Linux source needs some help to guide their users.
> That's why I tried to complete the documentation for the kernel.

Excellent - I had forgotten about this already again.

> GSC/Gecko bus support
> CONFIG_GSC
>   This option gives to the kernel the capability to manage GSC buses 
>   of HP computers.

It's really more than that. Or at least it was.
All code in drivers/gsc is enabled with this flag.
It's worth noting that systems with GSC slots, LASI, EISA or
Dino (GSCtoPCI) bridge need this defined.

> This option is compulsory if you want it working.

All MMIO access once required CONFIG_GSC.
IIRC, someone fixed this dependency (willy maybe?).
A real test is if A500 and/or C3000 can build/run w/o CONFIG_GSC.

...
> GSCtoPCI/DINO PCI support
> CONFIG_GSC_DINO
>   By selecting this item, you add the use of your PCI extension slots.

I would say:
Add PCI support for Dino PCI Host Bus bridge.
PCI devices are sometimes embedded in GSC add-on cards (aka "card-mode Dino").

>   In order to be useful, you need a quite recent HP computer like those
>   based on PA7300LC or PA8X00.

"recent" means "not the oldest and not the newest".
I think mentioning some examples would be helpful (eg B132L, C200).

> HP Lasi SCSI support
> CONFIG_SCSI_LASI
>   If you have an old HP system like a 712, you should keep this on.
>   This will enable the 
>   For quite recent computers, you may be able to turn this off. 

If this can be a module, then we should mention that.
Again, some example systems with LASI/ASP built-in would be good.
(712/715/720/735/B132L/et al).

> Lasi ethernet
> CONFIG_LASI_82596
>   This option adds the driver for one of most used network cards.

It's not a seperate card. It's integrated in the LASI chip.
The question really is if apricot signals are exported out the
back of the machine. Off hand, I suspect only B180 (systems with
100BT instead of 10BT) falls into this category.
Otherwise all systems with LASI chip use this.

...
> PA Harmony audio driver
> CONFIG_SOUND_HARMONY
>   This option enables the audio part of the LASI controller. Since it is 
>   standard to all the boxes, this option should be set for any 
>   workstation.

Not true. Newer workstations with suckyio use AD1889 (IIRC).


thanks,
grant
