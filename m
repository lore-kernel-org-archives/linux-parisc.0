Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA16929
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 23:52:20 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id A4247195
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Sep 2000 23:53:17 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id XAA05971 for parisc-linux@thepuffingroup.com; Tue, 26 Sep 2000 23:53:06 -0600 (MDT)
Date: Tue, 26 Sep 2000 23:53:06 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200009270553.XAA05971@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Warning re: serial driver change
List-ID: <linux-parisc.vger.kernel.org>

I've been using a plug in PCI serial card on my J5000 for some time now,
but I had to make changes to the serial driver to get it to work.  One of
the changes was a workaround for a problem that I did not know the root
cause of.  I spent some time tonight tracking down that root cause (a bug
in pci_write_config_byte on Astro/Ike based machines with later revision
chips) and fixed it.

The other change I had a few concerns about, and wanted to do some
more testing on a few other machines before I checked the change
into the serial driver. Matt Taggart and I did that testing today,
so I just recently checked in the changes.

However, I need to warn you about this change.  Previously Martin Peterson
had made a change to the driver to not initialize the UART, since the
parisc firmware had already initialized it.  He experienced problems with
the serial port (like garbage output) if the UART was initialized a second
time.

However, this change was a problem for plug in (pci) serial cards, since
the firmware doesn't know about them, and did not initialize them.  I
thought about some kind of special case test, but at least on my A180, the
built in serial port still worked when I reverted the driver to the
previous state (i.e. the driver initializes the UART in all cases).  Matt
Taggart also tested the change on a Gecko and a C200. These represent
most of the machines (or very similar machines) that people are working
on. However, they are all LASI based, so it may not be a wide enough
sample.

Anyway, I am hoping that whatever originally caused the problem Martin
Peterson was seeing is now fixed.  If that is the case, this is the best
solution, since it removes one more parisc specific change to common code.
If you see garbage output after the message "Switching from PDC console",
then this is not the case, and we will have to try to find the root cause
and/or find a different solution.

So, if your serial port stops working, you can use the previous version
as a temporary workaround. Please let me know if you have any problems,
and tell me the specific configuration you are able to reproduce the
problem on.

John Marvin
jsm@fc.hp.com
