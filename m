Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA18502
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 23:31:18 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 06:34:16 -0000
Received: from hse-ottawa-ppp157550.sympatico.ca (HELO linuxcare.com) (adevries@64.229.130.221)
  by smtp.linuxcare.com with SMTP; 20 Dec 2000 06:34:10 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A405395.FFFF99E4@linuxcare.com>
Date: Wed, 20 Dec 2000 01:37:09 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
References: <200012200256.SAA16519@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Alex deVries wrote:
> > I've taken mkp's initial work on superio.c and added some stuff, but in
> > the end am confused by where we actually get the interrupt number from
> > the card.  There's no such register in function 1 (where the interrupts
> > ultimately end up) and both registers on function 0 and 2 return 0,
> > which I don't think is right.
> 
> Why are you reading this out of a register? Which register?

I'm reading it out of the INTERRUPT_LINE register because that's how
'normal' PCI devices set their dev->irq value.  If you say that's the
right approach, I believe you.

> IIRC, function 0 and 2 *should* return 0 in INTERRUPT_PIN configuration
> register and thus the INTERRUPT_LINE configuration as well.

Ah, good.

> But since IOSAPIC driver (when invoked by LBA PCI code) munges the
> INTERRUPT_LINE contents and puts the virtualized IRQ number in
> dev->irq for the drivers consumption, superio driver should
> not be reading these configuration registers.

Okay... but I get zero in dev->irq already, so I'm not sure the IOSAPIC
driver is virtualizing them properly.

Grant, I'll email the driver to you, Grant, to have a look at.

Thanks for your help!

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
