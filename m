Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA09930
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 08:36:10 -0600
Message-Id: <199909181436.HAA24063@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: Ryan Bradetich <rbradetich@uswest.net>,
        Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] exec_kernel help 
In-reply-to: Your message of "Sat, 18 Sep 1999 10:29:23 PDT."
             <19990918102923.C5481@suse.de>
Date: Sat, 18 Sep 1999 07:36:37 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> Ryan Bradetich wrote:
...
> > Here is the output on the console (I'm typing this in by hand)
> 
> Try to get a serial console set up.

Definitely...reading owners manuals can reveal interesting "tricks".
Holding the "TOC" button (for about 10 seconds) on my 715 during
powerup will force the console to serial port 1.  The user doesn't
have to muck with setting paths for collecting linux kernel output.
Check if the C200+ has the same behavior - good chance it does.

...
> > Any help/pointers would be appreciated :)
> 
> okay, both head.S and our console (which is still called pdc_* though it
> really is IODC) rely on pa1.1 firmware.  I am not sure this works on PA2.0
> systems.

"Legacy" firmware (includes C200+, A180L, etc) run PDC/IODC in narrow mode.
I expect PDC calls to work the same. I think something else is different.
As Philipp suggested, check the PIM dump since it's the only info available.
Someone is looking at a PA debugger...

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
