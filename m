Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA26115
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 10:04:07 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id MAA18876
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Oct 1999 12:04:01 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id JAA27382 for <parisc-linux@thepuffingroup.com>; Tue, 19 Oct 1999 09:04:42 -0700 (PDT)
Message-Id: <199910191604.JAA27382@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] different PA2.0 CPUs in the same box? 
In-reply-to: Your message of "Mon, 18 Oct 1999 22:31:15 PDT."
             <199910190531.WAA27190@milano.cup.hp.com>
Date: Tue, 19 Oct 1999 09:04:41 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Alex deVries wrote:
> > 
> > Can you mix and match different PA2.0 CPUs in a multiprocessor box?
> > An 8000 and an 8200?  
> 
> And HP hasn't mix/matched processor clock frequency's in one box either.
> 870 (4-way/PA1.0/CIO) I think had something funny about the clocks which
> I think was repeated in the T-class and possible planned in newer
> architectures. Can anyone shed more light on this?

I think I remember the problem now.

The processors can run from a "system clock" and they all run synchronous.
No chance of "clock drift" since they run at exactly the same pace.
But on systems like 870, T-class and N-class, the processors are fed clock
signals from (similar but) different sources.  Each frequency domain will
slowly drift from the "average" and thus the processor clocks need to be
resyncronized regularly.

> Minimizing clock drift of the various processors in an SMP box is
> a difficult problem. Keeping accurate time is important but
> synchronization of processors too often can really hurt performance.

grant
