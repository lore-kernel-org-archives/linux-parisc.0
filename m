Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA13010
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Nov 2000 13:05:25 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id D6986B30
	for <parisc-linux@thepuffingroup.com>; Thu,  9 Nov 2000 12:07:15 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id MAA06943
	for parisc-linux@thepuffingroup.com; Thu, 9 Nov 2000 12:12:25 -0800 (PST)
Date: Thu, 9 Nov 2000 12:12:25 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011092012.MAA06943@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tulip DMA mapping
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I see a "bug" in tulip's usage of mapping services.
It's not the bug I was looking for unfortunately.

In line 217 of drivers/net/tulip/interrupt.c:

	if (tp->tx_buffers[entry].mapping)
		pci_unmap_single(tp->pdev,
				tp->tx_buffers[entry].mapping,
				sizeof(tp->setup_frame),
				PCI_DMA_TODEVICE);

0 is a valid pci_map_single() return value when the system has an IO MMU.

The system will panic before pci_map_single() will fail.
The driver needs to remember some other way if a buffer was mapped or not.
Or the Documentation/DMA-mapping.txt should be changed - ie add this
to the interface definition and I can reserve the 1st mapping
entry so no-one uses it.

Should I be mailing Jeff Garzik <jgarzik@mandrakesoft.com> directly?
Or can someone who knows Jeff point this out to him?

thanks,
grant
