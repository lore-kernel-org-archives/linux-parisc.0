Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA13808
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 14:15:32 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 21 Dec 2000 21:18:32 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149D6c-00067K-00; Thu, 21 Dec 2000 21:18:30 +0000
Date: Thu, 21 Dec 2000 21:18:30 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Cc: tytso@mit.edu
Message-ID: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Console
List-ID: <linux-parisc.vger.kernel.org>


We were doing some very dubious things with our console; I hope I've now
fixed them.

The problem was that we can't output from the serial port until we've
done all the GSC and LASI setup, which is very late in the boot sequence.
The current serial console code just guesses, and gets lucky on x86, that
it can output bytes to the serial port.  This crashes for us because it
assumes it can use outb when it should be using gsc_readb.

So I've moved the call to initialise the serial console to the serial
driver, after it does its own setup.  This makes much more sense (the
serial console code might now be simplifiable, I haven't checked).

Of course, we'd like to see a bit of output before we get to that point.
So we still register the PDC console, crappy as it is, very early on
in the boot sequence (slightly later now than before, but it wasn't
used up until that point anyway, because none of the console system
was activated).

However, if you just do that and don't frob the dmesg log (nasty, nasty!),
you get everything twice.  So I invented a new console flag, CON_BOOT.
the register_console() interface notices that the previous console was
CON_BOOT, removes it and doesn't display the log to that point as it
assumes you've already seen it on the boot console.

I hope other architectures can take advantage of this small piece of
infrastructure.  Ted, are you the console maintainer?

-- 
Revolutions do not require corporate support.
