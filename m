Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA24171
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 22:26:59 -0700
Message-Id: <200011130534.VAA10080@milano.cup.hp.com>
To: Brian Poole <raj@cerias.purdue.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Problems booting new beta CD 
In-reply-to: Your message of "Sun, 12 Nov 2000 16:40:53 PST."
             <20001112164053.A14202@cerias.purdue.edu>
Date: Sun, 12 Nov 2000 21:34:08 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Brian Poole wrote:
> Quoting Grant Grundler (grundler@cup.hp.com) from 11 November 2000:
> > Is there a way via PALO to direct the console to FBCON or STICON or
> > whatever it's called now?
> > 
> > I had the impression *eventually* the boot console would be whatever PDC
> > says it is - ie graphics console for the 712.
> 
> Working on a 715 here.. notice you refer to 712s throughout, hopefully we are
> on the same page. Maybe 712s are identical to 715s, I don't have any idea,
> just noticed the irregularity.

For the most part yes. I had just assumed you were using a 712.

> I meant to say 'from serial console' or something of the sort.. 

Serial console should just work.
Shouldn't need an HIL keyboard connected though.

> 
> > > I've been fooling with it to no
> > > success.. I have it automatically booting from the CD, but it doesn't
> > > actually boot. I replug in the monitor & keyboard and find that it can't
> > > boot without the keyboard ('Failed to initiliaze a keyboard\n SYSTEM 
> > > HALTED').. How am I supposed to boot to the console if I can't boot w/o a
> > > keyboard? I imagine if it has a keyboard it will boot to the screen like 
>   a
> > > Sun.
> > 
> > AFAIK, 712's are the only parisc workstations what won't boot w/o keyboard.
> > All others will auto-switch to use serial console if the keyboard
> > is not connected
> 
> Hmmm.. so I have manually switch it to use serial console?

No. Just disconnect the keyboard before powering on the machine.
Should end up with console on the serial interface.

You may want to set the keyboard/console path to the serial port.
This can be done from "BOOT_ADMIN>" prompt.

The default kernel has "CONFIG_HIL=y". But since I don't test on
boxes with HIL interfaces, I have no idea if a keyboard is required
since the driver is enabled. It sounds like a bug if the 715
can't boot from serial console w/o HIL keyboard.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
