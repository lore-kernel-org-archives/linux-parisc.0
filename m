Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA12144
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 20:58:12 -0700
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id WAA16362
	for <parisc-linux@thepuffingroup.com>; Sun, 14 Nov 1999 22:58:51 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id UAA24070 for <parisc-linux@thepuffingroup.com>; Sun, 14 Nov 1999 20:01:16 -0800 (PST)
Message-Id: <199911150401.UAA24070@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hp700.c and hp800.c ? 
In-reply-to: Your message of "Sun, 14 Nov 1999 17:51:46 PST."
             <Pine.LNX.4.10.9911141751050.6663-100000@vodka.thepuffingroup.com>
Date: Sun, 14 Nov 1999 20:01:16 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> Do we really need hp700.c and hp800.c in arch/parisc/kernel ?

I sure hope not.

10.20 and previous releases shipped seperate binaries mostly
because the organizations didn't agree on product requirements.
Not because the technology was so different. They just had different
market requirements.

11.X releases only ship one binary which runs on both 700s and 800s.

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
