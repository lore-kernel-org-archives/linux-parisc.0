Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA05859
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 17:30:46 -0600
Date: Fri, 17 Sep 1999 01:32:40 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output
Message-ID: <19990917013240.J8112@suse.de>
References: <19990917003209.H8112@suse.de> <199909162322.QAA21423@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909162322.QAA21423@milano.cup.hp.com>; from Grant Grundler on Thu, Sep 16, 1999 at 04:22:00PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > > Couple of things in the trap handler would help here:
> > > o More white space - makes what to cut/paste easier to determine
> > > o clear text describing the fault
> > > o In this case the offending instruction and a stack trace.
> > > o printing the invalid address, IOAQ and general registers was good
> > 
> > basically look at what the x86 port does and implement it.
> 
> Ok - any volunteers?

I am a low-priority volunteer, i.e. if noone else does it I'll do it anyway
one day.

> > > ps. Alex showed me the "la la la" work around in init_task.c.
> > >    Is anyone already working to make this a runtime check?
> > 
> > you cannot.  not without major pain at least
> 
> That didn't answer my question.
> 
> The right person might be able fix this without major pain.
> I don't think I'm that person but I could look at it anyway
> and then try to find the right person. Another OS doesn't have
> this problem and obviously has solved it.

 - we could fix our binutils and use elf instead of som.  we'll have to do
   so anyway at one point but it's a major piece of boring work

 - we could runtime-relocate init_task_union.  major pain because we would
   have to change assembly

 - we could reduce the size of task_struct and stack to 4 KB

 - we could change the way Linux allocates the kernel stack

 - we could detect at build time that init_task_union isn't aligned and work
   around it with makefile / ld magic.
