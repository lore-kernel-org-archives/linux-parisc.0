Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA21579
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Oct 1999 23:30:56 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id WAA10593
	for <parisc-linux@thepuffingroup.com>; Sun, 3 Oct 1999 22:31:23 -0700 (PDT)
Message-Id: <199910040530.WAA15020@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Dino developments... 
In-reply-to: Your message of "Sun, 03 Oct 1999 19:29:19 PDT."
             <37F7E6CF.F781614F@thepuffingroup.com>
Date: Sun, 03 Oct 1999 22:30:33 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alex,
First cut review notes on the v1.17 dino.c:

o card-mode is only supported by dino 3.x.
  Only need to look for card-mode which is 3.0 or better.
  Look for DINO_MEM_DATA in the Dino ERS.
  I know for a fact none were shipped and no HP-UX drivers
  were shipped to support it either.

o "struct hp_driver" is not named very well. Needed more beer? :^)
  I'd like to suggest "struct pa_iodc_driver" or something like that.

o I'm not sure any systems were shipped with 2.0 built-in dino.
  Anybody know? What about 2.1's?
  I don't expect numbers to be posted here - just the existence.

o I see my long-ass comment about broken dino versions has been removed.
  Was it intentionally removed?
  (It's ok...I wrote it because I thought it was either useful or
  interesting depending on why anyone bothers reading the code).

o "struct dino_version_mapping" doesn't appear to be used.
  Can this go?

o FYI: "ifdef USE_PCI_INTR_OPS" stuff is mine.
  I want to save it for some experiments on interrupt path latency.
  May be able to run those by the end of this month at this pace.

o I'd like to move the card-mode initialization into a seperate
  routine. Makes the common initialization easier to read.
  I can already see some stuff is missing too.

o Before generic PCI  bus walk occurs card-mode dino support must
  program PCI_INTERRUPT_LINE of each PCI device below it.
  Firmware does this for PCI devices below built-in Dino.
  For now, this can be a simple none-recursive bus walk since
  very few people will have the card-mode expansion chassis (which
  uses PCI-PCI bridges).
  
  I'll take care of it this week but just wanted it noted in case
  anyone wonders why card-mode interrupts don't work now.

o is_buildtin_dino(). Typo and it's not needed right now.

o 0x05d. Need the workaround to eventually support J2240 firmware bug.
  This was included in the macros I had posted previously.
  Can just add another HPHW_BRIDGE entry instead.


That's enough for now....time to get some sleep.

later,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
