Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA28998
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 19:33:02 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA01022
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Oct 1999 18:33:49 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id SAA06943 for parisc-linux@thepuffingroup.com; Thu, 28 Oct 1999 18:34:15 -0700 (PDT)
Date: Thu, 28 Oct 1999 18:34:15 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910290134.SAA06943@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] serial.c and request_irq()
List-ID: <linux-parisc.vger.kernel.org>


I've most of today trying to interrupts under LASI working
and half of that was trying to understand drivers/char/serial.c.
My basic problem is serial.c has four references to request_irq()
and none of them are being invoked. I have a printk() in
request_irq() which isn't showing up.
Anyone understand why not?

Otherwise I'll just add a bunch more printk's to serial.c and
figure out why now...sure could use a debugger at this point.

thanks,
grant
