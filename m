Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD950591E.dip.t-dialin.net [217.80.89.30])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EA114A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 06:46:23 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f19DjJU10025
	for <parisc-linux@lists.parisc-linux.org>; Fri, 9 Feb 2001 14:46:16 +0100
Date: Fri, 9 Feb 2001 14:45:19 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730 
In-Reply-To: <200102090338.TAA07555@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102091426380.9525-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Feb 2001, Grant Grundler wrote:

> Hints on using serial console on 715 (you can search the archive
> for lots more 715 hints):
> 
> a) disable CONFIG_STI_CONSOLE
> b) enabled CONFIG_SERIAL=y
>            CONFIG_SERIAL_CONSOLE=y
>            CONFIG_SERIAL_GSC=y
> 
> c) connect x86 serial to port 1 of 715 and run minicom with 9600 8N1
>    serial line settings.
> d) Disconnect HIL keyboard and Mouse.
>    (*or* hold the TOC button for about 10 seconds while powering on the box.)
>    (Either should force the PDC to use serial port 1)

sorry about the confusing error report.
I'm actually using serial console, with the configuration above;
but the initial kernel messages are not redirected to the serial console.
not until the serial ports are found & initialized ...
... but since these kernel messages are printed before the time the
serial ports are recognized, I can't see them on the terminal, but on the
monitor.
My question was, whether there is a kernel parameter (i can pass to palo),
which redirects ALL kernel messages from the beginning to the serial port
(before they are regognized by the linux kernel). 

> GR02 is the most recent subroutine call return addr.
> (Typically the caller).
> 
> So look up c026e458 and c0246328 in your System.map.
> You can at least figure out about where it's crashing.
> (Hint: cvs co build-tools and look at a.c)

I'll do this tonight ...
 
> > NB: i typed all this stuff, no copy'n'paste; so perhaps
> > there are some errors ... 
> > 
> > BTW, no HIL connected, just serial console (but since
> > the kernel hangs before, i cannot see any output :))).

... on the serial console, hence the serial ports are not initialized,
but i can see the messages on the monitor! therefore I had to type
all the register dump by hand ...

> Wait. If PDC is printing to the serial console...I'm confused.

I hope you're not confused anymore ;)

greetings, max
