Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA03309
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Sep 1999 12:52:44 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA21080
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Sep 1999 14:53:48 -0400 (EDT)
Message-Id: <199909011851.LAA06628@milano.cup.hp.com>
To: "Bill Katz " "" (William) <billk@sr.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP3000 928LX Support? (fwd) 
In-reply-to: Your message of "Wed, 01 Sep 1999 10:09:14 PDT."
             <199909011709.KAA00812@meow.sr.hp.com>
Date: Wed, 01 Sep 1999 11:51:36 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bill Katz "(William)" wrote:
...
> However the unit could be old enough that it has I/O cards based on the
> CIO or NIO (aka HP -pricision) bus.  It is unlikely anyone will ever bother
> writing Linux drivers for those cards.

The whole point of linux is to use what's cheap and available.
I would rather say:
	It is unlikely anyone *in HP* will ever *get paid for* writing
	Linux drivers for CIO or NIO cards.

However, if documentation isn't publicly available, it would be
pretty "challenging" for someone outside HP to do anything with HP-PB.
And someone in HP might actually be masochistic enough to make
parisc-linux boot/scan on NIO bus machines. ;^)

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
