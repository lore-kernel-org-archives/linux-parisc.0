Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19351
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 10:41:12 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 26 Aug 1999 16:42:51 -0000
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 26 Aug 1999 17:38:39 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-Reply-To: <199908261629.JAA12121@milano.cup.hp.com> from "Grant Grundler" at Aug 26, 99 09:29:39 am
Content-Type: text
Message-Id: <E11K2Xy-0005wR-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I'm still convinced PA Processor HPAs should be passed to GSC drivers
> seperately (eg dino.c).  On IA64 platforms, I/O SAPIC and Local Sapic
> also seperate the target address and "vector".  I left David Mossberger
> voice mail about this - I suspect/hope the problem has already
> been solved.

Passing that kind of info out to arch specific drivers is ok. The rest of
the system wants a single opaque long cookie (with or without milk) . You
can even make that cookie a cast on a struct addr.

> Not HP's style. Too hostile. The process is to file "Change Requests"
> - a kind of black hole where managers pull statistics.  :^)

I've dealt with HP in another project. Im glad TPG are doing the HP interfacing
not me 8)

> I see three levels: block all IRQs, enable IRQs, and bh.
> It sounds like those correspond to SPLHI/SPL7, SPL5, and SPL2.
> Am I still on the right track?

Yes I think so. Im not that hot on the old BSD terminology

> implement more than one level of SPL. But I now agree not much is lost
> since two important levels are supported.  As long as the clock gets
> serviced, the timeouts it generates would run at about the same time.
> More on this below.

We never do timeouts in loops in an IRQ handler by checking versus the
clock. We also tend to use RDTSC or similar features if available - apic
clock, etc so we recover lost ticks too

> in this context. Knowing that Intel is eager to support UDI on linux,
> I would be worried about how UDI is made to work. (Hint: I worked on

I don't know any major Linux hacker who views UDI with anything but 
mild amusement. Linux people tend to be latency freaks.

> After doing this exercise, I agree with Alan - not much is lost.
> The ATT flavor Unixes need SPL6 because streams processing (another
> message passing subsystem) can take a really long time in the IRQ
> context and thus block the clock.

The crazies at gcom who did some streams based stuff for Linux (not in the
standard kernel) do their streams processing in the bh context for some
reason. 

Where we get drivers for hardware that is really horrible we sometimes do

	my_irq
		mark_bh
		mask irq
		return from irq

as the entire IRQ handler - the aha152x scsi controller is an example of
that. Thankfully for the devices people buy when they want speed you don't
have that problem.

Alan
