Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA15553
	for <parisc-linux@puffin.external.hp.com>; Thu, 15 Jul 1999 19:47:28 -0600
Message-ID: <378E8F71.A475AB34@ruhr-uni-bochum.de>
Date: Fri, 16 Jul 1999 03:48:33 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
CC: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        frank.benke@student.uni-tuebingen.de, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735 experience ??
References: <19990715230530.F25925@mencheca.ch.genedata.com> <199907152114.RAA12587@hiauly1.hia.nrc.ca> <19990715232738.G25925@mencheca.ch.genedata.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox schrieb:

> On Thu, Jul 15, 1999 at 05:14:35PM -0400, John David Anglin wrote:
> > I tried a few days ago (July 6) and sent the console output to Alex Devries.
> > There were problems with cpu speed, cpu level, and the stack/user address
> > space seemed to encompass all memory including the kernel.  The kernel
> > did determine the amount of memory in the machine and the machine type
> > correctly.
> >
> > I tried again a few days later and the boot just hung with no messages
> > at all.  I think the hpux ipl must have had problems with the object file.
> > Haven't tried the most recent version.
>
> You should :-)  Helge checked in some code today which apparently fixes
> the booting-via-hpux problems.

Yes, it would be great if someone could give me feedback if booting works now on
most machines...
Right now the kernel should start up and stop at "Calibrating delay loop..." and
your led's are blinking "in row"...
Yesterday Phillipp checked code in, where you could see the timer-irq running, but
he checked it out again (I don't know why).

Maybe I should also say, that I currently worked a little at the
ITE/Framebuffer-code and until now I already can switch to graphics-mode and show
some nice white-yellow blocks on the screen....
It's too early to commit this code, but maybe in 2-3 weeks I will check it in.

Helge Deller.
