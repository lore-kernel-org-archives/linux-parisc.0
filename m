Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error. 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 12 Mar 2002 23:48:38 GMT." <20020312234838.K30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk> <3C8E8520.EC6877E3@cup.hp.com> <20020312225858.A979E38556@carmen.fc.hp.com> <3C8E8A6F.2AD5761C@cup.hp.com>  <20020312234838.K30538@parcelfarce.linux.theplanet.co.uk> 
Date: Tue, 12 Mar 2002 18:42:06 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020313014206.75AA54851@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> The kernel has its own mappings for pages so it can take advantage of
> 16MB pages.  These are not coherent with the pages that are mapped into
> user space. 

And this would cause an HPMC?
(iirc, chassis codes indicated HPMC)
If someone could decode the Gururaj's HPMC data ("ser pim" from BCH prompt)
and post the results.  At worst, it would confirm this theory.

> By (ab)using the kmap() functionality, this problem can be
> solved and may even result in a performance increase for all machines.
> No real time to work on this...

Sorry, I'm not VM clueful enough to understand why this would be a
problem on N-class and not other boxes.  I know coherency works differently
here (Merced Bus is "central" vs Runway for most other boxes).
Someplace to look for more clues?
just curious...

thanks,
grant
