Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA06774
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Sep 1999 11:21:18 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA27200
	for <parisc-linux@thepuffingroup.com>; Thu, 2 Sep 1999 11:22:51 -0600 (MDT)
Message-Id: <199909021720.KAA07391@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux-cvs] grundler 
In-reply-to: Your message of "Thu, 02 Sep 1999 11:12:58 PDT."
             <19990902111258.J629@suse.de>
Date: Thu, 02 Sep 1999 10:20:32 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > Modified Files:
> > 	pci.c 
> 
> - removed support for more than one bus

Not quite - removed support for more than one type of PCI bus adapter.
PA platforms only support one type of PCI bus adapter at a time.
We could link in more than on PCI bus driver but only one will
ever get used. (At least that's my goal).

> we don't want that, do we ?

Rather we don't need it.
If you want it you can have it. :^)

> That's it for today, I promise.

ditto.

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
