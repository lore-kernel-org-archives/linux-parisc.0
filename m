Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA18863
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 09:24:48 -0600
Date: Thu, 26 Aug 1999 17:26:26 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
Message-ID: <19990826172626.K19314@suse.de>
References: <E11Jo9U-0005JL-00@the-village.bc.nu> <199908260213.TAA11687@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908260213.TAA11687@milano.cup.hp.com>; from Grant Grundler on Wed, Aug 25, 1999 at 07:13:04PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > Hardware interrupt. These live in a unified space described by a cookie.
> > We map the cookie to the irq number on a PC but that is optional. Drivers
> > only know about irqs as a cookie.

> I think there is going to a problem with "cookies" on PA.
> The problem is GSC devices need to program an "EIM" register.
> (For Dino, this is IAR0). The contents of the EIM register
> are a processor HPA (bits 11-31) and EIRR bit number (bits 0-4;

the Dino documentations says bits 5-31 are HPA but as long as 5-10 are 0 we
don't have to care.

> ie a value 0-31). The location of this register is NOT
> defined by PA I/O architecture - or at least not well defined.
> Is this a real problem or not?

No.  You just do
gsc_writel(0xfffe0000 + dev->irq, dev->hpa + DEVICE_SPECIFIC_OFFSET);
right after request_irq(dev->irq, ...);

> Another tidbit: I know of only one device which can use "6-bit"
> (0-63) EIRR vectors. GSC and PCI devices which are capable of mastering
> their own interrupt transactions can also use 6-bits. 6-bits is
> obviously only supportable running a 64-bit kernel binary.

Is it ok with you if we worry about SMP and PA2.0 boxes later ?

	Philipp Rumpf
