Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (unknown [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A118482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 08:32:27 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id g0JFV9201939;
	Sat, 19 Jan 2002 10:31:12 -0500
Message-Id: <200201191531.g0JFV9201939@localhost.localdomain>
To: Matthew Wilcox <willy@debian.org>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sched-O1-2.4.17-I3.patch, need help 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 19 Jan 2002 10:31:09 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
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

> >         while (1) {
> >                 void (*idle)(void) = pm_idle;
> >                 if (!idle)
> >                         idle = default_idle;
> > -               while (!current->need_resched)
> > +               if (!current->need_resched)
> >                         idle();
> >                 schedule();
> >                 check_pgt_cache();
>
> Dunno.

This is sending the idle thread back through the scheduler at least once every 
clock tick.  On the x86, idle() halts the processor until it receives an 
interrupt.

I *think* the reason is the idle tick rebalances the run queue but doesn't 
schedule the first task for execution (if there is one), so the call to 
schedule() does that.

However, there are more changes than just this (I just did the changes for a 
different arch).  You need to change p->processor to p->cpu in the SMP code.  
There may be other struct task changes that bite, but that looks like the only 
one in parisc.

You also get bitten (in I3) by the physical to logical CPU mapping problems.  
These are gone in J0, but now you have to introduce and extra migrate_process 
cross processor interrupt.

Probably the best way to work on this is to start a 2.5 parisc tree...

Good luck.

James Bottomley
