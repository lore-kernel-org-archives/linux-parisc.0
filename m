Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA08968
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 14:07:53 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id PAA26612
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 15:55:51 -0400 (EDT)
Message-Id: <199909271955.MAA03838@milano.cup.hp.com>
To: Simen Thoresen <simen-tt@online.no>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] compiling on a 735? 
In-reply-to: Your message of "Mon, 27 Sep 1999 21:29:20 PDT."
             <199909271923.VAA29471@online.no>
Date: Mon, 27 Sep 1999 12:55:11 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Simen Thoresen wrote:
...
> 2. Is my 735 a 712 or 715? Does it matter at this stage?

More like a 715 but not. 735 has several GSC "EISA" slots vs.
715's goofy one.

> 3. Is my 735 a A class or D class? Does it matter?

Neither. 735 predates the A/D-class nomenclature just like 715/712 do too.

> 4. The HCL notes that the 735 has a 7100, so that part is ok.

yes - should at least work like a 715 for the most part...some of the
other chips might not be the same though. I don't know and wouldn't
count on it.

> 5. Gecko or Dino? I don't have one pci-slots, so I guess it's no Dino, right?

Right. No dino - could install card-mode dino if/when that starts to work.

cheers,
grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
