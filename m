Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA02730
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 15:58:49 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA11620
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 17:59:40 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA20344 for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 14:58:16 -0700 (PDT)
Message-Id: <199909152158.OAA20344@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 bootpd fails 
In-reply-to: Your message of "Wed, 15 Sep 1999 14:21:50 PDT."
             <199909152122.OAA20249@milano.cup.hp.com>
Date: Wed, 15 Sep 1999 14:58:15 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> My 715/100 (firmware 1.6, 64MB RAM, no disk) complains
> 	"ERROR: Cannot load IPL, error detected"
...
> I'll try a different box (712/80) and see what that says.
> I have a scratch disk on this box and could try dumping "Image"
> to disk to see if it's a problem with how Image is built or
> how the bootp server is transmitting data to the target.

Looks like the latter though I don't like lifls complaining about it.

The 712/80 can load/run Image from disk but immediately dumps me back
into "BOOT_ADMIN" prompt when trying via the lan. I don't even
get an error messages - darn computer is probably just to fast for
me to read it....I'll switch to a serial console. Anybody wants
the console output for the 712/80, let me know.

grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
