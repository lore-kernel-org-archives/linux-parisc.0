Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA09858
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 15:35:37 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA16411
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 17:37:17 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id OAA11235 for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 14:37:34 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id OAA10057 for parisc-linux@thepuffingroup.com; Mon, 27 Sep 1999 14:37:49 -0700 (PDT)
Message-Id: <199909272137.OAA10057@meow.sr.hp.com>
Subject: Re: [parisc-linux] compiling on a 735? (fwd)
To: parisc-linux@thepuffingroup.com
Date: Mon, 27 Sep 1999 14:37:49 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|Simen Thoresen wrote:
|> 3. Is my 735 a A class or D class? Does it matter?
|
|It's really neither, and no, it doesn't matter yet either.   We just
|don't have enough IO support yet for it to matter.
|
|> 4. The HCL notes that the 735 has a 7100, so that part is ok.
|
|Yuppers.
|
|> 5. Gecko or Dino? I don't have one pci-slots, so I guess it's no Dino, right?
|
|If it has EISA slots, it probably has WAX, for which we have no docs. 
|It likely has Lasi, but I'm not sure and I'd need an HP person to tell
|me.

This really all depends if it is an early 715 (/33,50,75) or late
715 (64,80,100). that you are comparing it to.  735s do NOT have
GSC, therefore they do not have WAX.  They do have EISA, but it comes
through ASP and perhaps some other intermediate chips.

I really need to get the docs for the earlier workstations out
before Agilent is split form HP and I don't have docs any more.

	-Bill
