From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Cupertino test ring problem?
Date: Wed, 30 Jul 2008 23:15:24 -0600
Message-ID: <20080731051524.GC18732@colo.lackof.org>
References: <1217254746.3503.61.camel@localhost.localdomain> <20080728145712.GH18026@parisc-linux.org> <488DFD62.4080307@hp.com> <20080728171500.GB16059@parisc-linux.org> <488F777E.6090405@hp.com> <1217363136.6103.68.camel@localhost.localdomain> <488F842F.3040000@hp.com> <1217369386.6103.73.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rick Jones <rick.jones2@hp.com>, Matthew Wilcox <matthew@wil.cx>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1217369386.6103.73.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 29, 2008 at 05:09:45PM -0500, James Bottomley wrote:
> On Tue, 2008-07-29 at 13:57 -0700, Rick Jones wrote:
> > > gsyprf11 and gsyprf10 are still not responding to pings ... could the
> > > IP routings have changed or something?
> > 
> >  > I can't connect to port 22 on any of gsyprf3, gsyprf10 or gsyprf11.
> > 
> > Well, the IP's have remained the same, but the systems are physically in 
> > a different building.  Both netperf.org and ftp.cup.hp.com have moved 
> > from the same starting point to the same end-point.  If folks cannot 
> > ping them or cannot get to port 22 on those then there is still 
> > something amis in the network.  Otherwise there is still something amis 
> > with gsyprf[3|10|11].
> 
> gsyprf10 at least is one of the ia64 boxes.  Helpfully it identifies
> itself as lp1000 or something at the login prompt.

gsyprf10 is an x86 machine (HP lp1000r netserver).

> gsyprf11 is a PA A500 type box.  It should identify as gsyprf11
> at the login prompt.  We
> only need one up and running to begin diagnosing as we should be able to
> then get to other remote consoles.

I'll check with Rick tomorrow to see when I can drop by to help resurrect
them.

I expected gsyprf10 to auto reboot on it's own.
I'll change gsyprf11 and gsyprf3 to also autoboot since I don't think they
do at the moment.

cheers,
grant

> 
> James
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
