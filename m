Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA05706
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 17:28:53 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id TAA19471
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Sep 1999 19:23:19 -0400 (EDT)
Message-Id: <199909162322.QAA21423@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output 
In-reply-to: Your message of "Fri, 17 Sep 1999 00:32:09 PDT."
             <19990917003209.H8112@suse.de>
Date: Thu, 16 Sep 1999 16:22:00 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

> This is a NULL pointer, and most probably a bug in the CVS tree that is
> already fixed in my tree.  I will send a diff between the trees to the
> list later.

Cool. Thanks!

> 
> > Couple of things in the trap handler would help here:
> > o More white space - makes what to cut/paste easier to determine
> > o clear text describing the fault
> > o In this case the offending instruction and a stack trace.
> > o printing the invalid address, IOAQ and general registers was good
> 
> basically look at what the x86 port does and implement it.

Ok - any volunteers?


...
> > ps. Alex showed me the "la la la" work around in init_task.c.
> >    Is anyone already working to make this a runtime check?
> 
> you cannot.  not without major pain at least

That didn't answer my question.

The right person might be able fix this without major pain.
I don't think I'm that person but I could look at it anyway
and then try to find the right person. Another OS doesn't have
this problem and obviously has solved it.

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
