Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA08837
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Mar 2000 13:27:56 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id D8BCD854
	for <parisc-linux@thepuffingroup.com>; Sat, 11 Mar 2000 14:30:02 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id LAA10732 for parisc-linux@thepuffingroup.com; Sat, 11 Mar 2000 11:30:53 -0800 (PST)
Date: Sat, 11 Mar 2000 11:30:53 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200003111930.LAA10732@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] .depend file for drivers/gsc?
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Minor problem I think someone else can figure out faster then me.
I changed my .config to use CONFIG_LBA_PCI. When I rebuilt, I got
a "dino_init" no defined linker error.

It turns out no ".depend" file gets created for drivers/gsc.
I looked through linux-2.3/Makefile and drivers/Makefile and
they both looked ok to me. So if someone could take a quick look
at this....

in the meantime, i'll just "make clean" after changing my .config.

thanks,
grant
