Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA12001
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Aug 1999 05:27:47 -0600
Received: from grcbd508.grc.hp.com (root@grcbd508.grc.hp.com [15.139.203.207])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id HAA17630
	for <parisc-linux@thepuffingroup.com>; Wed, 4 Aug 1999 07:28:21 -0400 (EDT)
Received: (from imatthae@localhost)
	by grcbd508.grc.hp.com (8.9.3/8.9.3) id NAA17311
	for parisc-linux@thepuffingroup.com; Wed, 4 Aug 1999 13:28:50 +0200
Date: Wed, 4 Aug 1999 13:28:50 +0200
From: Ingo Matthaes <imatthae@grcbd508.grc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] unsatisfied symbols
Message-ID: <19990804132850.A17303@grcbd508.grc.hp.com>
References: <19990803114003.A5018@grcbd508.grc.hp.com> <99080400504700.00269@P100>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <99080400504700.00269@P100>; from Helge Deller on Wed, Aug 04, 1999 at 12:32:19AM +0200
List-ID: <linux-parisc.vger.kernel.org>

> Hi Ingo.
> 
> The unsatisfied symbol __delay was caused by the inclusion of pdc_cons.c by the
> bootloader. I fixed it some minutes ago in the cvs.
> The actual kernel from cvs compiles, links and boots (!!) now cleanly (I just
> tried it), if you add the line  
> extern pgd_t swapper_pg_dir[1024];
> to the file pgtable.h. I didn´t wanted to fix that, since I think, that Philipp

O.k. it works fine on my 715/33. I will try it on some 712 and, if available,
on a a-class



> is actually working on that code....
> 
> NB: If you want faster screen-output, then remove the delay() in pdc_cons.c.

Why should I remove that classic feeling :-)

  Ingo


-- 
Ingo Matthaes
HP-UX Net und Linux Support
HP Support Center Ratingen
