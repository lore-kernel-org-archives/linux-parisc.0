Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA08469
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 00:13:08 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id CAA19606
	for <parisc-linux@thepuffingroup.com>; Wed, 7 Jul 1999 02:23:47 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <3782F26C.78876DDD@thepuffingroup.com>
Date: Wed, 07 Jul 1999 02:23:40 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Whee! Dino is recognized.
List-ID: <linux-parisc.vger.kernel.org>


I fixed up dino.c a little to setup it's HPA properly.  Understanding
the docs took a bit of time, so this is a personal victory.

Now the kernel boots up and prints:

Dino device driver, by Alan Cox and Alex deVries
dino0: version 3.1 at 0xFF000000, IRQ 0, 1.

Now we just need to configure the PCI bus properly, connect the
interrupts, and we should be close to being able to talk to a network.
The A-classes have tulips hanging off the PCI bus, so that should be
pretty simple.

There's some small changes so that the GSC irqs are handled by a pool
handler.

People with 712s differ at this point, you'll have to muck with Lasi's
built in ethernet port, which will be slightly difficult because you may
interrupt the serial console in doing so.  If you use the graphics, you
should be okay.

There's some initial code to handle multiple dinos, and it may in fact
work, but I really haven't tried (and can't until I have one of those
GSC ethernet cards that Thomas and Philipp have).

What other HPs have Dino onboard?

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
