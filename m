Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31970
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 15:29:12 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 59C8BBE3
	for <parisc-linux@thepuffingroup.com>; Tue,  5 Sep 2000 14:29:21 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id OAA23661
	for parisc-linux@thepuffingroup.com; Tue, 5 Sep 2000 14:32:48 -0700 (PDT)
Date: Tue, 5 Sep 2000 14:32:48 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200009052132.OAA23661@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] entry.S Invalid operands
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
my parisc-linux kernel builds now get:
hppa-linux-gcc -I/linux/test6/linux-2.3/include   -D__KERNEL__ -I/linux/test6/linux-2.3/include  -c -o entry.o entry.S
entry.S: Assembler messages:
entry.S:828: Error: Invalid operands 
entry.S:829: Error: Invalid operands 
entry.S:830: Error: Invalid operands 
...

The preceding line (826) has:
	.level 2.0

I've rebuilt my XC using "recipe.linux -R -u".
How get the hppa-linux toolchain to accept ".level 2.0" stuff?
Or must I use hppa64-linux and force narrow mode builds somehow?

I want to continue testing on the A180 for now...

thanks,
grant
