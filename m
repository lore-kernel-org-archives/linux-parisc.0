Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10409
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 12:17:04 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37E3E49F.3CF5D20A@uswest.net>
Date: Sat, 18 Sep 1999 13:14:39 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Philipp Rumpf <prumpf@suse.de>,
        Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] exec_kernel help
References: <199909181436.HAA24063@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Philipp Rumpf wrote:
> > Ryan Bradetich wrote:
> ...
> > > Here is the output on the console (I'm typing this in by hand)
> >
> > Try to get a serial console set up.
>
> Definitely...reading owners manuals can reveal interesting "tricks".
> Holding the "TOC" button (for about 10 seconds) on my 715 during
> powerup will force the console to serial port 1.  The user doesn't
> have to muck with setting paths for collecting linux kernel output.
> Check if the C200+ has the same behavior - good chance it does.
>

Found out how to do this in the users manual ... next question.  What is
everyone using for a serial console?  I have the HP A4576A monitor attached to
the C200+ right now, this monitor does not have a serial connection.  It has
the Enhanced Video Connector and the HD-15 (svga) monitor connections.   The
only serial device that I can think of is the web console, and I can get one
from work later this afternoon, if that will work.

> ...
> > > Any help/pointers would be appreciated :)
> >
> > okay, both head.S and our console (which is still called pdc_* though it
> > really is IODC) rely on pa1.1 firmware.  I am not sure this works on PA2.0
> > systems.

Will look in to these ... I've been focusing on init/main.c and
arch/parisc/boot/boot_code/ipl_[cs].[cS]

Let my outline my understanding of how the kernel gets loaded, and then will
someone please correct me if I'm wrong.

    1. The ipl is called by the PDC.  Execution starts in
arch/parisc/boot/boot_code/ipl_s.S.
    2. The ipl does some stuff then calls IPL_main().  (in
arch/parisc/boot/boot_code/ipl_c.c)
    3. IPL_main does some stuff/displays some values then calles exec_kernel.
(in arch/parisc/boot/boot_code/ipl_s.S)
    4. exec_kernel changes the program counter to the entry_point then does an
rfi. (entry point is 0x00010000)

    This is all the farther I've been able to trace/understand.  I was assuming
that the rfi throws us to start_kernel in init/main.c.
    Although after glancing at arch/parisc/kernel/head.S it looks like that
assumption might have been invalid.

> "Legacy" firmware (includes C200+, A180L, etc) run PDC/IODC in narrow mode.
> I expect PDC calls to work the same. I think something else is different.
> As Philipp suggested, check the PIM dump since it's the only info available.
>

Nothing in the PIM dump, though that was a great idea.... forgot all about
checking the PIM codes (duh...) :)

> Someone is looking at a PA debugger...

What do you mean by a PA debugger?

>
> grant
>
> Grant Grundler
> Communications Infrastructure Computer Operations
> +1.408.447.7253
