Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id CABCA4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Feb 2001 16:59:39 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Date: Thu, 15 Feb 2001 01:01:35 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0102130007220.13741-100000@sgate.charlysworld.de> <20010214164925.U1374@linuxcare.com>
In-Reply-To: <20010214164925.U1374@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01021500595803.07438@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 14 February 2001 17:49, Richard Hirst wrote:
> I can reproduce this on a 715/75.  When it crashes I get:
>
>   ASP version 1 at 0xf0800000 found.
>   LED (ASP-style) display at f0800020 registered
>   Found HIL at 0xf0821000, IRQ 94
>   HIL: keyboard found at id 3
>   parport_init_chip: initialize bidirectional-mode.
>   Dumping Stack from c5ff0000 to c5ff0980:
>
>
> IAOQ = _gsc_readb + 0x0c
> r2 = parport_PS2_supported + 0x64
> r26 = 0xf0824800
>
> r26 corresponds to
>
>   Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0, 0x74,
> 0x0, 0x0
>
>
> From drivers/parport/parport_gsc.c:
>
>         port = ((unsigned long) d->hpa) + PARPORT_GSC_OFFSET;
>
>         /*
>             some older machines with ASP-chip don't support the enhanced
> parport modes */
>         if (!pdc_add_valid( (void *)(port+4))) {
>             /* Initialize bidirectional-mode (0x10) & data-tranfer-mode #1
> (0x20) */ printk("%s: initialize bidirectional-mode.\n", __FUNCTION__);
> parport_writeb ( (0x10 + 0x20), port + 4);
>         } else {
>             printk("%s: enhanced parport-modes not supported.\n",
> __FUNCTION__); }
>
> So, I guess it shouldn't have tried to initialise bidirectional-mode
> on my old 715/75 with ASP.  If I force that 'if' to fail, then on reboot
> I get:
>
>   ASP version 1 at 0xf0800000 found.
>   LED (ASP-style) display at f0800020 registered
>   Found HIL at 0xf0821000, IRQ 94
>   HIL: keyboard found at id 3
>   parport_init_chip: enhanced parport-modes not supported.
>   parport0: PC-style at 0xf0824800, irq 88 [PCSPP]

On my 715/64 I get with bidirectional mode enabled:
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
and this (TRISTATE) is why I wanted to enable this mode. 

> And the machine boots ok.  I added debug just to check, (port+4) is
> 0xf0824804.  So is pdc_add_valid() broken, or is that not the right
> address to be testing?

I'm still sure, that this is the correct address to test, but maybe we should 
just disable the initialisation of bidirectional mode for machines which
- have an ASP chip, or
- have their parport-chip at address 0xf0824800 (which is the only region 
where the ASP has it's parport), or
- on machines, where "parisc_get_cpu_type(cpu_data[0]) < pcxt_"  (from 
hardware.h and processor.h) [but I'm not sure if pcxt_ is correct. You'll 
need to verify]

This are just some possible solutions to work around the problem for now, but 
I'm sure there may be some others too.

> Oh, and a simple 'ls / > /dev/lp0' worked too.
Great.

> Richard

Greetings,

	Helge
