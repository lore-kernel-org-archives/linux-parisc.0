Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71BAE482F
	for <parisc-linux@parisc-linux.org>; Thu, 11 Oct 2001 14:22:53 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rmM0-0005Mg-00; Thu, 11 Oct 2001 21:22:52 +0100
Date: Thu, 11 Oct 2001 21:22:52 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011011212252.B25868@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010134526.F11105@linuxcare.com> <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk> <20011011024010.C13932@parcelfarce.linux.theplanet.co.uk> <20011011122351.L11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011122351.L11105@linuxcare.com>; from rhirst@linuxcare.com on Thu, Oct 11, 2001 at 12:23:51PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 12:23:51PM +0100, Richard Hirst wrote:
> asp_find_irq() wants changing:
> 
> -               case 0x76:      irq = 21; break; /* Centronics */
> +               case 0x76:      irq = 17; break; /* EISA BA */

Umm.  According to the Coral/Cobra (720/730/750) ERS I have here, irq 17
on Asp is error.  The Hardball ERS claims the same for the Cutoff ASIC
(someone's written in pencil `Asp 2' by it).  The comment is bogus;
I'll fix that.

> and needs a default case to avoid returning random irq values.

Yep, fixed in my tree.

> and you probably want something like this in eisa_probe():
> 
>         eisa_dev.region->action = kmalloc(sizeof(struct irqaction) * 32, GFP_ATOMIC);
>         memset(eisa_dev.region->action, 0, sizeof(struct irqaction) * 32);
> 
> I'm sure '32' is wrong, but at least you need some range checking on
> irq in eisa_irq() before using it to index in to the action array.

Probably something along those lines.  Apparently I should mask the byte
returned as well, but the docs say to see the Intel 82357 ISP data sheet
for details.  Grumble.

> I don't get any further eisa_irq() calls once my scsi card gerneates an
> interrupt, but for all I know I may have to poke some registers in the
> card before it allows interrupts out.

Looks like we're getting one error, and not resetting the bus.  Wonder why
we're getting an error...

-- 
Revolutions do not require corporate support.
