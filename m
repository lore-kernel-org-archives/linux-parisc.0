Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA4C44829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 16:17:20 -0600 (MDT)
Subject: Re: [parisc-linux] Installation issue on 800/F10.
From: Ryan Bradetich <rbradetich@uswest.net>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: Eric Boniface <eric_boniface@non.hp.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020812220324.36057.qmail@web12508.mail.yahoo.com>
References: <20020812220324.36057.qmail@web12508.mail.yahoo.com>
Content-Type: text/plain
Date: 12 Aug 2002 16:17:18 -0600
Message-Id: <1029190638.635.28.camel@beavis>
Mime-Version: 1.0
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

That is true to a point.  There has been a some work done on the 
nova class systems mainly by Christoph Platner to get the E series
working, and I belive Christoph does have a root nfs E55 running.  The
problem with the nova class systems are that documentation is sparse
and very hard to obtain.

First thing you need to do is configure a kernel with the PDC console 
support.  the nova class systems do not have a hardware console solution
(The K-class systems have this same problem).  You could also try to
enable the EARLY_BOOTUP_DEBUG in arch/parisc/kernel/pdc_cons.c to see
if that helps.

Good luck!

- Ryan


On Mon, 2002-08-12 at 16:03, Derek Engelhaupt wrote:
> By the way that site also states that the F,G,H,I series are not
> supported....fwiw.
> 
> derek
> 
> --- Thibaut VARENE <varenet@esiee.fr> wrote:
> > On Mon, 12 Aug 2002 18:49:32 +0200
> > Eric Boniface <eric_boniface@non.hp.com> wrote:
> >  
> > > I am ok to switch whatever it wants, but I don't really see what I
> > can 
> > > switch.
> > For any information on PARISC-Linux boot sequence, you can get the
> > latest (still under review) PARISC-Linux Boot HowTo here:
> > http://testpa.esiee.fr/.test/parisc-linux-boot.[html|pdf]
> > Look at the 'Consoles' section.
> > 
> > Any feedback about errors or precisions would be greatly appreciated.
> > 
> > 
> > Thibaut VARENE
> > The PA/Linux ESIEE Team
> > http://pateam.esiee.fr/
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> __________________________________________________
> Do You Yahoo!?
> HotJobs - Search Thousands of New Jobs
> http://www.hotjobs.com
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
