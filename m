Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA11592
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 14:53:34 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA04640
	for <parisc-linux@thepuffingroup.com>; Fri, 1 Oct 1999 16:53:12 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id NAA13364 for <parisc-linux@thepuffingroup.com>; Fri, 1 Oct 1999 13:52:53 -0700 (PDT)
Message-Id: <199910012052.NAA13364@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] commit FP coproc enable code? 
In-reply-to: Your message of "Fri, 01 Oct 1999 20:56:25 PDT."
             <19991001205625.J16533@suse.de>
Date: Fri, 01 Oct 1999 13:52:53 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > o FP enable via writing cr10 (CCR) register. Not doing this the "right"
> >   way - which is to use PDC_COPROC but it will work for all PA1.1
> >   platforms.
> 
> Why is not using PDC_COPROC not the right way ?
> It should do exactly the same
> thing, modulo machines without FPU (for which we do not provide emulation
> anyway) and firmware bugs ...

You are right.
But I'm lazy and I don't care right now about machines older than PA 1.1.
Someone who cares about PA 1.0 can implement that.

> 
> > ===================================================================
> > RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/head.S,v
> > retrieving revision 1.32
> > diff -u -r1.32 head.S
> > --- head.S      1999/08/31 19:25:23     1.32
> > +++ head.S      1999/09/30 22:43:03
> 
> I would prefer to do this somewhere after the kernel is loaded, in C,
> surrounded
> by a pair of printks, so we know whether it is this that hangs the machine.

Agreed...I'll do that....thanks!

grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
