Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10592
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 12:30:16 -0600
Date: Sat, 18 Sep 1999 20:32:30 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Grant Grundler <grundler@cup.hp.com>,
        Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] exec_kernel help
Message-ID: <19990918203230.F5481@suse.de>
References: <199909181436.HAA24063@milano.cup.hp.com> <37E3E49F.3CF5D20A@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37E3E49F.3CF5D20A@uswest.net>; from Ryan Bradetich on Sat, Sep 18, 1999 at 01:14:39PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> > Definitely...reading owners manuals can reveal interesting "tricks".
> > Holding the "TOC" button (for about 10 seconds) on my 715 during
> > powerup will force the console to serial port 1.  The user doesn't
> > have to muck with setting paths for collecting linux kernel output.
> > Check if the C200+ has the same behavior - good chance it does.

> Found out how to do this in the users manual ... next question.  What is
> everyone using for a serial console?  I have the HP A4576A monitor attached to
> the C200+ right now, this monitor does not have a serial connection.  It has
> the Enhanced Video Connector and the HD-15 (svga) monitor connections.   The
> only serial device that I can think of is the web console, and I can get one
> from work later this afternoon, if that will work.

I'd propose using a machine known to work, a null modem cable and a terminal
program.  That way you can copy and paste which is very handy sometimes.

>     1. The ipl is called by the PDC.  Execution starts in
> arch/parisc/boot/boot_code/ipl_s.S.
>     2. The ipl does some stuff then calls IPL_main().  (in
> arch/parisc/boot/boot_code/ipl_c.c)
>     3. IPL_main does some stuff/displays some values then calles exec_kernel.
> (in arch/parisc/boot/boot_code/ipl_s.S)
>     4. exec_kernel changes the program counter to the entry_point then does an
> rfi. (entry point is 0x00010000)

yup.

The entry point is in arch/parisc/kernel/head.S
head.S calls arch/parisc/kernel/setup.c (start_parisc)
setup.c does some initialization and calls init/main.c (start_kernel)
