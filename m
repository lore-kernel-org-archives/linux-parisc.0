Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA26779
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Apr 2000 22:26:20 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id A215738D8
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Apr 2000 00:26:18 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id VAA14713 for <parisc-linux@thepuffingroup.com>; Mon, 10 Apr 2000 21:26:19 -0700 (PDT)
Message-Id: <200004110426.VAA14713@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Mon, 10 Apr 2000 21:26:18 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] tulip on parisc-linux
List-ID: <linux-parisc.vger.kernel.org>

[ FYI - I posted this to linux-kernel mailing list earlier today
  and David Miller already replied saying this version of tulip
  driver works on Sparc64 (which has 64-byte cachelines) ]

Hi all,
I'm trying to bring-up tulip driver on an HP C3000 workstation.
I started out using a cogent (adaptec) 21143 PCI board.  I've
collected a PCI bus trace (cogent1.txt) and corresponding console
output (cogent1_cons.txt).  Both can be found on
	ftp://puffin.external.hp.com/pub/parisc/debug.

I then tried a HP 21143 PCI card and got similar results.
Output is in the same place under "hp100bt1*.txt".

The tulip driver in the parisc source tree "works" (NFS root)
for Thomas Bogendoerfer on his A180 (PA1.1, 32-byte cacheline) using
the "built-in" DEC 21143.  IIRC, Thomas pulled the current source
in the parisc-linux tree from 2.3.99-pre3.

Couple of questions:
1) Anyone know if drivers/net/tulip/* (pre3 or later) work on
   an architecture with 64-byte cachelines?
   (21143 doc says it supports 8/16/32 byte cachlines)

2) The tulip fetches way more data than it needs for the setup frame
   TX descriptor. (See lines -215 to -4 of the cogent PCI trace).
   Anyone know why?
   (I can arrange a free 712/80 for who ever can explain that to me)

There is also an issue with the tulip trying to mem_read from 0xfffffffc.
but I think that's a "side effect" of #2 above.


FWIW, my goal was to debug "Dynamic DMA mapping" support for "Astro"
based parisc platforms (eg B1000/C3000/J5000). Interested parties can
look at the code in:
http://puffin.external.hp.com/cgi-bin/cvsview/linux-2.3/arch/parisc/kernel/sba_iommu.c

thanks,
grant

Grant Grundler
grundler@removethis.cup.hp.com
