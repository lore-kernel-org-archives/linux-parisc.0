Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19471
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 10:41:55 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id MAA25830
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Aug 1999 12:42:57 -0400 (EDT)
To: Philipp Rumpf <prumpf@suse.de>
Cc: Grant Grundler <grundler@cup.hp.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
        parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c 
In-reply-to: Your message of "Thu, 26 Aug 1999 17:26:26 +0200."
             <19990826172626.K19314@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 26 Aug 1999 10:43:29 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990826164329.DEB9418708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> No.  You just do
> gsc_writel(0xfffe0000 + dev->irq, dev->hpa + DEVICE_SPECIFIC_OFFSET);
> right after request_irq(dev->irq, ...);
> Is it ok with you if we worry about SMP and PA2.0 boxes later ?

Writing to the specific HPA is most likely a SMP issue as well, but if we
go the route of using global broadcast interrupts, we should leave some
__really__ large handwriting on the wall for when SMP gets dealt with.
The mad dash to handle an interrupt is a great way to thrash the machine.

Likewise, if there's a clean way to get the processor HPA in the IRQ value,
there is no reason not to do it now, and avoid tracking down the problems
later.

lamont
