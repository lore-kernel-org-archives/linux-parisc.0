Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id KAA27660
	for <parisc-linux@sod.res.cmu.edu>; Mon, 29 Mar 1999 10:09:30 -0500
Message-ID: <19990329100924.V30475@cmu.edu>
Date: Mon, 29 Mar 1999 10:09:24 -0500
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Teaching the bootloader to grok ext2
List-ID: <linux-parisc.vger.kernel.org>

So, I am told that the firmware has nice ways of telling me things
about the scsi disk geometry and fetching blocks and so on.  Would
someone be able to point me at the appropriate documentation, or at
least give me some general clue about how to go about this?  I'd like
to make the bootloader capable of fetching kernel images from an ext2
filesystem, which Chris and I agreed seems to be the Right Thing to
do.

-Phil

------------------------------------------------------------------
"In film you will find four basic story lines. Man versus man, man
versus nature, nature versus nature, and dog versus vampire."
        - Steven Spielberg
