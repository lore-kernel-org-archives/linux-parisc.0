Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA22211
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 13:59:43 -0700
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA13672
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 13:01:07 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id NAA18050 for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 13:02:23 -0800 (PST)
Message-Id: <199911102102.NAA18050@milano.cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status 
In-reply-to: Your message of "Wed, 10 Nov 1999 11:10:49 PST."
             <19991110111049.V25252@mencheca.ch.genedata.com>
Date: Wed, 10 Nov 1999 13:02:19 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Wed, Nov 10, 1999 at 04:03:39AM -0500, Alex deVries wrote:
> > 
> > Having ASP interrupts working will enable a lot of different boxes to be
> > supported, mostly 715s.  I have a /50, /75 and probably /100 to test on.
> 
> The /50 and /75 are also Scorpio machines.  The /100 is either a Mirage or
> a Turnip.  As such, I don't know if it has ASP.

Turnip is the 715/100XC. Has 1MB I/D cache vs the 128KB or 256KB that
the regular 715/100. Alex is getting a 715/100 to test with and
he can then tell you if it has ASP or LASI ( I think the latter but don't
know for sure).

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
