Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA20736
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 08:37:00 -0700
Received: from esiee.net (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 83677D15A6
	for <parisc-linux@thepuffingroup.com>; Fri,  1 Dec 2000 16:39:21 +0100 (CET)
Sender: debackex@esiee.fr
Message-ID: <3A27C6DC.EA6F6965@esiee.net>
Date: Fri, 01 Dec 2000 16:42:20 +0100
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sti rom access on B132/B180
List-ID: <linux-parisc.vger.kernel.org>

Hi everyone!

i'm trying to find the sti rom...

well, unlike the 712,715 and 725, the address is not in the pdc.

for sgc and gsc based graphic cards, the sti rom has to be available at
the base hpa, which can be one of those addresses: 0xf4000000,
0xf6000000, 0xf8000000, or 0xfa000000.

the bios indicates that the graphics are at 0xf8000000

the other memory spaces are unaccessible, that's ok. 
but the problem is that 0xf8000000 is full of zeros (no rom)

two possibilies then:
- pdc has relocated the sti rom: impossible since kernel doesn't do any
PDC relocation.
- it's pci based card, so the sti rom must be accessible through the pci
expansion rom space and optionally, the base hpa.

so the questions are:
how can i access the pci expansion rom (do you have doc?)?
or do you have any other idea?

thanks for your help!

ESIEE Team.
