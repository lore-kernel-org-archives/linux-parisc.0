Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA27386
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Sep 1999 11:37:53 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA28292
	for <parisc-linux@thepuffingroup.com>; Sat, 11 Sep 1999 13:39:20 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id KAA16544 for <parisc-linux@thepuffingroup.com>; Sat, 11 Sep 1999 10:37:53 -0700 (PDT)
Message-Id: <199909111737.KAA16544@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Tue, 24 Aug 1999 23:44:40 PDT."
             <19990824234440.H31994@mencheca.ch.genedata.com>
Date: Sat, 11 Sep 1999 10:37:53 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] sched.models and HP-UX flavor
List-ID: <linux-parisc.vger.kernel.org>


Matthew Wilcox wrote:
...
> Well, according to /usr/sam/lib/mo/sched.models (a very useful file!)

This is the HP-UX 11.X location.
On 10.20, it's /usr/lib/sched.models.
(Agreed - a very useful file)

I think trying to build/link parisc-linux on 10.20 has been the
source of my problems. I have the impression binutils and egcs
configure scripts are targeted towards hpux11.00 host since
they use "elf" instead of "som" output format.
I'm moving to 11.00 host and see if that works better...

I'm not good at (mostly not interested) futzing around with build tools.
It would be a good thing if someone either fixed or intentionally broke
the parisc-linux configure scripts for hpux10.20 host.

cheers,
grant

ps. parisc/pci.[ch] and dino.c changes are coming along nicely.
   Most of the design issues are resolved though a few are still
   outstanding. It looks like I should be able to drop those
   in by next week after they are reviewed.

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
