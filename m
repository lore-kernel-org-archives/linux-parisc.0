Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30209
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jan 2000 10:46:12 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3885EA01.88E1513B@thepuffingroup.com>
Date: Wed, 19 Jan 2000 11:44:49 -0500
From: Michael Ang <mang@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Matthew Wilcox <willy@thepuffingroup.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NCR driver
References: <200001190634.WAA19934@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I've gotten the tulip driver to find it's device on the A180, but the
PCI I/O address is being reported incorrectly at some point.  The
pci_ioaddr reported is way too low, so I suspect that there is a Dino
related offset that needs to be added somewhere.  I'm digging into the
Dino code to find the right place to add the offset, and any hints/help
is appreciated.

Here's the output from the tulip driver with debugging turned on:
Found Digital DS21142/3 Tulip at I/O 0x1ff00.

PCI bus walking should work fine.  You can see the devices found by
defining DEBUG in drivers/pci/pci.c, and the vendor and device ids are
listed in devlist.h

	- Mike.

Grant Grundler wrote:
> 
> Someone else could start trying to make PCI NCR SCSI also work under Dino.
> Dino code does detect PCI devices and tulip (100BT) driver has started
> talking to it's device. Need to enable CONFIG_GSC_DINO from the default
> ".config". This requires an A, B, or C-class machine to test though.
