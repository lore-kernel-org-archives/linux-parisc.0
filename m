Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA28348
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 11:35:36 -0600
Date: Tue, 19 Oct 1999 11:32:28 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199910191732.LAA14850@fast.cs.utah.edu>
To: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] LASI and serial port initialization
Cc: Helge.Deller@ruhr-uni-bochum.de
List-ID: <linux-parisc.vger.kernel.org>

We did all three of these at one point or another (in our BSD and Mach).
Our variation on #1 was that we had a separate pseudo-console device that
used a private interface to the drivers.  So the serial driver and STI
(graphics) had cn_init, cn_putc, etc. functions.  cn_init would take
whatever measures necessary to ensure that the HW was setup independent
of the normal kernel HW probe path.  Console_init was called as early as
possible and then called again after the bus walk was done (since that
screwed up the serial port).

On hp300s (long ago!) we had a cn_probe for each possible console device
that was called first thing so we could choose the "highest priority" device
as the console at boot time.  Carrying this approach over to the PA, we
originally had a pdc_console device to do #2.  It was the "default" console
til the real console_init got done.

For our BSD we basically just do #3, buffering output until the real console
comes up and then dumping the buffer before anything else.  The "real
console" in this case is whatever the PDC tells us it is (serial or graphics).

Personally I don't see spending a lot of time worrying about this.  Our
simple console interface with pre-init buffering has been perfectly adequate
for us.  But our PA world is pretty simple, older 700 series machines and
one J-series.  So the console is either the builtin serial port or the
graphics device.  Are there that many more options now?

> To: parisc-linux@thepuffingroup.com
> Date: Tue, 19 Oct 1999 09:30:45 -0700
> From: Grant Grundler <grundler@cup.hp.com>
> Subject: [parisc-linux] LASI and serial port initialization
> 
> Helge and I exchanged some e-mail on the topic of LASI vis a vie
> serial port initialization. Since then, I've come to the conclusion
> all (or most) parisc platforms will have a similar problem.
> 
> The problem is LASI is "discovered" and initialized well after several
> other drivers want to print things to the console. I see a few options
> on how to handle it:
> 1) For each platform, force the console to be the first device "discovered"
>    and initialized. This is not a really good idea since console can be
>    different depending on configuration. Rebuilding the kernel to use
>    a different console doesn't seem reasonable to me. Having the user
>    figure out which devices need to be initialized first and build an
>    appropriate kernel so console works also seems unreasonable.  We are
>    headed down this path now though....
> 
> 2) Use IODC until the console device is "owned" by the appropriate driver
>    and can start taking input/output. 
> 
> 3) buffer the output instead of calling IODC.
>    Size of the buffer will impose some sort of limit.
>    I think this is what HP-UX does but don't really know
>    and it shouldn't matter to us.
> 
