Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39E3C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 00:14:23 -0700 (MST)
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] sched-O1-2.4.17-I3.patch, need help
Message-ID: <1011597251.3c4bbfc3ae334@webmail.tiscalinet.be>
Date: Mon, 21 Jan 2002 08:14:11 +0100 (CET)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
References: <200201191531.g0JFV9201939@localhost.localdomain>
In-Reply-To: <200201191531.g0JFV9201939@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello James,

Thanks a lot for inforamtion.

Quoting James Bottomley <James.Bottomley@HansenPartnership.com>:

> > >         while (1) {
> > >                 void (*idle)(void) = pm_idle;
> > >                 if (!idle)
> > >                         idle = default_idle;
> > > -               while (!current->need_resched)
> > > +               if (!current->need_resched)
> > >                         idle();
> > >                 schedule();
> > >                 check_pgt_cache();
> >
> > Dunno.
> 
> This is sending the idle thread back through the scheduler at least once
> every 
> clock tick.  On the x86, idle() halts the processor until it receives an
> 
> interrupt.
> 
> I *think* the reason is the idle tick rebalances the run queue but
> doesn't 
> schedule the first task for execution (if there is one), so the call to
> 
> schedule() does that.
> 
> However, there are more changes than just this (I just did the changes
> for a 
> different arch).  You need to change p->processor to p->cpu in the SMP
> code.  
> There may be other struct task changes that bite, but that looks like
> the only 
> one in parisc.

I think that also p->nice would be changed in p->__nice?

> 
> You also get bitten (in I3) by the physical to logical CPU mapping
> problems.  
> These are gone in J0, but now you have to introduce and extra
> migrate_process 
> cross processor interrupt.

I also have a look in J2 and notice that task_struct was deepely changed and so
I  ignore what will I have to do with offset.c.

> 
> Probably the best way to work on this is to start a 2.5 parisc tree...
> 

I do also believe that the limits of my knowledge will yet oblige me to wait
this release.

Thanks anyway for help and precious advises,

Joel

> Good luck.
> 
> James Bottomley
> 
> 
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
