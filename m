Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA23069
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Mar 2000 12:49:41 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id 5348B593
	for <parisc-linux@thepuffingroup.com>; Thu,  9 Mar 2000 13:50:53 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id KAA08656 for parisc-linux@thepuffingroup.com; Thu, 9 Mar 2000 10:52:33 -0800 (PST)
Date: Thu, 9 Mar 2000 10:52:33 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200003091852.KAA08656@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] linux-2.3/palo switched to ELF binary
List-ID: <linux-parisc.vger.kernel.org>


Hi folks,
Yesterday, after several days of testing, it was decided to switch
the kernel over to the ELF tool chain.  Mike Ang merged the changes
from the ELF_BRANCH onto the main line branch.  This switch is
necessary to:
o enable work on PA2.0 (64-bit) kernel support
o avoid SOM specific kluges in kernel initialization path


Willy updated the "How to Build a Kernel" a few days ago but
it doesn't include any info for palo (eg cvs -z3 co palo).
(Paul - can you fix that?)

I'm told only "make palo" works right now and "make Image" does not.
Interested parties are welcome to fix "make Image".

Is the ELF "hppa1.1" tool chain available as swdepot or tarball?
It would make life alot easier for folks like myself who aren't
very good tool chain hackers but could contribute in other ways.
(I already have ELF tool binaries - thanks to paul)

thanks,
grant
