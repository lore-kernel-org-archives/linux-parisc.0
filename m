From: Mel Gorman <mel@csn.ul.ie>
Subject: Re: parisc DISCONTIGMEM compile breakage
Date: Tue, 6 May 2008 16:49:23 +0100
Message-ID: <20080506154922.GB5034@csn.ul.ie>
References: <20080506134648.GA30082@cs181133002.pp.htv.fi> <20080506152457.GA13070@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Adrian Bunk <bunk@kernel.org>,
	Christoph Lameter <clameter@sgi.com>,
	Lee Schermerhorn <lee.schermerhorn@hp.com>,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080506152457.GA13070@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (06/05/08 11:24), Kyle McMartin didst pronounce:
> On Tue, May 06, 2008 at 04:46:48PM +0300, Adrian Bunk wrote:
> > Commit 54a6eb5c4765aa573a030ceeba2c14e3d2ea5706
> > (mm: use two zonelist that are filtered by GFP mask)
> > causes the following build error with CONFIG_DISCONTIGMEM=y
> > on parisc:
> > 
> > <--  snip  -->
> > 
> > ...
> >   CC      arch/parisc/mm/init.o
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/arch/parisc/mm/init.c: In function 'show_mem':
> > /home/bunk/linux/kernel-2.6/git/linux-2.6/arch/parisc/mm/init.c:609: error: too few arguments to function 'node_zonelist'
> > make[2]: *** [arch/parisc/mm/init.o] Error 1
> > 
> 
> yes. the obvious fix works and boots, but I haven't quite determined why
> they decided to add this yet, so no patch committed plz.
> 

I'm not sure what you are referring to as "this" here. If you mean the
zonelist changes, they were done to reduce the number of zonelists that
exist, to clear up an anomoly with MPOL_BIND and to remove a hack called
alloc_should_filter_zonelist() in the page allocator. The pa-risc code that
walks zonelists (presumably for debugging) has been around for a while and
was updated at the same time as the zonelist patches were done, just not as
well as it should have been.

-- 
Mel Gorman
Part-time Phd Student                          Linux Technology Center
University of Limerick                         IBM Dublin Software Lab
