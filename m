Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA23592
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 06:27:36 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 13:30:24 -0000
Subject: Re: [parisc-linux] SuckyIO support
To: adevries@linuxcare.com (Alex deVries)
Date: Wed, 20 Dec 2000 13:05:38 +0000 (GMT)
Cc: grundler@cup.hp.com (Grant Grundler), parisc-linux@thepuffingroup.com
In-Reply-To: <3A405395.FFFF99E4@linuxcare.com> from "Alex deVries" at Dec 20, 2000 01:37:09 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E148iw9-0001Vc-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > Why are you reading this out of a register? Which register?
> 
> I'm reading it out of the INTERRUPT_LINE register because that's how
> 'normal' PCI devices set their dev->irq value.  If you say that's the
> right approach, I believe you.

INTERRUPT_PIN is pre-PCI plumbing view of the interrupt
INTERRUPT_LINE is sort of the PCI view of the interrupt at best
pci_dev->irq is the Linux view post all the plumbing and host goo
