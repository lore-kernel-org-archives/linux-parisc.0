Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA15580
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Aug 1999 12:18:49 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA22782
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Aug 1999 14:19:51 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id LAA10916 for <parisc-linux@thepuffingroup.com>; Wed, 25 Aug 1999 11:20:48 -0700 (PDT)
Message-Id: <199908251820.LAA10916@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100 
In-reply-to: Your message of "Tue, 24 Aug 1999 23:44:40 PDT."
             <19990824234440.H31994@mencheca.ch.genedata.com>
Date: Wed, 25 Aug 1999 11:20:48 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> > I also wasn't sure about the difference between
> > CONFIG_PA7100 and CONFIG_PA7300 in the .config file.
> > I thought the 715/100 is an older machine before 7300LC
> > was available and thus is PA7100. Is this right?
> 
> Well, according to /usr/sam/lib/mo/sched.models (a very useful file!)
> 
> 715     1.1c    PA7100LC

On my HP-UX 10.20 machine the path is /usr/lib/sched.models

> It doesn't mention the submodels explicitly.  However,

Nor the "internal" project names...most people I've worked
have no clue what's in an F20 or I60 (and I don't either).
One of those gaps between marketing and developement.

> http://www.thepuffingroup.com/parisc/hp9000_models.html
> 
> says the 715/100 (both variants!) have PCXL CPUs which is the same as that
> on the 712 models, which we know to be the 7100LC.

Other HP folks:
1) Difference between 7100 and 7100LC the mainly integration of GSC interface?
(ignore clock speed differences)
2) Is PCXL really 7100 *and* 7100LC?

I see T500 used 7100s and I'm certain no GSC bus was present...

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
