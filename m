Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA17115
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Apr 2000 14:19:19 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id C5416496
	for <parisc-linux@thepuffingroup.com>; Tue, 18 Apr 2000 16:19:16 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id NAA24003 for parisc-linux@thepuffingroup.com; Tue, 18 Apr 2000 13:19:29 -0700 (PDT)
Date: Tue, 18 Apr 2000 13:19:29 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004182019.NAA24003@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] code 28 in msdos_partition()
List-ID: <linux-parisc.vger.kernel.org>


I figured out line 434 (of 497) fs/partitions/msdos.c
("if (!NR_SECTS(p))") is causing the code 28 trap (unaligned data
reference trap) despite the use of get_unaligned() macro. Seems
get_unaligned() just isn't supported. I tried tracking this down in
order to fix it but got distracted by another problem.
If someone feels like they want to contribute in
a small way, fixing get/put unaligned would be helpful.

The problem which distracted me was the use of generic
swap macros by get_unaligned. parisc-linux defines architecture
specific macros and I couldn't figure out why those
were NOT being used. Any takers for this too?

I'm punting for now on both problems because:
a) opportunity for someone else to contribute
b) I can work more on the HPMC problems.

thanks,
grant
