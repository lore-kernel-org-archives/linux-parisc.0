Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26147
	for <parisc-linux@puffin.external.hp.com>; Sun, 6 Feb 2000 10:56:45 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id B7B94173
	for <parisc-linux@thepuffingroup.com>; Sun,  6 Feb 2000 08:53:32 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id IAA09946 for <parisc-linux@thepuffingroup.com>; Sun, 6 Feb 2000 08:54:24 -0800 (PST)
Message-Id: <200002061654.IAA09946@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tulip driver 
In-reply-to: Your message of "Sun, 06 Feb 2000 02:46:51 PST."
             <20000206024651.B3143@alpha.franken.de>
Date: Sun, 06 Feb 2000 08:54:23 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:
> ...The SROMs of the
> tulips behind the card mode dino are looking stranger, they seem
> to be from a time before Digital released a sane SROM documentation
> and might confuse the driver as well. But since the machine hangs,
> when the driver tries to probe the second tulip on the card, this
> isn't an issue, yet.

Thomas,
I looked at the console output you sent me and I saw several things
not correct (which I'm trying to fix) right away:
o I/O BAR's where not getting programmed correctly.
  (both tulips fighting for the same I/O Port address (0) caused the hang)
o command register was not set
o cacheline size and latency timer were not getting set.

Now I have the opposite problem: PCI code finds and initiliazes the
tulips behind card-mode Dino but tulip.c doesn't want to talk to them.
So I can't really say for sure my changes work.

I've committed my code anyway since the oboard tulip continues to work.
Perhaps you can take another look at this.

thanks
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
