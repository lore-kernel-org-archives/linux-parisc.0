Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA15023
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Feb 2000 10:25:13 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id JAA25761
	for <parisc-linux@thepuffingroup.com>; Wed, 23 Feb 2000 09:25:55 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id JAA27870 for parisc-linux@thepuffingroup.com; Wed, 23 Feb 2000 09:25:55 -0700 (MST)
Date: Wed, 23 Feb 2000 09:25:55 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002231625.JAA27870@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Tulip Driver Bug
List-ID: <linux-parisc.vger.kernel.org>


I've been having reliability problems with networking on my J5000.
I tracked the problem down to this piece of code in tulip_interrupt():

    if (--work_budget < 0) {
	    if (tulip_debug > 1)
		    printk(KERN_WARNING "%s: Too much work during an interrupt, "
			       "csr5=0x%8.8x.\n", dev->name, csr5);
	    /* Acknowledge all interrupt sources. */
	    outl(0x8001ffff, ioaddr + CSR5);
	    /* Clear all interrupting sources, set timer to re-enable. */
	    outl(((~csr5) & 0x0001ebef) | AbnormalIntr | TimerInt,
		     ioaddr + CSR7);
	    outl(12, ioaddr + CSR11);
	    break;
    }

My understanding is that this code tries to defer work until later because
too many incoming packets have been handled during the current interrupt.
The problem is that there is no later. Once this code is run I stop
seeing iosapic interrupts, and a little later I get some Tx Hung messages,
one or two more interrupts, and then that is it. The bug may not actually
be in the above code, i.e. it may be in the timer re-enable that is
mentioned in the comment above.

If I ifdef the above code out, the driver is fairly reliable. I've run
tests with more than 20 sockets open simultaneously.

I believe the reason I see this problem more than others is probably due
to the fact that I am running on a fairly high traffic network, so the
machine is seeing a lot more packets. You should be able to reproduce
the problem by reducing the value of max_interrupt_work.

I could continue working on this problem to track it to root cause, but at
this point I would have to spend more time learning the driver and the
tulip hardware.  Perhaps someone with more experience with this driver
could find the problem with less effort.

I haven't tried this on another machine like an A-180 to determine if
the problem is only on iosapic based machines or if the problem is
general to all tulip based lan interfaces.

John Marvin
jsm@fc.hp.com
