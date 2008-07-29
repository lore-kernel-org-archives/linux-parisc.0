From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Cupertino test ring problem?
Date: Tue, 29 Jul 2008 17:09:45 -0500
Message-ID: <1217369386.6103.73.camel@localhost.localdomain>
References: <1217254746.3503.61.camel@localhost.localdomain>
	 <20080728145712.GH18026@parisc-linux.org> <488DFD62.4080307@hp.com>
	 <20080728171500.GB16059@parisc-linux.org>  <488F777E.6090405@hp.com>
	 <1217363136.6103.68.camel@localhost.localdomain>  <488F842F.3040000@hp.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Matthew Wilcox <matthew@wil.cx>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Rick Jones <rick.jones2@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <488F842F.3040000@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2008-07-29 at 13:57 -0700, Rick Jones wrote:
> > gsyprf11 and gsyprf10 are still not responding to pings ... could the
> > IP routings have changed or something?
> 
>  > I can't connect to port 22 on any of gsyprf3, gsyprf10 or gsyprf11.
> 
> Well, the IP's have remained the same, but the systems are physically in 
> a different building.  Both netperf.org and ftp.cup.hp.com have moved 
> from the same starting point to the same end-point.  If folks cannot 
> ping them or cannot get to port 22 on those then there is still 
> something amis in the network.  Otherwise there is still something amis 
> with gsyprf[3|10|11].

gsyprf10 at least is one of the ia64 boxes.  Helpfully it identifies
itself as lp1000 or something at the login prompt.  gsyprf11 is a PA
A500 type box.  It should identify as gsyprf11 at the login prompt.  We
only need one up and running to begin diagnosing as we should be able to
then get to other remote consoles.

James


