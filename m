Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13949
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 10:28:20 -0600
Date: Fri, 26 May 2000 09:29:26 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200005261629.JAA08798@milano.cup.hp.com>
To: mj@ucw.cz, torvalds@transmeta.com
Cc: linux-kernel@vger.rutgers.edu, parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] -pre9 patch for PCI
List-ID: <linux-parisc.vger.kernel.org>

Linus,
Here some things we (parisc port) found in the common code.
Mostly minor stuff.

drivers/pci/pci.c 
        spinlock_t declaration is getting picked up "accident".
	spinlock.h is included by another header file. 

drivers/pci/pci.ids 
        Martin Peterson (mkp@mkp.net) added SuperIO id's (aka suckyio :^).

include/linux/pci.h 
        Philipp Rumpf (prumpf@tux.org) fixed a stub function.

include/linux/pci_ids.h 
        goes with pci.ids above. 

thanks,
grant

Grant Grundler
grundler@puffin.external.hp.com
