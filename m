Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA11687
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Sep 2000 12:49:41 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id CF6971280
	for <parisc-linux@thepuffingroup.com>; Thu,  7 Sep 2000 11:49:46 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id LAA28084
	for parisc-linux@thepuffingroup.com; Thu, 7 Sep 2000 11:53:14 -0700 (PDT)
Date: Thu, 7 Sep 2000 11:53:14 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200009071853.LAA28084@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] pdc_console_wait_key()
List-ID: <linux-parisc.vger.kernel.org>

I see pdc_console_wait_key() has #if 0/#endif around the useful
part of the code. Any reason why?

Does (*PAGE0->mem_kbd.iodc_io)() deal with virtual/real mode?

I have the impression this can only be called while in real mode.

The debugger I'm working on "porting" wants pdc_console_wait_key().

thanks,
grant
