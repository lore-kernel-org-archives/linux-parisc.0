Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA23583
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Oct 1999 05:38:58 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 4 Oct 1999 11:39:27 -0000
Subject: Re: [parisc-linux] ethernet driver...
To: adevries@thepuffingroup.com (Alex deVries)
Date: Mon, 4 Oct 1999 12:37:10 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <37F84808.D8E48C4C@thepuffingroup.com> from "Alex deVries" at Oct 4, 99 02:24:08 am
Content-Type: text
Message-Id: <E11Y6Qa-0007PN-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I've cleaned up dino.c sufficiently that tulips are detected, although
> somewhat broken still:
> 
>   The PCI BIOS has not enabled this device!  Updating PCI command
> 1011->1015.   

That is reaosnably expected. The various control bits arent enabled by the
PA firmware

>   PCI latency timer (CFLT) is unreasonably low at 0.  Setting to 64
> clocks.     

And this is also a register where the PCI BIOS would have done the work
on a PC. That looks fine.


> - in tulip.c, there's really only one addition having to do with EEPROM
> detection, and I think I've messed that up.  The MACs shown are
> incorrect.
> 
> We're getting to the point where most PCI devices will start to be
> detected.

Wheee
